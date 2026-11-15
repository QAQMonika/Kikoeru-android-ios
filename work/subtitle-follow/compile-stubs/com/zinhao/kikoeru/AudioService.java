package com.zinhao.kikoeru;

import android.app.Service;
import android.os.Binder;
import com.google.android.exoplayer2.ExoPlayer;
import java.util.List;
import org.json.JSONObject;

public abstract class AudioService extends Service {
    public class CtrlBinder extends Binder {
        public ExoPlayer getExoPlayer() { return null; }
        public List<JSONObject> getPlaybackQueue() { return null; }
        public void play(List<JSONObject> queue, int index) throws Exception {}
        public void setReapAll() {}
        public JSONObject getCurrent() { return null; }
        public void setLrc(String text) {}
        public void setLocalLrc(String text) {}
        public boolean isLrcWindowShow() { return false; }
        public void showLrcFloatWindow() {}
        public void hideLrcFloatWindow() {}
    }
}
