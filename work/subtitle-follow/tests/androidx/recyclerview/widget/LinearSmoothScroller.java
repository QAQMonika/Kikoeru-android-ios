package androidx.recyclerview.widget;

import android.content.Context;

public class LinearSmoothScroller extends RecyclerView.SmoothScroller {
    public static final int SNAP_TO_START = -1;
    public LinearSmoothScroller(Context context) {}
    protected int getVerticalSnapPreference() { return 0; }
}
