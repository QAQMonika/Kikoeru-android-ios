package android.provider;

import android.net.Uri;
import java.net.URLDecoder;

public final class DocumentsContract {
    private static String segment(Uri uri,String marker) {
        String[] parts=uri.rawPath().split("/");
        for(int i=0;i<parts.length-1;i++) if(parts[i].equals(marker)) {
            try { return URLDecoder.decode(parts[i+1].replace("+","%2B"),"UTF-8"); }
            catch(Exception e) { throw new IllegalArgumentException(e); }
        }
        throw new IllegalArgumentException("Missing document segment");
    }
    public static String getDocumentId(Uri uri) { return segment(uri,"document"); }
    public static String getTreeDocumentId(Uri uri) { return segment(uri,"tree"); }
}
