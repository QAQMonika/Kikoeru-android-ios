package com.zinhao.kikoeru;

import android.app.*;
import android.content.*;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.*;
import android.net.Uri;
import android.os.*;
import android.text.*;
import android.text.method.PasswordTransformationMethod;
import android.view.*;
import android.widget.*;
import java.util.*;
import org.json.*;

/** Personal cloud browser. No embedded server, upload, delete or third-party authorization relay. */
public final class BaiduCloudController extends ContextWrapper implements ServiceConnection {
    private final Activity host;
    private final boolean embedded;
    private Intent launchIntent;
    private View view;
    private int bottomInset;
    private final Handler main=new Handler(Looper.getMainLooper());
    private JSONObject session=new JSONObject(),device;
    private JSONArray entries=new JSONArray();
    private final List<JSONObject> visible=new ArrayList<>();
    private String owner="",path="",rootPath="",pendingResumeCloudId="";
    private JSONObject currentLastPlayed;
    private int page,card,bar,next,loadGeneration,authGeneration,paletteIndex;
    private boolean loading,bound,favorites,more,authorizing,liquidState;
    private TextView title,status,empty;
    private EditText search;
    private GridView grid;
    private ListView list;
    private Button action,loadMore;
    private ImageButton favoriteTab,folderBack;
    private LinearLayout dock,headerBar,detailHeader;
    private FrameLayout detailContainer;
    private GlassUi.Navigation navigation;
    private MiniPlayer mini;
    private AudioService.CtrlBinder binder;
    private AlertDialog authDialog;
    BaiduCloudController(Activity activity,boolean embedded) {
        super(activity); host=activity; this.embedded=embedded;
        launchIntent=embedded?new Intent():activity.getIntent();
    }
    private Intent getIntent() { return launchIntent; }
    private boolean isFinishing() { return host.isFinishing(); }
    private boolean isDestroyed() { return host.isDestroyed(); }
    View view() { return view; }
    void create(Bundle state) {
        int palette=ThemePalettes.selected(this); paletteIndex=palette; liquidState=PlaybackOptions.liquidGlass(this); page=ThemePalettes.color(palette,1); card=ThemePalettes.color(palette,2); bar=ThemePalettes.color(palette,3);
        if(state!=null) { path=state.getString("cloud_path",""); favorites=state.getBoolean("cloud_favorites",false); }
        else favorites=getIntent().getIntExtra(AppShell.EXTRA_TAB,0)==1;
        build();
        bound=bindService(new Intent(this,AudioService.class),this,BIND_AUTO_CREATE);
        BaiduCloud.IO.execute(()-> {
            try { JSONObject loaded=BaiduCloud.api(this).state(); ui(()->connected(loaded,state==null)); }
            catch(Exception e) { ui(()->error(e)); }
        });
    }
    private int dp(int value) { return Math.round(value*getResources().getDisplayMetrics().density); }
    private int ink() { return ThemePalettes.text(page); }
    private int muted() { return ThemePalettes.secondary(page); }
    private int accent() { return GlassUi.RED; }
    private int icon(String name) { return getResources().getIdentifier(name,"drawable",getPackageName()); }
    private TextView label(String value,int size,int color) { TextView view=new TextView(this); view.setText(value); view.setTextSize(size); view.setTextColor(color); return view; }
    private GradientDrawable shape(int color) {
        GradientDrawable value=new GradientDrawable(); value.setColor(color); value.setCornerRadius(dp(12));
        value.setStroke(Math.max(1,dp(1)),ThemePalettes.light(color)?0x18202731:0x1affffff);
        return value;
    }
    private ImageButton button(String resource,String text,View.OnClickListener click) {
        ImageButton view=new ImageButton(this);
        Drawable sf=GlassUi.sfDrawable(this,resource);
        if(sf!=null) view.setImageDrawable(sf); else view.setImageResource(icon(resource));
        view.setImageTintList(ColorStateList.valueOf(accent()));
        view.setPadding(dp(10),dp(10),dp(10),dp(10)); view.setBackground(null);
        GlassUi.attachIosPress(view,0.90f);
        view.setContentDescription(text); view.setTooltipText(text); view.setOnClickListener(v-> {
            GlassUi.hapticTick(v); click.onClick(v);
        }); return view;
    }
    private void build() {
        LinearLayout container=new LinearLayout(this); container.setOrientation(1); container.setBackgroundColor(page);
        if(!embedded) container.setOnApplyWindowInsetsListener((view,insets)-> {
            view.setPadding(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),insets.getSystemWindowInsetRight(),0);
            dock.setPadding(0,0,0,dp(6)+insets.getSystemWindowInsetBottom()); return insets;
        });
        LinearLayout toolbar=new LinearLayout(this); toolbar.setGravity(Gravity.CENTER_VERTICAL); toolbar.setPadding(dp(8),0,dp(8),0);
        headerBar=toolbar;
        int btnSize=embedded?dp(42):dp(48), barHeight=embedded?dp(42):dp(56);
        folderBack=button("ic_arrow_back_black_24","\u8fd4\u56de",v->back());
        if(embedded) folderBack.setVisibility(View.GONE);
        toolbar.addView(folderBack,new LinearLayout.LayoutParams(btnSize,barHeight));
        title=label("\u767e\u5ea6\u7f51\u76d8",embedded?15:18,ink()); title.setSingleLine(); title.setEllipsize(TextUtils.TruncateAt.END); title.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
        status=label("\u6b63\u5728\u8bfb\u53d6\u8fde\u63a5\u914d\u7f6e",12,muted()); status.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        if(embedded) {
            title.setPadding(dp(4),0,dp(6),0);
            title.setVisibility(View.GONE);
            toolbar.addView(title,new LinearLayout.LayoutParams(-2,-2));
            status.setSingleLine();
            status.setPadding(dp(8),0,dp(8),0);
            toolbar.addView(status,new LinearLayout.LayoutParams(0,-2,1));
        } else {
            toolbar.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        }
        ImageButton searchButton=button("ic_baseline_search_24","\u641c\u7d22",v->toggleSearch());
        searchButton.setVisibility(View.GONE); toolbar.addView(searchButton,new LinearLayout.LayoutParams(btnSize,barHeight));
        toolbar.addView(button("ic_baseline_loop_24","\u5237\u65b0",v-> { if(!owner.isEmpty()) load(path,false); }),new LinearLayout.LayoutParams(btnSize,barHeight));
        toolbar.addView(button("ic_baseline_more_horiz_24","\u66f4\u591a",v->menu()),new LinearLayout.LayoutParams(btnSize,barHeight)); container.addView(toolbar);
        if(!embedded) {
            GlassUi.Sources sources=AppShell.sources(host,2);
            sources.setNavigationAllowed(()->!authorizing);
            LinearLayout.LayoutParams sourcesLp=new LinearLayout.LayoutParams(-1,dp(44));
            sourcesLp.setMargins(dp(12),0,dp(12),dp(4)); container.addView(sources,sourcesLp);
        }
        search=new EditText(this); search.setSingleLine(); search.setTextSize(15); search.setTextColor(ink()); search.setHintTextColor(muted()); search.setHint("\u641c\u7d22\u5f53\u524d\u76ee\u5f55");
        search.setBackground(GlassUi.searchFieldBackground(this,card)); search.setPadding(dp(26),dp(6),dp(26),dp(6)); search.setVisibility(View.GONE); search.setSaveEnabled(false);
        search.addTextChangedListener(new TextWatcher() { public void beforeTextChanged(CharSequence s,int a,int c,int f) {} public void onTextChanged(CharSequence s,int a,int b,int c) { rows(); } public void afterTextChanged(Editable e) {} });
        container.addView(search,new LinearLayout.LayoutParams(-1,dp(46)));
        if(!embedded) {
            status.setMaxLines(2); status.setPadding(dp(16),dp(8),dp(16),dp(8)); container.addView(status);
        }
        FrameLayout body=new FrameLayout(this); grid=new GridView(this); grid.setNumColumns(2); grid.setHorizontalSpacing(dp(8)); grid.setVerticalSpacing(dp(10)); grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH);
        grid.setPadding(dp(10),dp(6),dp(10),dp(10)); grid.setClipToPadding(false); grid.setAdapter(albums); body.addView(grid,new FrameLayout.LayoutParams(-1,-1));
        list=new ListView(this); list.setDivider(null); list.setPadding(dp(10),0,dp(10),dp(8)); list.setClipToPadding(false);
        detailContainer=new FrameLayout(this);
        detailHeader=GlassUi.buildWorkDetailHeader(this);
        detailHeader.setVisibility(View.GONE);
        detailContainer.addView(detailHeader,new FrameLayout.LayoutParams(-1,-2));
        list.addHeaderView(detailContainer,null,false);
        list.setAdapter(files); body.addView(list,new FrameLayout.LayoutParams(-1,-1));
        LinearLayout blank=new LinearLayout(this); blank.setOrientation(1); blank.setGravity(Gravity.CENTER); blank.setPadding(dp(24),0,dp(24),0);
        empty=label("",15,muted()); empty.setGravity(Gravity.CENTER); blank.addView(empty,new LinearLayout.LayoutParams(-1,-2));
        action=new Button(this); action.setText("\u914d\u7f6e\u5e94\u7528"); action.setTextColor(0xffffffff); action.setAllCaps(false);
        action.setTypeface(Typeface.create("sans-serif-medium",Typeface.BOLD)); action.setPadding(dp(24),0,dp(24),0);
        action.setBackground(GlassUi.iosPressable(this,accent(),22,0,0,0));
        GlassUi.attachIosPress(action,0.95f);
        LinearLayout.LayoutParams ap=new LinearLayout.LayoutParams(-2,dp(48)); ap.topMargin=dp(16); blank.addView(action,ap); body.addView(blank,new FrameLayout.LayoutParams(-1,-1));
        action.setOnClickListener(v-> { if(owner.isEmpty()) { if(!session.optBoolean("configured")) configuration(); else authorize(); } else if(rootPath.isEmpty()) chooseRoot(); else load(path,false); });
        empty.setTag(blank);
        FrameLayout stage=new FrameLayout(this); stage.addView(body,new FrameLayout.LayoutParams(-1,-1));
        loadMore=new Button(this); loadMore.setText("\u52a0\u8f7d\u66f4\u591a"); loadMore.setTextColor(ink()); loadMore.setBackgroundColor(page); loadMore.setOnClickListener(v->load(path,true));
        stage.addView(loadMore,new FrameLayout.LayoutParams(-1,dp(48),Gravity.BOTTOM));
        favoriteTab=button("ic_baseline_favorite_24","\u4e91\u7aef\u6536\u85cf",v->showFavorites());
        if(!embedded) {
            mini=new MiniPlayer(host);
            ImageButton works=button("ic_baseline_widgets_24","\u4e91\u7aef\u4f5c\u54c1",v->showWorks());
            ImageButton moreButton=button("ic_baseline_more_horiz_24","\u66f4\u591a",v->menu());
            navigation=AppShell.navigation(host,body,works,favoriteTab,moreButton,2,
                    ()->searchButton.performClick(),favorites?1:0);
            dock=AppShell.dock(host,body,mini.view,navigation);
            stage.addView(dock,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));
            dock.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,orr,ob)->updateDockSpacing());
        }
        container.addView(stage,new LinearLayout.LayoutParams(-1,0,1));
        grid.setOnItemClickListener((a,v,p,id)->open(visible.get(p)));
        list.setOnItemClickListener((a,v,p,id)-> {
            int idx=p-list.getHeaderViewsCount();
            if(idx>=0 && idx<visible.size()) open(visible.get(idx));
        });
        AdapterView.OnItemLongClickListener longClick=(a,v,p,id)-> {
            int idx=a==list?p-list.getHeaderViewsCount():p;
            if(idx<0 || idx>=visible.size()) return true;
            JSONObject row=visible.get(idx);
            if(row.optInt("isdir")==1) cloudRowMenu(row);
            return true;
        };
        grid.setOnItemLongClickListener(longClick); list.setOnItemLongClickListener(longClick);
        view=container; rows();
    }
    void toggleSearch() {
        search.setVisibility(search.getVisibility()==View.VISIBLE?View.GONE:View.VISIBLE);
        if(search.getVisibility()==View.GONE) search.setText(""); else search.requestFocus();
    }
    boolean canSwitch() { return !authorizing; }
    boolean isFavorite() { return favorites; }
    void requestTab(boolean value) {
        if(authorizing) return;
        if(owner.isEmpty()) { favorites=value; rows(); }
        else if(value) showFavorites(); else showWorks();
    }
    void setBottomInset(int inset) { bottomInset=Math.max(0,inset); updateDockSpacing(); }
    void refreshPalette() {
        int n=ThemePalettes.selected(this);
        boolean nextLiquid=PlaybackOptions.liquidGlass(this);
        if(n==paletteIndex && nextLiquid==liquidState) return;
        android.os.Parcelable oldList=list.onSaveInstanceState(), oldGrid=grid.onSaveInstanceState();
        paletteIndex=n; liquidState=nextLiquid;
        page=ThemePalettes.color(n,1); card=ThemePalettes.color(n,2); bar=ThemePalettes.color(n,3);
        view.setBackgroundColor(page); headerBar.setBackgroundColor(page); title.setTextColor(ink());
        status.setTextColor(muted()); empty.setTextColor(muted()); search.setTextColor(ink());
        search.setHintTextColor(muted()); search.setBackground(GlassUi.searchFieldBackground(this,card));
        for(int i=0;i<headerBar.getChildCount();i++) if(headerBar.getChildAt(i) instanceof ImageButton)
            ((ImageButton)headerBar.getChildAt(i)).setImageTintList(ColorStateList.valueOf(accent()));
        action.setTextColor(0xffffffff); action.setBackground(GlassUi.iosPressable(this,accent(),22,0,0,0));
        loadMore.setTextColor(ink()); loadMore.setBackgroundColor(page);
        list.setAdapter(files); grid.setAdapter(albums);
        if(oldList!=null) list.onRestoreInstanceState(oldList);
        if(oldGrid!=null) grid.onRestoreInstanceState(oldGrid);
        rows();
    }
    void showWorks() {
        if(rootPath.isEmpty()) { chooseRoot(); return; }
        if(!favorites && rootPath.equals(path)) return;
        favorites=false; load(rootPath,false);
    }
    void showFavorites() {
        if(rootPath.isEmpty()) { chooseRoot(); return; }
        favorites=true; ++loadGeneration; loading=false; rows();
    }
    private void updateDockSpacing() {
        if(loadMore==null) return;
        int dockHeight=embedded?bottomInset:(dock==null?0:dock.getHeight());
        FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)loadMore.getLayoutParams();
        if(lp.bottomMargin!=dockHeight) { lp.bottomMargin=dockHeight; loadMore.setLayoutParams(lp); }
        int bottom=dockHeight+dp(10)+(loadMore.getVisibility()==View.VISIBLE?dp(48):0);
        if(list.getPaddingBottom()!=bottom) list.setPadding(dp(10),0,dp(10),bottom);
        if(grid.getPaddingBottom()!=bottom) grid.setPadding(dp(10),dp(6),dp(10),bottom);
    }
    private void connected(JSONObject state,boolean initial) {
        session=state; owner=state.optString("owner");
        if(owner.isEmpty()) { rootPath=""; path=""; entries=new JSONArray(); loading=false; more=false; rows(); return; }
        String saved=getSharedPreferences("baidu_library",0).getString("root:"+owner,"");
        try { rootPath=BaiduApi.libraryRoot(saved); } catch(Exception ignored) { rootPath=""; }
        if(rootPath.isEmpty()) { path=""; favorites=false; entries=new JSONArray(); loading=false; more=false; rows(); return; }
        if(initial) path=rootPath;
        else if(!BaiduApi.withinRoot(rootPath,path)) { path=rootPath; favorites=false; }
        if(favorites) { loading=false; rows(); } else load(path,false);
    }
    private void load(String destination,boolean append) {
        if(owner.isEmpty()) { rows(); return; }
        if(rootPath.isEmpty()) { rows(); return; }
        try { destination=BaiduApi.path(destination); } catch(Exception e) { error(e); return; }
        if(!BaiduApi.withinRoot(rootPath,destination)) { error(BaiduApi.failure("\u8bf7\u5728\u5df2\u9009\u62e9\u7684\u4f5c\u54c1\u76ee\u5f55\u5185\u6d4f\u89c8")); return; }
        if(append && loading) return;
        final String folder=destination,account=owner; final int offset=append?next:0,generation=++loadGeneration;
        favorites=false; path=destination; loading=true; if(!append) { entries=new JSONArray(); next=0; search.setText(""); } rows();
        BaiduCloud.IO.execute(()-> {
            try { JSONArray loaded=BaiduCloud.api(this).list(account,folder,offset,200);
                ui(()-> {
                    if(generation!=loadGeneration || !owner.equals(account)) return;
                    Set<String> seen=new HashSet<>(); for(int i=0;i<entries.length();i++) seen.add(entries.optJSONObject(i).optString("fs_id"));
                    for(int i=0;i<loaded.length();i++) { JSONObject row=loaded.optJSONObject(i); if(seen.add(row.optString("fs_id"))) entries.put(row); }
                    next=offset+loaded.length(); more=loaded.length()==200; loading=false; rows();
                });
            } catch(Exception e) { ui(()-> { if(generation==loadGeneration) { loading=false; rows(); error(e); } }); }
        });
    }
    private void rows() {
        if(empty==null) return; visible.clear(); String query=search.getText().toString().trim().toLowerCase(Locale.ROOT);
        JSONArray source=favorites?favoriteRows():entries; boolean audio=false, hasSub=false; int audioCount=0;
        for(int i=0;i<source.length();i++) { JSONObject row=source.optJSONObject(i); if(row==null) continue;
            if(!BaiduApi.withinRoot(rootPath,row.optString("path"))) continue;
            String name=row.optString("server_filename"), ext=LocalIndex.extension(name);
            if(ext.equals("lrc") || ext.equals("vtt")) hasSub=true;
            if(row.optInt("isdir")!=1 && !LocalIndex.audio(name)) continue;
            if(GlassUi.matchesRjQuery(this,name,query)) {
                visible.add(row);
                if(row.optInt("isdir")==0) { audio=true; audioCount++; }
            }
        }
        boolean inSubfolder=!path.isEmpty() && !path.equals(rootPath) && !favorites;
        title.setText(favorites?"\u4e91\u7aef\u6536\u85cf":path.equals(rootPath)?"\u767e\u5ea6\u7f51\u76d8":BaiduApi.name(path));
        title.setVisibility(ShellState.embeddedTitleVisible(embedded,inSubfolder)?View.VISIBLE:View.GONE);
        folderBack.setVisibility(ShellState.folderBackVisible(embedded,inSubfolder)?View.VISIBLE:View.GONE);
        status.setText(owner.isEmpty()?"\u672a\u8fde\u63a5":rootPath.isEmpty()?"\u8bf7\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55":(loading?"\u52a0\u8f7d\u4e2d\u2026  ":"")+path+"  "+visible.size()+" \u9879");
        if(inSubfolder && detailHeader!=null) {
            detailHeader.setVisibility(View.VISIBLE);
            String folderTitle=BaiduApi.name(path);
            final String currentPath=path;
            JSONObject firstTrack=null;
            for(JSONObject r:visible) if(r.optInt("isdir")==0) { firstTrack=r; break; }
            final JSONObject playFirst=firstTrack;
            String cloudCoverOrigin=BaiduCloud.coverSourceLabel(this,owner,path);
            currentLastPlayed=TrackResume.lastPlayedForCloudFolder(this,owner,path);
            JSONObject folderProgress=TrackResume.folderProgressCloud(this,owner,visible);
            final JSONObject resumeTarget=currentLastPlayed;
            ImageView headerCover=GlassUi.bindWorkDetailHeader(this,detailHeader,folderTitle,"\u767e\u5ea6\u7f51\u76d8||"+cloudCoverOrigin,
                    path,audioCount,hasSub,isCloudFavorite(path),card,
                    ()->{ try { favorite(new JSONObject().put("fs_id","0").put("path",currentPath).put("server_filename",folderTitle).put("isdir",1)); rows(); } catch(Exception ignored) {} },
                    null,
                    playFirst!=null?()->open(playFirst):null,
                    ()->{ if(!isFinishing() && !isDestroyed()) rows(); },
                    currentLastPlayed,
                    folderProgress,
                    resumeTarget!=null?()->resumeCloudLastPlayed(resumeTarget):null);
            BaiduCloud.showCover(getApplicationContext(),headerCover,owner,path,icon("ic_no_cover"));
        } else if(detailHeader!=null) {
            currentLastPlayed=null;
            detailHeader.setVisibility(View.GONE);
        } else {
            currentLastPlayed=null;
        }
        boolean blank=visible.isEmpty() && !inSubfolder; ((View)empty.getTag()).setVisibility(blank?View.VISIBLE:View.GONE);
        boolean useList=inSubfolder || audio;
        grid.setVisibility(!blank && !useList?View.VISIBLE:View.GONE); list.setVisibility(!blank && useList?View.VISIBLE:View.GONE);
        empty.setText(owner.isEmpty()?"\u672a\u8fde\u63a5\u767e\u5ea6\u7f51\u76d8":rootPath.isEmpty()?"\u8bf7\u9009\u62e9\u4e00\u4e2a\u7f51\u76d8\u4e2d\u7684\u4f5c\u54c1\u6587\u4ef6\u5939":loading?"\u52a0\u8f7d\u4e2d\u2026":favorites?"\u6682\u65e0\u4e91\u7aef\u6536\u85cf":"\u6b64\u76ee\u5f55\u6ca1\u6709\u53ef\u64ad\u653e\u7684\u97f3\u8f68\u6216\u5b50\u6587\u4ef6\u5939");
        action.setVisibility(blank && !loading?View.VISIBLE:View.GONE); action.setText(owner.isEmpty()?(!session.optBoolean("configured")?"\u914d\u7f6e\u5e94\u7528":"\u767e\u5ea6\u6388\u6743"):rootPath.isEmpty()?"\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55":"\u91cd\u8bd5");
        loadMore.setVisibility(!favorites && more && !owner.isEmpty()?View.VISIBLE:View.GONE); loadMore.setEnabled(!loading);
        if(navigation!=null) navigation.select(favorites?1:0,true);
        if(embedded) AppShell.panelSelection(host,2,favorites?1:0);
        updateDockSpacing(); albums.notifyDataSetChanged(); files.notifyDataSetChanged();
        if(!pendingResumeCloudId.isEmpty() && !loading) {
            String targetId=pendingResumeCloudId; pendingResumeCloudId="";
            for(JSONObject r:visible) if(r.optInt("isdir")==0 && targetId.equals(r.optString("fs_id"))) {
                main.post(()-> { if(!isFinishing() && !isDestroyed()) open(r); });
                break;
            }
        }
    }
    private void error(Exception error) {
        pendingResumeCloudId="";
        String message=BaiduCloud.message(error); status.setText(message); empty.setText(message); action.setVisibility(View.VISIBLE);
        Toast.makeText(this,message,Toast.LENGTH_LONG).show();
    }
    private void ui(Runnable run) { main.post(()-> { if(!isFinishing() && !isDestroyed()) run.run(); }); }
    private void open(JSONObject row) {
        if(row.optInt("isdir")==1) { load(row.optString("path"),false); return; }
        if(loading || binder==null) return;
        final int generation=++loadGeneration; final String account=owner,folder=path,selected=row.optString("fs_id"); loading=true; status.setText("\u51c6\u5907\u64ad\u653e\u2026");
        BaiduCloud.IO.execute(()-> {
            try {
                JSONArray all=BaiduCloud.folder(this,account,folder,true);
                JSONArray queue=BaiduApi.queue(account,folder,all,BaiduCloud.trackCover(this,account,folder));
                ArrayList<JSONObject> tracks=new ArrayList<>(); int index=-1;
                for(int i=0;i<queue.length();i++) { JSONObject track=queue.getJSONObject(i); tracks.add(track); if(selected.equals(track.optString("cloud_id"))) index=i; }
                final int position=index;
                ui(()-> { if(generation!=loadGeneration || !owner.equals(account)) return; loading=false;
                    try { if(binder==null) throw BaiduApi.failure("\u64ad\u653e\u670d\u52a1\u672a\u8fde\u63a5\uff0c\u8bf7\u91cd\u8bd5");
                        if(position<0) throw BaiduApi.failure("\u97f3\u8f68\u5df2\u79fb\u52a8\uff0c\u8bf7\u5237\u65b0");
                        JSONObject current=binder.getCurrent();
                        if(current==null || !PlayerNavigation.identity(current).equals(PlayerNavigation.identity(tracks.get(position)))) binder.play(tracks,position);
                        PlayerNavigation.openPlayer(host); rows();
                    } catch(Exception e) { error(e); }
                });
            } catch(Exception e) { ui(()-> { if(generation==loadGeneration) { loading=false; rows(); error(e); } }); }
        });
    }
    private final BaseAdapter albums=new BaseAdapter() {
        public int getCount() { return visible.size(); } public Object getItem(int i) { return visible.get(i); } public long getItemId(int i) { return i; }
        public View getView(int i,View old,ViewGroup parent) {
            LinearLayout tile;
            if(old instanceof LinearLayout && "rj_album_tile".equals(old.getTag())) tile=(LinearLayout)old;
            else tile=GlassUi.buildAlbumTile(BaiduCloudController.this,card);
            JSONObject item=visible.get(i);
            int width=(Math.max(dp(200),parent.getWidth()==0?getResources().getDisplayMetrics().widthPixels:parent.getWidth())-dp(28))/2;
            ImageView image=GlassUi.bindAlbumTile(BaiduCloudController.this,tile,Math.round(width*.75f),
                    item.optString("server_filename"),0,false,card,
                    ()->{ if(!isFinishing() && !isDestroyed()) notifyDataSetChanged(); });
            BaiduCloud.showCover(getApplicationContext(),image,owner,item.optString("path"),icon("ic_no_cover"));
            return tile;
        }
    };
    private final BaseAdapter files=new BaseAdapter() {
        public int getCount() { return visible.size(); } public Object getItem(int i) { return visible.get(i); } public long getItemId(int i) { return i; }
        public View getView(int i,View old,ViewGroup parent) {
            LinearLayout row;
            if(old instanceof LinearLayout) row=(LinearLayout)old; else {
                row=new LinearLayout(BaiduCloudController.this); row.setGravity(Gravity.CENTER_VERTICAL); row.setMinimumHeight(dp(72)); row.setPadding(dp(12),dp(10),dp(12),dp(10));
                ImageView image=new ImageView(BaiduCloudController.this); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
                GradientDrawable clip=new GradientDrawable(); clip.setCornerRadius(dp(8)); image.setBackground(clip); image.setClipToOutline(true);
                row.addView(image,new LinearLayout.LayoutParams(dp(48),dp(48)));
                LinearLayout words=new LinearLayout(BaiduCloudController.this); words.setOrientation(1);
                TextView name=label("",15,ink()); name.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));
                name.setMaxLines(3); name.setEllipsize(TextUtils.TruncateAt.END); words.addView(name); words.addView(label("",12,muted()));
                LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,-2,1); lp.leftMargin=dp(12); row.addView(words,lp);
            }
            row.setBackground(GlassUi.iosGroupedRow(BaiduCloudController.this,card,i==0,i==visible.size()-1,66));
            JSONObject item=visible.get(i); boolean directory=item.optInt("isdir")==1; ImageView image=(ImageView)row.getChildAt(0);
            BaiduCloud.showCover(getApplicationContext(),image,owner,directory?item.optString("path"):path,icon(directory?"ic_baseline_folder_24":"ic_baseline_audiotrack_24"));
            LinearLayout words=(LinearLayout)row.getChildAt(1);
            TextView titleView=(TextView)words.getChildAt(0);
            TextView descView=(TextView)words.getChildAt(1);
            String fileName=item.optString("server_filename");
            boolean isLastDir=directory && isCloudFolderLastPlayed(item.optString("path"),currentLastPlayed);
            boolean isLastTrack=!directory && currentLastPlayed!=null && item.optString("fs_id").equals(currentLastPlayed.optString("cloudId"));
            titleView.setText(fileName);
            titleView.setTextColor(isLastDir || isLastTrack?GlassUi.RED:ink());
            boolean trackSub=!directory && hasCloudSubtitleFor(fileName);
            String desc=directory?"\u6587\u4ef6\u5939":LocalIndex.extension(fileName).toUpperCase(Locale.ROOT)
                    +String.format(Locale.ROOT,"  %.1f MB",item.optLong("size")/1048576.0)+(trackSub?"  \ud83d\udcac \u6b4c\u8bcd":"");
            String badge="";
            if(isLastDir) {
                badge="\u4e0a\u6b21\u542c\u5230\u6b64\u76ee\u5f55 \u00b7 "+currentLastPlayed.optString("title");
            } else if(!directory) {
                badge=TrackResume.buildTrackBadge(BaiduCloudController.this,TrackResume.cloudTrackStub(owner,item),0L,isLastTrack,currentLastPlayed);
            }
            GlassUi.setColoredSubtitle(descView,desc,badge,muted(),isLastDir || isLastTrack?GlassUi.RED:accent());
            return row;
        }
    };
    private boolean hasCloudSubtitleFor(String audioName) {
        String stem=BaiduApi.stem(audioName);
        for(int i=0;i<entries.length();i++) {
            JSONObject row=entries.optJSONObject(i);
            if(row==null || row.optInt("isdir")!=0) continue;
            String fn=row.optString("server_filename"), ext=LocalIndex.extension(fn);
            if((ext.equals("lrc") || ext.equals("vtt")) && stem.equals(BaiduApi.stem(fn))) return true;
        }
        return false;
    }
    private AlertDialog.Builder dialog(String text) {
        TextView heading=label(text,18,ThemePalettes.text(card)); heading.setTypeface(Typeface.DEFAULT,Typeface.BOLD); heading.setPadding(dp(22),dp(20),dp(22),dp(12));
        return new AlertDialog.Builder(this,ThemePalettes.light(card)?android.R.style.Theme_Material_Light_Dialog_Alert:android.R.style.Theme_Material_Dialog_Alert).setCustomTitle(heading);
    }
    private AlertDialog show(AlertDialog.Builder builder) {
        AlertDialog result=builder.create(); result.setOnShowListener(d->GlassUi.styleDialog(this,result,card,accent())); result.show(); return result;
    }
    void menu() {
        String[] choices={"\u5e94\u7528\u914d\u7f6e","\u767e\u5ea6\u6388\u6743","\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55","\u56de\u5230\u4f5c\u54c1\u76ee\u5f55","\u64ad\u653e\u5217\u8868","\u6e05\u7406\u5c01\u9762\u7f13\u5b58","\u65ad\u5f00\u672c\u673a\u8fde\u63a5","\u8df3\u8f6c\u76ee\u5f55","\u66f4\u591a\u8bbe\u7f6e"};
        show(dialog("\u4e91\u7aef\u66f4\u591a").setItems(choices,(d,which)-> {
            if(which==0) configuration(); else if(which==1) authorize(); else if(which==2) chooseRoot();
            else if(which==3) { if(rootPath.isEmpty()) chooseRoot(); else load(rootPath,false); }
            else if(which==4) PlayerNavigation.openQueue(host); else if(which==5) clearCache(); else if(which==6) disconnect(); else if(which==7) directory(); else if(which==8) AppShell.openSettings(host);
        }));
    }
    private void chooseRoot() {
        if(owner.isEmpty()) { Toast.makeText(this,"\u8bf7\u5148\u8fde\u63a5\u767e\u5ea6\u7f51\u76d8",Toast.LENGTH_SHORT).show(); return; }
        final String account=owner;
        String[] methods={"\u6d4f\u89c8\u6587\u4ef6\u5939","\u76f4\u63a5\u8f93\u5165\u8def\u5f84"};
        show(dialog("\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55").setItems(methods,(d,which)-> {
            if(!owner.equals(account)) return;
            if(which==0) new RootPicker(account).show(); else rootByPath(account);
        }));
    }
    private final class RootPicker {
        final String account; final List<JSONObject> directories=new ArrayList<>();
        String location="/"; int generation; boolean ready; AlertDialog window; TextView locationView; ListView items;
        RootPicker(String account) { this.account=account; }
        void show() {
            LinearLayout content=new LinearLayout(BaiduCloudController.this); content.setOrientation(1); content.setPadding(dp(16),0,dp(16),0);
            locationView=label("",13,ThemePalettes.secondary(card)); locationView.setPadding(0,dp(8),0,dp(8)); content.addView(locationView);
            items=new ListView(BaiduCloudController.this); items.setDivider(null); content.addView(items,new LinearLayout.LayoutParams(-1,dp(300)));
            items.setOnItemClickListener((a,v,p,id)-> { if(!location.equals("/") && p==0) go(BaiduApi.parent(location));
                else { int index=p-(location.equals("/")?0:1); if(index>=0 && index<directories.size()) go(directories.get(index).optString("path")); } });
            window=BaiduCloudController.this.show(dialog("\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55").setView(content).setNegativeButton("\u53d6\u6d88",null)
                    .setNeutralButton("\u8f93\u5165\u8def\u5f84",null).setPositiveButton("\u4f7f\u7528\u6b64\u76ee\u5f55",null));
            window.setOnDismissListener(d->generation++);
            window.getButton(-1).setOnClickListener(v->{ if(ready && !location.equals("/")) { String selected=location; window.dismiss(); setRoot(account,selected); } });
            window.getButton(-3).setOnClickListener(v->{ window.dismiss(); rootByPath(account); });
            go(rootPath.isEmpty()?"/":rootPath);
        }
        void go(String target) {
            try { target=BaiduApi.path(target); } catch(Exception e) { return; }
            location=target; ready=false; directories.clear(); final String requested=target; final int request=++generation;
            locationView.setText(requested+"  \u52a0\u8f7d\u4e2d\u2026"); window.getButton(-1).setEnabled(false); display();
            BaiduCloud.IO.execute(()-> {
                try { JSONArray found=BaiduCloud.api(BaiduCloudController.this).list(account,requested,0,1000);
                    ui(()-> { if(request!=generation || !window.isShowing() || !owner.equals(account)) return;
                        for(int i=0;i<found.length();i++) { JSONObject row=found.optJSONObject(i); if(row!=null && row.optInt("isdir")==1) directories.add(row); }
                        ready=true; locationView.setText(requested+(found.length()==1000?"  \u5217\u8868\u8f83\u591a\uff0c\u53ef\u8f93\u5165\u8def\u5f84":""));
                        window.getButton(-1).setEnabled(!requested.equals("/")); display(); });
                } catch(Exception e) { ui(()-> { if(request==generation && window.isShowing()) { locationView.setText(BaiduCloud.message(e)); display(); } }); }
            });
        }
        void display() {
            List<String> names=new ArrayList<>(); if(!location.equals("/")) names.add("\u2191  \u4e0a\u4e00\u7ea7");
            for(JSONObject row:directories) names.add("\u25b8  "+row.optString("server_filename"));
            items.setAdapter(new ArrayAdapter<String>(BaiduCloudController.this,android.R.layout.simple_list_item_1,names) {
                @Override public View getView(int position,View old,ViewGroup parent) { TextView view=(TextView)super.getView(position,old,parent); view.setTextColor(ThemePalettes.text(card)); return view; }
            });
        }
    }
    private void rootByPath(String account) {
        EditText input=new EditText(this); input.setSingleLine(); input.setHint("/\u4f5c\u54c1\u6587\u4ef6\u5939"); input.setTextColor(ThemePalettes.text(card));
        input.setPadding(dp(22),dp(8),dp(22),dp(8)); if(!rootPath.isEmpty()) input.setText(rootPath);
        AlertDialog prompt=show(dialog("\u8f93\u5165\u4f5c\u54c1\u76ee\u5f55").setView(input).setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u786e\u8ba4",null));
        prompt.getButton(-1).setOnClickListener(v->{
            final String selected; try { selected=BaiduApi.libraryRoot(input.getText().toString().trim()); }
            catch(Exception e) { input.setError("\u8bf7\u586b\u5199\u4ee5 / \u5f00\u5934\u7684\u5177\u4f53\u6587\u4ef6\u5939"); return; }
            prompt.getButton(-1).setEnabled(false);
            BaiduCloud.IO.execute(()-> { try { BaiduCloud.api(this).list(account,selected,0,1); ui(()-> { if(prompt.isShowing() && owner.equals(account)) { prompt.dismiss(); setRoot(account,selected); } }); }
                catch(Exception e) { ui(()-> { if(prompt.isShowing()) { prompt.getButton(-1).setEnabled(true); input.setError(BaiduCloud.message(e)); } }); } });
        });
    }
    private void setRoot(String account,String selected) {
        if(!owner.equals(account)) return;
        try { selected=BaiduApi.libraryRoot(selected); } catch(Exception e) { error(e); return; }
        ++loadGeneration; rootPath=selected; path=selected; favorites=false; entries=new JSONArray(); more=false;
        getSharedPreferences("baidu_library",0).edit().putString("root:"+account,selected).apply(); load(selected,false);
    }
    private void directory() {
        if(rootPath.isEmpty()) { chooseRoot(); return; }
        EditText value=new EditText(this); value.setSingleLine(); value.setText(path); value.setTextColor(ThemePalettes.text(card)); value.setPadding(dp(22),dp(8),dp(22),dp(8));
        AlertDialog dialog=show(dialog("\u76ee\u5f55\u8def\u5f84").setView(value).setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u6253\u5f00",null));
        dialog.getButton(-1).setOnClickListener(v-> { try { String target=BaiduApi.path(value.getText().toString().trim()); if(!BaiduApi.withinRoot(rootPath,target)) throw new IllegalArgumentException(); dialog.dismiss(); load(target,false); } catch(Exception e) { value.setError("\u8bf7\u8f93\u5165\u5df2\u9009\u4f5c\u54c1\u76ee\u5f55\u5185\u7684\u8def\u5f84"); } });
    }
    private EditText field(LinearLayout content,String caption,boolean secret) {
        TextView heading=label(caption,13,ThemePalettes.secondary(card)); content.addView(heading);
        EditText input=new EditText(this); input.setSingleLine(); input.setTextSize(15); input.setTextColor(ThemePalettes.text(card)); input.setSaveEnabled(false);
        input.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);
        input.setImeOptions(android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        input.setTransformationMethod(PasswordTransformationMethod.getInstance()); input.setAutofillHints((String[])null); input.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS);
        content.addView(input,new LinearLayout.LayoutParams(-1,dp(54))); return input;
    }
    private void configuration() {
        LinearLayout form=new LinearLayout(this); form.setOrientation(1); form.setPadding(dp(22),0,dp(22),dp(6));
        EditText key=field(form,"AppKey",false),secret=field(form,"SecretKey",true);
        AlertDialog dialog=show(dialog("\u767e\u5ea6\u5e94\u7528\u914d\u7f6e").setView(form).setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u4fdd\u5b58",null));
        dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        dialog.getButton(-1).setOnClickListener(v-> {
            String k=key.getText().toString().trim(),s=secret.getText().toString().trim();
            if(!BaiduApi.credential(k) || !BaiduApi.credential(s)) { key.setError("\u8bf7\u586b\u5199 AppKey \u548c SecretKey\uff0c\u4e0d\u662f AppID"); return; }
            dialog.getButton(-1).setEnabled(false); BaiduCloud.IO.execute(()-> {
                try { BaiduCloud.api(this).configure(k,s); JSONObject loaded=BaiduCloud.api(this).state(); ui(()-> { key.setText(""); secret.setText(""); dialog.dismiss(); connected(loaded,true); authorize(); }); }
                catch(Exception e) { ui(()-> { dialog.getButton(-1).setEnabled(true); error(e); }); }
            });
        });
    }
    private void authorize() {
        if(authorizing) return;
        authorizing=true; final int generation=++authGeneration; status.setText("\u6b63\u5728\u7533\u8bf7\u767e\u5ea6\u6388\u6743\u7801");
        BaiduCloud.IO.execute(()-> {
            try { JSONObject code=BaiduCloud.api(this).beginDevice(); ui(()-> {
                if(generation!=authGeneration) { BaiduCloud.IO.execute(()-> { try { BaiduCloud.api(this).cancelAuthorization(code.optLong("_revision")); } catch(Exception ignored) {} }); return; } device=code;
                TextView value=label("\u6388\u6743\u7801\uff1a"+code.optString("user_code"),20,ThemePalettes.text(card)); value.setTextIsSelectable(true); value.setGravity(Gravity.CENTER); value.setPadding(dp(20),dp(12),dp(20),dp(16));
                authDialog=show(dialog("\u767e\u5ea6\u8d26\u53f7\u6388\u6743").setView(value).setNegativeButton("\u53d6\u6d88",(d,w)->cancelAuth()).setPositiveButton("\u6253\u5f00\u767e\u5ea6\u6388\u6743",null));
                authDialog.setOnCancelListener(d->cancelAuth()); authDialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
                authDialog.getButton(-1).setOnClickListener(v-> {
                    try { String url=code.getString("verification_url"); if(!BaiduApi.authorizationUrl(url)) throw new Exception(); startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(url))); }
                    catch(Exception e) { error(BaiduApi.failure("\u8bf7\u5b89\u88c5\u6d4f\u89c8\u5668\u540e\u91cd\u8bd5")); }
                });
                schedulePoll(generation,code);
            }); } catch(Exception e) { ui(()-> { if(generation==authGeneration) { authorizing=false; error(e); } }); }
        });
    }
    private void schedulePoll(int generation,JSONObject code) {
        long interval=Math.max(5,Math.min(30,code.optInt("interval",5)))*1000L;
        main.postDelayed(()-> {
            if(generation!=authGeneration || isFinishing() || isDestroyed()) return;
            BaiduCloud.IO.execute(()-> {
                try { JSONObject result=BaiduCloud.api(this).pollDevice(code); ui(()-> {
                    if(generation!=authGeneration) return;
                    if(result.optBoolean("connected")) { authorizing=false; if(authDialog!=null) authDialog.dismiss();
                        BaiduCloud.IO.execute(()-> { try { JSONObject state=BaiduCloud.api(this).state(); ui(()->connected(state,true)); } catch(Exception e) { ui(()->error(e)); } });
                    } else { if(result.optString("error").equals("slow_down")) try { code.put("interval",Math.min(30,code.optInt("interval",5)+5)); } catch(Exception ignored) {} schedulePoll(generation,code); }
                }); } catch(Exception e) { ui(()-> { if(generation==authGeneration) { authorizing=false; if(authDialog!=null) authDialog.dismiss(); error(e); } }); }
            });
        },interval);
    }
    private void cancelAuth() {
        authorizing=false; ++authGeneration; JSONObject pending=device; device=null;
        if(pending!=null) BaiduCloud.IO.execute(()-> { try { BaiduCloud.api(this).cancelAuthorization(pending.optLong("_revision")); } catch(Exception ignored) {} }); rows();
    }
    private void disconnect() {
        show(dialog("\u65ad\u5f00\u672c\u673a\u8fde\u63a5\uff1f").setMessage("\u4e0d\u4f1a\u5220\u9664\u767e\u5ea6\u7f51\u76d8\u6587\u4ef6\uff0c\u91cd\u65b0\u8fde\u63a5\u9700\u518d\u6b21\u6388\u6743\u3002").setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u65ad\u5f00",(d,w)-> {
            ++loadGeneration; cancelAuth(); BaiduCloud.IO.execute(()-> { try { BaiduCloud.api(this).disconnect(); JSONObject state=BaiduCloud.api(this).state(); ui(()->connected(state,true)); } catch(Exception e) { ui(()->error(e)); } });
        }));
    }
    private JSONArray favoriteRows() {
        try { return new JSONArray(getSharedPreferences("baidu_library",0).getString("favorites:"+owner,"[]")); } catch(Exception e) { return new JSONArray(); }
    }
    private boolean isCloudFavorite(String targetPath) {
        if(owner.isEmpty() || targetPath==null) return false;
        JSONArray favs=favoriteRows();
        for(int i=0;i<favs.length();i++) {
            JSONObject row=favs.optJSONObject(i);
            if(row!=null && targetPath.equals(row.optString("path"))) return true;
        }
        return false;
    }
    private void cloudRowMenu(JSONObject selected) {
        String name=selected.optString("server_filename");
        final String rj=GlassUi.extractRj(name);
        boolean fav=isCloudFavorite(selected.optString("path"));
        ArrayList<String> actions=new ArrayList<>();
        if(!rj.isEmpty()) actions.add("\u590d\u5236 RJ \u53f7 ("+rj+")");
        actions.add(fav?"\u53d6\u6d88\u4e91\u7aef\u6536\u85cf":"\u52a0\u5165\u4e91\u7aef\u6536\u85cf");
        if(actions.size()==1) { favorite(selected); return; }
        show(dialog(name).setItems(actions.toArray(new String[0]),(d,which)-> {
            if(actions.get(which).startsWith("\u590d\u5236 RJ")) GlassUi.copyRj(this,rj);
            else favorite(selected);
        }));
    }
    private void favorite(JSONObject selected) {
        if(owner.isEmpty()) return; JSONArray before=favoriteRows(),after=new JSONArray(); boolean found=false;
        for(int i=0;i<before.length();i++) { JSONObject row=before.optJSONObject(i); if(row.optString("path").equals(selected.optString("path"))) found=true; else after.put(row); }
        if(!found) { if(after.length()>=2000) { Toast.makeText(this,"\u4e91\u7aef\u6536\u85cf\u5df2\u8fbe\u4e0a\u9650",Toast.LENGTH_SHORT).show(); return; }
            try { after.put(new JSONObject().put("fs_id",selected.optString("fs_id")).put("path",selected.optString("path")).put("server_filename",selected.optString("server_filename")).put("isdir",1)); } catch(Exception ignored) {}
        }
        getSharedPreferences("baidu_library",0).edit().putString("favorites:"+owner,after.toString()).apply(); if(favorites) rows();
        GlassUi.toast(this,found?"\u5df2\u53d6\u6d88\u4e91\u7aef\u6536\u85cf":"\u5df2\u52a0\u5165\u4e91\u7aef\u6536\u85cf");
    }
    private void clearCache() {
        BaiduCloud.IO.execute(()-> { java.io.File folder=new java.io.File(getCacheDir(),"baidu-covers"); java.io.File[] files=folder.listFiles(); if(files!=null) for(java.io.File file:files) if(file.isFile() && (file.getName().endsWith(".img") || file.getName().endsWith(".tmp"))) file.delete();
            ui(()-> { albums.notifyDataSetChanged(); this.files.notifyDataSetChanged(); GlassUi.toast(this,"\u5c01\u9762\u7f13\u5b58\u5df2\u6e05\u7406"); }); });
    }
    boolean handleBack() {
        if(authorizing || search.length()>0 || favorites || !owner.isEmpty() && !path.equals(rootPath)) { back(); return true; }
        return false;
    }
    void back() {
        if(authorizing) { if(authDialog!=null) authDialog.dismiss(); cancelAuth(); return; }
        if(search.length()>0) { search.setText(""); return; }
        if(favorites) { favorites=false; rows(); return; }
        if(!owner.isEmpty() && !path.equals(rootPath)) {
            String parent=BaiduApi.parent(path);
            load(BaiduApi.withinRoot(rootPath,parent)?parent:rootPath,false); return;
        }
        if(!embedded) host.finish();
    }
    void onNewIntent(Intent intent) {
        launchIntent=intent;
        if(!intent.hasExtra(AppShell.EXTRA_TAB)) return;
        boolean showFavorites=intent.getIntExtra(AppShell.EXTRA_TAB,0)==1;
        if(authorizing) return;
        if(showFavorites) { favorites=true; ++loadGeneration; loading=false; rows(); }
        else if(!rootPath.isEmpty()) load(rootPath,false);
        else { favorites=false; rows(); }
    }
    void onStart() { if(mini!=null) mini.active(true); if(list!=null && !loading && !owner.isEmpty() && !rootPath.isEmpty()) rows(); }

    private static boolean isCloudFolderLastPlayed(String folderPath,JSONObject last) {
        if(folderPath==null || folderPath.isEmpty() || last==null) return false;
        String target=last.optString("folder");
        return target.equals(folderPath) || target.startsWith(folderPath+"/");
    }

    private void resumeCloudLastPlayed(JSONObject last) {
        if(last==null) return;
        String targetFolder=last.optString("folder"),cloudId=last.optString("cloudId");
        if(targetFolder.isEmpty() || cloudId.isEmpty()) return;
        if(targetFolder.equals(path)) {
            for(JSONObject r:visible) if(r.optInt("isdir")==0 && cloudId.equals(r.optString("fs_id"))) {
                open(r); return;
            }
            GlassUi.toast(this,"\u672a\u627e\u5230\u4e0a\u6b21\u64ad\u653e\u7684\u4e91\u7aef\u97f3\u8f68");
            return;
        }
        pendingResumeCloudId=cloudId;
        load(targetFolder,false);
    }
    void onStop() { if(mini!=null) mini.active(false); }
    void onDestroy() {
        ++loadGeneration; ++authGeneration; main.removeCallbacksAndMessages(null); JSONObject pending=device;
        if(authorizing && pending!=null) BaiduCloud.IO.execute(()-> { try { BaiduCloud.api(this).cancelAuthorization(pending.optLong("_revision")); } catch(Exception ignored) {} });
        if(mini!=null) mini.dispose(); if(bound) unbindService(this);
    }
    void onSaveInstanceState(Bundle state) { state.putString("cloud_path",path); state.putBoolean("cloud_favorites",favorites); }
    public void onServiceConnected(ComponentName name,IBinder service) { binder=(AudioService.CtrlBinder)service; if(mini!=null) mini.attach(binder); }
    public void onServiceDisconnected(ComponentName name) { binder=null; if(mini!=null) mini.attach(null); }
}
