package com.zinhao.kikoeru;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.charset.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONObject;

/** Local-only hooks; network tracks continue through the original implementation. */
public final class LocalPlayback {
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static volatile JSONObject current;
    private static volatile String fallback="";
    private static long subtitleGeneration;
    public static void note(Context c, JSONObject track) {
        current=track;
        if(track!=null && (track.optBoolean("local_import") || BaiduCloud.cloud(track)) && fallback.isEmpty()) {
            try {
                File folder=new File(c.getFilesDir(),"local-covers"); folder.mkdirs();
                File file=new File(folder,"audio.png");
                if(!file.exists()) {
                    int id=c.getResources().getIdentifier("ic_baseline_audiotrack_24","drawable",c.getPackageName());
                    Drawable icon=c.getDrawable(id);
                    Bitmap bitmap=Bitmap.createBitmap(256,256,Bitmap.Config.ARGB_8888);
                    Canvas canvas=new Canvas(bitmap); canvas.drawColor(0xff24212d);
                    icon.setTint(0xffaab3c2); icon.setBounds(64,64,192,192); icon.draw(canvas);
                    try(OutputStream out=new FileOutputStream(file)) { bitmap.compress(Bitmap.CompressFormat.PNG,100,out); }
                    bitmap.recycle();
                }
                fallback=Uri.fromFile(file).toString();
            } catch(Exception e) { Log.w("LocalPlayback","Cannot create default cover",e); }
        }
    }
    public static String coverUrl(long workId) {
        JSONObject track=current;
        if(track==null || (!track.optBoolean("local_import") && !BaiduCloud.cloud(track)) || track.optLong("workId")!=workId) return fallback;
        String cover=track.optString("local_cover");
        if(cover.startsWith("file:") && !new File(Uri.parse(cover).getPath()).exists()) return fallback;
        return cover.isEmpty()?fallback:cover;
    }
    public static String coverRequest(String path) {
        if(!path.startsWith("/api/cover/-")) return null;
        try { return coverUrl(Long.parseLong(path.substring("/api/cover/".length()))); }
        catch(Exception e) { return fallback; }
    }
    static void prepareCover(Context c, JSONObject track) {
        if(!track.optString("local_cover").isEmpty()) return;
        try {
            String cover=LocalArt.extract(c,track.getString("mediaStreamUrl"));
            if(!cover.isEmpty()) track.put("local_cover",cover);
        } catch(Exception e) { Log.d("LocalPlayback","No embedded cover"); }
    }
    static String decode(byte[] bytes) throws Exception {
        if(bytes.length>=2 && bytes[0]==(byte)0xff && bytes[1]==(byte)0xfe)
            return new String(bytes,2,bytes.length-2,StandardCharsets.UTF_16LE);
        if(bytes.length>=2 && bytes[0]==(byte)0xfe && bytes[1]==(byte)0xff)
            return new String(bytes,2,bytes.length-2,StandardCharsets.UTF_16BE);
        String text;
        try {
            text=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(bytes)).toString();
        } catch(CharacterCodingException e) { text=new String(bytes,Charset.forName("GB18030")); }
        return text.startsWith("\ufeff")?text.substring(1):text;
    }
    public static boolean loadSubtitle(Context c, AudioService.CtrlBinder binder) {
        long generation=++subtitleGeneration;
        JSONObject track=binder.getCurrent();
        note(c,track);
        boolean cloud=BaiduCloud.cloud(track);
        if(track==null || (!track.optBoolean("local_import") && !cloud)) return false;
        binder.setLocalLrc("");
        String uri=track.optString(cloud?"cloud_subtitle":"local_subtitle");
        if(uri.isEmpty()) return true;
        Context context=c.getApplicationContext();
        IO.execute(()-> {
            String result="";
            try {
                if(cloud) result=decode(BaiduCloud.smallFile(context,track.optString("cloud_owner"),uri,4*1024*1024));
                else try(InputStream in=context.getContentResolver().openInputStream(Uri.parse(uri))) { result=decode(LocalDocuments.read(in,4*1024*1024)); }
                result=result.replace("\r\n","\n").replace('\r','\n');
            } catch(Exception e) { Log.w("LocalPlayback","Cannot read local subtitle",e); }
            final String text=result;
            MAIN.post(()-> {
                if(generation!=subtitleGeneration || binder.getCurrent()!=track) return;
                binder.setLocalLrc(text);
            });
        });
        return true;
    }
    static JSONObject artworkTrack(long album) {
        JSONObject track=current;
        return track!=null && (track.optBoolean("local_import") || BaiduCloud.cloud(track)) && track.optLong("workId")==album?track:null;
    }
    public static boolean ignoreNetworkSubtitle(AudioService.CtrlBinder binder) {
        JSONObject track=binder.getCurrent();
        return track!=null && (track.optBoolean("local_import") || BaiduCloud.cloud(track));
    }
}
