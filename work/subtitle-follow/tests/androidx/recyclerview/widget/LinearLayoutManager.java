package androidx.recyclerview.widget;

import android.view.View;

public class LinearLayoutManager extends RecyclerView.LayoutManager {
    private final RecyclerView owner;
    public LinearLayoutManager() { owner=null; }
    public LinearLayoutManager(RecyclerView owner) { this.owner=owner; }
    public int lastVisible = -1, target = -1, smoothCalls, directCalls,offset;
    public boolean smooth;
    @Override public boolean isSmoothScrolling() { return smooth; }
    public int findLastCompletelyVisibleItemPosition() { return lastVisible; }
    public void scrollToPosition(int position) { target = position; directCalls++; }
    public void scrollToPositionWithOffset(int position,int offset) {
        target=position; this.offset=offset; directCalls++;
        View row=findViewByPosition(position);
        if(row!=null) owner.scrollBy(0,row.top-owner.getPaddingTop()-offset);
        if(owner!=null) owner.layoutRequested=true;
    }
    public View findViewByPosition(int position) {
        if(owner!=null) for(View child:owner.children) if(child.adapterPosition==position) return child;
        return null;
    }
    public int getDecoratedTop(View view) { return 0; }
    public int getDecoratedBottom(View view) { return 60; }
    public void startSmoothScroll(RecyclerView.SmoothScroller scroller) {
        target = scroller.target;
        smoothCalls++;
        smooth = true;
    }
}
