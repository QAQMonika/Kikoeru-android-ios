package com.zinhao.kikoeru;

import android.content.Context;
import android.content.SharedPreferences;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** Separate per-track bookmarks; never alter the original source files or server progress. */
public final class TrackResume {
    private static final int LIMIT=2000;
    static String key(JSONObject track) {
        if(track==null) return "";
        String value;
        if(track.optBoolean("baidu_cloud")) {
            String owner=track.optString("cloud_owner"),file=track.optString("cloud_id");
            try { BaiduApi.id(owner); BaiduApi.id(file); } catch(Exception e) { return ""; }
            value="baidu:"+owner+":"+file;
        } else if(track.optBoolean("local_import")) {
            String uri=track.optString("mediaStreamUrl"); if(uri.isEmpty()) return "";
            try { value="local:"+LocalDeletion.key(uri); } catch(Exception e) { value="local:"+uri; }
        } else {
            String hash=track.optString("hash");
            if(hash.isEmpty()) {
                try { URI uri=new URI(track.optString("mediaStreamUrl")); hash=uri.getHost()+":"+uri.getPath(); }
                catch(Exception e) { return ""; }
                if(track.optString("mediaStreamUrl").isEmpty()) return "";
            }
            value="remote:"+track.optLong("workId")+":"+hash;
        }
        return UUID.nameUUIDFromBytes(value.getBytes(StandardCharsets.UTF_8)).toString();
    }
    private static SharedPreferences prefs(Context context) { return context.getSharedPreferences("track_positions",0); }
    static long position(Context context,JSONObject track) {
        if(!PlaybackOptions.enabled(context)) return 0;
        String key=key(track); if(key.isEmpty()) return 0;
        try {
            JSONObject record=new JSONObject(prefs(context).getString(key,"{}"));
            long seek=Math.max(0,record.optLong("seek")),duration=record.optLong("duration");
            return duration>0 && seek>=duration?0:seek;
        } catch(Exception e) { return 0; }
    }
    static void remember(Context context,JSONObject track,long seek,long duration) {
        if(!PlaybackOptions.enabled(context)) return;
        String key=key(track); if(key.isEmpty()) return;
        SharedPreferences prefs=prefs(context);
        try {
            JSONObject previous;
            try { previous=new JSONObject(prefs.getString(key,"{}")); } catch(Exception corrupt) { previous=new JSONObject(); }
            long position=Math.max(0,seek),length=Math.max(0,duration);
            if(previous.optLong("seek",-1)==position && previous.optLong("duration",-1)==length) return;
            SharedPreferences.Editor edit=prefs.edit();
            if(!prefs.contains(key) && prefs.getAll().size()>=LIMIT) {
                String oldest=null; long time=Long.MAX_VALUE;
                for(Map.Entry<String,?> item:prefs.getAll().entrySet()) {
                    long saved=0; try { saved=new JSONObject(String.valueOf(item.getValue())).optLong("time"); } catch(Exception ignored) {}
                    if(oldest==null || saved<time) { oldest=item.getKey(); time=saved; }
                }
                if(oldest!=null) edit.remove(oldest);
            }
            edit.putString(key,new JSONObject().put("seek",position).put("duration",length).put("time",System.currentTimeMillis()).toString()).apply();
        } catch(Exception e) { android.util.Log.w("TrackResume","Cannot store track bookmark",e); }
    }
    static void seed(Context context,JSONObject snapshot) {
        try {
            JSONArray queue=snapshot.optJSONArray("playlist"); int index=snapshot.optInt("index",-1);
            if(queue==null || index<0 || index>=queue.length()) return;
            JSONObject track=queue.getJSONObject(index); String key=key(track);
            if(!key.isEmpty() && !prefs(context).contains(key)) remember(context,track,snapshot.optLong("seek"),0);
        } catch(Exception ignored) {}
    }
}
