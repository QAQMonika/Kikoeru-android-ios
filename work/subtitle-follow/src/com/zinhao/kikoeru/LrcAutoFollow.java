package com.zinhao.kikoeru;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.LinearSmoothScroller;
import androidx.recyclerview.widget.RecyclerView;

/** Keeps manual subtitle browsing separate from playback-driven scrolling. */
public final class LrcAutoFollow extends RecyclerView.OnScrollListener
        implements RecyclerView.OnItemTouchListener, Runnable {
    private static final long IDLE_DELAY_MS = 2500L;
    private final AudioPlayerActivity activity;
    private final RecyclerView recycler;
    private final LrcVisuals visuals;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private boolean browsing;
    private boolean touching;
    private boolean returning;
    private boolean active = true;
    private boolean disposed;
    private boolean alignmentPending;
    private long idleSince;
    private final Runnable alignment = this::alignAfterLayout;
    private final View.OnLayoutChangeListener layoutListener = (v,l,t,r,b,ol,ot,or,ob) -> requestAlignment();

    public LrcAutoFollow(AudioPlayerActivity activity, RecyclerView recycler) {
        this.activity = activity;
        this.recycler = recycler;
        visuals = new LrcVisuals(recycler);
        recycler.addOnScrollListener(this);
        recycler.addOnItemTouchListener(this);
        recycler.addOnLayoutChangeListener(layoutListener);
    }

    @Override
    public boolean onInterceptTouchEvent(RecyclerView view, MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            cancelAlignment();
            touching = true;
            browsing = true;
            visuals.browsing(true);
            handler.removeCallbacks(this);
            recycler.stopScroll();
            returning = false;
        } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            touching = false;
            if (browsing && recycler.getScrollState() == RecyclerView.SCROLL_STATE_IDLE) {
                startIdleTimer();
            }
        }
        // Observe touches without stealing row clicks or RecyclerView's gestures.
        return false;
    }

    @Override
    public void onTouchEvent(RecyclerView view, MotionEvent event) {}

    @Override
    public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {}

    @Override
    public void onScrollStateChanged(RecyclerView view, int newState) {
        if (newState == RecyclerView.SCROLL_STATE_DRAGGING) {
            cancelAlignment();
            browsing = true;
            visuals.browsing(true);
            visuals.drag();
            returning = false;
            handler.removeCallbacks(this);
        } else if (newState == RecyclerView.SCROLL_STATE_SETTLING) {
            if (browsing) {
                handler.removeCallbacks(this);
            }
        } else if (newState == RecyclerView.SCROLL_STATE_IDLE) {
            returning = false;
            if (browsing && !touching) {
                startIdleTimer();
            }
        }
    }

    private void startIdleTimer() {
        handler.removeCallbacks(this);
        idleSince = SystemClock.uptimeMillis();
        if (active && !disposed) {
            handler.postDelayed(this, IDLE_DELAY_MS);
        }
    }

    @Override
    public void run() {
        if (disposed || !active || !browsing || touching
                || recycler.getScrollState() != RecyclerView.SCROLL_STATE_IDLE) {
            return;
        }
        long remaining = IDLE_DELAY_MS - (SystemClock.uptimeMillis() - idleSince);
        if (remaining > 0L) {
            handler.postDelayed(this, remaining);
        } else if (!activity.isLrcFollowPlaying()) {
            // Leave paused browsing intact; resume only after playback restarts.
            handler.postDelayed(this, 250L);
        } else {
            int index = activity.getLrcFollowIndex();
            if (validIndex(index)) {
                browsing = false;
                visuals.browsing(false);
                visuals.focus(index,true);
                scrollTo(index, true);
            } else {
                handler.postDelayed(this, 250L);
            }
        }
    }

    public void follow() {
        if (alignmentPending) {
            requestAlignment();
            return;
        }
        boolean changed=visuals.focus(activity.getLrcFollowIndex(),active && !browsing);
        RecyclerView.LayoutManager manager = recycler.getLayoutManager();
        if (returning && recycler.getScrollState() == RecyclerView.SCROLL_STATE_IDLE
                && (manager == null || !manager.isSmoothScrolling())) {
            returning = false;
        }
        if (active && !disposed && !browsing && !touching && !returning
                && (activity.isLrcFollowPlaying() || changed)) {
            scrollTo(activity.getLrcFollowIndex(), false);
        }
    }

    public void resumeAt(int index) {
        cancelAlignment();
        handler.removeCallbacks(this);
        browsing = false;
        visuals.browsing(false);
        visuals.focus(index,true);
        touching = false;
        returning = false;
        recycler.stopScroll();
        if (active && !disposed) {
            scrollTo(index, true);
        }
    }

    public void setActive(boolean value) {
        boolean wasActive = active;
        active = value;
        visuals.active(value);
        handler.removeCallbacks(this);
        handler.removeCallbacks(alignment);
        if (!value) {
            touching = false;
            recycler.stopScroll();
            returning = false;
        } else if (browsing && !disposed) {
            startIdleTimer();
        } else if (!disposed && (!wasActive || alignmentPending)) {
            alignCurrent();
        }
    }

    /** Initial/re-entry positioning is a layout-safe snap, independent of playback or row events. */
    public void alignCurrent() {
        if (disposed) return;
        alignmentPending = true;
        requestAlignment();
    }

    private void requestAlignment() {
        handler.removeCallbacks(alignment);
        if (alignmentPending && active && !disposed && !browsing && !touching) {
            handler.postDelayed(alignment, 16L);
        }
    }

    private void cancelAlignment() {
        alignmentPending = false;
        handler.removeCallbacks(alignment);
    }

    private void alignAfterLayout() {
        if (!alignmentPending || !active || disposed || browsing || touching) return;
        if (!recycler.isLaidOut() || recycler.getWidth() <= 0
                || recycler.getHeight() <= recycler.getPaddingTop() + recycler.getPaddingBottom()) return;
        if (recycler.isLayoutRequested() || recycler.isComputingLayout()) {
            requestAlignment();
            return;
        }
        RecyclerView.LayoutManager manager = recycler.getLayoutManager();
        if (!(manager instanceof LinearLayoutManager)) return;
        int index = activity.syncLrcFollowIndex();
        if (!validIndex(index)) return;
        alignmentPending = false;
        returning = false;
        recycler.stopScroll();
        // No SmoothScroller is started before the new page has attached/layouted its rows.
        if(!visuals.snap(index)) ((LinearLayoutManager) manager).scrollToPositionWithOffset(index, 0);
    }

    public void dispose() {
        disposed = true;
        active = false;
        handler.removeCallbacks(this);
        cancelAlignment();
        visuals.dispose();
        recycler.removeOnScrollListener(this);
        recycler.removeOnItemTouchListener(this);
        recycler.removeOnLayoutChangeListener(layoutListener);
        recycler.stopScroll();
    }

    private boolean validIndex(int index) {
        RecyclerView.Adapter<?> adapter = recycler.getAdapter();
        return adapter != null && index >= 0 && index < adapter.getItemCount();
    }

    private void scrollTo(int index, boolean smooth) {
        if (!validIndex(index)) {
            return;
        }
        RecyclerView.LayoutManager manager = recycler.getLayoutManager();
        if (!(manager instanceof LinearLayoutManager)) {
            return;
        }
        LinearLayoutManager layout = (LinearLayoutManager) manager;
        if (visuals.scrollTo(index,smooth)) return;
        if (!smooth) {
            if (layout.findLastCompletelyVisibleItemPosition() != index) {
                layout.scrollToPosition(index);
            }
            return;
        }
        View row = layout.findViewByPosition(index);
        if (row != null && layout.getDecoratedTop(row) >= recycler.getPaddingTop()
                && layout.getDecoratedBottom(row) <= recycler.getHeight() - recycler.getPaddingBottom()) {
            return;
        }
        LinearSmoothScroller scroller = new LinearSmoothScroller(recycler.getContext()) {
            @Override
            protected int getVerticalSnapPreference() {
                return SNAP_TO_START;
            }
        };
        scroller.setTargetPosition(index);
        returning = true;
        layout.startSmoothScroll(scroller);
    }
}
