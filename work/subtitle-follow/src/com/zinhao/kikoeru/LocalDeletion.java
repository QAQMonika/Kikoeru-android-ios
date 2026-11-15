package com.zinhao.kikoeru;

import android.content.Context;
import android.content.UriPermission;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.CancellationException;
import java.util.function.BooleanSupplier;
import org.json.JSONArray;
import org.json.JSONObject;

/** A confirmed, bounded SAF folder operation; never falls back to raw filesystem paths. */
public final class LocalDeletion {
    private static volatile Snapshot active;
    static boolean isActive() { return active!=null; }
    public interface Provider {
        LocalIndex.Entry document(String uri) throws Exception;
        List<LocalIndex.Entry> children(String uri) throws Exception;
        boolean contains(String parent,String child) throws Exception;
        boolean canDelete(String uri) throws Exception;
        boolean delete(String uri) throws Exception;
    }
    public static final class Snapshot {
        public final String source,target,name,path;
        public final int files,folders,tracks;
        public final long bytes;
        private final Set<String> keys;
        private final SortedMap<String,String> contents;
        private boolean used,started;
        Snapshot(String source,String target,String name,String path,int files,int folders,int tracks,
                long bytes,SortedMap<String,String> contents) {
            this.source=source; this.target=target; this.name=name; this.path=path;
            this.files=files; this.folders=folders; this.tracks=tracks; this.bytes=bytes;
            this.contents=Collections.unmodifiableSortedMap(new TreeMap<>(contents));
            keys=Collections.unmodifiableSet(new HashSet<>(contents.keySet()));
        }
    }
    public static String key(String value) {
        Uri uri=Uri.parse(value);
        if(!"content".equals(uri.getScheme()) || uri.getAuthority()==null)
            throw new IllegalArgumentException("Not a document URI");
        String id;
        try { id=DocumentsContract.getDocumentId(uri); }
        catch(IllegalArgumentException e) { id=DocumentsContract.getTreeDocumentId(uri); }
        if(id.isEmpty()) throw new IllegalArgumentException("Empty document ID");
        return uri.getAuthority().toLowerCase(Locale.ROOT)+"\n"+id;
    }
    public static boolean hasWrite(Context context,String source) {
        Uri expected=Uri.parse(source);
        for(UriPermission grant:context.getContentResolver().getPersistedUriPermissions())
            if(expected.equals(grant.getUri()) && grant.isWritePermission()) return true;
        return false;
    }
    public static Provider provider(Context context,String source) {
        return new SafProvider(context.getApplicationContext(),source);
    }
    private static final class SafProvider implements Provider {
        final Context context;
        final LocalDocuments documents;
        final String source;
        SafProvider(Context context,String source) {
            this.context=context; this.source=source;
            documents=new LocalDocuments(context,Uri.parse(source));
        }
        public LocalIndex.Entry document(String value) throws Exception {
            Uri uri=Uri.parse(value);
            String[] columns={DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                    DocumentsContract.Document.COLUMN_DISPLAY_NAME,DocumentsContract.Document.COLUMN_MIME_TYPE,
                    DocumentsContract.Document.COLUMN_SIZE};
            try(Cursor c=context.getContentResolver().query(uri,columns,null,null,null)) {
                if(c==null || !c.moveToFirst()) throw new IOException("Folder unavailable");
                return new LocalIndex.Entry(DocumentsContract.buildDocumentUriUsingTree(Uri.parse(source),c.getString(0)).toString(),
                        c.getString(1),c.getString(2),DocumentsContract.Document.MIME_TYPE_DIR.equals(c.getString(2)),
                        c.isNull(3)?0:c.getLong(3));
            }
        }
        public List<LocalIndex.Entry> children(String uri) throws Exception { return documents.children(uri); }
        public boolean contains(String parent,String child) throws Exception {
            return key(parent).equals(key(child)) || DocumentsContract.isChildDocument(
                    context.getContentResolver(),Uri.parse(parent),Uri.parse(child));
        }
        public boolean canDelete(String uri) throws Exception {
            try(Cursor c=context.getContentResolver().query(Uri.parse(uri),
                    new String[]{DocumentsContract.Document.COLUMN_FLAGS},null,null,null)) {
                return c!=null && c.moveToFirst() && (c.getInt(0)&DocumentsContract.Document.FLAG_SUPPORTS_DELETE)!=0;
            }
        }
        public boolean delete(String uri) throws Exception {
            if(!hasWrite(context,source)) throw new SecurityException("Folder write grant is required");
            return DocumentsContract.deleteDocument(context.getContentResolver(),Uri.parse(uri));
        }
    }
    public static Snapshot prepare(JSONArray roots,String source,String target,Provider provider,
            BooleanSupplier cancelled) throws Exception {
        if(source.isEmpty() || target.isEmpty()) throw new IOException("Missing selected folder");
        JSONObject root=null,selected=null;
        for(int i=0;i<roots.length();i++) if(source.equals(roots.getJSONObject(i).optString("uri"))) {
            root=roots.getJSONObject(i); break;
        }
        if(root==null) throw new IOException("Import is no longer present");
        String document=root.getString("document");
        JSONArray entries=root.getJSONArray("entries");
        for(int i=0;i<entries.length();i++) {
            JSONObject node=entries.getJSONObject(i);
            if(node.optBoolean("directory") && key(node.getString("uri")).equals(key(target))) { selected=node; break; }
        }
        if(selected==null || selected.optInt("count")<=0) throw new IOException("Select an indexed work folder");
        // A collection import is not itself a deletable album. A directly imported audio album is.
        if(key(document).equals(key(target))) {
            boolean directAudio=false;
            for(int i=0;i<entries.length();i++) {
                JSONObject node=entries.getJSONObject(i);
                if(!node.optBoolean("directory") && node.optString("parent").equals(document)) directAudio=true;
            }
            if(!directAudio) throw new IOException("Cannot delete the whole collection import");
        }
        if(!provider.contains(document,target)) throw new SecurityException("Folder is outside the selected import");
        LocalIndex.Entry folder=provider.document(target);
        if(!folder.directory || !key(folder.uri).equals(key(target))) throw new IOException("Folder identity changed");
        if(!provider.canDelete(target)) throw new IOException("\u6587\u4ef6\u63d0\u4f9b\u65b9\u4e0d\u652f\u6301\u5220\u9664\u6b64\u6587\u4ef6\u5939");
        int files=0,folders=0,tracks=0; long bytes=0;
        SortedMap<String,String> contents=new TreeMap<>();
        ArrayDeque<LocalIndex.Entry> pending=new ArrayDeque<>(); pending.add(folder);
        while(!pending.isEmpty()) {
            if(cancelled.getAsBoolean()) throw new CancellationException();
            LocalIndex.Entry node=pending.removeFirst(); String identity=key(node.uri);
            if(contents.containsKey(identity)) throw new IOException("Repeated document or folder cycle");
            if(contents.size()>=100000) throw new IOException("Work contains too many documents");
            if(!provider.contains(target,node.uri)) throw new SecurityException("Document escaped the selected work");
            contents.put(identity,new JSONArray().put(node.name).put(node.mime).put(node.directory).put(node.size).toString());
            if(node.directory) { folders++; pending.addAll(provider.children(node.uri)); }
            else {
                files++; if(LocalIndex.audio(node.name)) tracks++;
                long size=Math.max(0,node.size); bytes=Long.MAX_VALUE-bytes<size?Long.MAX_VALUE:bytes+size;
            }
        }
        return new Snapshot(source,target,folder.name,selected.optString("path",folder.name),files,folders,tracks,bytes,contents);
    }
    private static void rejectQueued(Snapshot snapshot,List<JSONObject> queue) {
        if(queue==null) return;
        for(JSONObject track:queue) if(track!=null && track.optBoolean("local_import")
                && snapshot.keys.contains(key(track.optString("mediaStreamUrl"))))
            throw new IllegalStateException("\u8be5\u4f5c\u54c1\u4ecd\u5728\u64ad\u653e\u961f\u5217\u4e2d\uff0c\u8bf7\u5148\u5207\u6362\u5230\u5176\u4ed6\u4f5c\u54c1\u540e\u518d\u5220\u9664");
    }
    public static synchronized void begin(Snapshot snapshot,List<JSONObject> queue,boolean enabled,boolean confirmed) {
        synchronized(BaiduTransfer.OPERATIONS) {
            if(!enabled || !confirmed) throw new IllegalStateException("Deletion is not enabled and confirmed");
            if(BaiduTransfer.running()) throw new IllegalStateException("\u6709\u4e91\u7aef\u4e0a\u4f20\u4efb\u52a1\u65f6\u4e0d\u80fd\u5220\u9664\u672c\u5730\u4f5c\u54c1");
            if(active!=null || snapshot.used) throw new IllegalStateException("A fresh deletion confirmation is required");
            rejectQueued(snapshot,queue); snapshot.used=true; active=snapshot;
        }
    }
    public static synchronized void checkPlayback(List<JSONObject> queue) {
        if(active!=null) rejectQueued(active,queue);
    }
    public static synchronized void finish(Snapshot snapshot) { if(active==snapshot) active=null; }
    public static void execute(Snapshot snapshot,JSONArray currentRoots,Provider provider,
            boolean enabled,boolean confirmed) throws Exception {
        synchronized(LocalDeletion.class) {
            if(active!=snapshot || snapshot.started || !enabled || !confirmed) throw new IllegalStateException("No fresh confirmed deletion");
            snapshot.started=true;
        }
        Snapshot live=prepare(currentRoots,snapshot.source,snapshot.target,provider,()->false);
        if(!live.contents.equals(snapshot.contents))
            throw new IOException("\u6587\u4ef6\u5939\u5185\u5bb9\u5df2\u53d8\u5316\uff0c\u8bf7\u91cd\u65b0\u786e\u8ba4\u5220\u9664\u8303\u56f4");
        if(!provider.delete(snapshot.target)) throw new IOException("\u7cfb\u7edf\u672a\u786e\u8ba4\u5220\u9664\u6210\u529f\uff0c\u7d22\u5f15\u4fdd\u7559\uff0c\u8bf7\u68c0\u67e5\u6587\u4ef6\u5939\u540e\u91cd\u65b0\u626b\u63cf");
    }
    private static boolean removed(Snapshot snapshot,String uri) {
        return uri.startsWith("content:") && snapshot.keys.contains(key(uri));
    }
    public static JSONArray prune(JSONArray roots,Snapshot snapshot) throws Exception {
        JSONArray result=new JSONArray();
        for(int i=0;i<roots.length();i++) {
            JSONObject root=new JSONObject(roots.getJSONObject(i).toString());
            String document=root.getString("document");
            if(removed(snapshot,document)) continue;
            JSONArray entries=root.getJSONArray("entries"),kept=new JSONArray();
            Map<String,JSONObject> folders=new HashMap<>(); List<JSONObject> tracks=new ArrayList<>();
            for(int j=0;j<entries.length();j++) {
                JSONObject node=entries.getJSONObject(j);
                if(removed(snapshot,node.getString("uri"))) continue;
                if(removed(snapshot,node.optString("cover"))) node.put("cover","");
                if(node.optBoolean("directory")) { node.put("count",0); folders.put(node.getString("uri"),node); }
                else tracks.add(node);
                kept.put(node);
            }
            for(JSONObject track:tracks) {
                String parent=track.optString("parent"); Set<String> seen=new HashSet<>();
                while(folders.containsKey(parent) && seen.add(parent)) {
                    JSONObject folder=folders.get(parent); folder.put("count",folder.optInt("count")+1);
                    parent=folder.optString("parent");
                }
            }
            JSONArray pruned=new JSONArray();
            for(int j=0;j<kept.length();j++) {
                JSONObject node=kept.getJSONObject(j);
                if(!node.optBoolean("directory") || node.optInt("count")>0 || node.optString("uri").equals(document)) pruned.put(node);
            }
            if(removed(snapshot,root.optString("cover"))) root.put("cover","");
            root.put("entries",pruned).put("count",tracks.size()); result.put(root);
        }
        LocalIndex.artHints(result); return result;
    }
}
