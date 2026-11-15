package android.content.res;

import android.util.DisplayMetrics;

public class Resources {
    public final DisplayMetrics metrics=new DisplayMetrics();
    public DisplayMetrics getDisplayMetrics() { return metrics; }
    public int getIdentifier(String name,String type,String pkg) { return "textView3".equals(name)?3:0; }
}
