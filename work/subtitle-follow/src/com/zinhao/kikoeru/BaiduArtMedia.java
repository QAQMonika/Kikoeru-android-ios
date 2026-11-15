package com.zinhao.kikoeru;

import android.media.MediaDataSource;
import android.media.MediaMetadataRetriever;
import java.io.IOException;
import java.nio.ByteBuffer;

/** Android's M4A metadata parser with the same bounded, seekable cloud reader. */
public final class BaiduArtMedia {
    static byte[] picture(BaiduArt.RangeChannel source) throws Exception {
        MediaDataSource data=new MediaDataSource() {
            @Override public synchronized int readAt(long position,byte[] buffer,int offset,int count) throws IOException {
                if(position<0 || offset<0 || count<0 || offset>buffer.length-count) throw new IOException("Invalid media range");
                if(count==0) return 0;
                return source.position(position).read(ByteBuffer.wrap(buffer,offset,count));
            }
            @Override public long getSize() { return source.size(); }
            @Override public void close() { }
        };
        MediaMetadataRetriever retriever=new MediaMetadataRetriever();
        try { retriever.setDataSource(data); return retriever.getEmbeddedPicture(); }
        finally { retriever.release(); }
    }
}
