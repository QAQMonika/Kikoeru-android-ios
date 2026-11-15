package com.zinhao.kikoeru;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.SeekableByteChannel;
import java.util.Locale;

/** Bounded metadata-only reads. Audio payloads are skipped with byte-range seeks. */
public final class BaiduArt {
    static final int LIMIT=16*1024*1024;
    interface Fetcher { byte[] read(long offset,int count) throws IOException; }
    static boolean supported(String extension) {
        return java.util.Arrays.asList("wav","wave","flac","mp3","m4a").contains(extension.toLowerCase(Locale.ROOT));
    }
    static final class Result {
        final boolean id3; final byte[] bytes;
        Result(boolean id3,byte[] bytes) { this.id3=id3; this.bytes=bytes; }
    }
    static final class RangeChannel implements SeekableByteChannel {
        private final long size; private final Fetcher fetcher;
        private long position,base,transferred; private int requests; private boolean open=true;
        private byte[] cache=new byte[0];
        RangeChannel(long size,Fetcher fetcher) throws IOException {
            if(size<0 || fetcher==null) throw new IOException("Invalid audio size");
            this.size=size; this.fetcher=fetcher;
        }
        public int read(ByteBuffer target) throws IOException {
            if(!open) throw new IOException("Closed channel");
            if(!target.hasRemaining()) return 0;
            if(position>=size) return -1;
            if(position<base || position>=base+cache.length) {
                int count=(int)Math.min(size-position,Math.max(32768,Math.min(target.remaining(),1024*1024)));
                if(++requests>128 || transferred+count>LIMIT+1024*1024) throw new IOException("Metadata limit exceeded");
                byte[] data=fetcher.read(position,count);
                if(data==null || data.length!=count) throw new IOException("Truncated range");
                base=position; cache=data; transferred+=data.length;
            }
            int offset=(int)(position-base),count=Math.min(target.remaining(),cache.length-offset);
            target.put(cache,offset,count); position+=count; return count;
        }
        public int write(ByteBuffer source) throws IOException { throw new IOException("Read-only channel"); }
        public long position() { return position; }
        public SeekableByteChannel position(long value) throws IOException {
            if(!open || value<0) throw new IOException("Invalid position"); position=value; return this;
        }
        public long size() { return size; }
        public SeekableByteChannel truncate(long value) throws IOException { throw new IOException("Read-only channel"); }
        public boolean isOpen() { return open; }
        public void close() { open=false; cache=new byte[0]; }
    }
    private static byte[] read(SeekableByteChannel in,int count) throws IOException {
        if(count<0 || count>LIMIT) throw new IOException("Metadata limit exceeded");
        ByteBuffer data=ByteBuffer.allocate(count);
        while(data.hasRemaining()) if(in.read(data)<=0) throw new IOException("Truncated metadata");
        return data.array();
    }
    static Result find(SeekableByteChannel in,String extension) throws IOException {
        String kind=extension.toLowerCase(Locale.ROOT);
        if(kind.equals("wav") || kind.equals("wave")) {
            byte[] tag=LocalWaveArt.tag(in,LIMIT); return tag==null?null:new Result(true,tag);
        }
        in.position(0);
        if(kind.equals("mp3")) {
            if(in.size()<10) return null;
            byte[] header=read(in,10);
            if(header[0]!='I' || header[1]!='D' || header[2]!='3') return null;
            int length=0; for(int i=6;i<10;i++) { if((header[i]&128)!=0) return null; length=(length<<7)|(header[i]&127); }
            long total=10L+length+((header[3]==4 && (header[5]&16)!=0)?10:0);
            if(total>LIMIT || total>in.size()) return null;
            in.position(0); return new Result(true,read(in,(int)total));
        }
        if(!kind.equals("flac") || in.size()<8) return null;
        Result fallback=null;
        byte[] signature=read(in,4);
        if(signature[0]=='I' && signature[1]=='D' && signature[2]=='3' && in.size()>=14) {
            in.position(0); byte[] header=read(in,10); int length=0;
            for(int i=6;i<10;i++) { if((header[i]&128)!=0) return null; length=(length<<7)|(header[i]&127); }
            long total=10L+length+((header[3]==4 && (header[5]&16)!=0)?10:0);
            if(total>LIMIT || total+4>in.size()) return null;
            in.position(0); fallback=new Result(true,read(in,(int)total));
            signature=read(in,4);
        }
        if(signature[0]!='f' || signature[1]!='L' || signature[2]!='a' || signature[3]!='C') return fallback;
        for(int i=0;i<128 && in.position()+4<=in.size();i++) {
            byte[] block=read(in,4); int type=block[0]&127;
            int length=((block[1]&255)<<16)|((block[2]&255)<<8)|(block[3]&255);
            long start=in.position(); if(length>in.size()-start) return null;
            if(type==6 && length<=LIMIT) {
                try { byte[][] picture=picture(read(in,length));
                    if(picture!=null) { Result found=new Result(false,picture[1]); if(picture[0][0]==3) return found; if(fallback==null) fallback=found; }
                } catch(IOException ignored) { }
            }
            in.position(start+length); if((block[0]&128)!=0) break;
        }
        return fallback;
    }
    private static byte[][] picture(byte[] data) throws IOException {
        DataInputStream in=new DataInputStream(new ByteArrayInputStream(data));
        int type=in.readInt(); skipField(in); skipField(in);
        for(int i=0;i<4;i++) in.readInt();
        int length=in.readInt(); if(length<=0 || length>LIMIT || length>in.available()) return null;
        byte[] image=new byte[length]; in.readFully(image); return new byte[][]{new byte[]{(byte)type},image};
    }
    private static void skipField(DataInputStream in) throws IOException {
        long count=in.readInt()&0xffffffffL;
        if(count>in.available() || count>LIMIT) throw new IOException("Invalid picture field");
        if(in.skipBytes((int)count)!=count) throw new IOException("Truncated picture field");
    }
}
