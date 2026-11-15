package com.zinhao.kikoeru;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import java.util.*;

/** Lyric presentation shares the native adapter and audio-independent follow lifecycle. */
public final class LrcVisuals extends RecyclerView.OnScrollListener implements
        ViewTreeObserver.OnPreDrawListener,RecyclerView.OnChildAttachStateChangeListener {
    private static final float[] OPACITY={1f,.55f,.40f,.26f,.16f};
    private static final float[] RADII={0f,1.2f,2.6f,3.8f,5f};
    private final RecyclerView recycler;
    private final int textId,left,top,right,bottom;
    private final boolean clip;
    private final float density;
    private final WeakHashMap<View,Row> rows=new WeakHashMap<>();
    private final ArrayList<Row> visible=new ArrayList<>();
    private ValueAnimator animator;
    private boolean active,disposed,browsing,reading,blur,motion,modern,accessible,blurFailed;
    private boolean pendingAnimate,jumped,applyingScroll;
    private int current=-1,target=-1,pending=-1,direction=1;
    private int distance,requested,moved,first,last;
    private float progress;
    private Object[] effects;
    private static final class Row {
        final View view;
        final TextView text;
        int index=-1,level=-1;
        float initialShift,alpha,radius,fromAlpha,fromRadius;
        Row(View view,TextView text) { this.view=view; this.text=text; }
    }
    static boolean modern(Context context) { return PlaybackOptions.subtitleBlur(context) || PlaybackOptions.subtitleMotion(context); }
    public static void bind(TextView text,ImageView cue,boolean selected) {
        Context context=text.getContext(); boolean modern=modern(context);
        float density=context.getResources().getDisplayMetrics().density;
        text.setTextSize(modern?20:selected?36:15);
        text.setTypeface(Typeface.DEFAULT);
        text.getPaint().setFakeBoldText(modern && selected);
        text.setIncludeFontPadding(!modern);
        text.setLineSpacing(modern?4*density:0,1);
        int horizontal=Math.round((modern?8:3)*density),vertical=Math.round((modern?12:3)*density);
        text.setPadding(horizontal,vertical,horizontal,vertical);
        text.setMinHeight(modern?Math.round(48*density):0);
        text.setShadowLayer(modern?0:5,modern?0:3,modern?0:3,0xff000000);
        text.setAlpha(selected?1f:.3f);
        cue.setVisibility(modern || selected?View.GONE:View.VISIBLE); cue.setAlpha(.3f);
        text.invalidate();
    }
    public LrcVisuals(RecyclerView recycler) {
        this.recycler=recycler;
        Context context=recycler.getContext();
        textId=context.getResources().getIdentifier("textView3","id",context.getPackageName());
        density=context.getResources().getDisplayMetrics().density;
        left=recycler.getPaddingLeft(); top=recycler.getPaddingTop();
        right=recycler.getPaddingRight(); bottom=recycler.getPaddingBottom(); clip=recycler.getClipToPadding();
        recycler.addOnScrollListener(this); recycler.addOnChildAttachStateChangeListener(this); active(true);
    }
    public void active(boolean value) {
        if(disposed || active==value) return;
        active=value; ViewTreeObserver observer=recycler.getViewTreeObserver();
        if(value) {
            Context context=recycler.getContext(); boolean previous=modern;
            blur=PlaybackOptions.subtitleBlur(context); motion=PlaybackOptions.subtitleMotion(context); modern=blur || motion;
            Object service=context.getSystemService(Context.ACCESSIBILITY_SERVICE);
            accessible=service instanceof AccessibilityManager && ((AccessibilityManager)service).isTouchExplorationEnabled();
            if(previous!=modern && recycler.getAdapter()!=null) recycler.getAdapter().notifyDataSetChanged();
            if(observer.isAlive()) observer.addOnPreDrawListener(this);
            recycler.invalidate();
        } else {
            if(observer.isAlive()) observer.removeOnPreDrawListener(this);
            pending=-1; stop(true);
            for(Row row:rows.values()) reset(row);
            rows.clear(); visible.clear(); restorePadding();
        }
    }
    public boolean focus(int index,boolean animate) {
        if(disposed || index==current) return false;
        current=index;
        for(Row row:rows.values()) { row.fromAlpha=row.alpha; row.fromRadius=row.radius; }
        if(active) recycler.invalidate();
        return true;
    }
    public void browsing(boolean value) {
        if(disposed || browsing==value) return;
        browsing=value; pending=-1;
        stop(!value);
        if(!value) reading=false;
        if(active) recycler.invalidate();
    }
    public void drag() { reading=true; stop(true); recycler.invalidate(); }
    public boolean snap(int index) {
        if(!modern || disposed) return false;
        stop(true); current=index; target=index; pending=index; pendingAnimate=false; jumped=false;
        recycler.invalidate(); return true;
    }
    private boolean canMove() { return active && motion && !browsing && !accessible && ValueAnimator.areAnimatorsEnabled(); }
    public boolean scrollTo(int index,boolean returning) {
        if(!modern || !active || disposed || browsing || !valid(index)) return false;
        if(!returning && target==index && pending<0) return true;
        if(target>=0 && target!=index) direction=index>target?1:-1;
        stop(false); target=index; pending=index; pendingAnimate=canMove(); jumped=false;
        recycler.invalidate(); return true;
    }
    private boolean valid(int index) { return index>=0 && recycler.getAdapter()!=null && index<recycler.getAdapter().getItemCount(); }
    private int dp(float value) { return Math.round(value*density); }
    private boolean padding() {
        if(!modern || recycler.getHeight()<=0) return false;
        int inset=Math.max(0,(recycler.getHeight()-dp(48))/2);
        if(recycler.getPaddingTop()==inset && recycler.getPaddingBottom()==inset) return false;
        recycler.setClipToPadding(false); recycler.setPadding(left,inset,right,inset);
        if(!browsing && valid(current)) { stop(true); pending=current; pendingAnimate=false; jumped=false; }
        return true;
    }
    private void restorePadding() {
        recycler.setClipToPadding(clip);
        if(recycler.getPaddingTop()!=top || recycler.getPaddingBottom()!=bottom)
            recycler.setPadding(left,top,right,bottom);
    }
    private float center(View row) {
        return row.getHeight()>recycler.getHeight()-dp(24)?dp(12)+row.getHeight()/2f:recycler.getHeight()/2f;
    }
    private void align(LinearLayoutManager manager) {
        if(!valid(pending)) { pending=-1; return; }
        View selected=manager.findViewByPosition(pending);
        if(selected==null) {
            if(!jumped) {
                int entrance=pendingAnimate?direction*Math.min(dp(64),recycler.getHeight()/4):0;
                int anchor=(recycler.getHeight()-dp(52))/2-recycler.getPaddingTop()+entrance;
                manager.scrollToPositionWithOffset(pending,anchor); jumped=true;
            }
            return;
        }
        int delta=Math.round(selected.getTop()+selected.getHeight()/2f-center(selected));
        if(pendingAnimate && Math.abs(delta)>recycler.getHeight()*.8f && !jumped) {
            int entrance=direction*Math.min(dp(64),recycler.getHeight()/4);
            int anchor=Math.round(center(selected)-selected.getHeight()/2f)-recycler.getPaddingTop()+entrance;
            manager.scrollToPositionWithOffset(pending,anchor); jumped=true; return;
        }
        pending=-1;
        if(pendingAnimate && canMove() && selected.getHeight()<recycler.getHeight()-dp(24)) startMotion(delta);
        else { stop(true); recycler.scrollBy(0,delta); }
    }
    static int distance(int index,int current) { return current<0?0:(int)Math.min(4,Math.abs((long)index-current)); }
    static float opacity(int distance,boolean reading,boolean known) { return !known?1f:reading?(distance==0?1f:.62f):OPACITY[Math.max(0,Math.min(4,distance))]; }
    static float radius(int distance) { return RADII[Math.max(0,Math.min(4,distance))]; }
    static float remaining(float progress,float order) {
        float time=Math.max(0,Math.min(1,(progress*640-Math.max(0,Math.min(4,order))*25)/540f));
        return (1-time)*(1-time)*(1-time);
    }
    @Override public boolean onPreDraw() {
        if(!active || disposed) return true;
        if(padding()) return false;
        if(recycler.isComputingLayout() || recycler.isLayoutRequested()) return true;
        if(!ValueAnimator.areAnimatorsEnabled() && animator!=null) stop(true);
        collect();
        if(pending>=0 && recycler.getLayoutManager() instanceof LinearLayoutManager) {
            align((LinearLayoutManager)recycler.getLayoutManager());
            if(jumped && recycler.isLayoutRequested()) return false;
            collect();
        }
        transforms(); styles(); return true;
    }
    private void collect() {
        visible.clear();
        for(int i=0;i<recycler.getChildCount();i++) {
            View child=recycler.getChildAt(i); int index=recycler.getChildAdapterPosition(child);
            if(index==RecyclerView.NO_POSITION) continue;
            Row row=rows.get(child);
            if(row==null || row.index!=index) {
                if(row!=null) reset(row);
                View text=child.findViewById(textId); if(!(text instanceof TextView)) continue;
                row=new Row(child,(TextView)text); row.index=index; rows.put(child,row);
                row.alpha=row.fromAlpha=opacity(distance(index,current),reading || accessible,current>=0);
                row.radius=row.fromRadius=radius(distance(index,current));
            }
            visible.add(row);
        }
        visible.sort((a,b)->Integer.compare(a.view.getTop(),b.view.getTop()));
    }
    private void startMotion(int delta) {
        stop(false); distance=delta; requested=0; moved=0; progress=0;
        first=visible.isEmpty()?current:visible.get(0).index;
        last=visible.isEmpty()?current:visible.get(visible.size()-1).index;
        for(Row row:visible) { row.initialShift=row.view.getTranslationY(); row.fromAlpha=row.alpha; row.fromRadius=row.radius; }
        ValueAnimator next=ValueAnimator.ofFloat(0,1); animator=next;
        next.setDuration(640); next.setInterpolator(value->value);
        next.addUpdateListener(value-> {
            if(animator!=next || !active || disposed || browsing) return;
            progress=(Float)value.getAnimatedValue();
            int travel=Math.round(distance*(1-remaining(progress,0)));
            applyingScroll=true; recycler.scrollBy(0,travel-requested); applyingScroll=false; requested=travel;
            collect(); transforms(); styles();
            if(progress>=1) { animator=null; clearTranslations(); }
        }); next.start();
    }
    @Override public void onScrolled(RecyclerView view,int dx,int dy) { if(applyingScroll) moved+=dy; }
    private void transforms() {
        if(animator==null) return;
        float bottom=Float.NEGATIVE_INFINITY;
        for(Row row:visible) {
            float order=4f*(distance>=0?row.index-first:last-row.index)/Math.max(1,last-first);
            float lag=moved-distance*(1-remaining(progress,order));
            float shift=row.initialShift*remaining(progress,0)+Math.max(-dp(22),Math.min(dp(22),lag));
            float position=Math.max(row.view.getTop()+shift,bottom);
            row.view.setTranslationY(position-row.view.getTop()); bottom=position+row.view.getHeight();
        }
    }
    private void styles() {
        boolean clear=reading || accessible || !modern;
        float blend=animator==null?1:Math.min(1,progress*640/180);
        for(Row row:visible) {
            int distance=distance(row.index,current);
            float alpha=modern?opacity(distance,clear,current>=0):(row.index==current?1f:.3f);
            float radius=blur && !clear && !blurFailed?radius(distance):0;
            row.alpha=clear?alpha:row.fromAlpha+(alpha-row.fromAlpha)*blend;
            row.radius=clear?0:row.fromRadius+(radius-row.fromRadius)*blend;
            if(row.index==current) { row.alpha=1; row.radius=0; }
            float y=row.view.getTop()+row.view.getTranslationY()+row.view.getHeight()/2f;
            float edge=modern && row.index!=current?Math.max(0,Math.min(1,Math.min(y,recycler.getHeight()-y)/dp(42))):1;
            float opacity=row.alpha*edge;
            if(row.text.getAlpha()!=opacity) row.text.setAlpha(opacity);
            effect(row,row.radius);
        }
    }
    private void effect(Row row,float radius) {
        int level=blurFailed?0:Math.max(0,Math.min(25,Math.round(radius*5)));
        if(row.level==level) return;
        if(Build.VERSION.SDK_INT>=31) {
            try {
                if(effects==null) effects=new Object[26];
                if(level>0 && effects[level]==null) effects[level]=Blur.create(level*density/5);
                Blur.apply(row.text,effects[level]);
            } catch(RuntimeException | LinkageError failure) {
                blurFailed=true;
                try { Blur.apply(row.text,null); } catch(RuntimeException | LinkageError ignored) {}
            }
        }
        row.level=level;
    }
    private static final class Blur {
        static Object create(float radius) { return RenderEffect.createBlurEffect(radius,radius,Shader.TileMode.CLAMP); }
        static void apply(View view,Object effect) { view.setRenderEffect((RenderEffect)effect); }
    }
    private void stop(boolean clear) {
        ValueAnimator previous=animator; animator=null; if(previous!=null) previous.cancel();
        if(clear) clearTranslations();
    }
    private void clearTranslations() { for(Row row:rows.values()) { row.initialShift=0; row.view.setTranslationY(0); } }
    private void reset(Row row) {
        row.view.setTranslationY(0); row.text.setAlpha(row.index==current?1f:.3f);
        if(Build.VERSION.SDK_INT>=31) try { Blur.apply(row.text,null); } catch(RuntimeException | LinkageError ignored) {}
    }
    @Override public void onChildViewAttachedToWindow(View view) { if(active) recycler.invalidate(); }
    @Override public void onChildViewDetachedFromWindow(View view) {
        Row row=rows.remove(view); if(row!=null) { reset(row); visible.remove(row); }
    }
    public void dispose() {
        if(disposed) return;
        active(false); disposed=true; effects=null;
        recycler.removeOnScrollListener(this); recycler.removeOnChildAttachStateChangeListener(this);
    }
}
