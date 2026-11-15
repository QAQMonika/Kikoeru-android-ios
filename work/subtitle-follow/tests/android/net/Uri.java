package android.net;

import java.io.File;
import java.net.URI;

public final class Uri {
    private final URI value;
    private Uri(String text) { value=URI.create(text); }
    public static Uri parse(String text) { return new Uri(text); }
    public static Uri fromFile(File file) { return new Uri(file.toURI().toString()); }
    public String getAuthority() { return value.getAuthority(); }
    public String getScheme() { return value.getScheme(); }
    public String getPath() { return value.getPath(); }
    public String rawPath() { return value.getRawPath(); }
    public String toString() { return value.toString(); }
    @Override public boolean equals(Object other) { return other instanceof Uri && value.equals(((Uri)other).value); }
    @Override public int hashCode() { return value.hashCode(); }
}
