package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.*;
import com.google.android.exoplayer2.Player;
import org.json.JSONObject;

/** The existing 68dp dock, connected to the existing player rather than a second queue. */
public final class MiniPlayer implements Player.Listener {
    private final Activity activity;
    public final View view;
    private final ImageView cover;
    private final TextView title,subtitle;
    private final ImageButton play,lyrics;
    private AudioService.CtrlBinder binder;
    private boolean active;
    private String artworkKey="";
    private final int ink,secondary;
    public MiniPlayer(Activity activity) {
        this.activity=activity;
        view=activity.getLayoutInflater().inflate(id("layout_current_play","layout"),null,false);
        cover=view.findViewById(id("imageView","id")); title=view.findViewById(id("textView","id"));
        subtitle=view.findViewById(id("textView2","id")); play=view.findViewById(id("button","id"));
        lyrics=view.findViewById(id("imageButton","id"));
        int bar=ThemePalettes.color(ThemePalettes.selected(activity),3);
        ink=ThemePalettes.text(bar); secondary=ThemePalettes.secondary(bar);
        GradientDrawable background=new GradientDrawable(); background.setColor(bar);
        float radius=8*activity.getResources().getDisplayMetrics().density;
        background.setCornerRadii(new float[]{radius,radius,radius,radius,0,0,0,0}); view.setBackground(background);
        title.setTextColor(ink); subtitle.setTextColor(secondary);
        play.setImageTintList(ColorStateList.valueOf(ink)); lyrics.setImageTintList(ColorStateList.valueOf(secondary));
        view.setVisibility(View.GONE); view.setOnClickListener(v->PlayerNavigation.openPlayer(activity));
        play.setOnClickListener(v-> {
            if(binder==null) return;
            if(binder.getExoPlayer().isPlaying()) binder.getExoPlayer().pause(); else binder.getExoPlayer().play();
        });
        lyrics.setOnClickListener(v-> {
            if(binder==null) return;
            if(binder.isLrcWindowShow()) binder.hideLrcFloatWindow(); else binder.showLrcFloatWindow();
        });
    }
    private int id(String name,String type) { return activity.getResources().getIdentifier(name,type,activity.getPackageName()); }
    public void attach(AudioService.CtrlBinder next) {
        if(binder==next) { render(); return; }
        if(binder!=null && active) binder.getExoPlayer().removeListener(this);
        binder=next; artworkKey="";
        if(binder!=null && active) binder.getExoPlayer().addListener(this);
        render();
    }
    public void active(boolean value) {
        if(active==value) return;
        active=value;
        if(binder!=null) {
            if(active) binder.getExoPlayer().addListener(this); else binder.getExoPlayer().removeListener(this);
        }
        if(active) { artworkKey=""; render(); }
    }
    public void dispose() {
        active(false); binder=null; LocalArt.cancel(activity,cover);
    }
    public void render() {
        if(activity.isFinishing() || activity.isDestroyed()) return;
        JSONObject track=binder==null?null:binder.getCurrent();
        view.setVisibility(track==null?View.GONE:View.VISIBLE);
        if(track==null) { artworkKey=""; LocalArt.cancel(activity,cover); return; }
        title.setText(track.optString("title")); subtitle.setText(track.optString("workTitle"));
        boolean playing=binder.getExoPlayer().isPlaying();
        play.setImageResource(id(playing?"ic_baseline_pause_white_24":"ic_baseline_play_arrow_white_24","drawable"));
        play.setContentDescription(playing?"\u6682\u505c":"\u64ad\u653e");
        String key=PlayerNavigation.identity(track)+"\n"+track.optString("local_cover");
        if(!key.equals(artworkKey)) { artworkKey=key; PlayerArtwork.bindTrack(activity,cover,track); }
    }
    @Override public void onEvents(Player player,Player.Events events) {
        if(active) activity.runOnUiThread(()->render());
    }
}
