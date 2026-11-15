package com.zinhao.kikoeru;

import java.io.*;
import java.nio.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** In-memory and sparse fixtures only: no real audio or network requests. */
public final class BaiduArtTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static byte[] ascii(String value) { return value.getBytes(StandardCharsets.US_ASCII); }
    private static byte[] picture(int type,byte[] image) throws Exception {
        ByteArrayOutputStream bytes=new ByteArrayOutputStream(); DataOutputStream out=new DataOutputStream(bytes);
        out.writeInt(type); byte[] mime=ascii("image/png"); out.writeInt(mime.length); out.write(mime);
        out.writeInt(0); out.writeInt(40); out.writeInt(40); out.writeInt(24); out.writeInt(0); out.writeInt(image.length); out.write(image);
        return bytes.toByteArray();
    }
    private static void block(ByteArrayOutputStream output,int type,byte[] data,boolean last) throws Exception {
        output.write(type|(last?128:0)); output.write(data.length>>>16); output.write(data.length>>>8); output.write(data.length); output.write(data);
    }
    private static BaiduArt.Result find(byte[] bytes,String extension) throws Exception {
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(bytes.length,(offset,count)->Arrays.copyOfRange(bytes,(int)offset,(int)offset+count))) {
            return BaiduArt.find(channel,extension);
        }
    }
    public static void main(String[] arguments) throws Exception {
        byte[] back=ascii("back-image"),front=ascii("front-image");
        ByteArrayOutputStream flac=new ByteArrayOutputStream(); flac.write(ascii("fLaC"));
        block(flac,0,new byte[34],false); block(flac,6,picture(4,back),false); block(flac,6,picture(3,front),true);
        BaiduArt.Result found=find(flac.toByteArray(),"flac");
        check(found!=null && !found.id3 && Arrays.equals(found.bytes,front),"FLAC front cover is preferred");
        ByteArrayOutputStream onlyBack=new ByteArrayOutputStream(); onlyBack.write(ascii("fLaC")); block(onlyBack,6,picture(4,back),true);
        check(Arrays.equals(find(onlyBack.toByteArray(),"flac").bytes,back),"Other picture type is a fallback");
        ByteArrayOutputStream malformed=new ByteArrayOutputStream(); malformed.write(ascii("fLaC")); block(malformed,6,new byte[]{0,1,2},true);
        check(find(malformed.toByteArray(),"flac")==null,"Malformed picture is ignored");
        check(find(ascii("not flac"),"flac")==null,"Incorrect FLAC magic is rejected");
        byte[] tag=new byte[]{'I','D','3',4,0,0,0,0,0,4,1,2,3,4};
        found=find(tag,"mp3"); check(found!=null && found.id3 && Arrays.equals(found.bytes,tag),"MP3 ID3 tag is returned for existing decoder");
        byte[] invalid=tag.clone(); invalid[6]=(byte)128; check(find(invalid,"mp3")==null,"Malformed syncsafe size rejected");
        byte[] truncated=tag.clone(); truncated[9]=20; check(find(truncated,"mp3")==null,"Oversized or truncated MP3 tag rejected");
        check(find(tag,"ogg")==null,"Unsupported format has no false artwork");
        check(BaiduArt.supported("m4a") && BaiduArt.supported("M4A"),"M4A embedded artwork is eligible for the Android metadata reader");
        check(!BaiduArt.supported("ogg"),"Unimplemented formats do not trigger metadata network reads");

        final int pcm=100*1024*1024; final long size=12L+8+pcm+8+tag.length;
        ByteBuffer first=ByteBuffer.allocate(20).order(ByteOrder.LITTLE_ENDIAN);
        first.put(ascii("RIFF")).putInt((int)(size-8)).put(ascii("WAVEdata")).putInt(pcm);
        ByteBuffer last=ByteBuffer.allocate(8+tag.length).order(ByteOrder.LITTLE_ENDIAN);
        last.put(ascii("id3 ")).putInt(tag.length).put(tag);
        long[] transferred={0}; int[] requests={0}; List<Long> offsets=new ArrayList<>();
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(size,(offset,count)-> {
            requests[0]++; transferred[0]+=count; offsets.add(offset); byte[] result=new byte[count];
            copy(first.array(),0,result,offset); copy(last.array(),20L+pcm,result,offset); return result;
        })) {
            BaiduArt.Result wave=BaiduArt.find(channel,"wav");
            check(wave!=null && wave.id3 && Arrays.equals(wave.bytes,tag),"WAV ID3 found after PCM");
            check(transferred[0]<100000 && requests[0]<=3,"WAV artwork skips the 100 MiB PCM payload");
            check(offsets.size()>=2 && offsets.get(1)>=pcm,"WAV requests a distant range for the tail tag");
        }
        boolean failed=false;
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(100,(offset,count)->new byte[count-1])) { channel.read(ByteBuffer.allocate(10)); }
        catch(IOException expected) { failed=true; }
        check(failed,"Truncated HTTP ranges are rejected");
        failed=false;
        try(BaiduArt.RangeChannel channel=new BaiduArt.RangeChannel(20*1024*1024,(offset,count)->new byte[count])) {
            channel.read(ByteBuffer.allocate(10*1024*1024));
            while(channel.read(ByteBuffer.allocate(1024*1024))>0) { }
        } catch(IOException expected) { failed=true; }
        check(failed,"Total artwork metadata transfer is bounded");
        System.out.println("PASS: "+checks+" bounded WAV, FLAC, MP3 and Range artwork checks");
    }
    private static void copy(byte[] source,long sourceOffset,byte[] target,long targetOffset) {
        long start=Math.max(sourceOffset,targetOffset),end=Math.min(sourceOffset+source.length,targetOffset+target.length);
        if(end>start) System.arraycopy(source,(int)(start-sourceOffset),target,(int)(start-targetOffset),(int)(end-start));
    }
}
