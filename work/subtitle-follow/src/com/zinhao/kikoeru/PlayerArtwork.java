package com.zinhao.kikoeru;

import android.content.Context;
import android.content.ContextWrapper;
import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.widget.ImageView;
import androidx.palette.graphics.Palette;
import com.bumptech.glide.Glide;
import com.bumptech.glide.request.RequestOptions;
import org.json.JSONArray;
import org.json.JSONObject;

/** Local artwork is resolved lazily even for a restored, paused queue. */
public final class PlayerArtwork {
    static void ready(ImageView image,Drawable drawable) {
        Context context=image.getContext();
        while(context instanceof ContextWrapper && !(context instanceof Activity)) {
            Context base=((ContextWrapper)context).getBaseContext(); if(base==context) break; context=base;
        }
        if(!(context instanceof Activity) || !context.getClass().getName().equals("com.zinhao.kikoeru.AudioPlayerActivity")
                || !(drawable instanceof BitmapDrawable)) return;
        Activity activity=(Activity)context;
        Palette.from(((BitmapDrawable)drawable).getBitmap()).generate(palette-> {
            if(palette==null || activity.isFinishing() || activity.isDestroyed() || image.getDrawable()!=drawable) return;
            int fallback=activity.getResources().getIdentifier("main_color","color",activity.getPackageName());
            int color=palette.getDarkMutedColor(fallback==0?0xff24212d:activity.getColor(fallback));
            View root=activity.findViewById(activity.getResources().getIdentifier("root","id",activity.getPackageName()));
            if(root!=null) root.setBackgroundColor(color);
            activity.getWindow().setStatusBarColor(color); activity.getWindow().setNavigationBarColor(color);
        });
    }
    public static boolean bindLocal(Context context,ImageView image,long album) {
        JSONObject track=LocalPlayback.artworkTrack(album);
        if(track==null || image==null) return false;
        bindTrack(context,image,track); return true;
    }
    public static void bindTrack(Context context,ImageView image,JSONObject track) {
        int placeholder=context.getResources().getIdentifier("ic_no_cover","drawable",context.getPackageName());
        if(BaiduCloud.cloud(track)) {
            BaiduCloud.showTrackCover(context,image,track,placeholder);
        } else if(track!=null && track.optBoolean("local_import")) {
            BaiduCloud.cancelCover(image);
            LocalArt.show(context,image,localCover(track),candidates(track),placeholder);
        } else {
            BaiduCloud.cancelCover(image);
            // Invalidate any outstanding local extraction before recycling into a remote row.
            LocalArt.cancel(context,image);
            long album=track==null?0:track.optLong("workId");
            Glide.with(context.getApplicationContext()).load(album>0?Api.minCoverImageUrl(album):null)
                    .apply(new RequestOptions().placeholder(placeholder).error(placeholder).centerCrop()).into(image);
        }
    }
    static String localCover(JSONObject track) {
        String cover=track.optString("local_cover");
        return cover.endsWith("/audio.png")?"":cover;
    }
    static JSONArray candidates(JSONObject track) {
        JSONArray result=new JSONArray(); String audio=track.optString("mediaStreamUrl");
        if(!audio.isEmpty()) result.put(audio); return result;
    }
}
