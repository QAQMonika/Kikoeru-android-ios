package com.zinhao.kikoeru;

import com.google.android.exoplayer2.*;
import java.util.*;
import org.json.JSONObject;

public class AudioService {
    public class CtrlBinder {
        public List<JSONObject> queue = new ArrayList<>();
        public final FakePlayer player = new FakePlayer();
        public int playCalls;
        public ExoPlayer getExoPlayer() { return player; }
        public List<JSONObject> getPlaybackQueue() { return queue; }
        public JSONObject getCurrent() { return queue.isEmpty()?null:queue.get(player.index); }
        public void setReapAll() {}
        public void play(List<JSONObject> items, int index) {
            LocalDeletion.checkPlayback(items);
            PlaybackPosition.beforePlay(this);
            playCalls++;
            queue = new ArrayList<>(items);
            player.index = index; player.position = PlaybackPosition.startPosition(this,items,index); player.state = Player.STATE_BUFFERING;
            player.playing = true;
        }
    }
    public static class FakePlayer implements ExoPlayer {
        public int state = STATE_IDLE, index;
        public long position;
        public long duration=300000;
        public boolean playing;
        public Listener listener;
        public int getPlaybackState() { return state; }
        public int getCurrentMediaItemIndex() { return index; }
        public long getCurrentPosition() { return position; }
        public long getDuration() { return duration; }
        public boolean isPlaying() { return playing; }
        public void pause() { playing = false; }
        public void seekTo(int i, long p) { index = i; position = p; }
        public void addListener(Listener l) { listener = l; }
        public void removeListener(Listener l) { if (listener == l) listener = null; }
        public void event() { listener.onEvents(this, new Events()); }
        public void discontinuity() { listener.onPositionDiscontinuity(new PositionInfo(), new PositionInfo(), 0); }
    }
}
