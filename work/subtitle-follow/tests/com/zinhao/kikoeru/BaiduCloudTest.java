package com.zinhao.kikoeru;

import java.io.*;
import java.net.*;
import java.security.cert.Certificate;
import java.util.*;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import org.json.*;

/** Synthetic credentials only. No internet, real authorization or source-file access. */
public final class BaiduCloudTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    interface Throwing { void run() throws Exception; }
    private static void rejected(Throwing task,String message) throws Exception {
        boolean rejected=false; try { task.run(); } catch(Exception expected) { rejected=true;
            check(!String.valueOf(expected.getMessage()).contains("TEST_SECRET"),"No secret in errors"); }
        check(rejected,message);
    }
    private static final class Store implements BaiduApi.Store {
        JSONObject value=new JSONObject(); int writes;
        public JSONObject read() throws Exception { return new JSONObject(value.toString()); }
        public void write(JSONObject value) throws Exception { this.value=new JSONObject(value.toString()); writes++; }
    }
    private static final class Clock implements BaiduApi.Clock { long now=1000000; public long now() { return now; } }
    private static final class Network implements BaiduApi.Network {
        final List<String> endpoints=new ArrayList<>(); final List<Map<String,String>> queries=new ArrayList<>();
        final Queue<JSONObject> replies=new ArrayDeque<>();
        public JSONObject get(String endpoint,Map<String,String> parameters) throws Exception {
            endpoints.add(endpoint); queries.add(new LinkedHashMap<>(parameters));
            if(replies.isEmpty()) throw new AssertionError("Unexpected request "+endpoint); return replies.remove();
        }
        void add(String json) throws Exception { replies.add(new JSONObject(json)); }
    }
    private static JSONObject entry(String id,String path,boolean directory) throws Exception {
        return new JSONObject().put("fs_id",new java.math.BigInteger(id)).put("path",path)
                .put("server_filename",BaiduApi.name(path)).put("isdir",directory?1:0).put("size",1234567);
    }
    private static final class Connection extends HttpsURLConnection {
        final int status; final String range,location; final byte[] bytes; boolean disconnected;
        Connection(URL url,int status,String range,String location,byte[] bytes) { super(url); this.status=status; this.range=range; this.location=location; this.bytes=bytes; }
        public int getResponseCode() { return status; }
        public String getHeaderField(String name) { return name.equals("Content-Range")?range:name.equals("Location")?location:null; }
        public long getContentLengthLong() { return bytes.length; }
        public InputStream getInputStream() { return new ByteArrayInputStream(bytes); }
        public InputStream getErrorStream() { return getInputStream(); }
        public void disconnect() { disconnected=true; } public boolean usingProxy() { return false; } public void connect() {}
        public String getCipherSuite() { return "TLS_TEST"; } public Certificate[] getLocalCertificates() { return null; } public Certificate[] getServerCertificates() { return null; }
    }
    public static void main(String[] arguments) throws Exception {
        Store store=new Store(); Network network=new Network(); Clock clock=new Clock(); BaiduApi api=new BaiduApi(store,network,clock);
        rejected(()->api.beginDevice(),"Missing keys fail before network"); check(network.endpoints.isEmpty(),"No request without own keys");
        for(String value:new String[]{"","123","key\nvalue","https://test.invalid/key"}) rejected(()->api.configure(value,"TEST_SECRET"),"Invalid credentials rejected");
        api.configure("TEST_KEY","TEST_SECRET"); check(store.value.optString("access").isEmpty(),"Configuration does not invent authorization");
        network.add("{\"device_code\":\"DEVICE\",\"user_code\":\"123456\",\"verification_url\":\"https://openapi.baidu.com/device\",\"expires_in\":600,\"interval\":5}");
        JSONObject device=api.beginDevice();
        check(network.endpoints.get(0).equals(BaiduApi.OAUTH+"device/code"),"Only official device endpoint");
        check(network.queries.get(0).get("client_id").equals("TEST_KEY"),"AppKey, not AppID");
        check(!network.queries.get(0).containsKey("client_secret"),"Device-code request needs no secret");
        network.add("{\"error\":\"authorization_pending\"}"); check(api.pollDevice(device).optString("error").equals("authorization_pending"),"Pending is not failure");
        network.add("{\"error\":\"slow_down\"}"); check(api.pollDevice(device).optString("error").equals("slow_down"),"Server poll backoff retained");
        network.add("{\"access_token\":\"ACCESS_A\",\"refresh_token\":\"REFRESH_A\",\"expires_in\":1000}");
        network.add("{\"errno\":0,\"uk\":1234567890123456,\"netdisk_name\":\"Synthetic\",\"vip_type\":2}");
        JSONObject account=api.pollDevice(device);
        check(account.optBoolean("connected") && account.optString("owner").equals("1234567890123456"),"Stable account identity after official authorization");
        check(account.optInt("vip")==2 && !account.has("access_token"),"UI gets profile, not access token");
        check(network.queries.get(3).get("client_secret").equals("TEST_SECRET"),"Token sent only to official token endpoint");
        String owner=account.getString("owner");
        JSONObject file=entry("9007199254740993","/Album/02.wav",false);
        network.replies.add(new JSONObject().put("errno",0).put("list",new JSONArray().put(file)));
        check(api.list(owner,"/Album",0,200).getJSONObject(0).optString("fs_id").equals("9007199254740993"),"IDs beyond double precision preserved");
        Map<String,String> listing=network.queries.get(network.queries.size()-1);
        check(listing.get("start").equals("0") && listing.get("limit").equals("200") && listing.get("method").equals("list"),"Bounded paired start/limit");
        rejected(()->api.list("999","/Album",0,200),"Different account rejected");
        rejected(()->api.list(owner,"/Album/../Other",0,200),"Traversal rejected");
        check(BaiduApi.libraryRoot("/Library/").equals("/Library"),"Explicit root has a canonical boundary");
        rejected(()->BaiduApi.libraryRoot("/"),"Disk root is not an implicit library");
        rejected(()->BaiduApi.libraryRoot("/Library//Nested"),"Ambiguous repeated separators rejected");
        check(BaiduApi.withinRoot("/Library","/Library") && BaiduApi.withinRoot("/Library","/Library/Album/Sub"),"Selected root and descendants are visible");
        check(!BaiduApi.withinRoot("/Library","/Library2") && !BaiduApi.withinRoot("/Library","/Library/../Other"),"Sibling prefixes and traversal stay outside root");
        check(!BaiduApi.withinRoot("/","/Library") && !BaiduApi.withinRoot("","/Library"),"Unset or legacy root cannot expose the disk");
        check(BaiduApi.withinRoot("/\u4f5c\u54c1","/\u4f5c\u54c1/\u97f3\u9891"),"Unicode directory paths retain their scope");
        check(BaiduApi.artworkFolders("/Library","/Library/RJ123456/Audio").equals(Arrays.asList("/Library/RJ123456/Audio","/Library/RJ123456")),"Cloud tracks may inherit their own album cover");
        check(BaiduApi.artworkFolders("/Library","/Library/RJ123456").equals(Arrays.asList("/Library/RJ123456")),"Collection root never becomes an album fallback");
        check(BaiduApi.artworkFolders("/Library/RJ123456","/Library/RJ123456/Audio").equals(Arrays.asList("/Library/RJ123456/Audio","/Library/RJ123456")),"A directly selected RJ album may supply its cover");
        check(BaiduApi.artworkFolders("/Library","/Library2/RJ123456").isEmpty() && BaiduApi.artworkFolders("/Library","/Library/../Other").isEmpty(),"Artwork lookups cannot leave the selected root");
        check(BaiduApi.artworkFolders("/Library","/Library/Series/RJ123456/Audio").equals(Arrays.asList("/Library/Series/RJ123456/Audio","/Library/Series/RJ123456")),"An RJ album boundary stops before its containing series");
        check(BaiduApi.artworkFolders("/Library","/Library/Series/RJ123456").equals(Arrays.asList("/Library/Series/RJ123456")),"An album does not inherit a series cover");
        check(BaiduApi.artworkFolders("/Library","/Library/Series/Album").equals(Arrays.asList("/Library/Series/Album")),"Ambiguous collection parents are not used as album covers");
        check(BaiduApi.artworkFolders("/Library","/Library/Series/Album/Audio").equals(Arrays.asList("/Library/Series/Album/Audio","/Library/Series/Album")),"A named audio folder may inherit its immediate album cover");
        network.replies.add(new JSONObject().put("errno",0).put("list",new JSONArray().put(entry("4","/Other/02.wav",false))));
        rejected(()->api.list(owner,"/Album",0,200),"Cross-folder server response rejected");
        clock.now+=1000000; network.add("{\"access_token\":\"ACCESS_B\",\"refresh_token\":\"REFRESH_B\",\"expires_in\":1000}");
        network.add("{\"errno\":0,\"list\":[]}"); api.list(owner,"/Album",0,200);
        check(store.value.getString("refresh").equals("REFRESH_B"),"Rotating refresh token is persisted");
        check(api.state().optBoolean("configured") && !api.state().has("secret") && !api.state().has("access") && !api.state().has("refresh"),"UI state never contains app secrets or session tokens");
        network.add("{\"errno\":111}"); network.add("{\"access_token\":\"ACCESS_C\",\"expires_in\":1000}"); network.add("{\"errno\":0,\"list\":[]}");
        api.list(owner,"/Album",0,200); check(store.value.getString("refresh").equals("REFRESH_B"),"Refresh without replacement retains valid refresh token");
        network.add("{\"errno\":0,\"list\":[{\"fs_id\":9007199254740993,\"isdir\":0,\"dlink\":\"https://d.pcs.baidu.com/file/test?sign=synthetic\"}]}");
        String link=api.link(owner,"9007199254740993",false); check(link.contains("&access_token=ACCESS_C"),"Correct separator preserves signed query");
        int requests=network.endpoints.size(); check(link.equals(api.link(owner,"9007199254740993",false)) && requests==network.endpoints.size(),"Short-lived links reuse in-memory cache");
        check(!store.value.toString().contains("d.pcs"),"Signed download URL never persisted");
        for(String unsafe:new String[]{"http://d.pcs.baidu.com/a","https://baidu.com.evil.invalid/a","https://evil.invalid/a","https://user@d.pcs.baidu.com/a","https://d.pcs.baidu.com:123/a","https://d.pcs.baidu.com/a#token"}) check(!BaiduApi.downloadUrl(unsafe),"Unsafe redirect rejected");
        for(String safe:new String[]{"https://d.pcs.baidu.com/a","https://bj.baidupcs.com/a","https://bucket.baidubce.com/a"}) check(BaiduApi.downloadUrl(safe),"Owned HTTPS CDN accepted");
        check(!BaiduApi.authorizationUrl("https://bucket.baidubce.com/login"),"Authorization stays on Baidu account domains");
        String stable=BaiduApi.mediaUri(owner,"9007199254740993"); check(!stable.contains("ACCESS") && BaiduApi.mediaIdentity(stable)[1].equals("9007199254740993"),"Queue URI is an immutable file identity");
        for(String bad:new String[]{stable+"?access_token=bad",stable+"#x","kiko-baidu://123/../4","kiko-baidu://user@123/4","https://123/4"}) rejected(()->BaiduApi.mediaIdentity(bad),"Malformed cloud identity rejected");
        JSONArray contents=new JSONArray().put(entry("10","/Album/10.wav",false)).put(file).put(entry("3","/Album/02.lrc",false))
                .put(entry("4","/Album/02.vtt",false)).put(entry("6","/Album/Sub/02.lrc",false)).put(entry("9","/Album/Sub",true));
        JSONArray queue=BaiduApi.queue(owner,"/Album",contents,"file:///private/cover.img");
        check(queue.length()==2 && queue.getJSONObject(0).optString("title").equals("02.wav"),"Natural audio order");
        JSONObject track=queue.getJSONObject(0);
        check(track.getString("cloud_subtitle").equals("3"),"Same-folder LRC takes priority over VTT");
        check(track.optLong("cloud_size")==1234567,"A cloud track retains its file size for bounded embedded-cover reads");
        check(track.optBoolean("baidu_cloud") && !track.optBoolean("local_import"),"Cloud cannot enter local-source deletion path");
        check(track.optLong("workId")<0 && track.optString("local_file_path").isEmpty(),"Offline metadata contract preserved without claiming a local file");
        check(!queue.toString().contains("ACCESS_") && !queue.toString().contains("REFRESH_") && !queue.toString().contains("TEST_SECRET"),"Playback checkpoints contain no authorization secrets");
        check(!TrackResume.key(track).isEmpty(),"Existing per-track resume accepts stable cloud IDs");
        JSONObject renamed=new JSONObject(track.toString()).put("title","Renamed.wav").put("local_cover","").put("workId",-999);
        check(TrackResume.key(track).equals(TrackResume.key(renamed)),"Renaming and cover changes do not lose position");
        JSONObject different=new JSONObject(track.toString()).put("cloud_owner","999");
        check(!TrackResume.key(track).equals(TrackResume.key(different)),"Accounts do not share bookmarks");
        network.add("{\"device_code\":\"REAUTH\",\"user_code\":\"654321\",\"verification_url\":\"http://openapi.baidu.com/device\",\"expires_in\":600}");
        JSONObject reauth=api.beginDevice(); check(reauth.getString("verification_url").startsWith("https://"),"Legacy authorization URL is upgraded before opening");
        clock.now+=1000000;
        network.add("{\"access_token\":\"ACCESS_D\",\"refresh_token\":\"REFRESH_D\",\"expires_in\":1000}"); network.add("{\"errno\":0,\"list\":[]}");
        api.list(owner,"/Album",0,200);
        api.cancelAuthorization(reauth.getLong("_revision"));
        check(store.value.optString("owner").equals(owner) && store.value.optString("refresh").equals("REFRESH_D"),"Cancelling reauthorization preserves the old account and its newly rotated refresh token");
        network.add("{\"device_code\":\"NEW\",\"user_code\":\"111111\",\"verification_url\":\"https://openapi.baidu.com/device\",\"expires_in\":30}");
        JSONObject fresh=api.beginDevice(); long revision=fresh.getLong("_revision");
        api.cancelAuthorization(reauth.getLong("_revision")); check(store.value.optLong("revision")==revision,"Old cancellation cannot invalidate a newer authorization");
        clock.now+=30000; rejected(()->api.pollDevice(fresh),"Expired device code fails without a token request");
        api.cancelAuthorization(revision);
        network.add("{\"errno\":0,\"list\":[{\"fs_id\":9,\"isdir\":0,\"dlink\":\"https://evil.invalid/file\"}]}");
        rejected(()->api.link(owner,"9",true),"Untrusted metadata download URL never receives an access token");
        api.disconnect(); rejected(()->api.link(owner,"9007199254740993",false),"Logout invalidates cached URLs");
        rejected(()->api.pollDevice(device),"Old auth polling cannot resurrect a disconnected session");
        check(!store.value.has("access") && !store.value.has("refresh"),"Disconnect clears persisted tokens but retains own app configuration");
        check(BaiduHttp.range(100,50).equals("bytes=100-149") && BaiduHttp.range(100,-1).equals("bytes=100-"),"Precise seek byte ranges");
        check(BaiduHttp.responseLength(206,100,"bytes 100-149/1000",50)==50,"Matching partial response");
        rejected(()->BaiduHttp.responseLength(200,100,null,1000),"Server ignoring Range cannot trigger full-file seek download");
        rejected(()->BaiduHttp.responseLength(206,100,"bytes 0-49/1000",50),"Wrong-offset partial response rejected");
        rejected(()->BaiduHttp.read(new ByteArrayInputStream(new byte[101]),100),"Small metadata/image/subtitle limits enforced");
        final Connection[] observed=new Connection[1];
        BaiduHttp transport=new BaiduHttp(url->observed[0]=new Connection(url,206,"bytes 100-149/1000",null,new byte[50]));
        try(BaiduHttp.Opened opened=transport.open("https://d.pcs.baidu.com/file/test",100,50)) {
            check(opened.length==50 && opened.input.read(new byte[50])==50,"Transport streams only requested content");
            check(observed[0].getRequestProperty("Range").equals("bytes=100-149"),"Actual request carries Range");
            check(observed[0].getRequestProperty("User-Agent").equals("pan.baidu.com"),"Baidu-only user agent");
            check(observed[0].getRequestProperty("Authorization")==null && observed[0].getRequestProperty("Cookie")==null,"No asmr.one token or browser cookies in CDN request");
        }
        check(observed[0].disconnected,"Stream close releases connection");
        int[] openedCount={0};
        BaiduHttp redirect=new BaiduHttp(url->{ openedCount[0]++; return new Connection(url,302,null,"https://evil.invalid/file",new byte[0]); });
        rejected(()->redirect.open("https://d.pcs.baidu.com/file/test",0,-1),"Redirect domain checked before request"); check(openedCount[0]==1,"No request or token sent to untrusted host");
        rejected(()->transport.get(BaiduApi.XPAN+"file",BaiduApi.params("method","delete")),"Read-only client rejects cloud delete");
        byte[] key=new byte[32]; Arrays.fill(key,(byte)7); SecretKeySpec secret=new SecretKeySpec(key,"AES");
        byte[] plain="{\"secret\":\"TEST_SECRET\",\"refresh\":\"SYNTHETIC\"}".getBytes("UTF-8");
        byte[] encrypted=BaiduVault.seal(secret,plain),encrypted2=BaiduVault.seal(secret,plain);
        check(!Arrays.equals(encrypted,encrypted2),"Fresh GCM nonce for every credential save");
        check(Arrays.equals(BaiduVault.unseal(secret,encrypted),plain),"Encrypted credentials round-trip");
        check(!new String(encrypted,"ISO-8859-1").contains("TEST_SECRET"),"No plaintext key in credential payload");
        encrypted[encrypted.length-1]^=1; rejected(()->BaiduVault.unseal(secret,encrypted),"Tampering fails closed");
        rejected(()->BaiduVault.unseal(new SecretKeySpec(new byte[32],"AES"),encrypted2),"Another key cannot read credentials");
        rejected(()->BaiduVault.unseal(secret,new byte[2]),"Truncated credentials do not fall back to plaintext");
        check(network.replies.isEmpty(),"All synthetic request expectations consumed");
        System.out.println("PASS: "+checks+" Baidu authorization, identity, read-only, Range, redirect, resume and encryption checks");
    }
}
