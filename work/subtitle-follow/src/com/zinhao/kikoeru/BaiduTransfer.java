package com.zinhao.kikoeru;

import android.content.Context;
import android.net.Uri;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** One app-process upload at a time. No token or source content is persisted by this manager. */
public final class BaiduTransfer {
    static final Object OPERATIONS=new Object();
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static volatile Job current;
    public static final class Job implements BaiduUpload.Progress {
        public volatile boolean running=true,cancel;
        public volatile String stage="",name="",message="";
        public volatile int completed,total;
        public volatile long done,bytes;
        public boolean cancelled() { return cancel; }
        public void update(String stage,String name,int complete,int total,long done,long bytes) {
            this.stage=stage; this.name=name; this.completed=complete; this.total=total; this.done=done; this.bytes=bytes;
        }
    }
    static Job current() { return current; }
    static boolean running() { Job job=current; return job!=null && job.running; }
    static BaiduUpload.Source source(Context context,String tree) {
        final Context app=context.getApplicationContext(); final LocalDeletion.Provider provider=LocalDeletion.provider(app,tree);
        return new BaiduUpload.Source() {
            public LocalIndex.Entry document(String uri) throws Exception { return provider.document(uri); }
            public List<LocalIndex.Entry> children(String uri) throws Exception { return provider.children(uri); }
            public boolean contains(String parent,String child) throws Exception { return provider.contains(parent,child); }
            public String key(String uri) { return LocalDeletion.key(uri); }
            public InputStream open(String uri) throws Exception { return app.getContentResolver().openInputStream(Uri.parse(uri)); }
        };
    }
    static synchronized Job start(Context context,BaiduUpload.Plan plan,String owner,String root,String name) throws Exception {
        synchronized(OPERATIONS) {
        if(running() || LocalDeletion.isActive()) throw new IOException("\u5f53\u524d\u6709\u4e0a\u4f20\u6216\u5220\u9664\u4efb\u52a1\uff0c\u8bf7\u5148\u7b49\u5f85\u5b8c\u6210");
        Context app=context.getApplicationContext(); BaiduApi.id(owner); root=BaiduApi.libraryRoot(root); BaiduUpload.name(name);
        String selected=app.getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
        if(!root.equals(selected)) throw new IOException("\u4e91\u7aef\u4f5c\u54c1\u76ee\u5f55\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u9009\u62e9");
        final String target=root; Job job=new Job(); current=job;
        IO.execute(()-> {
            try {
                BaiduUpload.execute(plan,target,name,new Cloud(app,owner,target,job),job,true);
                job.message="\u4e0a\u4f20\u5b8c\u6210\uff1b\u672c\u5730\u539f\u6587\u4ef6\u4ecd\u7136\u4fdd\u7559";
            } catch(CancellationException e) { job.message="\u5df2\u53d6\u6d88\uff1b\u5df2\u4e0a\u4f20\u7684\u90e8\u5206\u4f1a\u7559\u5728\u7f51\u76d8\uff0c\u672c\u5730\u539f\u6587\u4ef6\u672a\u5220\u9664"; }
            catch(Exception e) { job.message=BaiduCloud.message(e)+"\n\u5df2\u4e0a\u4f20\u7684\u90e8\u5206\u4f1a\u7559\u5728\u7f51\u76d8\uff0c\u672c\u5730\u539f\u6587\u4ef6\u672a\u5220\u9664"; }
            finally { job.running=false; }
        });
        return job;
        }
    }
    private static final class Cloud implements BaiduUpload.Cloud {
        final Context context; final String owner,root; final Job job; final BaiduApi api; final BaiduUploadHttp http=new BaiduUploadHttp();
        Cloud(Context context,String owner,String root,Job job) { this.context=context; this.owner=owner; this.root=root; this.job=job; api=BaiduCloud.api(context); }
        private void check(String path) throws Exception {
            if(job.cancel) throw new CancellationException();
            String selected=context.getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
            if(!root.equals(selected) || !BaiduApi.withinRoot(root,path)) throw new IOException("\u4e91\u7aef\u76ee\u5f55\u5df2\u66f4\u6362\uff0c\u4e0a\u4f20\u505c\u6b62");
        }
        private static int code(JSONObject value) {
            if(value.has("errno")) return value.optInt("errno",-1);
            return value.has("error_code")?value.optInt("error_code",-1):0;
        }
        private static boolean expired(int code) { return code==110 || code==111 || code==-6; }
        private static void ok(JSONObject response,boolean allowMissingErrno) throws IOException {
            int error=code(response);
            if(error==-8) throw BaiduApi.failure("\u4e91\u7aef\u5df2\u6709\u540c\u540d\u6587\u4ef6\u6216\u6587\u4ef6\u5939\uff0c\u4e3a\u9632\u8986\u76d6\u5df2\u505c\u6b62\uff0c\u8bf7\u6362\u540d\u540e\u91cd\u8bd5");
            if(error==6 || error==10 || error==31045 || error==20016) throw BaiduApi.failure("\u767e\u5ea6\u5e94\u7528\u6ca1\u6709\u76ee\u6807\u76ee\u5f55\u7684\u5199\u5165\u6743\u9650\uff0c\u8bf7\u68c0\u67e5\u5e94\u7528\u6388\u6743");
            if(error!=0) throw BaiduApi.failure("\u767e\u5ea6\u4e0a\u4f20\u5931\u8d25\uff08\u4ee3\u7801 "+error+"\uff09");
            if(!allowMissingErrno && !response.has("errno")) throw BaiduApi.failure("\u767e\u5ea6\u4e0a\u4f20\u54cd\u5e94\u65e0\u6548");
        }
        private JSONObject form(String method,String path,Map<String,String> body) throws Exception {
            check(path); if(!path.equals(body.get("path"))) throw new IOException("Cloud path mismatch");
            JSONObject result=http.form(method,api.uploadToken(owner,false),body);
            if(expired(code(result))) { check(path); result=http.form(method,api.uploadToken(owner,true),body); }
            ok(result,false); return result;
        }
        public void directory(String path) throws Exception {
            JSONObject result=form("create",path,BaiduApi.params("path",path,"isdir","1","rtype","0"));
            if(result.has("path") && !path.equals(result.optString("path"))) throw BaiduApi.failure("\u4e91\u7aef\u6587\u4ef6\u5939\u8def\u5f84\u4e0d\u5339\u914d");
            if(result.has("isdir") && result.optInt("isdir")!=1) throw BaiduApi.failure("\u4e91\u7aef\u6587\u4ef6\u5939\u7c7b\u578b\u4e0d\u5339\u914d");
        }
        public JSONObject precreate(String path,long size,JSONArray hashes) throws Exception {
            return form("precreate",path,BaiduApi.params("path",path,"size",String.valueOf(size),"isdir","0","rtype","0","autoinit","1","block_list",hashes.toString()));
        }
        public String part(String path,String uploadId,int index,byte[] bytes,int count) throws Exception {
            Exception last=null;
            for(int attempt=0;attempt<3;attempt++) {
                check(path);
                try {
                    JSONObject result=http.part(api.uploadToken(owner,false),path,uploadId,index,bytes,count,()->job.cancel);
                    if(expired(code(result))) { check(path); result=http.part(api.uploadToken(owner,true),path,uploadId,index,bytes,count,()->job.cancel); }
                    ok(result,true); String md5=result.optString("md5"); if(md5.isEmpty()) throw new IOException("\u767e\u5ea6\u672a\u8fd4\u56de\u5206\u7247\u6821\u9a8c\u503c"); return md5;
                } catch(CancellationException e) { throw e; }
                catch(Exception e) { last=e; if(attempt<2) Thread.sleep(500L*(attempt+1)); }
            }
            throw last;
        }
        public JSONObject finish(String path,long size,String uploadId,JSONArray hashes) throws Exception {
            return form("create",path,BaiduApi.params("path",path,"size",String.valueOf(size),"isdir","0","rtype","0","uploadid",uploadId,"block_list",hashes.toString()));
        }
        public void verify(String path,long size) throws Exception {
            check(path); String parent=BaiduApi.parent(path),name=BaiduApi.name(path);
            for(int attempt=0;attempt<3;attempt++) {
                for(int offset=0;offset<10000;offset+=500) {
                    check(path); JSONArray rows=api.list(owner,parent,offset,500);
                    for(int i=0;i<rows.length();i++) { JSONObject item=rows.getJSONObject(i);
                        if(path.equals(item.optString("path")) && name.equals(item.optString("server_filename")) && item.optInt("isdir")==0 && item.optLong("size",-1)==size) return;
                    }
                    if(rows.length()<500) break;
                }
                if(attempt<2) Thread.sleep(300L*(attempt+1));
            }
            throw BaiduApi.failure("\u672a\u80fd\u786e\u8ba4\u4e91\u7aef\u6587\u4ef6\u548c\u5927\u5c0f\uff0c\u8bf7\u5728\u7f51\u76d8\u4e2d\u68c0\u67e5");
        }
    }
}
