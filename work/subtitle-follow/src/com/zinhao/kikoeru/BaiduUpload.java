package com.zinhao.kikoeru;

import java.io.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.*;

/** Explicit copy-only folder upload. Does not rename, delete or overwrite source or destination. */
public final class BaiduUpload {
    static final int BLOCK=4*1024*1024, MAX_BLOCKS=10000, MAX_ENTRIES=50000;
    public interface Source {
        LocalIndex.Entry document(String uri) throws Exception;
        List<LocalIndex.Entry> children(String uri) throws Exception;
        boolean contains(String parent,String child) throws Exception;
        String key(String uri) throws Exception;
        InputStream open(String uri) throws Exception;
    }
    public interface Cloud {
        void directory(String path) throws Exception;
        JSONObject precreate(String path,long size,JSONArray hashes) throws Exception;
        String part(String path,String uploadId,int index,byte[] bytes,int count) throws Exception;
        JSONObject finish(String path,long size,String uploadId,JSONArray hashes) throws Exception;
        void verify(String path,long size) throws Exception;
    }
    public interface Progress {
        boolean cancelled();
        void update(String stage,String name,int complete,int total,long done,long bytes);
    }
    public static final class Item {
        final String uri,relative; final boolean directory; final long size;
        Item(String uri,String relative,boolean directory,long size) { this.uri=uri; this.relative=relative; this.directory=directory; this.size=size; }
    }
    public static final class Plan {
        public final String name; public final int files,folders; public final long bytes; public final boolean unknownSizes;
        final List<Item> items; final Source source; final String sourceRoot,selected; final AtomicBoolean used=new AtomicBoolean();
        Plan(String name,int files,int folders,long bytes,boolean unknown,List<Item> items,Source source,String sourceRoot,String selected) {
            this.name=name; this.files=files; this.folders=folders; this.bytes=bytes; this.unknownSizes=unknown;
            this.items=Collections.unmodifiableList(items); this.source=source; this.sourceRoot=sourceRoot; this.selected=selected;
        }
    }
    private static final class Pending {
        final LocalIndex.Entry entry; final String relative; final int depth;
        Pending(LocalIndex.Entry entry,String relative,int depth) { this.entry=entry; this.relative=relative; this.depth=depth; }
    }
    static String name(String value) throws IOException {
        if(value==null || value.isEmpty() || value.equals(".") || value.equals("..") || value.length()>255 || !value.equals(value.trim())
                || value.endsWith(".") || value.indexOf('/')>=0 || value.indexOf('\\')>=0 || value.matches(".*[\\x00-\\x1f<>:\"|?*].*")
                || value.toLowerCase(Locale.ROOT).matches(".*%(2e|2f|5c).*"))
            throw new IOException("\u6587\u4ef6\u6216\u6587\u4ef6\u5939\u540d\u5305\u542b\u7f51\u76d8\u4e0d\u652f\u6301\u7684\u5b57\u7b26");
        return value;
    }
    private static void check(Progress progress) {
        if(progress.cancelled()) throw new CancellationException();
    }
    public static Plan prepare(String sourceRoot,String selected,Source source,Progress progress) throws Exception {
        if(source==null || sourceRoot==null || selected==null || !source.contains(sourceRoot,selected)) throw new IOException("\u6240\u9009\u4f5c\u54c1\u4e0d\u5728\u5df2\u5bfc\u5165\u7684\u6587\u4ef6\u5939\u4e2d");
        LocalIndex.Entry root=source.document(selected);
        if(root==null || !root.directory || !source.key(root.uri).equals(source.key(selected))) throw new IOException("\u65e0\u6cd5\u8bfb\u53d6\u6240\u9009\u4f5c\u54c1");
        name(root.name); ArrayDeque<Pending> pending=new ArrayDeque<>(); pending.add(new Pending(root,"",0));
        Set<String> seen=new HashSet<>(); List<Item> items=new ArrayList<>(); int files=0,folders=0; long bytes=0; boolean unknown=false;
        while(!pending.isEmpty()) {
            check(progress); Pending current=pending.removeFirst(); LocalIndex.Entry entry=current.entry;
            if(current.depth>64 || items.size()>=MAX_ENTRIES) throw new IOException("\u4f5c\u54c1\u76ee\u5f55\u5c42\u7ea7\u6216\u6587\u4ef6\u6570\u8d85\u8fc7\u4e0a\u9650");
            if(!seen.add(source.key(entry.uri)) || !source.contains(selected,entry.uri)) throw new IOException("\u6587\u4ef6\u5939\u5305\u542b\u91cd\u590d\u6216\u8d8a\u754c\u6587\u4ef6");
            items.add(new Item(entry.uri,current.relative,entry.directory,entry.size));
            if(entry.directory) {
                folders++; List<LocalIndex.Entry> children=source.children(entry.uri); children.sort((a,b)->LocalIndex.natural(a.name,b.name));
                Set<String> names=new HashSet<>();
                for(LocalIndex.Entry child:children) {
                    String part=name(child.name); if(!names.add(part)) throw new IOException("\u6587\u4ef6\u5939\u5185\u5b58\u5728\u540c\u540d\u9879\uff0c\u65e0\u6cd5\u4fdd\u5b58\u539f\u7ed3\u6784");
                    pending.addLast(new Pending(child,current.relative.isEmpty()?part:current.relative+"/"+part,current.depth+1));
                }
            } else {
                files++; if(entry.size<=0) unknown=true;
                if(entry.size>0) { if(Long.MAX_VALUE-bytes<entry.size) throw new IOException("\u6587\u4ef6\u603b\u5927\u5c0f\u8d85\u8fc7\u4e0a\u9650"); bytes+=entry.size; }
            }
            progress.update("scan",entry.name,files,0,bytes,0);
        }
        if(files==0) throw new IOException("\u6240\u9009\u76ee\u5f55\u6ca1\u6709\u6587\u4ef6");
        return new Plan(root.name,files,folders,bytes,unknown,items,source,sourceRoot,selected);
    }
    private static void unchanged(Plan plan,Progress progress) throws Exception {
        Progress quiet=new Progress() {
            public boolean cancelled() { return progress.cancelled(); }
            public void update(String s,String n,int c,int t,long d,long b) { }
        };
        Plan live=prepare(plan.sourceRoot,plan.selected,plan.source,quiet);
        if(!plan.name.equals(live.name) || plan.items.size()!=live.items.size()) throw new IOException("\u672c\u5730\u4f5c\u54c1\u76ee\u5f55\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u68c0\u67e5");
        for(int i=0;i<plan.items.size();i++) { Item a=plan.items.get(i),b=live.items.get(i);
            if(!a.uri.equals(b.uri) || !a.relative.equals(b.relative) || a.directory!=b.directory || a.size!=b.size)
                throw new IOException("\u672c\u5730\u4f5c\u54c1\u76ee\u5f55\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u68c0\u67e5");
        }
    }
    private static String child(String root,String relative) throws IOException {
        String result=relative.isEmpty()?root:BaiduApi.path(root+"/"+relative);
        if(!BaiduApi.withinRoot(root,result)) throw new IOException("\u4e91\u7aef\u8def\u5f84\u8d85\u51fa\u4f5c\u54c1\u76ee\u5f55");
        return result;
    }
    public static void execute(Plan plan,String destination,String folderName,Cloud cloud,Progress progress,boolean confirmed) throws Exception {
        if(plan==null || cloud==null || progress==null || !confirmed || !plan.used.compareAndSet(false,true)) throw new IOException("\u8bf7\u5148\u91cd\u65b0\u786e\u8ba4\u4e0a\u4f20");
        destination=BaiduApi.libraryRoot(destination); String album=BaiduApi.path(destination+"/"+name(folderName));
        if(!BaiduApi.withinRoot(destination,album)) throw new IOException("\u4e91\u7aef\u8def\u5f84\u65e0\u6548");
        progress.update("scan","",0,plan.files,0,plan.bytes); unchanged(plan,progress);
        int completed=0; long done=0; byte[] buffer=new byte[BLOCK];
        for(Item item:plan.items) {
            check(progress); String path=child(album,item.relative);
            if(item.directory) { cloud.directory(path); continue; }
            String display=item.relative; progress.update("hash",display,completed,plan.files,done,plan.bytes);
            List<String> hashes=new ArrayList<>(); long actual=0;
            try(InputStream input=plan.source.open(item.uri)) {
                if(input==null) throw new IOException("\u672c\u5730\u6587\u4ef6\u65e0\u6cd5\u8bfb\u53d6");
                while(true) { check(progress); int count=readBlock(input,buffer); if(count==0) break;
                    hashes.add(md5(buffer,count)); actual+=count;
                    if(hashes.size()>MAX_BLOCKS) throw new IOException("\u5355\u4e2a\u6587\u4ef6\u7684\u5206\u7247\u6570\u8d85\u8fc7\u4e0a\u9650");
                }
            }
            if(hashes.isEmpty()) hashes.add(md5(buffer,0));
            if(item.size>0 && item.size!=actual) throw new IOException("\u672c\u5730\u6587\u4ef6\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u4e0a\u4f20");
            JSONArray blocks=new JSONArray(hashes); check(progress);
            JSONObject pending=cloud.precreate(path,actual,blocks); check(progress);
            if(pending.optInt("return_type",1)!=1 && pending.optInt("return_type",1)!=2) throw new IOException("\u767e\u5ea6\u9884\u4e0a\u4f20\u54cd\u5e94\u65e0\u6548");
            if(pending.optInt("return_type",1)==2) {
                cloud.verify(path,actual);
            } else {
                String uploadId=pending.optString("uploadid"); JSONArray requested=pending.optJSONArray("block_list");
                if(uploadId.isEmpty() || uploadId.length()>1024 || requested==null) throw new IOException("\u767e\u5ea6\u9884\u4e0a\u4f20\u54cd\u5e94\u65e0\u6548");
                boolean[] needed=new boolean[hashes.size()];
                for(int i=0;i<requested.length();i++) { int index=requested.getInt(i); if(index<0 || index>=needed.length || needed[index]) throw new IOException("\u767e\u5ea6\u8fd4\u56de\u4e86\u65e0\u6548\u5206\u7247"); needed[index]=true; }
                if(requested.length()==0) Arrays.fill(needed,true);
                try(InputStream input=plan.source.open(item.uri)) {
                    if(input==null) throw new IOException("\u672c\u5730\u6587\u4ef6\u65e0\u6cd5\u8bfb\u53d6");
                    long offset=0;
                    for(int index=0;index<hashes.size();index++) {
                        check(progress); int count=readBlock(input,buffer);
                        if(!hashes.get(index).equals(md5(buffer,count))) throw new IOException("\u672c\u5730\u6587\u4ef6\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u4e0a\u4f20");
                        if(needed[index]) {
                            String received=cloud.part(path,uploadId,index,buffer,count);
                            if(!hashes.get(index).equalsIgnoreCase(received)) throw new IOException("\u4e91\u7aef\u5206\u7247\u6821\u9a8c\u5931\u8d25");
                        }
                        offset+=count; progress.update("upload",display,completed,plan.files,done+offset,plan.bytes);
                    }
                    if(input.read()!=-1 || offset!=actual) throw new IOException("\u672c\u5730\u6587\u4ef6\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u4e0a\u4f20");
                }
                check(progress); JSONObject created=cloud.finish(path,actual,uploadId,blocks);
                if(created.has("path") && !path.equals(created.optString("path"))) throw new IOException("\u4e91\u7aef\u6587\u4ef6\u8def\u5f84\u4e0d\u5339\u914d");
                if(created.has("size") && created.optLong("size",-1)!=actual) throw new IOException("\u4e91\u7aef\u6587\u4ef6\u5927\u5c0f\u4e0d\u5339\u914d");
                cloud.verify(path,actual);
            }
            completed++; done+=actual; progress.update("upload",display,completed,plan.files,done,plan.bytes);
        }
        check(progress); progress.update("scan","",completed,plan.files,done,plan.bytes); unchanged(plan,progress);
    }
    private static int readBlock(InputStream input,byte[] buffer) throws IOException {
        int count=0;
        while(count<buffer.length) {
            int n=input.read(buffer,count,buffer.length-count); if(n<0) break;
            if(n==0) { int b=input.read(); if(b<0) break; buffer[count++]=(byte)b; } else count+=n;
        }
        return count;
    }
    private static String md5(byte[] bytes,int count) throws Exception {
        MessageDigest digest=MessageDigest.getInstance("MD5"); digest.update(bytes,0,count); byte[] hash=digest.digest();
        char[] hex="0123456789abcdef".toCharArray(),result=new char[hash.length*2];
        for(int i=0;i<hash.length;i++) { result[i*2]=hex[(hash[i]&255)>>>4]; result[i*2+1]=hex[hash[i]&15]; }
        return new String(result);
    }
}
