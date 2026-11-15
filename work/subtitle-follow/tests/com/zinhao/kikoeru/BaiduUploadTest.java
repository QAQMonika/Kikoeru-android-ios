package com.zinhao.kikoeru;

import java.io.*;
import java.net.*;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.concurrent.CancellationException;
import javax.net.ssl.HttpsURLConnection;
import org.json.*;

/** Entirely synthetic local trees, cloud responses and HTTPS connections. */
public final class BaiduUploadTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    interface Throwing { void run() throws Exception; }
    private static void rejected(Throwing task,String message) throws Exception {
        boolean failed=false; try { task.run(); } catch(Exception expected) { failed=true;
            check(!String.valueOf(expected.getMessage()).contains("TEST_TOKEN"),"Secrets are not included in errors"); }
        check(failed,message);
    }
    private static final class Progress implements BaiduUpload.Progress {
        boolean cancel; int updates;
        public boolean cancelled() { return cancel; }
        public void update(String phase,String name,int complete,int total,long done,long bytes) { updates++; }
    }
    private static final class Source implements BaiduUpload.Source {
        final Map<String,LocalIndex.Entry> nodes=new LinkedHashMap<>(); final Map<String,List<LocalIndex.Entry>> children=new HashMap<>();
        final Map<String,byte[]> data=new HashMap<>(); int opens; boolean mutate;
        void dir(String uri,String parent,String name) { add(new LocalIndex.Entry(uri,name,"directory",true,0),parent); }
        void file(String uri,String parent,String name,byte[] bytes) { add(new LocalIndex.Entry(uri,name,"file",false,bytes.length),parent); data.put(uri,bytes); }
        void add(LocalIndex.Entry entry,String parent) { nodes.put(entry.uri,entry); if(parent!=null) children.computeIfAbsent(parent,k->new ArrayList<>()).add(entry); }
        public LocalIndex.Entry document(String uri) { return nodes.get(uri); }
        public List<LocalIndex.Entry> children(String uri) { return new ArrayList<>(children.getOrDefault(uri,Collections.emptyList())); }
        public boolean contains(String parent,String child) { return child.equals(parent) || child.startsWith(parent+"/"); }
        public String key(String uri) { return uri; }
        public InputStream open(String uri) {
            opens++; byte[] original=data.get(uri),bytes=original.clone();
            if(mutate && opens==2 && bytes.length>0) bytes[0]^=1;
            return new ByteArrayInputStream(bytes);
        }
    }
    private static String md5(byte[] bytes,int count) throws Exception {
        MessageDigest digest=MessageDigest.getInstance("MD5"); digest.update(bytes,0,count); StringBuilder out=new StringBuilder();
        for(byte b:digest.digest()) out.append(String.format(Locale.ROOT,"%02x",b&255)); return out.toString();
    }
    private static final class Cloud implements BaiduUpload.Cloud {
        final List<String> directories=new ArrayList<>(),finished=new ArrayList<>(),verified=new ArrayList<>();
        final List<Integer> parts=new ArrayList<>(); final Map<String,Long> sizes=new HashMap<>();
        boolean conflict,instant,badMd5,failVerify,onlySecond; JSONArray lastHashes; Runnable onFinish;
        public void directory(String path) throws Exception { if(conflict) throw new IOException("Already exists"); directories.add(path); }
        public JSONObject precreate(String path,long size,JSONArray hashes) throws Exception {
            lastHashes=new JSONArray(hashes.toString()); sizes.put(path,size);
            if(instant) return new JSONObject().put("return_type",2);
            JSONArray needed=new JSONArray(); for(int i=0;i<hashes.length();i++) if(!onlySecond || i==1) needed.put(i);
            return new JSONObject().put("return_type",1).put("uploadid","SYNTHETIC").put("block_list",needed);
        }
        public String part(String path,String id,int index,byte[] bytes,int count) throws Exception {
            check(id.equals("SYNTHETIC"),"Only the matching synthetic upload ID reaches a part"); parts.add(index); return badMd5?"bad":md5(bytes,count);
        }
        public JSONObject finish(String path,long size,String id,JSONArray hashes) throws Exception {
            check(hashes.toString().equals(lastHashes.toString()),"Final create retains every original block hash");
            finished.add(path); if(onFinish!=null) { Runnable action=onFinish; onFinish=null; action.run(); }
            return new JSONObject().put("path",path).put("size",size);
        }
        public void verify(String path,long size) throws Exception {
            if(failVerify) throw new IOException("Verification failed");
            check(sizes.get(path)==size,"Remote size matches local bytes"); verified.add(path);
        }
    }
    private static Source source() {
        Source source=new Source(); source.dir("root",null,"Library"); source.dir("root/album","root","RJ123");
        byte[] audio=new byte[BaiduUpload.BLOCK+137]; for(int i=0;i<audio.length;i++) audio[i]=(byte)(i*31);
        source.file("root/album/audio","root/album","01.m4a",audio);
        source.file("root/album/lrc","root/album","01.lrc","[00:01]text".getBytes());
        source.dir("root/album/img","root/album","img"); source.file("root/album/img/cover","root/album/img","cover.png",new byte[]{1,2,3});
        return source;
    }
    private static final class Connection extends HttpsURLConnection {
        final int status; final String body; final ByteArrayOutputStream sent=new ByteArrayOutputStream(); boolean disconnected;
        Connection(URL url,int status,String body) { super(url); this.status=status; this.body=body; }
        public OutputStream getOutputStream() { return sent; }
        public int getResponseCode() { return status; }
        public InputStream getInputStream() { return new ByteArrayInputStream(body.getBytes(java.nio.charset.StandardCharsets.UTF_8)); }
        public InputStream getErrorStream() { return getInputStream(); }
        public void disconnect() { disconnected=true; } public boolean usingProxy() { return false; } public void connect() {}
        public String getCipherSuite() { return "TLS_TEST"; } public Certificate[] getLocalCertificates() { return null; } public Certificate[] getServerCertificates() { return null; }
        long length() { return fixedContentLengthLong>=0?fixedContentLengthLong:fixedContentLength; }
    }
    public static void main(String[] arguments) throws Exception {
        Progress progress=new Progress(); Source source=source(); Cloud cloud=new Cloud();
        BaiduUpload.Plan plan=BaiduUpload.prepare("root","root/album",source,progress);
        check(plan.files==3 && plan.folders==2 && plan.name.equals("RJ123"),"Complete album tree is planned");
        check(source.opens==0 && cloud.directories.isEmpty(),"Planning does not open media or write to the cloud");
        rejected(()->BaiduUpload.execute(plan,"/Library","RJ123",cloud,progress,false),"Explicit confirmation is required");
        check(cloud.directories.isEmpty(),"Cancellation before confirmation makes no remote changes");
        BaiduUpload.execute(plan,"/Library","RJ123",cloud,progress,true);
        check(cloud.directories.equals(Arrays.asList("/Library/RJ123","/Library/RJ123/img")),"Directories created inside the chosen cloud root");
        check(cloud.finished.size()==3 && cloud.verified.size()==3 && cloud.parts.size()==4,"Audio, subtitle and cover are uploaded and checked");
        check(progress.updates>0 && source.data.size()==3,"Progress is emitted and local files are preserved");
        rejected(()->BaiduUpload.execute(plan,"/Library","RJ123",cloud,progress,true),"Confirmation is single-use");

        Source collisionSource=source(); BaiduUpload.Plan collisionPlan=BaiduUpload.prepare("root","root/album",collisionSource,new Progress()); Cloud collision=new Cloud(); collision.conflict=true;
        rejected(()->BaiduUpload.execute(collisionPlan,"/Library","RJ123",collision,new Progress(),true),"Existing album stops upload before any part");
        check(collision.parts.isEmpty() && collision.finished.isEmpty(),"Conflict never uploads or overwrites files");
        Source mutated=source(); BaiduUpload.Plan mutatedPlan=BaiduUpload.prepare("root","root/album",mutated,new Progress()); mutated.mutate=true; Cloud changed=new Cloud();
        rejected(()->BaiduUpload.execute(mutatedPlan,"/Library","RJ123",changed,new Progress(),true),"Changes between hashing and upload are detected");
        check(changed.finished.isEmpty(),"A changed source is not finalized");
        Source edited=source(); BaiduUpload.Plan editedPlan=BaiduUpload.prepare("root","root/album",edited,new Progress());
        edited.file("root/album/new","root/album","new.txt",new byte[]{9}); Cloud noWrites=new Cloud();
        rejected(()->BaiduUpload.execute(editedPlan,"/Library","RJ123",noWrites,new Progress(),true),"Changes to the planned tree are detected before upload");
        check(noWrites.directories.isEmpty(),"A stale confirmation cannot create a cloud folder");
        Source midUpload=source(); BaiduUpload.Plan midPlan=BaiduUpload.prepare("root","root/album",midUpload,new Progress()); Cloud midCloud=new Cloud();
        midCloud.onFinish=()->midUpload.file("root/album/new","root/album","new.txt",new byte[]{9});
        rejected(()->BaiduUpload.execute(midPlan,"/Library","RJ123",midCloud,new Progress(),true),"Changes during upload are not reported as complete");
        check(midCloud.finished.size()>0 && midUpload.data.size()==4,"Partial cloud data and all local files are retained on interruption");
        Source selective=source(); BaiduUpload.Plan selectivePlan=BaiduUpload.prepare("root","root/album",selective,new Progress()); Cloud partial=new Cloud(); partial.onlySecond=true;
        BaiduUpload.execute(selectivePlan,"/Library","RJ123",partial,new Progress(),true);
        check(partial.parts.contains(1),"Server-requested second block is uploaded");
        Source instantSource=source(); BaiduUpload.Plan instantPlan=BaiduUpload.prepare("root","root/album",instantSource,new Progress()); Cloud instant=new Cloud(); instant.instant=true;
        BaiduUpload.execute(instantPlan,"/Library","RJ123",instant,new Progress(),true);
        check(instant.parts.isEmpty() && instant.verified.size()==3,"Instant uploads are still verified");
        Source corruptSource=source(); BaiduUpload.Plan corruptPlan=BaiduUpload.prepare("root","root/album",corruptSource,new Progress()); Cloud corrupt=new Cloud(); corrupt.badMd5=true;
        rejected(()->BaiduUpload.execute(corruptPlan,"/Library","RJ123",corrupt,new Progress(),true),"Wrong server part checksum aborts");
        check(corrupt.finished.isEmpty(),"Checksum failure never finalizes the file");
        Source broken=source(); BaiduUpload.Plan brokenPlan=BaiduUpload.prepare("root","root/album",broken,new Progress()); Cloud verify=new Cloud(); verify.failVerify=true;
        rejected(()->BaiduUpload.execute(brokenPlan,"/Library","RJ123",verify,new Progress(),true),"Verification failure is not reported as completion");
        Progress cancelled=new Progress(); cancelled.cancel=true; Source stopped=source(); Cloud untouched=new Cloud();
        rejected(()->BaiduUpload.prepare("root","root/album",stopped,cancelled),"Scanning is cancellable"); check(untouched.directories.isEmpty(),"Cancellation makes no remote changes");
        rejected(()->BaiduUpload.prepare("elsewhere","root/album",source(),new Progress()),"Source must belong to the selected tree");
        Source outside=source(); outside.file("outside","root/album","outside.txt",new byte[]{1});
        rejected(()->BaiduUpload.prepare("root","root/album",outside,new Progress()),"Escaping child URI is rejected");
        rejected(()->BaiduUpload.name("../outside"),"Path traversal rejected");
        rejected(()->BaiduUpload.name("%2e%2e"),"Encoded traversal rejected");
        rejected(()->BaiduUpload.name("bad/name"),"Path separators rejected");
        check(BaiduUpload.name("\u4f5c\u54c1 01").equals("\u4f5c\u54c1 01"),"Normal Unicode folder names are retained");

        final Connection[] observed=new Connection[1];
        BaiduUploadHttp http=new BaiduUploadHttp(url->observed[0]=new Connection(url,200,"{\"errno\":0}"));
        http.form("create","TEST_TOKEN",BaiduApi.params("path","/Library/RJ123","isdir","1","rtype","0"));
        String body=observed[0].sent.toString("UTF-8");
        check(observed[0].getURL().getHost().equals("pan.baidu.com") && observed[0].getRequestMethod().equals("POST"),"Only the official form endpoint is used");
        check(body.contains("rtype=0") && body.contains("isdir=1") && !body.contains("TEST_TOKEN"),"No-overwrite and form/token separation");
        check(observed[0].length()==observed[0].sent.size() && observed[0].disconnected,"Form uses fixed length and closes connection");
        String validHash="d41d8cd98f00b204e9800998ecf8427e";
        http.form("precreate","TEST_TOKEN",BaiduApi.params("path","/Library/RJ123/a","isdir","0","rtype","0","size","0","autoinit","1","block_list","[\""+validHash+"\"]"));
        check(observed[0].sent.toString("UTF-8").contains("autoinit=1"),"Valid precreate is form encoded");
        http.form("create","TEST_TOKEN",BaiduApi.params("path","/Library/RJ123/a","isdir","0","rtype","0","size","0","uploadid","synthetic","block_list","[\""+validHash+"\"]"));
        check(observed[0].sent.toString("UTF-8").contains("uploadid=synthetic"),"Valid final create retains the upload ID");
        rejected(()->http.form("precreate","TEST_TOKEN",BaiduApi.params("path","/Library/a","isdir","0","rtype","0","size","1","autoinit","1","block_list","[\"bad\"]")),"Invalid block checksums are rejected before transport");
        int[] connections={0}; BaiduUploadHttp guarded=new BaiduUploadHttp(url->{ connections[0]++; return new Connection(url,302,"{}"); });
        rejected(()->guarded.form("delete","TEST_TOKEN",BaiduApi.params("path","/Library/x","isdir","1","rtype","0")),"Delete is not an allowed upload operation");
        rejected(()->guarded.form("create","TEST_TOKEN",BaiduApi.params("path","/Library/x","isdir","1","rtype","2")),"Overwrite mode is rejected");
        rejected(()->guarded.form("create","TEST_TOKEN",BaiduApi.params("path","/Library/x","isdir","1","rtype","0","opera","delete")),"Unrecognized file-management fields are rejected");
        rejected(()->guarded.form("create","TEST_TOKEN",BaiduApi.params("path","/Library/x","isdir","1","rtype","0")),"Redirects are not followed");
        check(connections[0]==1,"No secret is forwarded to a redirected host");
        BaiduUploadHttp partHttp=new BaiduUploadHttp(url->observed[0]=new Connection(url,200,"{\"md5\":\"dummy\"}"));
        partHttp.part("TEST_TOKEN","/Library/RJ123/01.m4a","SYNTHETIC",0,new byte[]{4,5,6},3,()->false);
        check(observed[0].getURL().getHost().equals("d.pcs.baidu.com"),"Multipart uses the official PCS upload endpoint");
        check(observed[0].length()==observed[0].sent.size() && observed[0].getRequestProperty("Content-Type").startsWith("multipart/form-data"),"Multipart Content-Length is exact");
        check(observed[0].disconnected,"Multipart releases connection");
        rejected(()->partHttp.part("TEST_TOKEN","/Library/RJ123/x","SYNTHETIC",0,new byte[1],1,()->true),"Cancellation stops before opening an upload");
        System.out.println("PASS: "+checks+" copy-only album planning, checksums, containment, confirmation and upload HTTP checks");
    }
}
