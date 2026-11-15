package android.widget;

import android.content.Context;

public final class Toast {
    public static final int LENGTH_LONG=1;
    public static int shown;
    public static String last;
    private final String message;
    private Toast(String message) { this.message=message; }
    public static Toast makeText(Context context,CharSequence text,int duration) {
        return new Toast(text.toString());
    }
    public void show() { shown++; last=message; }
}
