package com.zinhao.kikoeru;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.SeekableByteChannel;

/** Locate a bounded RIFF ID3 chunk without reading the PCM payload. */
public final class LocalWaveArt {
    static final int LIMIT=24*1024*1024;
    private static byte[] read(SeekableByteChannel in,int count) throws IOException {
        ByteBuffer buffer=ByteBuffer.allocate(count);
        while(buffer.hasRemaining()) if(in.read(buffer)<=0) throw new IOException("Truncated WAV metadata");
        return buffer.array();
    }
    private static boolean four(byte[] bytes,int offset,String name) {
        for(int i=0;i<4;i++) if(Character.toLowerCase((char)(bytes[offset+i]&255))!=name.charAt(i)) return false;
        return true;
    }
    public static byte[] tag(SeekableByteChannel in) throws IOException {
        return tag(in,LIMIT);
    }
    static byte[] tag(SeekableByteChannel in,int limit) throws IOException {
        in.position(0);
        if(in.size()<12) return null;
        byte[] header=read(in,12);
        if(!four(header,0,"riff") || !four(header,8,"wave")) return null;
        long end=Math.min(in.size(),8+(ByteBuffer.wrap(header,4,4).order(ByteOrder.LITTLE_ENDIAN).getInt()&0xffffffffL));
        for(int i=0;i<10000 && in.position()+8<=end;i++) {
            byte[] chunk=read(in,8);
            long count=ByteBuffer.wrap(chunk,4,4).order(ByteOrder.LITTLE_ENDIAN).getInt()&0xffffffffL;
            long start=in.position();
            if(count>end-start) return null;
            if((four(chunk,0,"id3 ") || four(chunk,0,"id3\0")) && count>=10 && count<=Math.min(LIMIT,limit)) {
                byte[] tag=read(in,(int)count);
                if(tag[0]=='I' && tag[1]=='D' && tag[2]=='3') return tag;
            }
            long next=start+count+(count&1);
            if(next>end) return null;
            in.position(next);
        }
        return null;
    }
}
