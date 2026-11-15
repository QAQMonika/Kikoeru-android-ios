package com.zinhao.kikoeru;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

public final class LocalDocuments implements LocalIndex.Provider {
    static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private final Context context;
    private final Uri tree;
    private static final String[] COLUMNS={DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME,DocumentsContract.Document.COLUMN_MIME_TYPE,
            DocumentsContract.Document.COLUMN_SIZE};
    public LocalDocuments(Context context, Uri tree) { this.context=context.getApplicationContext(); this.tree=tree; }
    private LocalIndex.Entry entry(Cursor c) {
        String id=c.getString(0), mime=c.getString(2);
        return new LocalIndex.Entry(DocumentsContract.buildDocumentUriUsingTree(tree,id).toString(),
                c.getString(1),mime,DocumentsContract.Document.MIME_TYPE_DIR.equals(mime),c.isNull(3)?0:c.getLong(3));
    }
    public LocalIndex.Entry root() throws Exception {
        Uri doc=DocumentsContract.buildDocumentUriUsingTree(tree,DocumentsContract.getTreeDocumentId(tree));
        try(Cursor c=context.getContentResolver().query(doc,COLUMNS,null,null,null)) {
            if(c==null || !c.moveToFirst()) throw new IOException("Folder unavailable");
            return entry(c);
        }
    }
    @Override public List<LocalIndex.Entry> children(String uri) throws Exception {
        Uri doc=Uri.parse(uri);
        Uri children=DocumentsContract.buildChildDocumentsUriUsingTree(tree,DocumentsContract.getDocumentId(doc));
        List<LocalIndex.Entry> result=new ArrayList<>();
        try(Cursor c=context.getContentResolver().query(children,COLUMNS,null,null,null)) {
            if(c==null) throw new IOException("Cannot read folder");
            while(c.moveToNext()) result.add(entry(c));
        }
        return result;
    }
    private static AtomicFile index(Context c) { return new AtomicFile(new File(c.getFilesDir(),"local-library.json")); }
    static JSONArray load(Context c) throws Exception {
        AtomicFile file=index(c);
        if(!file.getBaseFile().exists()) return new JSONArray();
        try(InputStream in=file.openRead()) {
            JSONArray roots=new JSONObject(new String(read(in,64*1024*1024),StandardCharsets.UTF_8)).getJSONArray("roots");
            LocalIndex.artHints(roots);
            return roots;
        }
    }
    static void save(Context c, JSONArray roots) throws Exception {
        AtomicFile file=index(c); FileOutputStream stream=null;
        byte[] bytes=new JSONObject().put("version",1).put("roots",roots).toString().getBytes(StandardCharsets.UTF_8);
        if(bytes.length>64*1024*1024) throw new IOException("Index exceeds 64 MB; import smaller folders");
        try {
            stream=file.startWrite();
            stream.write(bytes);
            file.finishWrite(stream);
        } catch(Exception e) { if(stream!=null) file.failWrite(stream); throw e; }
    }
    static byte[] read(InputStream in, int limit) throws IOException {
        if(in==null) throw new IOException("Document unavailable");
        ByteArrayOutputStream out=new ByteArrayOutputStream(); byte[] buffer=new byte[8192]; int n;
        while((n=in.read(buffer))!=-1) {
            if(out.size()+n>limit) throw new IOException("Document too large");
            out.write(buffer,0,n);
        }
        return out.toByteArray();
    }
}
