package com.google.android.exoplayer2;

public interface Player {
    int STATE_IDLE = 1, STATE_BUFFERING = 2, STATE_READY = 3, STATE_ENDED = 4;
    class Events {}
    class PositionInfo {}
    interface Listener {
        default void onEvents(Player p, Events events) {}
        default void onPositionDiscontinuity(PositionInfo old, PositionInfo next, int reason) {}
    }
    int getPlaybackState();
    int getCurrentMediaItemIndex();
    long getCurrentPosition();
    long getDuration();
    boolean isPlaying();
    void pause();
    void seekTo(int index, long position);
    void addListener(Listener listener);
    void removeListener(Listener listener);
}
