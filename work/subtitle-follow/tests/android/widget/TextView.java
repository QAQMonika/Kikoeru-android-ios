package android.widget;

public class TextView extends android.view.View {
    public float size=15;
    public boolean includeFontPadding=true;
    public int minHeight;
    public float lineSpacing,shadow;
    public final android.text.TextPaint paint=new android.text.TextPaint();
    public float getTextSize() { return size; }
    public void setTextSize(float value) { size=value; }
    public void setTypeface(android.graphics.Typeface typeface) {}
    public android.text.TextPaint getPaint() { return paint; }
    public void setIncludeFontPadding(boolean value) { includeFontPadding=value; }
    public void setLineSpacing(float extra,float multiplier) { lineSpacing=extra; }
    public void setMinHeight(int value) { minHeight=value; }
    public void setShadowLayer(float radius,float dx,float dy,int color) { shadow=radius; }
}
