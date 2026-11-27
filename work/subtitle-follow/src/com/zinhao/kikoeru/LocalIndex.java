package com.zinhao.kikoeru;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.CancellationException;
import org.json.JSONArray;
import org.json.JSONObject;

/** Provider-independent, iterative folder indexing. Audio bytes are never copied. */
public final class LocalIndex {
    public static final int SORT_NAME_ASC=0;
    public static final int SORT_NAME_DESC=1;
    public static final int SORT_TIME_DESC=2;
    public static final int SORT_TIME_ASC=3;
    public static final int SORT_RECENT_PLAYED=4;
    public static final String[] SORT_LABELS={
            "\u540d\u79f0 A \u2192 Z",
            "\u540d\u79f0 Z \u2192 A",
            "\u6700\u65b0\u4e0a\u4f20 / \u4fee\u6539",
            "\u6700\u65e9\u4e0a\u4f20 / \u4fee\u6539",
            "\u6700\u8fd1\u542c\u8fc7"
    };

    public static final class Entry {
        public final String uri, name, mime;
        public final boolean directory;
        public final long size, modified;
        public Entry(String uri, String name, String mime, boolean directory, long size) {
            this(uri, name, mime, directory, size, 0L);
        }
        public Entry(String uri, String name, String mime, boolean directory, long size, long modified) {
            this.uri = uri; this.name = name; this.mime = mime;
            this.directory = directory; this.size = size; this.modified = modified;
        }
    }
    public interface Provider { List<Entry> children(String uri) throws Exception; }
    public interface Progress { void update(int folders, int tracks); boolean cancelled(); }
    private static final class Folder {
        final Entry entry; final String parent, path, cover;
        Folder(Entry e, String parent, String path, String cover) {
            this.entry=e; this.parent=parent; this.path=path; this.cover=cover;
        }
    }
    public static String extension(String name) {
        int dot=name.lastIndexOf('.');
        return dot < 0 ? "" : name.substring(dot+1).toLowerCase(Locale.ROOT);
    }
    public static String stem(String name) {
        int dot=name.lastIndexOf('.');
        return (dot < 0 ? name : name.substring(0,dot)).toLowerCase(Locale.ROOT);
    }
    public static boolean audio(String name) {
        return Arrays.asList("mp3","flac","wav","m4a","aac","ogg","opus","amr","3gp").contains(extension(name));
    }
    private static boolean image(String name) {
        return Arrays.asList("jpg","jpeg","png","webp").contains(extension(name));
    }
    public static int natural(String a, String b) {
        int i=0,j=0;
        while(i<a.length() && j<b.length()) {
            char x=Character.toLowerCase(a.charAt(i)), y=Character.toLowerCase(b.charAt(j));
            if(x>='0' && x<='9' && y>='0' && y<='9') {
                int endA=i,endB=j;
                while(endA<a.length() && a.charAt(endA)>='0' && a.charAt(endA)<='9') endA++;
                while(endB<b.length() && b.charAt(endB)>='0' && b.charAt(endB)<='9') endB++;
                int startA=i,startB=j;
                while(startA<endA-1 && a.charAt(startA)=='0') startA++;
                while(startB<endB-1 && b.charAt(startB)=='0') startB++;
                int cmp=Integer.compare(endA-startA,endB-startB);
                if(cmp!=0) return cmp;
                cmp=a.substring(startA,endA).compareTo(b.substring(startB,endB));
                if(cmp!=0) return cmp;
                i=endA; j=endB;
            } else {
                if(x!=y) return Character.compare(x,y);
                i++; j++;
            }
        }
        int cmp=Integer.compare(a.length()-i,b.length()-j);
        return cmp!=0 ? cmp : a.compareTo(b);
    }
    private static JSONObject node(Folder folder) throws Exception {
        return new JSONObject().put("uri",folder.entry.uri).put("name",folder.entry.name)
                .put("parent",folder.parent).put("path",folder.path).put("directory",true)
                .put("cover",folder.cover).put("count",0).put("modified",folder.entry.modified);
    }
    public static JSONObject scan(Entry root, Provider provider, Progress progress) throws Exception {
        List<JSONObject> nodes=new ArrayList<>();
        Map<String,JSONObject> directories=new HashMap<>();
        Set<String> visited=new HashSet<>(), audioUris=new HashSet<>();
        ArrayDeque<Folder> pending=new ArrayDeque<>();
        pending.push(new Folder(root,"",root.name,""));
        int folders=0,tracks=0;
        while(!pending.isEmpty()) {
            if(progress.cancelled()) throw new CancellationException();
            Folder folder=pending.pop();
            if(!visited.add(folder.entry.uri)) continue;
            if(visited.size()>100000) throw new IOException("Folder limit exceeded");
            List<Entry> children=provider.children(folder.entry.uri);
            children.sort((a,b)->natural(a.name,b.name));
            Map<String,Entry> subtitles=new HashMap<>();
            String cover=folder.cover, firstImage="";
            for(Entry e:children) {
                if(e.directory) continue;
                String ext=extension(e.name);
                if(ext.equals("lrc") || ext.equals("vtt")) {
                    Entry old=subtitles.get(stem(e.name));
                    if(old==null || ext.equals("lrc")) subtitles.put(stem(e.name),e);
                }
                if(image(e.name)) {
                    if(firstImage.isEmpty()) firstImage=e.uri;
                    if(Arrays.asList("cover","folder","front","jacket").contains(stem(e.name))) cover=e.uri;
                }
            }
            if(cover.equals(folder.cover) && !firstImage.isEmpty()) cover=firstImage;
            JSONObject dir=node(folder).put("cover",cover);
            directories.put(folder.entry.uri,dir); nodes.add(dir); folders++;
            for(Entry e:children) {
                if(progress.cancelled()) throw new CancellationException();
                if(e.directory) pending.addLast(new Folder(e,folder.entry.uri,folder.path+"/"+e.name,cover));
                else if(audio(e.name) && audioUris.add(e.uri)) {
                    Entry subtitle=subtitles.get(stem(e.name));
                    nodes.add(new JSONObject().put("uri",e.uri).put("name",e.name)
                            .put("parent",folder.entry.uri).put("path",folder.path+"/"+e.name)
                            .put("directory",false).put("size",e.size).put("modified",e.modified).put("cover",cover)
                            .put("subtitle",subtitle==null?"":subtitle.uri));
                    tracks++;
                }
            }
            progress.update(folders,tracks);
        }
        for(JSONObject n:nodes) if(!n.optBoolean("directory")) {
            boolean hasSub=!n.optString("subtitle").isEmpty();
            long mod=n.optLong("modified",0L);
            Set<String> chain=new HashSet<>(); String p=n.optString("parent");
            while(directories.containsKey(p) && chain.add(p)) {
                JSONObject dir=directories.get(p);
                dir.put("count",dir.optInt("count")+1);
                if(mod>dir.optLong("modified",0L)) dir.put("modified",mod);
                if(hasSub) dir.put("lyric",true);
                p=dir.optString("parent");
            }
        }
        for(int i=nodes.size()-1;i>=0;i--) {
            JSONObject child=nodes.get(i);
            if(!child.optBoolean("directory")) continue;
            long mod=child.optLong("modified",0L);
            JSONObject parent=directories.get(child.optString("parent"));
            if(parent!=null && mod>parent.optLong("modified",0L)) parent.put("modified",mod);
        }
        // Artwork-only subfolders are useful even though they are hidden from the audio browser.
        for(int i=nodes.size()-1;i>=0;i--) {
            JSONObject child=nodes.get(i);
            if(!child.optBoolean("directory") || child.optString("cover").isEmpty()) continue;
            JSONObject parent=directories.get(child.optString("parent"));
            if(parent!=null && parent.optString("cover").isEmpty()) parent.put("cover",child.optString("cover"));
        }
        for(JSONObject n:nodes) {
            JSONObject parent=directories.get(n.optString("parent"));
            if(parent==null || !n.optString("cover").isEmpty()) continue;
            // A library root's inferred cover must not leak into unrelated sibling albums.
            if(!parent.optString("uri").equals(root.uri) || !n.optBoolean("directory"))
                n.put("cover",parent.optString("cover"));
        }
        JSONArray entries=new JSONArray();
        for(JSONObject n:nodes) if(!n.optBoolean("directory") || n.optInt("count")>0 || n.optString("uri").equals(root.uri)) entries.put(n);
        JSONObject rootDir=directories.get(root.uri);
        long rootMod=rootDir!=null?rootDir.optLong("modified",root.modified):root.modified;
        JSONObject result=new JSONObject().put("uri",root.uri).put("name",root.name).put("count",tracks)
                .put("modified",rootMod).put("scanned",System.currentTimeMillis()).put("entries",entries);
        artHints(new JSONArray().put(result));
        return result;
    }
    public static void artHints(JSONArray roots) throws Exception {
        for(int i=0;i<roots.length();i++) {
            JSONObject root=roots.getJSONObject(i); JSONArray entries=root.getJSONArray("entries");
            Map<String,JSONObject> folders=new HashMap<>(); List<JSONObject> tracks=new ArrayList<>();
            for(int j=0;j<entries.length();j++) {
                JSONObject n=entries.getJSONObject(j);
                if(n.optBoolean("directory")) { folders.put(n.optString("uri"),n); n.put("artAudio","").put("artAudios",new JSONArray()); }
                else tracks.add(n);
            }
            tracks.sort((a,b)->natural(a.optString("path"),b.optString("path")));
            for(JSONObject track:tracks) {
                boolean sub=!track.optString("subtitle").isEmpty();
                String parent=track.optString("parent"); Set<String> chain=new HashSet<>();
                while(folders.containsKey(parent) && chain.add(parent)) {
                    JSONObject folder=folders.get(parent);
                    if(folder.optString("artAudio").isEmpty()) folder.put("artAudio",track.optString("uri"));
                    folder.getJSONArray("artAudios").put(track.optString("uri"));
                    if(sub) folder.put("lyric",true);
                    parent=folder.optString("parent");
                }
            }
            for(JSONObject folder:folders.values()) if(folder.optString("parent").isEmpty()) {
                root.put("cover",folder.optString("cover")).put("artAudio",folder.optString("artAudio"))
                        .put("artAudios",folder.getJSONArray("artAudios")).put("lyric",folder.optBoolean("lyric")); break;
            }
        }
    }
    public static JSONArray artworkSources(JSONObject row) {
        if(!row.optBoolean("directory")) return new JSONArray().put(row.optString("uri"));
        JSONArray sources=row.optJSONArray("artAudios");
        if(sources!=null) return sources;
        String first=row.optString("artAudio");
        return first.isEmpty()?new JSONArray():new JSONArray().put(first);
    }
    public static JSONArray replace(JSONArray roots, JSONObject replacement) throws Exception {
        JSONArray result=new JSONArray(); boolean found=false;
        for(int i=0;i<roots.length();i++) {
            JSONObject old=roots.getJSONObject(i);
            if(old.optString("uri").equals(replacement.optString("uri"))) {
                if(!found) result.put(replacement); found=true;
            } else result.put(old);
        }
        if(!found) result.put(replacement);
        return result;
    }
    public static List<JSONObject> rows(JSONArray roots, String source, String parent, String query) throws Exception {
        List<JSONObject> rows=new ArrayList<>(); Set<String> seen=new HashSet<>();
        String needle=query.trim().toLowerCase(Locale.ROOT);
        for(int i=0;i<roots.length();i++) {
            JSONObject root=roots.getJSONObject(i);
            if(!source.isEmpty() && !source.equals(root.optString("uri"))) continue;
            if(source.isEmpty() && needle.isEmpty()) {
                rows.add(new JSONObject(root.toString()).put("directory",true).put("source",root.optString("uri")));
                continue;
            }
            JSONArray entries=root.getJSONArray("entries");
            for(int j=0;j<entries.length();j++) {
                JSONObject n=entries.getJSONObject(j);
                boolean match=needle.isEmpty() ? n.optString("parent").equals(parent)
                        : !n.optBoolean("directory") && n.optString("path").toLowerCase(Locale.ROOT).contains(needle);
                if(match && seen.add(n.optString("uri"))) rows.add(new JSONObject(n.toString()).put("source",root.optString("uri")));
            }
        }
        rows.sort((a,b)-> {
            int cmp=Boolean.compare(b.optBoolean("directory"),a.optBoolean("directory"));
            if(cmp!=0) return cmp;
            return natural(a.optString(needle.isEmpty()?"name":"path"),b.optString(needle.isEmpty()?"name":"path"));
        });
        return rows;
    }
    public static List<JSONObject> playlist(List<JSONObject> rows) throws Exception {
        List<JSONObject> result=new ArrayList<>();
        for(JSONObject node:rows) if(!node.optBoolean("directory")) {
            String parent=node.optString("parent");
            String path=node.optString("path"), title=path.substring(0,Math.max(0,path.lastIndexOf('/')));
            result.add(new JSONObject().put("type","audio").put("title",node.getString("name"))
                    .put("workTitle",title).put("workId",-1-(parent.hashCode()&0x3fffffff))
                    .put("hash",node.getString("uri")).put("local_import",true)
                    .put("local_file_path","").put("mediaStreamUrl",node.getString("uri"))
                    .put("local_subtitle",node.optString("subtitle")).put("local_cover",node.optString("cover"))
                    .put("local_source",node.optString("source")).put("local_parent",parent));
        }
        return result;
    }
    public static List<JSONObject> albums(JSONArray roots) throws Exception {
        List<JSONObject> albums=new ArrayList<>(); Set<String> seen=new HashSet<>();
        for(int i=0;i<roots.length();i++) {
            JSONObject root=roots.getJSONObject(i);
            String document=root.optString("document",root.optString("uri"));
            List<JSONObject> children=rows(new JSONArray().put(root),root.optString("uri"),document,"");
            boolean directAudio=false;
            for(JSONObject child:children) if(!child.optBoolean("directory")) directAudio=true;
            if(directAudio || children.isEmpty()) {
                if(seen.add(document)) albums.add(new JSONObject(root.toString()).put("directory",true).put("source",root.optString("uri")));
            } else for(JSONObject child:children) if(seen.add(child.optString("uri"))) {
                if(child.optLong("scanned",0L)==0L && root.optLong("scanned",0L)>0L) child.put("scanned",root.optLong("scanned",0L));
                albums.add(child);
            }
        }
        albums.sort((a,b)->natural(a.optString("name"),b.optString("name")));
        return albums;
    }

