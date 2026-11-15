package android.graphics;

public class Color {
    public static final int WHITE = -1;
    public static int parseColor(String hex) { return (int)(0xff000000L | Long.parseLong(hex.substring(1), 16)); }
    public static int red(int c) { return (c >> 16) & 255; }
    public static int green(int c) { return (c >> 8) & 255; }
    public static int blue(int c) { return c & 255; }
}
