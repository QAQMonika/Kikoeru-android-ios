package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.text.format.DateFormat;
import android.text.TextUtils;
import android.util.AtomicFile;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.zinhao.kikoeru.db.LocalWorkHistory;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Local listening records share the original history UI, never its online database. */
public final class LocalHistory {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static final WeakHashMap<Activity,List<LocalWorkHistory>> pages=new WeakHashMap<>();
    private static final WeakHashMap<Activity,Map<Long,JSONObject>> records=new WeakHashMap<>();
    private static final Set<String> started=ConcurrentHashMap.newKeySet();
    static void notePlaying(List<JSONObject> queue,int index) {
        if(queue==null || index<0 || index>=queue.size()) return;
        JSONObject track=queue.get(index);
        if(track.optBoolean("local_import")) started.add(track.optString("mediaStreamUrl"));
    }
    private static String key(JSONObject track) { return track.optString("local_source")+"\n"+track.optString("local_parent"); }
    static JSONArray update(JSONArray old,JSONObject track,long seek,long time) throws Exception {
        if(!track.optBoolean("local_import")) return old;
        String key=key(track); long id=-1; JSONObject previous=null;
        for(int i=0;i<old.length();i++) {
            JSONObject r=old.getJSONObject(i); id=Math.min(id,r.optLong("id",-1)-1);
            if(r.optString("key").equals(key)) previous=r;
        }
        if(previous!=null) id=previous.getLong("id");
        String title=track.optString("workTitle"); int slash=title.lastIndexOf('/'); if(slash>=0) title=title.substring(slash+1);
        JSONObject record=new JSONObject().put("id",id).put("key",key).put("source",track.optString("local_source"))
                .put("parent",track.optString("local_parent")).put("title",title).put("track",track.optString("title"))
                .put("audio",track.optString("mediaStreamUrl")).put("cover",track.optString("local_cover"))
                .put("seek",Math.max(0,seek)).put("time",Math.max(0,time));
        List<JSONObject> rows=new ArrayList<>(); rows.add(record);
        for(int i=0;i<old.length();i++) if(!old.getJSONObject(i).optString("key").equals(key)) rows.add(old.getJSONObject(i));
        rows.sort((a,b)->Long.compare(b.optLong("time"),a.optLong("time")));
        JSONArray result=new JSONArray(); for(int i=0;i<Math.min(500,rows.size());i++) result.put(rows.get(i));
        return result;
    }
    private static JSONArray load(Context c) throws Exception {
        AtomicFile file=new AtomicFile(new File(c.getFilesDir(),"local-listening-history.json"));
        try(InputStream in=file.openRead()) {
            return new JSONArray(new String(LocalDocuments.read(in,4*1024*1024),StandardCharsets.UTF_8));
        } catch(FileNotFoundException e) { return new JSONArray(); }
    }
    // Called on PlaybackPosition's serialized writer, after its checkpoint succeeds.
    static synchronized boolean checkpoint(Context c,String payload,boolean playing) {
        try {
            JSONObject snapshot=new JSONObject(payload); JSONArray queue=snapshot.getJSONArray("playlist");
            JSONObject track=queue.getJSONObject(snapshot.getInt("index"));
            if(!track.optBoolean("local_import")) return true;
            String uri=track.optString("mediaStreamUrl");
            if(playing) started.add(uri);
            if(!started.contains(uri)) return true;
            JSONArray updated=update(load(c),track,snapshot.optLong("seek"),System.currentTimeMillis());
            byte[] bytes=updated.toString().getBytes(StandardCharsets.UTF_8);
            if(bytes.length>4*1024*1024) throw new IOException("Local history limit exceeded");
            AtomicFile file=new AtomicFile(new File(c.getFilesDir(),"local-listening-history.json"));
            FileOutputStream out=null;
            try { out=file.startWrite(); out.write(bytes); file.finishWrite(out); }
            catch(Exception e) { if(out!=null) file.failWrite(out); throw e; }
            return true;
        } catch(Exception e) { Log.w("LocalHistory","Cannot save local listening history",e); return false; }
    }
    public static List<LocalWorkHistory> merge(Activity activity,List<LocalWorkHistory> online) {
        List<LocalWorkHistory> list=online==null?new ArrayList<>():new ArrayList<>(online);
        pages.put(activity,list); refresh(activity); return list;
    }
    public static void refresh(Activity activity) {
        List<LocalWorkHistory> list=pages.get(activity); if(list==null) return;
        Context context=activity.getApplicationContext();
        java.lang.ref.WeakReference<Activity> ref=new java.lang.ref.WeakReference<>(activity);
        IO.execute(()-> {
            try {
                JSONArray saved;
                synchronized(LocalHistory.class) { saved=load(context); }
                MAIN.post(()-> {
                    Activity page=ref.get(); if(page==null || page.isFinishing() || page.isDestroyed() || pages.get(page)!=list) return;
                    Map<Long,JSONObject> lookup=new HashMap<>();
                    list.removeIf(row->row.getRjNumber()<0);
                    for(int i=0;i<saved.length();i++) {
                        JSONObject row=saved.optJSONObject(i); if(row==null || row.optLong("id")>=0) continue;
                        long id=row.optLong("id"); lookup.put(id,row);
                        list.add(new LocalWorkHistory(id,row.optLong("time"),row.optString("cover"),row.optString("title")));
                    }
                    records.put(page,lookup); list.sort((a,b)->Long.compare(b.getPosition(),a.getPosition()));
                    View view=page.findViewById(page.getResources().getIdentifier("mainRecycler","id",page.getPackageName()));
                    if(view instanceof RecyclerView) {
                        RecyclerView.Adapter adapter=((RecyclerView)view).getAdapter(); if(adapter!=null) adapter.notifyDataSetChanged();
                    }
                });
            } catch(Exception e) { Log.w("LocalHistory","Cannot load local listening history",e); }
        });
    }
    private static JSONObject record(Activity page,LocalWorkHistory item) {
        Map<Long,JSONObject> lookup=records.get(page); return lookup==null?null:lookup.get(item.getRjNumber());
    }
    private static void text(View root,String id,String text) {
        View v=root.findViewById(root.getResources().getIdentifier(id,"id",root.getContext().getPackageName()));
        if(v instanceof TextView) ((TextView)v).setText(text);
        if(v instanceof TextView && id.equals("tvRJ")) {
            ((TextView)v).setMaxLines(2); ((TextView)v).setEllipsize(TextUtils.TruncateAt.END);
        }
    }
    static String time(long milliseconds) {
        long seconds=Math.max(0,milliseconds)/1000;
        return String.format(Locale.ROOT,"%02d:%02d:%02d",seconds/3600,(seconds/60)%60,seconds%60);
    }
    public static boolean bind(Activity page,View row,LocalWorkHistory item) {
        JSONObject record=record(page,item); if(record==null) return false;
        text(row,"tvTitle",record.optString("title"));
        text(row,"tvRJ","\u672c\u5730 \u00b7 "+record.optString("track"));
        text(row,"tvDate",DateFormat.format("yyyy-MM-dd HH:mm:ss",record.optLong("time"))+"  \u00b7 "+time(record.optLong("seek")));
        View image=row.findViewById(row.getResources().getIdentifier("ivCover","id",page.getPackageName()));
        if(image instanceof ImageView) LocalArt.show(page,(ImageView)image,record.optString("cover"),
                new JSONArray().put(record.optString("audio")),android.R.drawable.ic_menu_gallery);
        row.setOnClickListener(v->open(page,item)); return true;
    }
    public static boolean open(Activity page,LocalWorkHistory item) {
        if(item.getRjNumber()>=0) return false;
        JSONObject record=record(page,item); if(record==null) return true;
        Intent intent=new Intent(page,LocalLibraryActivity.class);
        intent.putExtra("source",record.optString("source")).putExtra("parent",record.optString("parent"))
                .putExtra("resume_uri",record.optString("audio")).putExtra("resume_seek",record.optLong("seek"));
        page.startActivity(intent); return true;
    }
}
