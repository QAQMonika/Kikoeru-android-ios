package com.zinhao.kikoeru;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.util.Arrays;

public final class LocalWaveArtTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static void little(RandomAccessFile f,long value) throws IOException {
        for(int i=0;i<4;i++) f.write((int)(value>>(8*i))&255);
    }
    private static void header(RandomAccessFile f,long size) throws IOException {
        f.seek(0); f.writeBytes("RIFF"); little(f,size-8); f.writeBytes("WAVE");
    }
    private static final class Counted implements SeekableByteChannel {
        final FileChannel file; int bytes;
        Counted(FileChannel file) { this.file=file; }
        public int read(ByteBuffer b) throws IOException { int n=file.read(b); if(n>0) bytes+=n; return n; }
        public int write(ByteBuffer b) { throw new UnsupportedOperationException(); }
        public long position() throws IOException { return file.position(); }
        public SeekableByteChannel position(long p) throws IOException { file.position(p); return this; }
        public long size() throws IOException { return file.size(); }
        public SeekableByteChannel truncate(long s) { throw new UnsupportedOperationException(); }
        public boolean isOpen() { return file.isOpen(); }
        public void close() throws IOException { file.close(); }
    }
    public static void main(String[] args) throws Exception {
        File temp=File.createTempFile("kiko-wave-art-",".wav");
        try(RandomAccessFile f=new RandomAccessFile(temp,"rw")) {
            byte[] id3={'I','D','3',3,0,0,0,0,0,0};
            long pcm=600_000_000L, tagOffset=12+8+pcm;
            f.setLength(tagOffset+8+id3.length); header(f,f.length());
            f.seek(12); f.writeBytes("data"); little(f,pcm);
            f.seek(tagOffset); f.writeBytes("id3 "); little(f,id3.length); f.write(id3);
            Counted counted=new Counted(f.getChannel());
            check(Arrays.equals(LocalWaveArt.tag(counted),id3),"Trailing ID3 chunk found");
            check(counted.bytes==38,"600MB PCM skipped by seek, not read");
            f.seek(tagOffset); f.writeBytes("ID3 ");
            check(LocalWaveArt.tag(f.getChannel())!=null,"Uppercase ID3 chunk accepted");
            f.seek(tagOffset+4); little(f,0xffffffffL);
            check(LocalWaveArt.tag(f.getChannel())==null,"Unsigned oversized/truncated chunk rejected");
            f.setLength(40); header(f,40); f.seek(12); f.writeBytes("JUNK"); little(f,1); f.write(0); f.write(0);
            f.writeBytes("id3 "); little(f,10); f.write(id3);
            check(LocalWaveArt.tag(f.getChannel())!=null,"Odd-length RIFF chunks padded");
            f.seek(30); f.writeBytes("BAD");
            check(LocalWaveArt.tag(f.getChannel())==null,"Non-ID3 payload rejected");
            f.setLength(12+8+LocalWaveArt.LIMIT+2L); header(f,f.length()); f.seek(12); f.writeBytes("id3 "); little(f,LocalWaveArt.LIMIT+2L);
            check(LocalWaveArt.tag(f.getChannel())==null,"ID3 allocation bounded");
            f.seek(0); f.writeBytes("fLaC");
            check(LocalWaveArt.tag(f.getChannel())==null,"Other formats stay on native artwork path");
            f.setLength(3);
            check(LocalWaveArt.tag(f.getChannel())==null,"Short header safe");
            f.setLength(32); header(f,12);
            check(LocalWaveArt.tag(f.getChannel())==null,"RIFF declared boundary respected");
        } finally { if(!temp.delete()) throw new IOException("Test fixture cleanup failed"); }
        System.out.println("PASS: "+checks+" WAV artwork checks against production bytecode");
    }
}
