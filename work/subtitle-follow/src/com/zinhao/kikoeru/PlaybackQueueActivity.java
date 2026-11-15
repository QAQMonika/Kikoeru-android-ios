package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.*;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.text.TextUtils;
import android.view.*;
import android.widget.*;
import com.google.android.exoplayer2.Player;
import java.util.*;
import org.json.JSONObject;

public final class PlaybackQueueActivity extends Activity implements ServiceConnection,Player.Listener {
    private AudioService.CtrlBinder binder;
    private boolean bound,active,positioned;
    private List<JSONObject> queue=Collections.emptyList();
    private ListView list;
    private TextView count,empty;
    private int page,card,ink,muted,accent;
    private MiniPlayer mini;
    private int dp(int n) { return Math.round(n*getResources().getDisplayMetrics().density); }
    private TextView label(String value,float size,int color) {
        TextView text=new TextView(this); text.setText(value); text.setTextSize(size); text.setTextColor(color); return text;
    }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        int selected=ThemePalettes.selected(this);
        page=ThemePalettes.color(selected,1); card=ThemePalettes.color(selected,2);
        ink=ThemePalettes.text(page); muted=ThemePalettes.secondary(page);
        accent=GlassUi.RED;
        LinearLayout dock=new LinearLayout(this); dock.setOrientation(LinearLayout.VERTICAL);
        LinearLayout root=new LinearLayout(this); root.setOrientation(LinearLayout.VERTICAL); root.setBackgroundColor(page);
        root.setOnApplyWindowInsetsListener((v,insets)-> {
            v.setPadding(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),insets.getSystemWindowInsetRight(),0);
            dock.setPadding(dp(12),0,dp(12),dp(8)+insets.getSystemWindowInsetBottom()); return insets;
        });
        FrameLayout header=new FrameLayout(this); header.setBackgroundColor(page);
        View back=GlassUi.iosBackButton(this,accent,()-> { finish(); overridePendingTransition(0,0); });
        header.addView(back,new FrameLayout.LayoutParams(-2,dp(48),Gravity.START|Gravity.CENTER_VERTICAL));
        TextView heading=label("\u64ad\u653e\u5217\u8868",17.5f,ink); heading.setTypeface(GlassUi.boldFont());
        heading.setGravity(Gravity.CENTER);
        header.addView(heading,new FrameLayout.LayoutParams(-2,-2,Gravity.CENTER));
        count=label("",13f,muted); count.setTypeface(GlassUi.mediumFont()); count.setPadding(dp(12),0,dp(16),0);
        header.addView(count,new FrameLayout.LayoutParams(-2,-2,Gravity.END|Gravity.CENTER_VERTICAL));
        root.addView(header,new LinearLayout.LayoutParams(-1,dp(48)));
        View hairline=new View(this);
        hairline.setBackgroundColor(ThemePalettes.light(page)?0x223c3c43:0x2e545458);
        root.addView(hairline,new LinearLayout.LayoutParams(-1,Math.max(1,dp(1))));

        FrameLayout stage=new FrameLayout(this);
        FrameLayout body=new FrameLayout(this);
        list=new ListView(this); list.setDivider(null); list.setClipToPadding(false);
        list.setPadding(0,dp(10),0,dp(92));
        GlassUi.attachIosBounce(list);
        list.setAdapter(adapter);
        body.addView(list,new FrameLayout.LayoutParams(-1,-1));
        empty=label("\u6682\u65e0\u64ad\u653e\u5185\u5bb9",16f,muted); empty.setGravity(Gravity.CENTER);
        body.addView(empty,new FrameLayout.LayoutParams(-1,-1));
        stage.addView(body,new FrameLayout.LayoutParams(-1,-1));
        mini=new MiniPlayer(this);
        AppShell.styleMini(this,mini.view,body);
        dock.addView(mini.view,new LinearLayout.LayoutParams(-1,dp(66)));
        stage.addView(dock,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));
        root.addView(stage,new LinearLayout.LayoutParams(-1,0,1));
        list.setOnItemClickListener((parent,view,position,id)-> {
            try {
                GlassUi.hapticTick(view);
                if(PlayerNavigation.select(binder,queue,position)) PlayerNavigation.openPlayer(this);
                else { refresh(); GlassUi.toast(this,"\u64ad\u653e\u5217\u8868\u5df2\u66f4\u65b0\uff0c\u8bf7\u91cd\u65b0\u9009\u62e9"); }
            } catch(Exception e) { GlassUi.toast(this,"\u65e0\u6cd5\u6253\u5f00\u97f3\u8f68"); }
        });
        setContentView(root);
        GlassUi.installIosPage(this);
        ThemePalettes.systemBars(getWindow(),page,page,page); root.requestApplyInsets();
        bound=bindService(new Intent(this,AudioService.class),this,BIND_AUTO_CREATE);
    }
    private final BaseAdapter adapter=new BaseAdapter() {
        public int getCount() { return queue.size(); }
        public Object getItem(int position) { return queue.get(position); }
        public long getItemId(int position) { return position; }
        public View getView(int position,View old,ViewGroup owner) {
            LinearLayout row;
            if(old instanceof LinearLayout) row=(LinearLayout)old; else {
                row=new LinearLayout(PlaybackQueueActivity.this); row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(26),dp(10),dp(28),dp(10));
                TextView number=label("",13f,muted); number.setGravity(Gravity.CENTER); row.addView(number,new LinearLayout.LayoutParams(dp(28),dp(48)));
                ImageView cover=new ImageView(PlaybackQueueActivity.this); cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
                GradientDrawable clipShape=new GradientDrawable(); clipShape.setCornerRadius(dp(8));
                cover.setBackground(clipShape); cover.setClipToOutline(true);
                LinearLayout.LayoutParams art=new LinearLayout.LayoutParams(dp(44),dp(44)); art.setMargins(dp(4),0,dp(12),0); row.addView(cover,art);
                LinearLayout words=new LinearLayout(PlaybackQueueActivity.this); words.setOrientation(1);
                TextView title=label("",15.5f,ThemePalettes.text(card)); title.setMaxLines(2); title.setEllipsize(TextUtils.TruncateAt.END); words.addView(title);
                TextView work=label("",12.5f,ThemePalettes.secondary(card)); work.setSingleLine(); work.setEllipsize(TextUtils.TruncateAt.END); words.addView(work);
                row.addView(words,new LinearLayout.LayoutParams(0,-2,1));
            }
            JSONObject track=queue.get(position); boolean current=binder!=null && binder.getExoPlayer().getCurrentMediaItemIndex()==position;
            row.setBackground(GlassUi.iosGroupedRow(PlaybackQueueActivity.this,card,position,queue.size(),14,72,0));
            ((TextView)row.getChildAt(0)).setText(String.valueOf(position+1));
            ((TextView)row.getChildAt(0)).setTextColor(current?accent:ThemePalettes.secondary(card));
            ((TextView)row.getChildAt(0)).setTypeface(current?GlassUi.boldFont():Typeface.DEFAULT);
            PlayerArtwork.bindTrack(PlaybackQueueActivity.this,(ImageView)row.getChildAt(1),track);
            LinearLayout words=(LinearLayout)row.getChildAt(2); TextView title=(TextView)words.getChildAt(0);
            title.setText(track.optString("title")); title.setTextColor(current?accent:ThemePalettes.text(card));
            title.setTypeface(current?GlassUi.boldFont():Typeface.DEFAULT);
            ((TextView)words.getChildAt(1)).setText(track.optString("workTitle")); return row;
        }
    };
    private void refresh() {
        if(isFinishing() || isDestroyed()) return;
        queue=PlayerNavigation.snapshot(binder); count.setText(queue.size()+" \u9996");
        empty.setVisibility(queue.isEmpty()?View.VISIBLE:View.GONE); adapter.notifyDataSetChanged();
        if(!positioned && !queue.isEmpty()) { positioned=true; list.setSelection(Math.max(0,binder.getExoPlayer().getCurrentMediaItemIndex())); }
    }
    public void onServiceConnected(ComponentName name,IBinder service) {
        binder=(AudioService.CtrlBinder)service; if(active) binder.getExoPlayer().addListener(this); mini.attach(binder); refresh();
    }
    public void onServiceDisconnected(ComponentName name) { if(binder!=null) binder.getExoPlayer().removeListener(this); binder=null; mini.attach(null); refresh(); }
    @Override public void onEvents(Player player,Player.Events events) { if(active) runOnUiThread(()->refresh()); }
    @Override protected void onStart() { super.onStart(); active=true; if(binder!=null) binder.getExoPlayer().addListener(this); mini.active(true); refresh(); }
    @Override protected void onStop() { active=false; if(binder!=null) binder.getExoPlayer().removeListener(this); mini.active(false); super.onStop(); }
    @Override protected void onDestroy() { mini.dispose(); if(binder!=null) binder.getExoPlayer().removeListener(this); if(bound) unbindService(this); super.onDestroy(); }
}
