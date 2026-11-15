package com.zinhao.kikoeru;

import android.content.Context;
import android.net.Uri;
import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.source.DefaultMediaSourceFactory;
import com.google.android.exoplayer2.upstream.*;
import java.io.*;
import java.util.*;

/** Resolves stable account/file IDs on the loader thread, with Range-aware retries. */
public final class BaiduPlayback {
    public static boolean isUri(String value) { return value!=null && value.startsWith(BaiduApi.SCHEME+"://"); }
    public static void configure(Context context,ExoPlayer.Builder builder) {
        Context app=context.getApplicationContext();
        DataSource.Factory originals=new DefaultDataSource.Factory(app);
        builder.setMediaSourceFactory(new DefaultMediaSourceFactory(()->new Routing(app,originals.createDataSource())));
    }
    private static final class Routing implements DataSource {
        private final DataSource original,cloud;
        private DataSource active;
        Routing(Context context,DataSource original) { this.original=original; cloud=new Remote(context); }
        public void addTransferListener(TransferListener listener) { original.addTransferListener(listener); cloud.addTransferListener(listener); }
        public long open(DataSpec spec) throws IOException { active=isUri(spec.uri.toString())?cloud:original; return active.open(spec); }
        public int read(byte[] data,int offset,int length) throws IOException { return active.read(data,offset,length); }
        public Uri getUri() { return active==null?null:active.getUri(); }
        public Map<String,List<String>> getResponseHeaders() { return active==null?Collections.emptyMap():active.getResponseHeaders(); }
        public void close() throws IOException { if(active!=null) { try { active.close(); } finally { active=null; } } }
    }
    private static final class Remote extends BaseDataSource {
        private final Context context;
        private BaiduHttp.Opened opened;
        private Uri uri;
        private long remaining;
        private boolean started;
        Remote(Context context) { super(true); this.context=context; }
        @Override public long open(DataSpec spec) throws IOException {
            transferInitializing(spec); uri=spec.uri;
            try {
                String[] identity=BaiduApi.mediaIdentity(uri.toString());
                if(spec.length==0) { remaining=0; return 0; }
                for(int attempt=0;attempt<2;attempt++) {
                    try { opened=new BaiduHttp().open(BaiduCloud.api(context).link(identity[0],identity[1],attempt>0),spec.position,spec.length); break; }
                    catch(BaiduHttp.Failure e) { if(attempt!=0 || (e.status!=401 && e.status!=403)) throw e; }
                }
                remaining=opened.length; started=true; transferStarted(spec); return remaining;
            } catch(Exception e) { close(); throw new IOException(BaiduCloud.message(e)); }
        }
        @Override public int read(byte[] data,int offset,int length) throws IOException {
            if(length==0) return 0; if(remaining==0) return -1;
            int count;
            try { count=opened.input.read(data,offset,remaining<0?length:(int)Math.min(length,remaining)); }
            catch(IOException e) { throw new IOException("\u4e91\u7aef\u97f3\u9891\u8fde\u63a5\u4e2d\u65ad\uff0c\u8bf7\u91cd\u8bd5"); }
            if(count<0 && remaining>0) throw new EOFException("\u4e91\u7aef\u97f3\u9891\u63d0\u524d\u4e2d\u65ad");
            if(count>0) { if(remaining>0) remaining-=count; bytesTransferred(count); } return count;
        }
        @Override public Uri getUri() { return uri; }
        @Override public void close() throws IOException {
            try { if(opened!=null) opened.close(); }
            finally { opened=null; uri=null; if(started) { started=false; transferEnded(); } }
        }
    }
}
