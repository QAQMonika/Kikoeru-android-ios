package com.zinhao.kikoeru;

import java.io.IOException;
import java.net.URI;
import java.util.*;
import org.json.*;

/** Personal, read-only Baidu client. Session secrets never become queue URLs. */
public final class BaiduApi {
    public interface Store { JSONObject read() throws Exception; void write(JSONObject value) throws Exception; }
    public interface Network { JSONObject get(String endpoint,Map<String,String> parameters) throws Exception; }
    public interface Clock { long now(); }
    static final String OAUTH="https://openapi.baidu.com/oauth/2.0/";
    static final String XPAN="https://pan.baidu.com/rest/2.0/xpan/";
    static final String SCHEME="kiko-baidu";
    private final Store store;
    private final Network network;
    private final Clock clock;
    private final Map<String,Link> links=new HashMap<>();
    private final Map<Long,JSONObject> authorizations=new HashMap<>();
    private static final class Link { final String url; final long until; Link(String u,long t) { url=u; until=t; } }
    public BaiduApi(Store store,Network network,Clock clock) { this.store=store; this.network=network; this.clock=clock; }
    static Map<String,String> params(String... pairs) {
        Map<String,String> result=new LinkedHashMap<>();
        for(int i=0;i<pairs.length;i+=2) result.put(pairs[i],pairs[i+1]); return result;
    }
    static IOException failure(String text) { return new IOException(text); }
    public synchronized JSONObject state() throws Exception {
        JSONObject value=store.read();
        return new JSONObject().put("configured",credential(value.optString("key")) && credential(value.optString("secret")))
                .put("owner",value.optString("owner")).put("name",value.optString("name")).put("vip",value.optInt("vip"));
    }
    public synchronized void configure(String key,String secret) throws Exception {
        if(!credential(key) || !credential(secret)) throw failure("AppKey / SecretKey \u683c\u5f0f\u4e0d\u6b63\u786e");
        long revision=store.read().optLong("revision")+1;
        store.write(new JSONObject().put("key",key.trim()).put("secret",secret.trim()).put("revision",revision)); links.clear(); authorizations.clear();
    }
    static boolean credential(String value) { return value!=null && value.trim().matches("[A-Za-z0-9_-]{4,256}"); }
    public synchronized void disconnect() throws Exception {
        JSONObject old=store.read();
        store.write(new JSONObject().put("key",old.optString("key")).put("secret",old.optString("secret"))
                .put("revision",old.optLong("revision")+1)); links.clear(); authorizations.clear();
    }
    public synchronized void cancelAuthorization(long expected) throws Exception {
        JSONObject value=store.read(); if(value.optLong("revision")!=expected) return;
        JSONObject previous=authorizations.remove(expected); if(previous!=null) value=previous;
        value.put("revision",expected+1); store.write(value); links.clear();
    }
    public synchronized JSONObject beginDevice() throws Exception {
        JSONObject state=store.read(); requireKeys(state);
        authorizations.clear(); authorizations.put(state.optLong("revision")+1,new JSONObject(state.toString()));
        state.put("revision",state.optLong("revision")+1); store.write(state);
        JSONObject result=network.get(OAUTH+"device/code",params("response_type","device_code","client_id",state.getString("key"),"scope","basic,netdisk"));
        oauth(result,false);
        if(result.optString("device_code").isEmpty() || result.optString("user_code").isEmpty()) throw failure("\u767e\u5ea6\u672a\u8fd4\u56de\u6388\u6743\u7801");
        String verification=secureUrl(result.optString("verification_url"));
        if(!authorizationUrl(verification)) throw failure("\u6388\u6743\u5730\u5740\u65e0\u6548");
        result.put("verification_url",verification);
        return new JSONObject(result.toString()).put("_revision",state.optLong("revision"))
                .put("_deadline",clock.now()+Math.max(30,Math.min(1800,result.optInt("expires_in",600)))*1000L);
    }
    public synchronized JSONObject pollDevice(JSONObject device) throws Exception {
        JSONObject state=store.read(); requireKeys(state);
        if(device.optLong("_revision",-1)!=state.optLong("revision")) throw failure("\u6388\u6743\u5df2\u53d6\u6d88");
        if(clock.now()>=device.optLong("_deadline")) throw failure("\u6388\u6743\u7801\u5df2\u8fc7\u671f\uff0c\u8bf7\u91cd\u65b0\u6388\u6743");
        JSONObject result=network.get(OAUTH+"token",params("grant_type","device_token","code",device.getString("device_code"),
                "client_id",state.getString("key"),"client_secret",state.getString("secret")));
        String error=result.optString("error");
        if(error.equals("authorization_pending") || error.equals("slow_down")) return result;
        oauth(result,true);
        JSONObject profile=network.get(XPAN+"nas",params("method","uinfo","vip_version","v2","access_token",result.getString("access_token")));
        apiError(profile); String owner=profile.optString("uk"); id(owner);
        applyToken(state,result);
        state.put("owner",owner).put("name",profile.optString("netdisk_name",profile.optString("baidu_name")))
                .put("vip",profile.optInt("vip_type")); store.write(state); links.clear();
        return new JSONObject().put("connected",true).put("owner",owner).put("name",state.optString("name")).put("vip",state.optInt("vip"));
    }
    private static void requireKeys(JSONObject state) throws IOException {
        if(!credential(state.optString("key")) || !credential(state.optString("secret"))) throw failure("\u8bf7\u5148\u914d\u7f6e\u81ea\u5df1\u7684 AppKey \u548c SecretKey");
    }
    private void applyToken(JSONObject state,JSONObject token) throws Exception {
        if(token.optString("access_token").isEmpty()) throw failure("\u767e\u5ea6\u6388\u6743\u54cd\u5e94\u65e0\u6548");
        String refresh=token.optString("refresh_token",state.optString("refresh"));
        if(refresh.isEmpty()) throw failure("\u7f3a\u5c11\u5237\u65b0\u51ed\u636e\uff0c\u8bf7\u91cd\u65b0\u6388\u6743");
        state.put("access",token.getString("access_token")).put("refresh",refresh)
                .put("expires",clock.now()+Math.max(1,Math.min(366L*86400,token.optLong("expires_in",2592000)))*1000L);
    }
    private synchronized String token(String owner,boolean refresh) throws Exception {
        JSONObject state=store.read(); requireKeys(state);
        if(state.optString("owner").isEmpty() || (!owner.isEmpty() && !owner.equals(state.optString("owner"))))
            throw failure("\u8bf7\u8fde\u63a5\u8be5\u97f3\u8f68\u6240\u5c5e\u7684\u767e\u5ea6\u8d26\u53f7");
        if(refresh || state.optString("access").isEmpty() || state.optLong("expires")<=clock.now()+60000) {
            if(state.optString("refresh").isEmpty()) throw failure("\u8bf7\u91cd\u65b0\u6388\u6743\u767e\u5ea6\u7f51\u76d8");
            JSONObject result=network.get(OAUTH+"token",params("grant_type","refresh_token","refresh_token",state.getString("refresh"),
                    "client_id",state.getString("key"),"client_secret",state.getString("secret")));
            oauth(result,true); applyToken(state,result);
            JSONObject previous=authorizations.get(state.optLong("revision"));
            if(previous!=null && previous.optString("owner").equals(state.optString("owner"))) {
                previous.put("access",state.getString("access")).put("refresh",state.getString("refresh")).put("expires",state.getLong("expires"));
            }
            store.write(state); links.clear();
        }
        return state.getString("access");
    }
    synchronized String uploadToken(String owner,boolean refresh) throws Exception { return token(owner,refresh); }
    private JSONObject request(String owner,String path,Map<String,String> parameters) throws Exception {
        Map<String,String> query=new LinkedHashMap<>(parameters); query.put("access_token",token(owner,false));
        JSONObject response=network.get(XPAN+path,query);
        if(response.optInt("errno")==110 || response.optInt("errno")==111 || response.optInt("errno")==-6) {
            query.put("access_token",token(owner,true)); response=network.get(XPAN+path,query);
        }
        apiError(response); return response;
    }
    public JSONArray list(String owner,String directory,int start,int limit) throws Exception {
        String path=path(directory);
        if(start<0 || limit<1 || limit>1000) throw failure("\u76ee\u5f55\u5206\u9875\u53c2\u6570\u65e0\u6548");
        JSONObject response=request(owner,"file",params("method","list","dir",path,"order","name","desc","0",
                "start",String.valueOf(start),"limit",String.valueOf(limit),"web","1"));
        JSONArray result=response.optJSONArray("list"); if(result==null) throw failure("\u767e\u5ea6\u672a\u8fd4\u56de\u76ee\u5f55\u5217\u8868");
        JSONArray clean=new JSONArray();
        for(int i=0;i<result.length();i++) {
            JSONObject row=result.getJSONObject(i); String child=path(row.getString("path"));
            if(!parent(child).equals(path) || row.optString("server_filename").contains("/")) throw failure("\u76ee\u5f55\u54cd\u5e94\u8d85\u51fa\u8bf7\u6c42\u8303\u56f4");
            id(row.optString("fs_id")); clean.put(row);
        }
        return clean;
    }
    public String link(String owner,String file,boolean refresh) throws Exception {
        id(owner); id(file); token(owner,false);
        String identity=owner+":"+file;
        synchronized(this) {
            Link cached=links.get(identity);
            if(!refresh && cached!=null && cached.until>clock.now()) return cached.url;
        }
        JSONObject response=request(owner,"multimedia",params("method","filemetas","fsids","["+file+"]","dlink","1","extra","1"));
        JSONArray list=response.optJSONArray("list"); JSONObject match=null;
        if(list!=null) for(int i=0;i<list.length();i++) if(file.equals(list.getJSONObject(i).optString("fs_id"))) match=list.getJSONObject(i);
        String url=match==null?"":secureUrl(match.optString("dlink"));
        if(match==null || match.optInt("isdir")!=0 || !downloadUrl(url)) throw failure("\u672a\u83b7\u53d6\u5230\u53ef\u7528\u7684\u767e\u5ea6\u6587\u4ef6\u5730\u5740");
        // Some official endpoints require access_token on the initial dlink; never persist it.
        if(!queryHas(url,"access_token")) url+=(url.contains("?")?"&":"?")+"access_token="+BaiduHttp.encode(token(owner,false));
        synchronized(this) {
            if(links.size()>256) links.clear();
            links.put(identity,new Link(url,clock.now()+120000));
        }
        return url;
    }
    static boolean queryHas(String url,String key) throws Exception {
        String query=new URI(url).getRawQuery();
        if(query!=null) for(String pair:query.split("&")) if(pair.split("=",2)[0].equals(key)) return true;
        return false;
    }
    static void oauth(JSONObject result,boolean token) throws IOException {
        String error=result.optString("error");
        if(!error.isEmpty()) {
            if(error.equals("invalid_client") || error.equals("invalid_client_secret") || error.equals("unauthorized_client"))
                throw failure("\u5e94\u7528\u51ed\u636e\u6216\u6743\u9650\u65e0\u6548\uff0c\u8bf7\u68c0\u67e5 AppKey / SecretKey");
            if(error.equals("access_denied")) throw failure("\u767e\u5ea6\u6388\u6743\u5df2\u88ab\u53d6\u6d88");
            throw failure("\u767e\u5ea6\u6388\u6743\u5931\u6548\uff0c\u8bf7\u91cd\u65b0\u6388\u6743");
        }
        if(token && result.optString("access_token").isEmpty()) throw failure("\u6388\u6743\u54cd\u5e94\u65e0\u6548");
    }
    static void apiError(JSONObject result) throws IOException {
        if(!result.has("errno") || result.optInt("errno",-1)!=0) {
            int code=result.optInt("errno",-1);
            if(code==110 || code==111 || code==-6) throw failure("\u767e\u5ea6\u767b\u5f55\u5df2\u5931\u6548\uff0c\u8bf7\u91cd\u65b0\u6388\u6743");
            if(code==6 || code==10 || code==31045 || code==20016) throw failure("\u5e94\u7528\u65e0\u6743\u8bfb\u53d6\u6b64\u76ee\u5f55\uff0c\u8bf7\u68c0\u67e5\u767e\u5ea6\u5e94\u7528\u6743\u9650");
            throw failure("\u767e\u5ea6\u8bf7\u6c42\u5931\u8d25\uff08\u4ee3\u7801 "+code+"\uff09");
        }
    }
    static void id(String value) throws IOException { if(value==null || !value.matches("[1-9][0-9]{0,19}")) throw failure("\u4e91\u7aef\u6587\u4ef6\u6807\u8bc6\u65e0\u6548"); }
    static String path(String value) throws IOException {
        if(value==null || !value.startsWith("/") || value.indexOf('\0')>=0 || value.length()>8192 || value.contains("\\")) throw failure("\u4e91\u7aef\u76ee\u5f55\u8def\u5f84\u65e0\u6548");
        if(value.contains("//")) throw failure("\u4e91\u7aef\u76ee\u5f55\u8def\u5f84\u65e0\u6548");
        if(value.length()>1 && value.endsWith("/")) value=value.substring(0,value.length()-1);
        for(String segment:value.split("/",-1)) if(segment.equals(".") || segment.equals("..")) throw failure("\u4e91\u7aef\u76ee\u5f55\u8def\u5f84\u65e0\u6548");
        return value;
    }
    static String libraryRoot(String value) throws IOException {
        String root=path(value);
        if(root.equals("/")) throw failure("\u8bf7\u9009\u62e9\u4e00\u4e2a\u5177\u4f53\u7684\u4f5c\u54c1\u6587\u4ef6\u5939");
        return root;
    }
    static boolean withinRoot(String root,String value) {
        try { root=libraryRoot(root); value=path(value); return value.equals(root) || value.startsWith(root+"/"); }
        catch(Exception ignored) { return false; }
    }
    static List<String> artworkFolders(String root,String folder) {
        List<String> result=new ArrayList<>();
        try {
            root=libraryRoot(root); folder=path(folder); if(!withinRoot(root,folder)) return result;
            String boundary="",probe=folder;
            while(withinRoot(root,probe)) {
                if(name(probe).matches("(?i).*RJ[0-9]{5,10}.*")) { boundary=probe; break; }
                if(probe.equals(root)) break;
                probe=parent(probe);
            }
            result.add(folder);
            if(!boundary.isEmpty()) {
                while(!folder.equals(boundary)) { folder=parent(folder); result.add(folder); }
            } else if(!folder.equals(root) && mediaFolder(name(folder))) {
                String parent=parent(folder);
                // A generic collection root must not donate another album's cover.
                if(!parent.equals(root)) result.add(parent);
            }
        } catch(Exception ignored) { }
        return result;
    }
    private static boolean mediaFolder(String value) {
        String name=value.toLowerCase(Locale.ROOT);
        return name.contains("audio") || name.contains("voice") || name.contains("sound") || name.contains("track")
                || name.contains("flac") || name.contains("wav") || name.contains("mp3") || name.contains("m4a")
                || name.contains("\u97f3\u58f0") || name.contains("\u97f3\u8072") || name.contains("\u97f3\u8f68") || name.contains("\u97f3\u6e90")
                || name.contains("\u672c\u7de8") || name.contains("\u672c\u7bc7") || name.contains("\u6b63\u7bc7") || name.contains("\u6b63\u7247");
    }
    static String parent(String path) { int slash=path.lastIndexOf('/'); return slash<=0?"/":path.substring(0,slash); }
    static String name(String path) { return path.substring(path.lastIndexOf('/')+1); }
    static boolean domain(String host,String suffix) { return host!=null && (host.equals(suffix) || host.endsWith("."+suffix)); }
    static boolean downloadUrl(String text) {
        try { URI uri=new URI(text); String host=uri.getHost();
            return uri.getScheme().equals("https") && uri.getUserInfo()==null && uri.getFragment()==null
                    && (uri.getPort()==-1 || uri.getPort()==443) && (domain(host,"baidu.com") || domain(host,"baidupcs.com") || domain(host,"baidubce.com"));
        } catch(Exception e) { return false; }
    }
    static String secureUrl(String text) {
        if(text.startsWith("http://")) {
            String secure="https:"+text.substring(5); if(downloadUrl(secure)) return secure;
        }
        return text;
    }
    static boolean authorizationUrl(String text) {
        try { URI uri=new URI(text); return downloadUrl(text) && domain(uri.getHost(),"baidu.com"); }
        catch(Exception e) { return false; }
    }
    static String mediaUri(String owner,String file) throws Exception { id(owner); id(file); return SCHEME+"://"+owner+"/"+file; }
    static String[] mediaIdentity(String value) throws Exception {
        URI uri=new URI(value); String owner=uri.getHost(),file=uri.getPath()==null?"":uri.getPath().substring(1);
        if(!SCHEME.equals(uri.getScheme()) || uri.getQuery()!=null || uri.getFragment()!=null || uri.getUserInfo()!=null || uri.getPort()!=-1) throw failure("\u4e91\u7aef\u97f3\u8f68\u5730\u5740\u65e0\u6548");
        id(owner); id(file); return new String[]{owner,file};
    }
    static String stem(String file) { int dot=file.lastIndexOf('.'); return (dot<0?file:file.substring(0,dot)).toLowerCase(Locale.ROOT); }
    static JSONArray queue(String owner,String folder,JSONArray entries,String cover) throws Exception {
        id(owner); folder=path(folder); List<JSONObject> audio=new ArrayList<>(); Map<String,JSONObject> subtitles=new HashMap<>();
        for(int i=0;i<entries.length();i++) {
            JSONObject entry=entries.getJSONObject(i); if(entry.optInt("isdir")!=0 || !parent(entry.getString("path")).equals(folder)) continue;
            String file=entry.getString("server_filename"),extension=LocalIndex.extension(file);
            if(LocalIndex.audio(file)) audio.add(entry);
            if(extension.equals("lrc") || extension.equals("vtt")) {
                String key=stem(file); if(!subtitles.containsKey(key) || extension.equals("lrc")) subtitles.put(key,entry);
            }
        }
        audio.sort((a,b)->LocalIndex.natural(a.optString("server_filename"),b.optString("server_filename")));
        long album=UUID.nameUUIDFromBytes(("baidu:"+owner+":"+folder).getBytes(java.nio.charset.StandardCharsets.UTF_8)).getMostSignificantBits();
        album=album==Long.MIN_VALUE?-1:-Math.max(1,Math.abs(album)); JSONArray result=new JSONArray();
        for(JSONObject entry:audio) {
            String file=entry.getString("server_filename"),fid=entry.optString("fs_id"); id(fid);
            JSONObject sub=subtitles.get(stem(file));
            if(sub!=null) id(sub.optString("fs_id"));
            result.put(new JSONObject().put("baidu_cloud",true).put("cloud_owner",owner).put("cloud_id",fid)
                    .put("cloud_folder",folder).put("cloud_size",entry.optLong("size",0)).put("cloud_subtitle",sub==null?"":sub.optString("fs_id"))
                    .put("title",file).put("workTitle",name(folder).isEmpty()?"\u767e\u5ea6\u7f51\u76d8":name(folder))
                    .put("workId",album).put("hash","baidu:"+owner+":"+fid).put("mediaStreamUrl",mediaUri(owner,fid))
                    .put("local_file_path","").put("local_cover",cover).put("type","audio"));
        }
        return result;
    }
}
