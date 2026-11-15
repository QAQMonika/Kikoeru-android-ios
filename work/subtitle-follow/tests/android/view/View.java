package android.view;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.RenderEffect;
import java.util.ArrayList;
import java.util.List;

public class View {
    public static final int VISIBLE=0,GONE=8;
    public interface OnLayoutChangeListener {
        void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);
    }
    public final List<OnLayoutChangeListener> layoutListeners = new ArrayList<>();
    public boolean laidOut = true, layoutRequested;
    public int width = 400, height = 400;
    public int top,id,adapterPosition;
    public int paddingLeft,paddingTop,paddingRight,paddingBottom,visibility;
    public float alpha=1,translationY;
    public RenderEffect effect;
    public ViewParent parent;
    public final ViewTreeObserver observer=new ViewTreeObserver();
    public Context context=new Context();
    public Drawable background;
    public Drawable getBackground() { return background; }
    public Context getContext() { return context; }
    public int getTop() { return top; }
    public ViewParent getParent() { return parent; }
    public float getAlpha() { return alpha; }
    public void setAlpha(float value) { alpha=value; }
    public float getTranslationY() { return translationY; }
    public void setTranslationY(float value) { translationY=value; }
    public void setRenderEffect(RenderEffect value) {
        if(value!=null && RenderEffect.fail) throw new IllegalStateException("Hardware effect unavailable");
        effect=value;
    }
    public ViewTreeObserver getViewTreeObserver() { return observer; }
    public void invalidate() {}
    @SuppressWarnings("unchecked") public <T extends View> T findViewById(int wanted) { return wanted==id?(T)this:null; }
    public int getPaddingLeft() { return paddingLeft; }
    public int getPaddingTop() { return paddingTop; }
    public int getPaddingRight() { return paddingRight; }
    public int getPaddingBottom() { return paddingBottom; }
    public void setPadding(int l,int t,int r,int b) { paddingLeft=l; paddingTop=t; paddingRight=r; paddingBottom=b; layoutRequested=true; }
    public void setVisibility(int value) { visibility=value; }
    public int getVisibility() { return visibility; }
    public int getHeight() { return height; }
    public int getWidth() { return width; }
    public boolean isLaidOut() { return laidOut; }
    public boolean isLayoutRequested() { return layoutRequested; }
    public void addOnLayoutChangeListener(OnLayoutChangeListener l) { layoutListeners.add(l); }
    public void removeOnLayoutChangeListener(OnLayoutChangeListener l) { layoutListeners.remove(l); }
    public void completeLayout() {
        laidOut = true; layoutRequested = false;
        for(OnLayoutChangeListener l:new ArrayList<>(layoutListeners)) l.onLayoutChange(this,0,0,width,height,0,0,0,0);
    }
}
