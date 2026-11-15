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
    private static final int WORK_LIMIT=500;
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
    private static SharedPreferences workPrefs(Context context) { return context.getSharedPreferences("work_last_tracks",0); }
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
            long now=System.currentTimeMillis();
            if(previous.optLong("seek",-1)!=position || previous.optLong("duration",-1)!=length) {
                SharedPreferences.Editor edit=prefs.edit();
                if(!prefs.contains(key) && prefs.getAll().size()>=LIMIT) {
                    evictOldest(prefs,edit);
                }
                edit.putString(key,new JSONObject().put("seek",position).put("duration",length).put("time",now).toString()).apply();
            }
            rememberWorkLastTrack(context,track,key,position,length,now);
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

    private static void evictOldest(SharedPreferences sp,SharedPreferences.Editor edit) {
        String oldest=null; long oldestTime=Long.MAX_VALUE;
        for(Map.Entry<String,?> item:sp.getAll().entrySet()) {
            long saved=0; try { saved=new JSONObject(String.valueOf(item.getValue())).optLong("time"); } catch(Exception ignored) {}
            if(oldest==null || saved<oldestTime) { oldest=item.getKey(); oldestTime=saved; }
        }
        if(oldest!=null) edit.remove(oldest);
    }

    private static String uuidKey(String raw) {
        return UUID.nameUUIDFromBytes(raw.getBytes(StandardCharsets.UTF_8)).toString();
    }

    private static String safeLocalKey(String uri) {
        if(uri==null || uri.isEmpty()) return "";
        try { return LocalDeletion.key(uri); } catch(Exception e) { return uri; }
    }

    private static String normalizePath(String path) {
        if(path==null) return "";
        String trimmed=path.trim();
        while(trimmed.endsWith("/") && trimmed.length()>1) trimmed=trimmed.substring(0,trimmed.length()-1);
        return trimmed;
    }

    private static long resolveOnlineWorkId(JSONObject track) {
        if(track==null) return 0L;
        long workId=track.optLong("workId",0L);
        if(workId!=0L) return workId;
        String hash=track.optString("hash","");
        int slash=hash.indexOf('/');
        if(slash>0) {
            try { return Long.parseLong(hash.substring(0,slash)); } catch(NumberFormatException ignored) {}
        }
        return 0L;
    }

    static int computePercent(long seek,long duration,boolean completed) {
        if(completed) return 100;
        if(seek<=0) return 0;
        if(duration<=0) return -1;
        return (int)Math.min(99L,Math.max(1L,Math.round(seek*100.0/duration)));
    }

    private static void rememberWorkLastTrack(Context context,JSONObject track,String trackKey,long position,long duration,long now) {
        if(track==null) return;
        boolean completed=duration>0 && position>=duration;
        long savedSeek=completed?0L:position;
        int percent=computePercent(position,duration,completed);
        String workKey="";
        JSONObject entry=new JSONObject();
        try {
            entry.put("trackKey",trackKey)
                    .put("title",track.optString("title"))
                    .put("workTitle",track.optString("workTitle"))
                    .put("seek",savedSeek)
                    .put("rawSeek",position)
                    .put("duration",duration)
                    .put("completed",completed)
                    .put("percent",percent)
                    .put("time",now);
            if(track.optBoolean("baidu_cloud")) {
                String owner=track.optString("cloud_owner"),folder=normalizePath(track.optString("cloud_folder")),cloudId=track.optString("cloud_id");
                if(owner.isEmpty() || folder.isEmpty()) return;
                workKey=uuidKey("baidu:"+owner+":"+folder);
                entry.put("source","baidu").put("owner",owner).put("folder",folder).put("cloudId",cloudId);
            } else if(track.optBoolean("local_import")) {
                String sourceKey=safeLocalKey(track.optString("local_source"));
                String parentUri=track.optString("local_parent"),parentKey=safeLocalKey(parentUri);
                String folderPath=normalizePath(track.optString("workTitle"));
                String rawUri=track.optString("mediaStreamUrl"),uriKey=safeLocalKey(rawUri);
                if(parentKey.isEmpty() && folderPath.isEmpty()) return;
                workKey=uuidKey("local:"+sourceKey+":"+(!parentKey.isEmpty()?parentKey:folderPath));
                entry.put("source","local").put("localSource",sourceKey).put("localParent",parentKey)
                        .put("localParentUri",parentUri).put("folderPath",folderPath)
                        .put("uri",uriKey).put("rawUri",rawUri);
            } else {
                long workId=resolveOnlineWorkId(track);
                String hash=track.optString("hash");
                if(workId==0L && hash.isEmpty()) return;
                workKey=uuidKey("online:"+workId);
                entry.put("source","online").put("workId",workId).put("hash",hash)
                        .put("mediaStreamUrl",track.optString("mediaStreamUrl"));
            }
            SharedPreferences wp=workPrefs(context);
            JSONObject prev=null;
            try { String raw=wp.getString(workKey,""); if(!raw.isEmpty()) prev=new JSONObject(raw); } catch(Exception ignored) {}
            if(prev!=null && trackKey.equals(prev.optString("trackKey"))
                    && savedSeek==prev.optLong("seek",-1L) && duration==prev.optLong("duration",-1L)
                    && completed==prev.optBoolean("completed")
                    && Math.abs(now-prev.optLong("time",0L))<3000L) {
                return;
            }
            SharedPreferences.Editor edit=wp.edit();
            if(!wp.contains(workKey) && wp.getAll().size()>=WORK_LIMIT) {
                evictOldest(wp,edit);
            }
            edit.putString(workKey,entry.toString()).apply();
        } catch(Exception ignored) {}
    }

    static JSONObject trackProgress(Context context,JSONObject track) {
        return trackProgress(context,track,0L);
    }

    static JSONObject trackProgress(Context context,JSONObject track,long fallbackWorkId) {
        if(!PlaybackOptions.enabled(context) || track==null) return null;
        JSONObject lookup=track;
        if(fallbackWorkId!=0L && !track.optBoolean("baidu_cloud") && !track.optBoolean("local_import") && track.optLong("workId",0L)==0L) {
            try { lookup=new JSONObject(track.toString()).put("workId",fallbackWorkId); } catch(Exception e) { return null; }
        }
        String key=key(lookup); if(key.isEmpty()) return null;
        try {
            String raw=prefs(context).getString(key,"");
            if(raw.isEmpty()) return null;
            JSONObject record=new JSONObject(raw);
            long seek=Math.max(0L,record.optLong("seek",0L));
            long duration=Math.max(0L,record.optLong("duration",0L));
            boolean completed=duration>0L && seek>=duration;
            long displaySeek=completed?0L:seek;
            int percent=computePercent(seek,duration,completed);
            if(displaySeek<=0L && !completed) return null;
            return new JSONObject().put("seek",displaySeek).put("rawSeek",seek).put("duration",duration)
                    .put("time",record.optLong("time",0L)).put("completed",completed).put("percent",percent);
        } catch(Exception e) { return null; }
    }

    static JSONObject lastPlayedForOnlineWork(Context context,long workId) {
        if(!PlaybackOptions.enabled(context) || workId==0L) return null;
        try {
            String raw=workPrefs(context).getString(uuidKey("online:"+workId),"");
            if(raw.isEmpty()) return null;
            return new JSONObject(raw);
        } catch(Exception e) { return null; }
    }

    static JSONObject lastPlayedForLocalFolder(Context context,String sourceUri,String folderPath,String folderUri) {
        if(!PlaybackOptions.enabled(context)) return null;
        String normSource=safeLocalKey(sourceUri),normUri=safeLocalKey(folderUri),normPath=normalizePath(folderPath);
        JSONObject best=null; long bestTime=-1L;
        for(Map.Entry<String,?> item:workPrefs(context).getAll().entrySet()) {
            try {
                JSONObject obj=new JSONObject(String.valueOf(item.getValue()));
                if(!"local".equals(obj.optString("source"))) continue;
                String entrySource=obj.optString("localSource");
                if(!normSource.isEmpty() && !entrySource.isEmpty() && !normSource.equals(entrySource)) continue;
                String entryParent=obj.optString("localParent");
                String entryPath=normalizePath(obj.optString("folderPath"));
                boolean matches=(!normUri.isEmpty() && normUri.equals(entryParent))
                        || (!normPath.isEmpty() && (entryPath.equals(normPath) || entryPath.startsWith(normPath+"/")));
                if(!matches) continue;
                long t=obj.optLong("time",0L);
                if(best==null || t>bestTime) { best=obj; bestTime=t; }
            } catch(Exception ignored) {}
        }
        if(best==null) return null;
        try {
            JSONObject copy=new JSONObject(best.toString());
            String entryPath=normalizePath(copy.optString("folderPath"));
            String sub=!normPath.isEmpty() && entryPath.startsWith(normPath+"/") ? entryPath.substring(normPath.length()+1) : "";
            copy.put("subFolder",sub);
            return copy;
        } catch(Exception e) { return best; }
    }

    static JSONObject lastPlayedForCloudFolder(Context context,String owner,String folderPath) {
        if(!PlaybackOptions.enabled(context) || owner==null || owner.isEmpty()) return null;
        String normPath=normalizePath(folderPath);
        if(normPath.isEmpty()) return null;
        JSONObject best=null; long bestTime=-1L;
        for(Map.Entry<String,?> item:workPrefs(context).getAll().entrySet()) {
            try {
                JSONObject obj=new JSONObject(String.valueOf(item.getValue()));
                if(!"baidu".equals(obj.optString("source")) || !owner.equals(obj.optString("owner"))) continue;
                String entryFolder=normalizePath(obj.optString("folder"));
                boolean matches=entryFolder.equals(normPath)
                        || (normPath.equals("/")?entryFolder.startsWith("/"):entryFolder.startsWith(normPath+"/"));
                if(!matches) continue;
                long t=obj.optLong("time",0L);
                if(best==null || t>bestTime) { best=obj; bestTime=t; }
            } catch(Exception ignored) {}
        }
        if(best==null) return null;
        try {
            JSONObject copy=new JSONObject(best.toString());
            String entryFolder=normalizePath(copy.optString("folder"));
            String sub="";
            if(normPath.equals("/") && entryFolder.length()>1) sub=entryFolder.substring(1);
            else if(entryFolder.startsWith(normPath+"/")) sub=entryFolder.substring(normPath.length()+1);
            copy.put("subFolder",sub);
            return copy;
        } catch(Exception e) { return best; }
    }

    static JSONObject workProgressOnline(Context context,long workId,JSONArray trees) {
        if(!PlaybackOptions.enabled(context) || trees==null) return null;
        double[] stats=new double[4]; // [0]=totalTracks, [1]=playedTracks, [2]=totalWeight, [3]=listenedWeight
        accumulateOnlineProgress(context,workId,trees,stats);
        int total=(int)stats[0],played=(int)stats[1];
        if(total<=0 || played<=0) return null;
        int pct=(int)Math.round(stats[3]*100.0/Math.max(1.0,stats[2]));
        if(pct==0) pct=1;
        if(pct>100) pct=100;
        try {
            return new JSONObject().put("totalTracks",total).put("playedTracks",played)
                    .put("percent",pct).put("scopeLabel","\u6574\u90e8\u8fdb\u5ea6");
        } catch(Exception e) { return null; }
    }

    private static void accumulateOnlineProgress(Context context,long workId,JSONArray arr,double[] stats) {
        if(arr==null) return;
        for(int i=0;i<arr.length();i++) {
            JSONObject item=arr.optJSONObject(i);
            if(item==null) continue;
            String type=item.optString("type","");
            if("folder".equals(type)) {
                accumulateOnlineProgress(context,workId,item.optJSONArray("children"),stats);
            } else if("audio".equals(type)) {
                long durMs=Math.max(0L,Math.round(item.optDouble("duration",0.0)*1000.0));
                double weight=durMs>0L?durMs:60000.0;
                stats[0]+=1.0;
                stats[2]+=weight;
                JSONObject prog=trackProgress(context,item,workId);
                if(prog!=null) {
                    stats[1]+=1.0;
                    if(prog.optBoolean("completed")) {
                        stats[3]+=weight;
                    } else {
                        long effDur=durMs>0L?durMs:prog.optLong("duration",0L);
                        double ratio=effDur>0L?Math.min(1.0,prog.optLong("seek",0L)/(double)effDur):0.25;
                        stats[3]+=weight*ratio;
                    }
                }
            }
        }
    }

    static JSONObject localTrackStub(JSONObject node) {
        if(node==null) return null;
        try {
            return new JSONObject().put("local_import",true).put("title",node.optString("name"))
                    .put("mediaStreamUrl",node.optString("uri"));
        } catch(Exception e) { return null; }
    }

    static JSONObject cloudTrackStub(String owner,JSONObject item) {
        if(item==null || owner==null || owner.isEmpty()) return null;
        try {
            return new JSONObject().put("baidu_cloud",true).put("cloud_owner",owner)
                    .put("cloud_id",item.optString("fs_id")).put("title",item.optString("server_filename"));
        } catch(Exception e) { return null; }
    }

    static JSONObject workProgressLocal(Context context,JSONArray roots,String sourceUri,String folderPath,String folderUri) {
        if(!PlaybackOptions.enabled(context) || roots==null) return null;
        String normSource=safeLocalKey(sourceUri),normUri=safeLocalKey(folderUri),normPath=normalizePath(folderPath);
        int total=0,played=0; double ratioSum=0.0;
        java.util.Set<String> seen=new java.util.HashSet<>();
        for(int i=0;i<roots.length();i++) {
            JSONObject root=roots.optJSONObject(i); if(root==null) continue;
            String rootUri=root.optString("uri");
            if(!normSource.isEmpty() && !normSource.equals(safeLocalKey(rootUri))) continue;
            JSONArray entries=root.optJSONArray("entries"); if(entries==null) continue;
            for(int j=0;j<entries.length();j++) {
                JSONObject n=entries.optJSONObject(j);
                if(n==null || n.optBoolean("directory")) continue;
                String nParent=safeLocalKey(n.optString("parent"));
                String nPath=normalizePath(n.optString("path"));
                boolean inside=(!normUri.isEmpty() && normUri.equals(nParent))
                        || (!normPath.isEmpty() && nPath.startsWith(normPath+"/"));
                if(!inside) continue;
                String u=n.optString("uri"); if(!seen.add(u)) continue;
                total++;
                JSONObject prog=trackProgress(context,localTrackStub(n));
                if(prog!=null) {
                    played++;
                    if(prog.optBoolean("completed")) ratioSum+=1.0;
                    else if(prog.optInt("percent",-1)>0) ratioSum+=prog.optInt("percent")/100.0;
                    else ratioSum+=0.25;
                }
            }
        }
        if(total<=0 || played<=0) return null;
        int pct=(int)Math.round(ratioSum*100.0/total);
        if(pct==0) pct=1;
        if(pct>100) pct=100;
        try {
            return new JSONObject().put("totalTracks",total).put("playedTracks",played)
                    .put("percent",pct).put("scopeLabel","\u6574\u90e8\u8fdb\u5ea6");
        } catch(Exception e) { return null; }
    }

    static JSONObject folderProgressCloud(Context context,String owner,List<JSONObject> visibleRows) {
        if(!PlaybackOptions.enabled(context) || owner==null || owner.isEmpty() || visibleRows==null) return null;
        int total=0,played=0; double ratioSum=0.0;
        for(JSONObject row:visibleRows) {
            if(row==null || row.optInt("isdir")==1) continue;
            total++;
            JSONObject prog=trackProgress(context,cloudTrackStub(owner,row));
            if(prog!=null) {
                played++;
                if(prog.optBoolean("completed")) ratioSum+=1.0;
                else if(prog.optInt("percent",-1)>0) ratioSum+=prog.optInt("percent")/100.0;
                else ratioSum+=0.25;
            }
        }
        if(total<=0 || played<=0) return null;
        int pct=(int)Math.round(ratioSum*100.0/total);
        if(pct==0) pct=1;
        if(pct>100) pct=100;
        try {
            return new JSONObject().put("totalTracks",total).put("playedTracks",played)
                    .put("percent",pct).put("scopeLabel","\u5f53\u524d\u76ee\u5f55\u8fdb\u5ea6");
        } catch(Exception e) { return null; }
    }

    static String formatDurationClock(long ms) {
        long totalSec=Math.max(0L,ms/1000L);
        long h=totalSec/3600L,m=(totalSec%3600L)/60L,s=totalSec%60L;
        if(h>0L) return String.format(java.util.Locale.ROOT,"%d:%02d:%02d",h,m,s);
        return String.format(java.util.Locale.ROOT,"%02d:%02d",m,s);
    }

    static String formatRelativeTime(long timeMs,long nowMs) {
        if(timeMs<=0L || nowMs<timeMs) return "";
        long diffSec=(nowMs-timeMs)/1000L;
        if(diffSec<90L) return "\u521a\u521a";
        long mins=diffSec/60L;
        if(mins<60L) return mins+"\u5206\u949f\u524d";
        long hours=mins/60L;
        if(hours<24L) return hours+"\u5c0f\u65f6\u524d";
        long days=hours/24L;
        if(days<=30L) return days+"\u5929\u524d";
        java.text.SimpleDateFormat fmt=new java.text.SimpleDateFormat("MM-dd",java.util.Locale.ROOT);
        return fmt.format(new java.util.Date(timeMs));
    }

    static String buildTrackBadge(Context context,JSONObject track,long fallbackWorkId,boolean isLastPlayed,JSONObject lastPlayed) {
        JSONObject prog=trackProgress(context,track,fallbackWorkId);
        if(isLastPlayed) {
            boolean done=(prog!=null && prog.optBoolean("completed")) || (lastPlayed!=null && lastPlayed.optBoolean("completed"));
            long seek=prog!=null?prog.optLong("seek",0L):(lastPlayed!=null?lastPlayed.optLong("seek",0L):0L);
            int pct=prog!=null?prog.optInt("percent",-1):(lastPlayed!=null?lastPlayed.optInt("percent",-1):-1);
            if(done) return "\u4e0a\u6b21\u542c\u5230 \u00b7 \u5df2\u542c\u5b8c 100%";
            if(seek>0L) return "\u4e0a\u6b21\u542c\u5230 "+formatDurationClock(seek)+(pct>0?" ("+pct+"%)":"");
            return "\u4e0a\u6b21\u542c\u5230";
        }
        if(prog==null) return "";
        if(prog.optBoolean("completed")) return "\u5df2\u542c\u5b8c 100%";
        int pct=prog.optInt("percent",-1);
        long seek=prog.optLong("seek",0L);
        if(pct>0 && seek>0L) return "\u5df2\u542c "+pct+"% \u00b7 "+formatDurationClock(seek);
        if(seek>0L) return "\u5df2\u542c "+formatDurationClock(seek);
        return "";
    }
}
