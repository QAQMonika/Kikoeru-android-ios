package com.zinhao.kikoeru;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.id3.ApicFrame;
import com.google.android.exoplayer2.metadata.id3.Id3Decoder;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** On-demand directory and small-image cache; never a cloud file server. */
public final class BaiduCloud {
    static final ExecutorService IO=Executors.newFixedThreadPool(3);
    private static final ExecutorService ART=Executors.newFixedThreadPool(4);
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static BaiduApi api;
    private static final Map<ImageView,String> images=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Set<String> pending=new HashSet<>();
    private static final LinkedHashMap<String,Runnable> artQueue=new LinkedHashMap<>();
    private static int activeArt=0;
    private static final Map<String,Folder> folders=new LinkedHashMap<>();
    private static final class Folder { final JSONArray rows; final long until; Folder(JSONArray rows) { this.rows=rows; until=System.currentTimeMillis()+60000; } }
    static synchronized BaiduApi api(Context context) {
        if(api==null) api=new BaiduApi(new BaiduVault(context.getApplicationContext()),new BaiduHttp(),System::currentTimeMillis);
        return api;
    }
    static boolean cloud(JSONObject track) { return track!=null && track.optBoolean("baidu_cloud"); }
    static String cacheKey(String owner,String folder) {
        return UUID.nameUUIDFromBytes((owner+":"+folder).getBytes(StandardCharsets.UTF_8)).toString();
    }
    static File coverFile(Context context,String owner,String folder) {
        File directory=new File(context.getCacheDir(),"baidu-covers"); directory.mkdirs();
        return new File(directory,cacheKey(owner,folder)+".v2.img");
    }
    static String coverSourceLabel(Context context,String owner,String folder) {
        File file=coverFile(context,owner,folder);
        if(file.isFile()) {
            String src=context.getSharedPreferences("baidu_cover_src",0).getString(cacheKey(owner,folder),"");
            return src.isEmpty()?"\u81ea\u5df1\u7684\u6587\u4ef6 \u00b7 \u7f51\u76d8\u539f\u5c01\u9762":src;
        }
        if(!GlassUi.cachedRjCoverUri(context,folder).isEmpty()) {
            return "\u5b98\u65b9\u539f\u7248\u515c\u5e95\uff08\u7f51\u76d8\u539f\u56fe\u88ab\u62e6\u622a\u6216\u65e0\u5c01\u9762\uff09";
        }
        return "\u6b63\u5728\u68c0\u6d4b\u5c01\u9762\u2026";
    }
    static String cover(Context context,JSONObject track) {
        if(!cloud(track)) return "";
        File file=coverFile(context,track.optString("cloud_owner"),track.optString("cloud_folder"));
        return file.isFile()?Uri.fromFile(file).toString():"";
    }
    static String trackCover(Context context,String owner,String folder) {
        String root=context.getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
        for(String candidate:BaiduApi.artworkFolders(root,folder)) {
            File file=coverFile(context,owner,candidate);
            if(file.isFile()) return Uri.fromFile(file).toString();
        }
        return "";
    }
    static JSONArray folder(Context context,String owner,String path,boolean force) throws Exception {
        String key=owner+":"+path;
        synchronized(folders) { Folder cached=folders.get(key); if(!force && cached!=null && cached.until>System.currentTimeMillis()) return new JSONArray(cached.rows.toString()); }
        JSONArray all=new JSONArray(); Set<String> seen=new HashSet<>();
        for(int start=0;start<10000;start+=500) {
            JSONArray page=api(context).list(owner,path,start,500); int added=0;
            for(int i=0;i<page.length();i++) { JSONObject row=page.getJSONObject(i); if(seen.add(row.getString("fs_id"))) { all.put(row); added++; } }
            if(page.length()<500) {
                synchronized(folders) { if(folders.size()>=48) folders.remove(folders.keySet().iterator().next()); folders.put(key,new Folder(all)); }
                return new JSONArray(all.toString());
            }
            if(added==0) throw BaiduApi.failure("\u7f51\u76d8\u5206\u9875\u91cd\u590d\uff0c\u8bf7\u5237\u65b0\u91cd\u8bd5");
        }
        throw BaiduApi.failure("\u5355\u4e2a\u76ee\u5f55\u6587\u4ef6\u8fc7\u591a\uff0c\u8bf7\u5206\u6210\u5b50\u6587\u4ef6\u5939");
    }
    static String coverId(JSONArray entries) {
        List<JSONObject> pictures=new ArrayList<>();
        for(int i=0;i<entries.length();i++) { JSONObject row=entries.optJSONObject(i); if(row!=null && row.optInt("isdir")==0 && image(row.optString("server_filename"))) pictures.add(row); }
        pictures.sort((a,b)-> { String x=a.optString("server_filename"),y=b.optString("server_filename"); int n=Integer.compare(rank(x),rank(y)); return n!=0?n:LocalIndex.natural(x,y); });
        return pictures.isEmpty()?"":pictures.get(0).optString("fs_id");
    }
    static boolean image(String name) {
        return Arrays.asList("jpg","jpeg","png","webp","gif","bmp","jfif","heic","heif","avif").contains(LocalIndex.extension(name));
    }
    private static int rank(String name) {
        String stem=BaiduApi.stem(name);
        if(Arrays.asList("cover","folder","front","jacket","main","thumb","thumbnail","album","art","\u5c01\u9762","\u8868\u7d19","\u30b8\u30e3\u30b1\u30c3\u30c8","\u30e1\u30a4\u30f3").contains(stem)) return 0;
        if(stem.contains("cover") || stem.contains("front") || stem.contains("jacket") || stem.contains("main") || stem.contains("thumb")
                || stem.contains("\u5c01\u9762") || stem.contains("\u8868\u7d19") || stem.contains("\u30b8\u30e3\u30b1\u30c3\u30c8")
                || stem.matches("(?i).*rj[0-9]{5,10}.*")) return 1;
        return 2;
    }
    static void prepareCover(Context context,String owner,String folder) throws Exception {
        File file=coverFile(context,owner,folder); if(file.isFile()) return;
        byte[] bytes=findCover(context,owner,folder);
        if(bytes==null) return;
        saveCover(file,bytes);
    }
    private static boolean validImage(byte[] bytes) {
        if(bytes==null || bytes.length==0 || bytes.length>48*1024*1024) return false;
        android.graphics.BitmapFactory.Options bounds=new android.graphics.BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
        android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,bounds);
        return bounds.outWidth>0 && bounds.outHeight>0 && bounds.outWidth<=30000 && bounds.outHeight<=30000;
    }
    private static void saveCover(File file,byte[] bytes) throws Exception {
        if(!validImage(bytes)) return;
        try {
            android.graphics.BitmapFactory.Options opts=new android.graphics.BitmapFactory.Options();
            opts.inJustDecodeBounds=true;
            android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,opts);
            if(bytes.length>1024*1024 || opts.outWidth>1600 || opts.outHeight>1600) {
                int sample=1;
                while(opts.outWidth/sample>1600 || opts.outHeight/sample>1600) sample*=2;
                opts.inJustDecodeBounds=false; opts.inSampleSize=sample;
                android.graphics.Bitmap bmp=android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,opts);
                if(bmp!=null) {
                    ByteArrayOutputStream compressed=new ByteArrayOutputStream();
                    if(bmp.compress(android.graphics.Bitmap.CompressFormat.JPEG,90,compressed) && compressed.size()>0) bytes=compressed.toByteArray();
                    bmp.recycle();
                }
            }
        } catch(Throwable ignored) { }
        File temporary=new File(file.getParentFile(),file.getName()+"."+UUID.randomUUID()+".tmp");
        try {
            try(FileOutputStream out=new FileOutputStream(temporary)) { out.write(bytes); out.getFD().sync(); }
            if(!file.exists() && !temporary.renameTo(file)) throw new IOException();
        } finally { if(temporary.exists()) temporary.delete(); }
        trimCache(file.getParentFile(),file);
    }
    private static final class CoverFolder {
        final String path; final int depth;
        CoverFolder(String path,int depth) { this.path=path; this.depth=depth; }
    }
    private static int folderRank(JSONObject row) {
        String name=row.optString("server_filename").toLowerCase(Locale.ROOT);
        for(String k:new String[]{"img","image","cover","jacket","illust","pic","photo","art","thumb","\u5c01\u9762","\u753b\u50cf","\u8868\u7d19","\u63d2\u56fe","\u63d2\u753b","\u7acb\u7ed8","\u30a4\u30e9\u30b9\u30c8","\u30b8\u30e3\u30b1\u30c3\u30c8","\u7279\u5178"})
            if(name.contains(k)) return 0;
        for(String k:new String[]{"audio","voice","sound","track","disc","wav","flac","mp3","m4a","se","\u97f3\u58f0","\u97f3\u8f68","\u97f3\u6e90","\u672c\u7de8","\u672c\u7bc7","\u6b63\u7bc7","\u6b63\u7247","rj"})
            if(name.contains(k)) return 1;
        return 2;
    }
    private static boolean inScope(Context context,String owner,String folder) {
        String selected=context.getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
        return BaiduApi.withinRoot(selected,folder);
    }
    private static byte[] findCover(Context context,String owner,String album) throws Exception {
        if(!inScope(context,owner,album)) return null;
        ArrayDeque<CoverFolder> queue=new ArrayDeque<>(); queue.add(new CoverFolder(BaiduApi.path(album),0));
        List<JSONObject> audio=new ArrayList<>();
        int inspected=0,pictures=0,tried=0;
        while(!queue.isEmpty() && inspected++<16) {
            if(!inScope(context,owner,album)) return null;
            CoverFolder current=queue.remove(); JSONArray entries;
            try { entries=folder(context,owner,current.path,false); } catch(Exception e) { if(inspected==1) throw e; else continue; }
            List<JSONObject> images=new ArrayList<>(),children=new ArrayList<>();
            for(int i=0;i<entries.length();i++) { JSONObject row=entries.optJSONObject(i); if(row==null) continue;
                String name=row.optString("server_filename"),ext=LocalIndex.extension(name);
                if(row.optInt("isdir")==1 && current.depth<4) children.add(row);
                else if(row.optInt("isdir")==0 && image(name)) images.add(row);
                else if(row.optInt("isdir")==0 && BaiduArt.supported(ext) && row.optLong("size")>0 && audio.size()<12) audio.add(row);
            }
            images.sort((a,b)-> { int order=Integer.compare(rank(a.optString("server_filename")),rank(b.optString("server_filename"))); return order!=0?order:LocalIndex.natural(a.optString("server_filename"),b.optString("server_filename")); });
            for(JSONObject picture:images) if(pictures++<12) {
                if(!inScope(context,owner,album)) return null;
                long picSize=picture.optLong("size",0);
                if(picSize>0 && picSize<=48L*1024*1024) {
                    try {
                        byte[] bytes=smallFile(context,owner,picture.optString("fs_id"),48*1024*1024);
                        // Reject Baidu Netdisk censor replacement banners whose byte length differs from the real file size
                        if(bytes!=null && bytes.length==picSize && validImage(bytes)) {
                            context.getSharedPreferences("baidu_cover_src",0).edit()
                                    .putString(cacheKey(owner,album),"\u81ea\u5df1\u7684\u6587\u4ef6 \u00b7 \u7f51\u76d8\u539f\u56fe ("+picture.optString("server_filename")+")").apply();
                            return bytes;
                        }
                        android.util.Log.d("BaiduCover","rejected mismatched/intercepted image "+picture.optString("server_filename")+" (expected="+picSize+", got="+(bytes==null?-1:bytes.length)+")");
                    } catch(Exception e) {
                        android.util.Log.d("BaiduCover","smallFile failed for "+picture.optString("server_filename")+" ("+picSize+"B): "+e.getMessage());
                    }
                }
            }
            children.sort((a,b)-> { int order=Integer.compare(folderRank(a),folderRank(b)); return order!=0?order:LocalIndex.natural(a.optString("server_filename"),b.optString("server_filename")); });
            for(JSONObject child:children) if(queue.size()<32) queue.add(new CoverFolder(child.optString("path"),current.depth+1));
        }
        audio.sort((a,b)->LocalIndex.natural(a.optString("server_filename"),b.optString("server_filename")));
        while(tried<audio.size() && tried<6) {
            if(!inScope(context,owner,album)) return null;
            JSONObject track=audio.get(tried++);
            try {
                byte[] image=embedded(context,owner,album,track);
                if(validImage(image)) {
                    context.getSharedPreferences("baidu_cover_src",0).edit()
                            .putString(cacheKey(owner,album),"\u81ea\u5df1\u7684\u6587\u4ef6 \u00b7 \u97f3\u9891\u5185\u5d4c ("+track.optString("server_filename")+")").apply();
                    return image;
                }
            }
            catch(Exception e) { android.util.Log.d("BaiduCover","embedded failed for "+track.optString("server_filename")+": "+e.getMessage()); }
        }
        android.util.Log.d("BaiduCover","no cloud cover found for "+album+" (inspected="+inspected+", pictures="+pictures+", audio="+audio.size()+")");
        return null;
    }
    private static byte[] embedded(Context context,String owner,String album,JSONObject row) throws Exception {
        String id=row.getString("fs_id"); long size=row.optLong("size");
        try(BaiduArt.RangeChannel source=new BaiduArt.RangeChannel(size,(offset,count)->range(context,owner,album,id,offset,count))) {
            String extension=LocalIndex.extension(row.optString("server_filename"));
            if(extension.equals("m4a")) return BaiduArtMedia.picture(source);
            BaiduArt.Result result=BaiduArt.find(source,extension);
            if(result!=null) {
                if(!result.id3) return result.bytes;
                Metadata frames=new Id3Decoder().decode(result.bytes,result.bytes.length); byte[] fallback=null;
                if(frames!=null) for(int i=0;i<frames.length();i++) if(frames.get(i) instanceof ApicFrame) {
                    ApicFrame picture=(ApicFrame)frames.get(i);
                    if(validImage(picture.pictureData)) { if(picture.pictureType==3) return picture.pictureData; if(fallback==null) fallback=picture.pictureData; }
                }
                if(fallback!=null) return fallback;
            }
            source.position(0);
            return BaiduArtMedia.picture(source);
        }
    }
    private static byte[] range(Context context,String owner,String album,String id,long position,int count) throws IOException {
        for(int attempt=0;attempt<2;attempt++) {
            if(!inScope(context,owner,album)) throw new IOException("Cloud folder changed");
            try(BaiduHttp.Opened opened=new BaiduHttp().open(api(context).link(owner,id,attempt>0),position,count)) {
                if(opened.connection.getResponseCode()!=206 || opened.length!=count) throw new IOException("Range unavailable");
                byte[] bytes=new byte[count]; int offset=0;
                while(offset<count) { int read=opened.input.read(bytes,offset,count-offset); if(read<=0) throw new IOException("Truncated range"); offset+=read; }
                return bytes;
            } catch(BaiduHttp.Failure e) { if(attempt!=0 || (e.status!=401 && e.status!=403)) throw e; }
            catch(Exception e) { throw new IOException("Cloud metadata read failed"); }
        }
        throw new IOException("Cloud metadata read failed");
    }
    private static void trimCache(File directory,File keep) {
        File[] files=directory.listFiles((d,n)->n.endsWith(".img")); if(files==null) return;
        long total=0; for(File file:files) total+=file.length(); if(total<=96L*1024*1024) return;
        Arrays.sort(files,Comparator.comparingLong(File::lastModified));
        for(File file:files) if(total>80L*1024*1024 && !file.equals(keep)) { long size=file.length(); if(file.delete()) total-=size; }
    }
    static byte[] smallFile(Context context,String owner,String id,int limit) throws Exception {
        for(int attempt=0;attempt<2;attempt++) {
            try(BaiduHttp.Opened opened=new BaiduHttp().open(api(context).link(owner,id,attempt>0),0,-1)) {
                if(opened.length>limit) throw BaiduApi.failure("\u5c01\u9762\u6216\u5b57\u5e55\u8d85\u8fc7\u8bfb\u53d6\u4e0a\u9650");
                return BaiduHttp.read(opened.input,limit);
            } catch(BaiduHttp.Failure e) { if(attempt!=0 || (e.status!=401 && e.status!=403)) throw e; }
        }
        throw new IOException("\u4e91\u7aef\u6587\u4ef6\u8bfb\u53d6\u5931\u8d25");
    }
    private static void enqueueArt(String key,Runnable work) {
        synchronized(pending) {
            if(pending.contains(key)) {
                Runnable queued=artQueue.remove(key);
                if(queued!=null) artQueue.put(key,queued);
                return;
            }
            pending.add(key);
            artQueue.put(key,work);
            if(activeArt<4) {
                activeArt++;
                ART.execute(BaiduCloud::drainArt);
            }
        }
    }
    private static void drainArt() {
        while(true) {
            String nextKey=null; Runnable nextWork;
            synchronized(pending) {
                if(artQueue.isEmpty()) { activeArt--; return; }
                Set<String> visible;
                synchronized(images) { visible=new HashSet<>(images.values()); }
                List<String> keys=new ArrayList<>(artQueue.keySet());
                for(int i=keys.size()-1;i>=0;i--) {
                    if(visible.contains(keys.get(i))) { nextKey=keys.get(i); break; }
                }
                if(nextKey==null) nextKey=keys.get(keys.size()-1);
                nextWork=artQueue.remove(nextKey);
            }
            try { if(nextWork!=null) nextWork.run(); }
            finally { synchronized(pending) { pending.remove(nextKey); } }
        }
    }
    static void showCover(Context context,ImageView view,String owner,String folder,int placeholder) {
        Context app=context.getApplicationContext(); String key=owner+":"+folder; images.put(view,key);
        JSONObject track=new JSONObject(); try { track.put("baidu_cloud",true).put("cloud_owner",owner).put("cloud_folder",folder); } catch(Exception ignored) {}
        String cached=cover(app,track);
        if(cached.isEmpty()) cached=GlassUi.cachedRjCoverUri(app,folder);
        LocalArt.show(app,view,cached,new JSONArray(),placeholder);
        if(!cached.isEmpty()) return;
        enqueueArt(key,()-> {
            try { prepareCover(app,owner,folder); } catch(Exception e) { android.util.Log.d("BaiduCover","prepareCover error "+folder+": "+e.getMessage()); }
            MAIN.post(()-> {
                File file=coverFile(app,owner,folder);
                String uri=file.exists()?Uri.fromFile(file).toString():GlassUi.cachedRjCoverUri(app,folder);
                if(!uri.isEmpty()) {
                    List<Map.Entry<ImageView,String>> snapshot;
                    synchronized(images) { snapshot=new ArrayList<>(images.entrySet()); }
                    for(Map.Entry<ImageView,String> entry:snapshot) {
                        ImageView image=entry.getKey(); if(image!=null && key.equals(entry.getValue()))
                            LocalArt.show(app,image,uri,new JSONArray(),placeholder);
                    }
                    return;
                }
                GlassUi.fetchRjCoverFallback(app,folder,fallbackUri-> {
                    List<Map.Entry<ImageView,String>> snapshot;
                    synchronized(images) { snapshot=new ArrayList<>(images.entrySet()); }
                    for(Map.Entry<ImageView,String> entry:snapshot) {
                        ImageView image=entry.getKey(); if(image!=null && key.equals(entry.getValue()))
                            LocalArt.show(app,image,fallbackUri,new JSONArray(),placeholder);
                    }
                });
            });
        });
    }
    private static void selectedCover(Context context,String owner,String folder,String id,String name,long size) throws Exception {
        if(id.isEmpty() || !BaiduArt.supported(LocalIndex.extension(name))) return;
        BaiduApi.id(id); JSONObject selected=null;
        if(size>0) selected=new JSONObject().put("fs_id",id).put("server_filename",name).put("size",size);
        else for(int start=0;start<2000;start+=200) {
            if(!inScope(context,owner,folder)) return;
            JSONArray entries=api(context).list(owner,folder,start,200);
            for(int i=0;i<entries.length();i++) {
                JSONObject row=entries.optJSONObject(i);
                if(row!=null && row.optInt("isdir")==0 && id.equals(row.optString("fs_id"))) { selected=row; break; }
            }
            if(selected!=null || entries.length()<200) break;
        }
        if(selected==null || selected.optLong("size",0)<=0) return;
        byte[] image=embedded(context,owner,folder,selected);
        if(validImage(image)) saveCover(coverFile(context,owner,folder),image);
    }
    static void showTrackCover(Context context,ImageView view,JSONObject track,int placeholder) {
        Context app=context.getApplicationContext();
        String owner=track.optString("cloud_owner"),folder=track.optString("cloud_folder"),id=track.optString("cloud_id"),name=track.optString("title");
        long size=track.optLong("cloud_size",0);
        String root=app.getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
        List<String> candidates=BaiduApi.artworkFolders(root,folder);
        String key="player:"+owner+":"+root+":"+folder+":"+id; images.put(view,key);
        LocalArt.show(app,view,trackCover(app,owner,folder),new JSONArray(),placeholder);
        if(candidates.isEmpty() || coverFile(app,owner,candidates.get(0)).isFile()) return;
        enqueueArt(key,()-> {
            for(String candidate:candidates) {
                if(!root.equals(app.getSharedPreferences("baidu_library",0).getString("root:"+owner,""))) break;
                try { prepareCover(app,owner,candidate); } catch(Exception ignored) { }
                if(candidate.equals(folder) && !coverFile(app,owner,folder).isFile()) {
                    try { selectedCover(app,owner,folder,id,name,size); } catch(Exception ignored) { }
                }
                if(coverFile(app,owner,candidate).isFile()) break;
            }
            MAIN.post(()-> {
                if(!root.equals(app.getSharedPreferences("baidu_library",0).getString("root:"+owner,""))) return;
                String found=trackCover(app,owner,folder); if(found.isEmpty()) return;
                List<Map.Entry<ImageView,String>> snapshot;
                synchronized(images) { snapshot=new ArrayList<>(images.entrySet()); }
                for(Map.Entry<ImageView,String> entry:snapshot) {
                    ImageView image=entry.getKey(); if(image!=null && key.equals(entry.getValue()))
                        LocalArt.show(app,image,found,new JSONArray(),placeholder);
                }
            });
        });
    }
    static void cancelCover(ImageView image) { images.remove(image); }
    static String message(Exception error) {
        if(error instanceof IOException && error.getMessage()!=null && !error.getMessage().contains("://")) return error.getMessage();
        return "\u4e91\u7aef\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\u6216\u91cd\u65b0\u6388\u6743";
    }
}
