package androidx.recyclerview.widget;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

public class RecyclerView extends ViewGroup {
    public static final int NO_POSITION=-1;
    public interface OnChildAttachStateChangeListener {
        void onChildViewAttachedToWindow(View view);
        void onChildViewDetachedFromWindow(View view);
    }
    public final List<OnChildAttachStateChangeListener> childListeners=new ArrayList<>();
    public void addOnChildAttachStateChangeListener(OnChildAttachStateChangeListener listener) { childListeners.add(listener); }
    public void removeOnChildAttachStateChangeListener(OnChildAttachStateChangeListener listener) { childListeners.remove(listener); }
    public int getChildAdapterPosition(View view) { return view.adapterPosition; }
    public void detach(View view) { removeView(view); for(OnChildAttachStateChangeListener listener:new ArrayList<>(childListeners)) listener.onChildViewDetachedFromWindow(view); }
    public static final int SCROLL_STATE_IDLE = 0, SCROLL_STATE_DRAGGING = 1, SCROLL_STATE_SETTLING = 2;
    public static class OnScrollListener {
        public void onScrollStateChanged(RecyclerView recycler, int state) {}
        public void onScrolled(RecyclerView recycler,int dx,int dy) {}
    }
    public interface OnItemTouchListener {
        boolean onInterceptTouchEvent(RecyclerView recycler, MotionEvent event);
        void onTouchEvent(RecyclerView recycler, MotionEvent event);
        void onRequestDisallowInterceptTouchEvent(boolean value);
    }
    public abstract static class Adapter<T> {
        public abstract int getItemCount();
        public void notifyItemChanged(int position) {}
        public void notifyDataSetChanged() {}
    }
    public static class ItemAnimator {}
    public ItemAnimator animator=new ItemAnimator();
    public void setItemAnimator(ItemAnimator animator) { this.animator=animator; }
    public static class LayoutManager { public boolean isSmoothScrolling() { return false; } }
    public static class SmoothScroller {
        public int target;
        public void setTargetPosition(int position) { target = position; }
    }
    public final List<OnScrollListener> scrollListeners = new ArrayList<>();
    public final List<OnItemTouchListener> touchListeners = new ArrayList<>();
    public LinearLayoutManager layout = new LinearLayoutManager(this);
    public int scrollByCalls,totalScrolled;
    public void scrollBy(int dx,int dy) {
        scrollByCalls++; totalScrolled+=dy;
        for(View child:children) child.top-=dy;
        if(dy!=0) for(OnScrollListener listener:new ArrayList<>(scrollListeners)) listener.onScrolled(this,dx,dy);
    }
    private int state;
    public int count = 200;
    public boolean computingLayout;
    public boolean isComputingLayout() { return computingLayout; }
    public Adapter<?> getAdapter() { return new Adapter<Object>() {
        public int getItemCount() { return count; }
    }; }
    public LayoutManager getLayoutManager() { return layout; }
    public int getScrollState() { return state; }
    public void addOnScrollListener(OnScrollListener listener) { scrollListeners.add(listener); }
    public void removeOnScrollListener(OnScrollListener listener) { scrollListeners.remove(listener); }
    public void addOnItemTouchListener(OnItemTouchListener listener) { touchListeners.add(listener); }
    public void removeOnItemTouchListener(OnItemTouchListener listener) { touchListeners.remove(listener); }
    public void stopScroll() { layout.smooth = false; setState(SCROLL_STATE_IDLE); }
    public void setState(int value) {
        if (state == value) { return; }
        state = value;
        if(value == SCROLL_STATE_IDLE) layout.smooth = false;
        for (OnScrollListener listener : new ArrayList<>(scrollListeners)) {
            listener.onScrollStateChanged(this, value);
        }
    }
    public void touch(int action) {
        for (OnItemTouchListener listener : new ArrayList<>(touchListeners)) {
            if (listener.onInterceptTouchEvent(this, new MotionEvent(action))) {
                throw new AssertionError("Subtitle following must not intercept clicks");
            }
        }
    }
}