    public static long effectiveModified(JSONObject node) {
        if(node==null) return 0L;
        long m=node.optLong("modified",0L);
        return m>0L?m:node.optLong("scanned",0L);
    }

    public static void sortAlbums(List<JSONObject> rows, int mode, Map<String, Long> lastPlayedTimes) {
        if(rows==null || rows.size()<=1) return;
        rows.sort((a,b)-> {
            String na=a.optString("name"), nb=b.optString("name");
            if(mode==SORT_NAME_DESC) return natural(nb,na);
            if(mode==SORT_TIME_DESC) {
                int cmp=Long.compare(effectiveModified(b),effectiveModified(a));
                return cmp!=0?cmp:natural(nb,na);
            }
            if(mode==SORT_TIME_ASC) {
                int cmp=Long.compare(effectiveModified(a),effectiveModified(b));
                return cmp!=0?cmp:natural(na,nb);
            }
            if(mode==SORT_RECENT_PLAYED) {
                long ta=lastPlayedTimes==null?0L:lastPlayedTimes.getOrDefault(a.optString("uri"),0L);
                long tb=lastPlayedTimes==null?0L:lastPlayedTimes.getOrDefault(b.optString("uri"),0L);
                int cmp=Long.compare(tb,ta);
                if(cmp!=0) return cmp;
                cmp=Long.compare(effectiveModified(b),effectiveModified(a));
                return cmp!=0?cmp:natural(na,nb);
            }
            return natural(na,nb);
        });
    }
}
