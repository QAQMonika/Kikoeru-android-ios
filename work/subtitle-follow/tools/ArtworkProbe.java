import java.io.*;
import java.util.*;
import android.graphics.BitmapFactory;
import android.os.Looper;

/** Read-only device diagnostic. Never included in the APK. */
public final class ArtworkProbe {
    public static void main(String[] args) throws Exception {
        if(Looper.myLooper()==null) Looper.prepareMainLooper();
        Class<?> history=Class.forName("com.zinhao.kikoeru.LocalHistory");
        Class<?> model=Class.forName("com.zinhao.kikoeru.db.LocalWorkHistory");
        Object entry=model.getConstructor(long.class,long.class,String.class,String.class).newInstance(-1L,123L,"cover","Album");
        if((Long)model.getMethod("getRjNumber").invoke(entry)!=-1L) throw new AssertionError("Native history model linkage");
        history.getMethod("bind",android.app.Activity.class,android.view.View.class,model);
        history.getMethod("open",android.app.Activity.class,model);
        history.getMethod("merge",android.app.Activity.class,List.class);
        org.json.JSONObject track=new org.json.JSONObject().put("local_import",true).put("local_source","tree")
                .put("local_parent","album").put("mediaStreamUrl","audio").put("workTitle","Library/Album");
        java.lang.reflect.Method update=history.getDeclaredMethod("update",org.json.JSONArray.class,org.json.JSONObject.class,long.class,long.class);
        update.setAccessible(true);
        org.json.JSONArray saved=(org.json.JSONArray)update.invoke(null,new org.json.JSONArray(),track,17000L,123L);
        if(saved.getJSONObject(0).getLong("seek")!=17000) throw new AssertionError("Local history position");
        System.out.println("PASS: packaged local history model/helper linkage and native JSON record");
        for(String path:args) {
            File[] flacs=new File(path).listFiles((d,n)->n.toLowerCase(Locale.ROOT).endsWith(".flac"));
            if(flacs!=null && flacs.length>0) {
                Arrays.sort(flacs);
                System.out.println(new File(path).getName()+": "+flacs.length+" FLAC files");
                for(int number=0;number<Math.min(1,flacs.length);number++) {
                    int pictures=0;
                    try(RandomAccessFile in=new RandomAccessFile(flacs[number],"r")) {
                        byte[] magic=new byte[4]; in.readFully(magic);
                        System.out.println("track="+(number+1)+" magic="+new String(magic,"US-ASCII"));
                        if(!Arrays.equals(magic,new byte[]{'f','L','a','C'})) continue;
                        boolean last=false;
                        for(int i=0;i<1000 && !last;i++) {
                            int type=in.readUnsignedByte(); last=(type&128)!=0;
                            int len=(in.readUnsignedByte()<<16)|(in.readUnsignedByte()<<8)|in.readUnsignedByte();
                            long end=in.getFilePointer()+len;
                            if(number==0) System.out.println("FLAC block="+(type&127)+" bytes="+len);
                            if((type&127)==6 && len<=12*1024*1024) {
                                int pictureType=in.readInt(), mimeLength=in.readInt();
                                if(mimeLength<0 || mimeLength>1000) break;
                                byte[] mime=new byte[mimeLength]; in.readFully(mime);
                                int desc=in.readInt(); if(desc<0 || desc>len) break; in.seek(in.getFilePointer()+desc);
                                int width=in.readInt(), height=in.readInt(); in.readInt(); in.readInt();
                                int size=in.readInt();
                                System.out.println("FLAC picture type="+pictureType+" mime="+new String(mime,"US-ASCII")+" declared="+width+"x"+height+" bytes="+size);
                                if(size>0 && size<=end-in.getFilePointer()) {
                                    byte[] art=new byte[size]; in.readFully(art);
                                    BitmapFactory.Options bounds=new BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
                                    BitmapFactory.decodeByteArray(art,0,art.length,bounds);
                                    System.out.println("FLAC decoded="+bounds.outWidth+"x"+bounds.outHeight);
                                    Class<?> loader=Class.forName("com.zinhao.kikoeru.LocalArt");
                                    java.lang.reflect.Method valid=loader.getDeclaredMethod("valid",byte[].class); valid.setAccessible(true);
                                    if(!(Boolean)valid.invoke(null,(Object)art)) throw new AssertionError("Packaged artwork validator rejected FLAC picture");
                                    System.out.println("PASS: packaged artwork validator accepts large FLAC cover");
                                    if(bounds.outWidth>0 && bounds.outHeight>0) pictures++;
                                }
                            }
                            in.seek(end);
                        }
                    }
                    System.out.println("track="+(number+1)+" decodable pictures="+pictures);
                }
            }
            File[] files=new File(path).listFiles((d,n)->n.toLowerCase(Locale.ROOT).endsWith(".wav"));
            if(files==null || files.length==0) continue;
            Arrays.sort(files);
            System.out.println(new File(path).getName()+": "+files.length+" WAV files");
            try(RandomAccessFile in=new RandomAccessFile(files[0],"r")) {
                byte[] header=new byte[12]; in.readFully(header);
                System.out.println("header="+new String(header,0,4,"US-ASCII")+"/"+new String(header,8,4,"US-ASCII"));
                for(int i=0;i<64 && in.getFilePointer()+8<=in.length();i++) {
                    byte[] chunk=new byte[8]; in.readFully(chunk);
                    long len=0; for(int j=0;j<4;j++) len|=(chunk[4+j]&255L)<<(j*8);
                    System.out.println("chunk="+new String(chunk,0,4,"US-ASCII")+" bytes="+len);
                    if(len>in.length()-in.getFilePointer()) break;
                    if(new String(chunk,0,4,"US-ASCII").equalsIgnoreCase("id3 ")) {
                        byte[] tag=new byte[10]; in.readFully(tag);
                        System.out.println("ID3 version="+(tag[3]&255)+" prefix="+new String(tag,0,3,"US-ASCII"));
                        in.seek(in.getFilePointer()-10);
                    }
                    in.seek(in.getFilePointer()+len+(len&1));
                }
            }
            try(FileInputStream in=new FileInputStream(files[0])) {
                Class<?> wave=Class.forName("com.zinhao.kikoeru.LocalWaveArt");
                byte[] tag=(byte[])wave.getMethod("tag",java.nio.channels.SeekableByteChannel.class).invoke(null,in.getChannel());
                if(tag==null) throw new AssertionError("No RIFF ID3 tag");
                Class<?> decoder=Class.forName("com.google.android.exoplayer2.metadata.id3.Id3Decoder");
                Object frames=decoder.getMethod("decode",byte[].class,int.class).invoke(decoder.getConstructor().newInstance(),tag,tag.length);
                Class<?> metadata=Class.forName("com.google.android.exoplayer2.metadata.Metadata");
                int length=(Integer)metadata.getMethod("length").invoke(frames), found=0;
                for(int i=0;i<length;i++) {
                    Object frame=metadata.getMethod("get",int.class).invoke(frames,i);
                    if(!frame.getClass().getSimpleName().equals("ApicFrame")) continue;
                    byte[] art=(byte[])frame.getClass().getField("pictureData").get(frame);
                    BitmapFactory.Options bounds=new BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
                    BitmapFactory.decodeByteArray(art,0,art.length,bounds);
                    System.out.println("APIC bytes="+art.length+" dimensions="+bounds.outWidth+"x"+bounds.outHeight);
                    if(bounds.outWidth>0 && bounds.outHeight>0) found++;
                }
                if(found==0) throw new AssertionError("No decodable artwork");
                System.out.println("PASS: packaged WAV reader and ID3 decoder extracted artwork");
            }
        }
    }
}
