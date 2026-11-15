package com.zinhao.kikoeru;

import android.media.MediaMetadataRetriever;
import java.util.Arrays;

/** Tests the range bridge with a fake Android retriever, not Android's native parser. */
public final class BaiduArtMediaTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    public static void main(String[] arguments) throws Exception {
        final long size=100L*1024*1024; long[] transferred={0};
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(size,(offset,count)-> {
            transferred[0]+=count; byte[] bytes=new byte[count];
            for(int i=0;i<count;i++) bytes[i]=(byte)((offset+i)&255); return bytes;
        })) {
            MediaMetadataRetriever.fail=false; MediaMetadataRetriever.released=false;
            check(Arrays.equals(BaiduArtMedia.picture(channel),new byte[]{8,6,7}),"M4A adapter returns the framework result");
            check(MediaMetadataRetriever.first==4 && MediaMetadataRetriever.last==3,"Random reads return the correct available count");
            check(MediaMetadataRetriever.observed[2]==0 && MediaMetadataRetriever.observed[5]==3
                    && MediaMetadataRetriever.observed[7]==(byte)((size-3)&255),"Buffers respect offset and seek position");
            check(MediaMetadataRetriever.eof==-1 && MediaMetadataRetriever.empty==0,"EOF and zero-length reads match MediaDataSource contract");
            check(transferred[0]<100000 && MediaMetadataRetriever.released,"Metadata seeks remain bounded and retriever is released");
        }
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(1,(offset,count)->new byte[count])) {
            MediaMetadataRetriever.fail=true; MediaMetadataRetriever.released=false; boolean failed=false;
            try { BaiduArtMedia.picture(channel); } catch(IllegalStateException expected) { failed=true; }
            check(failed && MediaMetadataRetriever.released,"Framework errors still release the retriever");
        }
        System.out.println("PASS: "+checks+" M4A bounded range bridge checks using a fake retriever");
    }
}
