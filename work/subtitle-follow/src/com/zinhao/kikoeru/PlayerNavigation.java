package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Intent;
import java.util.*;
import org.json.JSONObject;

/** Back uses the real task stack; queue browsing is an explicit user action. */
public final class PlayerNavigation {
    public static void openPlayer(Activity activity) {
        activity.startActivity(new Intent(activity,AudioPlayerActivity.class));
    }
    public static void openQueue(Activity activity) {
        activity.startActivity(new Intent(activity,PlaybackQueueActivity.class));
    }
    public static void openCloud(Activity activity) {
        if(!AppShell.showHomeSource(activity,2)) activity.startActivity(new Intent(activity,BaiduCloudActivity.class));
    }
    static List<JSONObject> snapshot(AudioService.CtrlBinder binder) {
        List<JSONObject> queue=binder==null?null:binder.getPlaybackQueue();
        return queue==null?Collections.emptyList():new ArrayList<>(queue);
    }
    static boolean select(AudioService.CtrlBinder binder,List<JSONObject> shown,int index) throws Exception {
        if(binder==null || index<0 || index>=shown.size()) return false;
        List<JSONObject> live=snapshot(binder);
        if(live.size()!=shown.size()) return false;
        for(int i=0;i<live.size();i++) if(!identity(live.get(i)).equals(identity(shown.get(i)))) return false;
        if(binder.getExoPlayer().getCurrentMediaItemIndex()!=index) binder.play(live,index);
        return true;
    }
    static String identity(JSONObject track) {
        return track==null?"":track.optString("mediaStreamUrl",track.optString("hash"));
    }
}
