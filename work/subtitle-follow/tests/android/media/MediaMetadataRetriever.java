package android.media;
public class MediaMetadataRetriever {
    public static boolean released,fail; public static int first,last,eof,empty; public static byte[] observed;
    private MediaDataSource source;
    public void setDataSource(MediaDataSource source) { this.source=source; }
    public byte[] getEmbeddedPicture() {
        if(fail) throw new IllegalStateException("Synthetic parser error");
        try {
            byte[] bytes=new byte[12]; first=source.readAt(0,bytes,2,4);
            last=source.readAt(source.getSize()-3,bytes,7,4);
            eof=source.readAt(source.getSize(),bytes,0,1); empty=source.readAt(0,bytes,0,0); observed=bytes;
            return new byte[]{8,6,7};
        } catch(Exception e) { throw new IllegalStateException(e); }
    }
    public void release() { released=true; }
}
