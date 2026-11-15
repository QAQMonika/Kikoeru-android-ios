package com.zinhao.kikoeru;

import androidx.recyclerview.widget.RecyclerView;

/** Selection is committed by the adapter before either affected row is rebound. */
public final class LrcSelection {
    public static int index(int requested,int count) {
        return requested>=0 && requested<count?requested:-1;
    }
    public static void refresh(RecyclerView.Adapter<?> adapter,int previous,int current) {
        if(previous==current) return;
        int count=adapter.getItemCount();
        if(previous>=0 && previous<count) adapter.notifyItemChanged(previous);
        if(current>=0 && current<count) adapter.notifyItemChanged(current);
    }
    public static void configure(RecyclerView recycler) {
        // Change crossfades can keep an obsolete enlarged holder visible beside the new one.
        recycler.setItemAnimator(null);
    }
}
