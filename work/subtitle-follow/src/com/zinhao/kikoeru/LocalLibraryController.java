package com.zinhao.kikoeru;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.*;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.concurrent.CancellationException;
import org.json.JSONArray;
import org.json.JSONObject;
import static android.app.Activity.RESULT_OK;

public final class LocalLibraryController extends ContextWrapper implements ServiceConnection {
    private final Activity host;
    private final boolean embedded;
    private Intent launchIntent;
    private View view;
    private JSONArray roots=new JSONArray();
    private List<JSONObject> visible=new ArrayList<>();
    private String source="",parent="";
    private String resumeUri="";
    private long resumeSeek;
    private AudioService.CtrlBinder binder;
    private boolean bound, busy, loading=true,deleteEnabled,deleting,favoritesMode;
    private volatile boolean cancel;
    private TextView heading,status;
    private EditText search;
    private ListView list;
    private GridView grid;
    private TextView empty;
    private ImageButton add,refresh,management,folderBack;
    private MiniPlayer mini;
    private LinearLayout dock,headerBar,detailHeader;
    private FrameLayout detailContainer;
    private ImageButton worksTab,favoritesTab;
    private GlassUi.Navigation navigation;
    private String pendingWriteSource="";
    private int page,card,bar,paletteIndex;
    private boolean liquidState;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Runnable filter=()->refreshRows();
    LocalLibraryController(Activity activity,boolean embedded) {
        super(activity); host=activity; this.embedded=embedded;
        launchIntent=embedded?new Intent():activity.getIntent();
    }
    private Intent getIntent() { return launchIntent; }
    private Window getWindow() { return host.getWindow(); }
    private boolean isFinishing() { return host.isFinishing(); }
    private boolean isDestroyed() { return host.isDestroyed(); }
    private void startActivityForResult(Intent intent,int request) { host.startActivityForResult(intent,request); }
    View view() { return view; }
    void create(Bundle state) {
        source=state==null?getIntent().getStringExtra("source"):state.getString("source");
        parent=state==null?getIntent().getStringExtra("parent"):state.getString("parent");
        if(source==null) source=""; if(parent==null) parent="";
        resumeUri=state==null?getIntent().getStringExtra("resume_uri"):state.getString("resume_uri","");
        if(resumeUri==null) resumeUri="";
        resumeSeek=state==null?getIntent().getLongExtra("resume_seek",0):state.getLong("resume_seek",0);
        if(state!=null) pendingWriteSource=state.getString("write_source","");
        favoritesMode=state!=null ? state.getBoolean("favorites",false)
                : getIntent().getIntExtra(AppShell.EXTRA_TAB,0)==1;
        int n=ThemePalettes.selected(this); paletteIndex=n; liquidState=PlaybackOptions.liquidGlass(this);
        page=ThemePalettes.color(n,1); card=ThemePalettes.color(n,2); bar=ThemePalettes.color(n,3);
        build();
        if(state!=null) { search.setText(state.getString("query","")); if(search.length()>0) search.setVisibility(View.VISIBLE); }
        bound=bindService(new Intent(this,AudioService.class),this,BIND_AUTO_CREATE);
        LocalDocuments.IO.execute(()-> {
            try {
                JSONArray loaded=LocalDocuments.load(getApplicationContext());
                ui(()-> { roots=loaded; loading=false; refreshRows(); });
            } catch(Exception e) { ui(()-> { loading=false; error("\u8bfb\u53d6\u672c\u5730\u7d22\u5f15\u5931\u8d25",e); refreshRows(); }); }
        });
    }
    private int dp(int n) { return Math.round(n*getResources().getDisplayMetrics().density); }
    private TextView text(String value,int size,int color) {
        TextView t=new TextView(this); t.setText(value); t.setTextSize(size); t.setTextColor(color); return t;
    }
    private int icon(String name,int fallback) {
        int id=getResources().getIdentifier(name,"drawable",getPackageName()); return id==0?fallback:id;
    }
    private ImageButton button(String name,String description,int fallback,View.OnClickListener action) {
        ImageButton b=new ImageButton(this);
        android.graphics.drawable.Drawable sf=GlassUi.sfDrawable(this,name);
        if(sf!=null) b.setImageDrawable(sf); else b.setImageResource(icon(name,fallback));
        b.setScaleType(ImageView.ScaleType.CENTER_INSIDE); b.setPadding(dp(10),dp(10),dp(10),dp(10));
        b.setImageTintList(ColorStateList.valueOf(accent()));
        b.setBackground(null);
        GlassUi.attachIosPress(b,0.90f);
        b.setContentDescription(description); b.setTooltipText(description); b.setOnClickListener(v-> {
            GlassUi.hapticTick(v); action.onClick(v);
        });
        return b;
    }
    private void build() {
        LinearLayout root=new LinearLayout(this); root.setOrientation(1); root.setBackgroundColor(page);
        if(!embedded) root.setOnApplyWindowInsetsListener((v,insets)-> {
            v.setPadding(insets.getSystemWindowInsetLeft(),insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(),0);
            dock.setPadding(0,0,0,dp(6)+insets.getSystemWindowInsetBottom()); return insets;
        });
        LinearLayout header=new LinearLayout(this); header.setGravity(Gravity.CENTER_VERTICAL); header.setBackgroundColor(page);
        headerBar=header;
        int btnSize=embedded?dp(42):dp(48), barHeight=embedded?dp(42):dp(56);
        header.setPadding(dp(8),0,dp(8),0);
        folderBack=button("ic_arrow_back_black_24","\u8fd4\u56de",android.R.drawable.ic_media_previous,v->back());
        if(embedded) folderBack.setVisibility(View.GONE);
        header.addView(folderBack,new LinearLayout.LayoutParams(btnSize,barHeight));
        heading=text("\u672c\u5730\u4f5c\u54c1",embedded?15:18,ThemePalettes.text(page)); heading.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
        heading.setSingleLine(); heading.setEllipsize(TextUtils.TruncateAt.END);
        status=text("\u8bfb\u53d6\u7d22\u5f15\u4e2d\u2026",13,ThemePalettes.secondary(page));
        status.setSingleLine(); status.setEllipsize(TextUtils.TruncateAt.END);
        if(embedded) {
            heading.setPadding(dp(4),0,dp(8),0);
            heading.setVisibility(View.GONE);
            header.addView(heading,new LinearLayout.LayoutParams(-2,-2));
            status.setPadding(dp(8),0,dp(8),0);
            header.addView(status,new LinearLayout.LayoutParams(0,-2,1));
        } else {
            header.addView(heading,new LinearLayout.LayoutParams(0,-2,1));
        }
        ImageButton searchButton=button("ic_baseline_search_24","\u641c\u7d22",android.R.drawable.ic_menu_search,v->toggleSearch());
        searchButton.setVisibility(View.GONE);
        header.addView(searchButton,new LinearLayout.LayoutParams(btnSize,barHeight));
        add=button("ic_baseline_folder_24","\u5bfc\u5165\u6587\u4ef6\u5939",android.R.drawable.ic_menu_agenda,v->choose());
        add.setImageTintList(ColorStateList.valueOf(accent()));
        header.addView(add,new LinearLayout.LayoutParams(btnSize,barHeight));
        refresh=button("ic_baseline_loop_24","\u91cd\u65b0\u626b\u63cf",android.R.drawable.ic_popup_sync,v-> {
            if(busy) cancel=true; else if(!source.isEmpty()) rescan(source); else if(roots.length()>0) manage(); else choose();
        });
        refresh.setVisibility(View.GONE); header.addView(refresh,new LinearLayout.LayoutParams(btnSize,barHeight));
        management=button("ic_baseline_more_horiz_24","\u672c\u5730\u7ba1\u7406",android.R.drawable.ic_menu_more,v->managementMenu());
        header.addView(management,new LinearLayout.LayoutParams(btnSize,barHeight)); root.addView(header);
        if(!embedded) {
            GlassUi.Sources sources=AppShell.sources(host,1);
            sources.setNavigationAllowed(()->!busy && !loading);
            LinearLayout.LayoutParams sourcesLp=new LinearLayout.LayoutParams(-1,dp(44));
            sourcesLp.setMargins(dp(12),0,dp(12),dp(4)); root.addView(sources,sourcesLp);
        }
        search=new EditText(this); search.setSingleLine(); search.setTextSize(15);
        search.setTextColor(ThemePalettes.text(page)); search.setHintTextColor(ThemePalettes.secondary(page));
        search.setHint("\u641c\u7d22\u672c\u5730\u97f3\u8f68"); search.setVisibility(View.GONE);
        search.setBackground(GlassUi.searchFieldBackground(this,card));
        search.setPadding(dp(26),dp(6),dp(26),dp(6));
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s,int start,int count,int after) {}
            public void onTextChanged(CharSequence s,int start,int before,int count) { main.removeCallbacks(filter); main.postDelayed(filter,180); }
            public void afterTextChanged(Editable e) {}
        }); root.addView(search,new LinearLayout.LayoutParams(-1,dp(46)));
        if(!embedded) {
            status.setPadding(dp(16),dp(8),dp(16),dp(8)); root.addView(status);
        }
        FrameLayout body=new FrameLayout(this);
        list=new ListView(this); list.setDivider(null); list.setClipToPadding(false); list.setPadding(dp(10),0,dp(10),dp(8));
        body.addView(list,new FrameLayout.LayoutParams(-1,-1));
        grid=new GridView(this); grid.setNumColumns(2); grid.setHorizontalSpacing(dp(8)); grid.setVerticalSpacing(dp(10));
        grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH); grid.setPadding(dp(10),dp(6),dp(10),dp(10)); grid.setClipToPadding(false);
        body.addView(grid,new FrameLayout.LayoutParams(-1,-1)); grid.setVisibility(View.GONE);
        empty=text("\u6682\u65e0\u672c\u5730\u97f3\u8f68",16,ThemePalettes.secondary(page)); empty.setGravity(Gravity.CENTER);
        body.addView(empty,new FrameLayout.LayoutParams(-1,-1));
        FrameLayout stage=new FrameLayout(this);
        stage.addView(body,new FrameLayout.LayoutParams(-1,-1));
        worksTab=button("ic_baseline_widgets_24","\u672c\u5730\u4f5c\u54c1",0,v->tab(false));
        favoritesTab=button("ic_baseline_favorite_24","\u672c\u5730\u6536\u85cf",0,v->tab(true));
        if(!embedded) {
            mini=new MiniPlayer(host);
            ImageButton more=button("ic_baseline_more_horiz_24","\u66f4\u591a",0,v->managementMenu());
            navigation=AppShell.navigation(host,body,worksTab,favoritesTab,more,1,
                    ()->searchButton.performClick(),favoritesMode?1:0);
            dock=AppShell.dock(host,body,mini.view,navigation);
            stage.addView(dock,new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM));
            AppShell.keepVisible(host,list,dock,0); AppShell.keepVisible(host,grid,dock,dp(6));
        }
        root.addView(stage,new LinearLayout.LayoutParams(-1,0,1));
        detailContainer=new FrameLayout(this);
        detailHeader=GlassUi.buildWorkDetailHeader(this);
        detailHeader.setVisibility(View.GONE);
        detailContainer.addView(detailHeader,new FrameLayout.LayoutParams(-1,-2));
        list.addHeaderView(detailContainer,null,false);
        list.setAdapter(adapter);
        grid.setAdapter(albumAdapter);
        list.setOnItemClickListener((a,v,position,id)-> {
            int idx=position-list.getHeaderViewsCount();
            if(idx>=0 && idx<visible.size()) open(visible.get(idx));
        });
        grid.setOnItemClickListener((a,v,position,id)->open(visible.get(position)));
        AdapterView.OnItemLongClickListener longClick=(a,v,position,id)-> {
            int idx=a==list?position-list.getHeaderViewsCount():position;
            if(idx<0 || idx>=visible.size() || busy || loading) return true;
            JSONObject row=visible.get(idx);
            if(row.optBoolean("directory")) albumMenu(row); else showRowInfo(row);
            return true;
        };
        list.setOnItemLongClickListener(longClick); grid.setOnItemLongClickListener(longClick);
        view=root;
    }
    void toggleSearch() {
        search.setVisibility(search.getVisibility()==View.VISIBLE?View.GONE:View.VISIBLE);
        if(search.getVisibility()==View.VISIBLE) search.requestFocus(); else search.setText("");
    }
    void setBottomInset(int value) {
        int bottom=Math.max(0,value)+dp(10);
        if(list.getPaddingBottom()!=bottom) list.setPadding(dp(10),0,dp(10),bottom);
        if(grid.getPaddingBottom()!=bottom) grid.setPadding(dp(10),dp(6),dp(10),bottom);
    }
    void refreshPalette() {
        int n=ThemePalettes.selected(this);
        boolean nextLiquid=PlaybackOptions.liquidGlass(this);
        if(n==paletteIndex && nextLiquid==liquidState) return;
        android.os.Parcelable oldList=list.onSaveInstanceState(), oldGrid=grid.onSaveInstanceState();
        paletteIndex=n; liquidState=nextLiquid;
        page=ThemePalettes.color(n,1); card=ThemePalettes.color(n,2); bar=ThemePalettes.color(n,3);
        view.setBackgroundColor(page); headerBar.setBackgroundColor(page);
        heading.setTextColor(ThemePalettes.text(page)); status.setTextColor(ThemePalettes.secondary(page));
        empty.setTextColor(ThemePalettes.secondary(page)); search.setTextColor(ThemePalettes.text(page));
        search.setHintTextColor(ThemePalettes.secondary(page)); search.setBackground(GlassUi.searchFieldBackground(this,card));
        for(ImageButton icon:new ImageButton[]{folderBack,refresh,management})
            icon.setImageTintList(ColorStateList.valueOf(accent()));
        add.setImageTintList(ColorStateList.valueOf(accent()));
        list.setAdapter(adapter); grid.setAdapter(albumAdapter);
        if(oldList!=null) list.onRestoreInstanceState(oldList);
        if(oldGrid!=null) grid.onRestoreInstanceState(oldGrid);
        refreshRows();
    }
    boolean canSwitch() { return !busy; }
    boolean isFavorite() { return favoritesMode; }
    void requestTab(boolean favorites) {
        if(!busy && !loading) tab(favorites); else if(!busy) favoritesMode=favorites;
    }
    void tab(boolean favorites) {
        if(busy || loading) return;
        if(favoritesMode==favorites && source.isEmpty() && search.getText().toString().isEmpty()) return;
        favoritesMode=favorites; source=""; parent=""; search.setText("");
        refreshRows(); list.setSelection(0); grid.setSelection(0);
    }
    private void albumMenu(JSONObject row) {
        final String rj=GlassUi.extractRj(row.optString("name"));
        if(!source.isEmpty()) {
            ArrayList<String> actions=new ArrayList<>();
            if(!rj.isEmpty()) actions.add("\u590d\u5236 RJ \u53f7 ("+rj+")");
            actions.add("\u4f5c\u54c1\u4fe1\u606f"); actions.add("\u4e0a\u4f20\u5230\u767e\u5ea6\u7f51\u76d8");
            if(deleteEnabled) actions.add("\u5220\u9664\u672c\u5730\u539f\u6587\u4ef6");
            showDialog(dialog(row.optString("name")).setItems(actions.toArray(new String[0]),(d,which)-> {
                String picked=actions.get(which);
                if(picked.startsWith("\u590d\u5236 RJ")) GlassUi.copyRj(this,rj);
                else if(picked.equals("\u4f5c\u54c1\u4fe1\u606f")) showRowInfo(row);
                else if(picked.startsWith("\u4e0a\u4f20")) prepareUpload(row);
                else prepareDeletion(row);
            }));
            return;
        }
        ArrayList<String> actions=new ArrayList<>();
        if(!rj.isEmpty()) actions.add("\u590d\u5236 RJ \u53f7 ("+rj+")");
        actions.add(LocalFavorites.contains(this,row)?"\u53d6\u6d88\u672c\u5730\u6536\u85cf":"\u52a0\u5165\u672c\u5730\u6536\u85cf");
        actions.add(row.has("entries")?"\u5bfc\u5165\u6e90\u7ba1\u7406":"\u4f5c\u54c1\u4fe1\u606f");
        actions.add("\u4e0a\u4f20\u5230\u767e\u5ea6\u7f51\u76d8");
        if(deleteEnabled) actions.add("\u5220\u9664\u672c\u5730\u539f\u6587\u4ef6");
        showDialog(dialog(row.optString("name")).setItems(actions.toArray(new String[0]),(d,which)-> {
            String picked=actions.get(which);
            if(picked.startsWith("\u590d\u5236 RJ")) GlassUi.copyRj(this,rj);
            else if(picked.contains("\u672c\u5730\u6536\u85cf")) {
                boolean added=LocalFavorites.toggle(this,row); refreshRows();
                GlassUi.toast(this,added?"\u5df2\u52a0\u5165\u672c\u5730\u6536\u85cf":"\u5df2\u53d6\u6d88\u672c\u5730\u6536\u85cf");
            } else if(picked.equals("\u5bfc\u5165\u6e90\u7ba1\u7406") || picked.equals("\u4f5c\u54c1\u4fe1\u606f")) showRowInfo(row);
            else if(picked.startsWith("\u4e0a\u4f20")) prepareUpload(row);
            else prepareDeletion(row);
        }));
    }
    private final BaseAdapter adapter=new BaseAdapter() {
        public int getCount() { return visible.size(); }
        public Object getItem(int p) { return visible.get(p); }
        public long getItemId(int p) { return p; }
        public View getView(int p,View old,ViewGroup owner) {
            LinearLayout row;
            if(old instanceof LinearLayout) row=(LinearLayout)old; else {
                row=new LinearLayout(LocalLibraryController.this); row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(12),dp(10),dp(12),dp(10));
                ImageView image=new ImageView(LocalLibraryController.this); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
                GradientDrawable clip=new GradientDrawable(); clip.setCornerRadius(dp(8)); image.setBackground(clip); image.setClipToOutline(true);
                row.addView(image,new LinearLayout.LayoutParams(dp(50),dp(50)));
                LinearLayout words=new LinearLayout(LocalLibraryController.this); words.setOrientation(1);
                TextView title=text("",15,ThemePalettes.text(card)); title.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));
                title.setMaxLines(3); title.setEllipsize(TextUtils.TruncateAt.END);
                TextView description=text("",12,ThemePalettes.secondary(card)); description.setMaxLines(2); description.setEllipsize(TextUtils.TruncateAt.END);
                words.addView(title); words.addView(description);
                LinearLayout.LayoutParams wp=new LinearLayout.LayoutParams(0,-2,1); wp.leftMargin=dp(12); row.addView(words,wp);
                row.setMinimumHeight(dp(72));
            }
            row.setBackground(GlassUi.iosGroupedRow(LocalLibraryController.this,card,p==0,p==visible.size()-1,68));
            JSONObject n=visible.get(p); boolean dir=n.optBoolean("directory");
            ImageView image=(ImageView)row.getChildAt(0);
            int placeholder=icon(dir?"ic_baseline_folder_24":"ic_baseline_audiotrack_24",dir?android.R.drawable.ic_menu_agenda:android.R.drawable.ic_media_play);
            image.setImageTintList(null);
            LocalArt.show(getApplicationContext(),image,n.optString("cover"),
                    LocalIndex.artworkSources(n),placeholder);
            LinearLayout words=(LinearLayout)row.getChildAt(1);
            ((TextView)words.getChildAt(0)).setText(n.optString("name"));
            String desc=dir?n.optInt("count")+" \u9996\u97f3\u8f68"+(n.optBoolean("lyric")?"  \ud83d\udcac \u6b4c\u8bcd":""):LocalIndex.extension(n.optString("name")).toUpperCase(Locale.ROOT)
                    +String.format(Locale.ROOT,"  %.1f MB",n.optLong("size")/1048576.0)+(n.optString("subtitle").isEmpty()?"":"  \ud83d\udcac \u6b4c\u8bcd");
            if(!search.getText().toString().trim().isEmpty()) desc=n.optString("path");
            ((TextView)words.getChildAt(1)).setText(desc);
            return row;
        }
    };
    private final BaseAdapter albumAdapter=new BaseAdapter() {
        public int getCount() { return visible.size(); }
        public Object getItem(int p) { return visible.get(p); }
        public long getItemId(int p) { return p; }
        public View getView(int p,View old,ViewGroup owner) {
            LinearLayout tile;
            if(old instanceof LinearLayout && "rj_album_tile".equals(old.getTag())) tile=(LinearLayout)old;
            else tile=GlassUi.buildAlbumTile(LocalLibraryController.this,card);
            int width=(Math.max(dp(200),owner.getWidth()==0?getResources().getDisplayMetrics().widthPixels:owner.getWidth())-dp(28))/2;
            JSONObject album=visible.get(p);
            ImageView cover=GlassUi.bindAlbumTile(LocalLibraryController.this,tile,Math.round(width*0.75f),
                    album.optString("name"),album.optInt("count"),album.optBoolean("lyric"),card,
                    ()->{ if(!isFinishing() && !isDestroyed()) notifyDataSetChanged(); });
            LocalArt.show(getApplicationContext(),cover,album.optString("cover"),LocalIndex.artworkSources(album),
                    icon("ic_baseline_album_24",android.R.drawable.ic_menu_gallery));
            return tile;
        }
    };
    private void ui(Runnable run) { main.post(()-> { if(!isFinishing() && !isDestroyed()) run.run(); }); }
    private int accent() { return GlassUi.RED; }
    private int danger() { return GlassUi.IOS_RED; }
    private GradientDrawable shape(int color) {
        GradientDrawable result=new GradientDrawable(); result.setColor(color); result.setCornerRadius(dp(8)); return result;
    }
    private AlertDialog.Builder dialog(String title) {
        TextView label=text(title,19,ThemePalettes.text(card)); label.setTypeface(Typeface.DEFAULT,Typeface.BOLD);
        label.setPadding(dp(22),dp(22),dp(22),dp(12));
        return new AlertDialog.Builder(this,ThemePalettes.light(card)?android.R.style.Theme_Material_Light_Dialog_Alert:
                android.R.style.Theme_Material_Dialog_Alert).setCustomTitle(label);
    }
    private void dialogText(View view) {
        if(view instanceof TextView) ((TextView)view).setTextColor("danger".equals(view.getTag())?danger():ThemePalettes.text(card));
        if(view instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++) dialogText(group.getChildAt(i));
        }
    }
    private void styleDialog(AlertDialog dialog) {
        Window window=dialog.getWindow(); window.setBackgroundDrawable(GlassUi.dialogSurface(this,card,22)); window.setDimAmount(0.52f);
        window.setLayout(Math.min(dp(400),getResources().getDisplayMetrics().widthPixels-dp(32)),-2);
        dialogText(window.getDecorView());
        GlassUi.styleDialog(this,dialog,card,accent());
    }
    private AlertDialog showDialog(AlertDialog.Builder builder) {
        AlertDialog result=builder.create(); result.show(); styleDialog(result); return result;
    }
    private void error(String message,Exception e) {
        showDialog(dialog(message).setMessage(e instanceof SecurityException
                ?"\u6587\u4ef6\u5939\u6388\u6743\u5df2\u5931\u6548\uff0c\u8bf7\u91cd\u65b0\u9009\u62e9\u539f\u6587\u4ef6\u5939\u3002":e.getMessage())
                .setPositiveButton("\u786e\u5b9a",null));
    }
    private void refreshRows() {
        if(loading) return;
        try {
            JSONObject root=findRoot(source);
            if(!source.isEmpty() && root==null) {
                if(!resumeUri.isEmpty()) Toast.makeText(this,"\u8be5\u8bb0\u5f55\u7684\u6587\u4ef6\u5939\u5df2\u79fb\u9664\uff0c\u8bf7\u91cd\u65b0\u5bfc\u5165",Toast.LENGTH_LONG).show();
                source=""; parent=""; resumeUri="";
            }
            if(root!=null && parent.isEmpty()) parent=root.optString("document");
            String title=source.isEmpty()?(favoritesMode?"\u672c\u5730\u6536\u85cf":"\u672c\u5730\u4f5c\u54c1"):folderName(root,parent);
            String query=search.getText().toString();
            if(source.isEmpty() && !favoritesMode && !query.trim().isEmpty()) {
                List<JSONObject> allAlbums=LocalIndex.albums(roots);
                List<JSONObject> matchedAlbums=new ArrayList<>();
                for(JSONObject a:allAlbums) if(GlassUi.matchesRjQuery(this,a.optString("name"),query.trim())) matchedAlbums.add(a);
                visible=!matchedAlbums.isEmpty()?matchedAlbums:LocalIndex.rows(roots,source,parent,query);
            } else {
                visible=source.isEmpty() && query.trim().isEmpty()?LocalIndex.albums(roots):LocalIndex.rows(roots,source,parent,query);
            }
            if(source.isEmpty() && favoritesMode) visible=LocalFavorites.albums(this,roots,query);
            heading.setText(title);
            heading.setVisibility(ShellState.embeddedTitleVisible(embedded,!source.isEmpty())?View.VISIBLE:View.GONE);
            folderBack.setVisibility(ShellState.folderBackVisible(embedded,!source.isEmpty())?View.VISIBLE:View.GONE);
            worksTab.setSelected(!favoritesMode); favoritesTab.setSelected(favoritesMode);
            if(navigation!=null) navigation.select(favoritesMode?1:0,true);
            if(embedded) AppShell.panelSelection(host,1,favoritesMode?1:0);
            empty.setText(source.isEmpty() && favoritesMode?"\u6682\u65e0\u672c\u5730\u6536\u85cf":"\u6682\u65e0\u672c\u5730\u97f3\u8f68");
            boolean albums=source.isEmpty() && !visible.isEmpty();
            for(JSONObject row:visible) if(!row.optBoolean("directory")) albums=false;
            if(!source.isEmpty() && root!=null && detailHeader!=null) {
                JSONObject currentDir=findFolderNode(root,parent);
                detailHeader.setVisibility(View.VISIBLE);
                final JSONObject targetDir=currentDir!=null?new JSONObject(currentDir.toString()).put("source",source):root;
                JSONObject firstAudio=null;
                for(JSONObject r:visible) if(!r.optBoolean("directory")) { firstAudio=r; break; }
                final JSONObject playTarget=firstAudio;
                String localCoverOrigin=!targetDir.optString("cover").isEmpty()?"\u81ea\u5df1\u7684\u6587\u4ef6 \u00b7 \u672c\u5730\u72ec\u7acb\u5c01\u9762\u56fe"
                        :(LocalIndex.artworkSources(targetDir).length()>0?"\u81ea\u5df1\u7684\u6587\u4ef6 \u00b7 \u672c\u5730\u97f3\u9891\u5185\u5d4c\u5c01\u9762":"\u6682\u65e0\u672c\u5730\u5c01\u9762");
                ImageView headerCover=GlassUi.bindWorkDetailHeader(this,detailHeader,
                        targetDir.optString("name",title),root.optString("name","\u672c\u5730")+"||"+localCoverOrigin,
                        targetDir.optString("path",title),targetDir.optInt("count",visible.size()),
                        targetDir.optBoolean("lyric"),LocalFavorites.contains(this,targetDir),card,
                        ()->{ boolean added=LocalFavorites.toggle(this,targetDir); refreshRows();
                            GlassUi.toast(this,added?"\u5df2\u52a0\u5165\u672c\u5730\u6536\u85cf":"\u5df2\u53d6\u6d88\u672c\u5730\u6536\u85cf"); },
                        ()->prepareUpload(targetDir),
                        playTarget!=null?()->open(playTarget):null,
                        ()->{ if(!isFinishing() && !isDestroyed()) refreshRows(); });
                LocalArt.show(getApplicationContext(),headerCover,targetDir.optString("cover"),
                        LocalIndex.artworkSources(targetDir),icon("ic_baseline_album_24",android.R.drawable.ic_menu_gallery));
            } else if(detailHeader!=null) {
                detailHeader.setVisibility(View.GONE);
            }
            list.setVisibility(albums?View.GONE:View.VISIBLE); grid.setVisibility(albums?View.VISIBLE:View.GONE);
            empty.setVisibility(visible.isEmpty()?View.VISIBLE:View.GONE);
            if(!busy) status.setText(visible.size()+(albums?" \u90e8\u4f5c\u54c1":" \u9879"));
            add.setEnabled(!busy); management.setEnabled(!busy); adapter.notifyDataSetChanged(); albumAdapter.notifyDataSetChanged();
        } catch(Exception e) { error("\u663e\u793a\u672c\u5730\u4f5c\u54c1\u5931\u8d25",e); }
    }
    private JSONObject findFolderNode(JSONObject root,String uri) {
        if(root==null) return null;
        JSONArray entries=root.optJSONArray("entries");
        if(entries!=null) for(int i=0;i<entries.length();i++) {
            JSONObject n=entries.optJSONObject(i);
            if(n!=null && n.optBoolean("directory") && n.optString("uri").equals(uri)) return n;
        }
        return root;
    }
    private JSONObject findRoot(String uri) {
        for(int i=0;i<roots.length();i++) { JSONObject r=roots.optJSONObject(i); if(r!=null && r.optString("uri").equals(uri)) return r; }
        return null;
    }
    private String folderName(JSONObject root,String uri) throws Exception {
        if(root==null) return "\u672c\u5730\u4f5c\u54c1";
        JSONArray entries=root.getJSONArray("entries");
        for(int i=0;i<entries.length();i++) if(entries.getJSONObject(i).optString("uri").equals(uri)) return entries.getJSONObject(i).optString("name");
        parent=root.optString("document"); return root.optString("name");
    }
    private void open(JSONObject node) {
        if(node.optBoolean("directory")) {
            source=node.optString("source"); parent=node.has("entries")?node.optString("document"):node.optString("uri");
            search.setText(""); refreshRows(); list.setSelection(0); grid.setSelection(0); return;
        }
        if(binder==null) { Toast.makeText(this,"\u64ad\u653e\u670d\u52a1\u8fde\u63a5\u4e2d",Toast.LENGTH_SHORT).show(); return; }
        if(busy) { Toast.makeText(this,"\u8bf7\u7b49\u5f85\u626b\u63cf\u5b8c\u6210",Toast.LENGTH_SHORT).show(); return; }
        try {
            List<JSONObject> queue=LocalIndex.playlist(visible); int selected=-1;
            for(int i=0;i<queue.size();i++) if(queue.get(i).optString("mediaStreamUrl").equals(node.optString("uri"))) selected=i;
            if(selected<0) return;
            final int index=selected; final JSONObject track=queue.get(index); final AudioService.CtrlBinder player=binder;
            busy=true; cancel=false; add.setEnabled(false); status.setText("\u6253\u5f00\u97f3\u8f68\u2026");
            LocalDocuments.IO.execute(()-> {
                try(android.os.ParcelFileDescriptor fd=getContentResolver().openFileDescriptor(Uri.parse(track.getString("mediaStreamUrl")),"r")) {
                    if(fd==null) throw new java.io.IOException("Audio unavailable");
                    LocalPlayback.prepareCover(getApplicationContext(),track);
                    ui(()-> {
                        busy=false;
                        if(cancel) { refreshRows(); return; }
                        try {
                            player.play(queue,index);
                            if(PlaybackOptions.enabled(this) && track.optString("mediaStreamUrl").equals(resumeUri)) {
                                player.getExoPlayer().seekTo(index,Math.max(0,resumeSeek)); resumeUri="";
                            }
                            PlayerNavigation.openPlayer(host);
                        }
                        catch(Exception e) { error("\u6253\u5f00\u97f3\u8f68\u5931\u8d25",e); }
                        refreshRows();
                    });
                } catch(Exception e) { ui(()-> { busy=false; error("\u6587\u4ef6\u65e0\u6cd5\u8bfb\u53d6",e); refreshRows(); }); }
            });
        } catch(Exception e) { error("\u64ad\u653e\u5931\u8d25",e); }
    }
    private void choose() {
        if(loading || busy) return;
        try {
            Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
            startActivityForResult(intent,72);
        } catch(Exception e) { error("\u65e0\u6cd5\u6253\u5f00\u6587\u4ef6\u5939\u9009\u62e9\u5668",e); }
    }
    void onActivityResult(int request,int result,Intent data) {
        if(request==73) {
            String expected=pendingWriteSource; pendingWriteSource="";
            if(result!=RESULT_OK || data==null || data.getData()==null) return;
            try {
                Uri uri=data.getData();
                if(!uri.toString().equals(expected) || (data.getFlags()&Intent.FLAG_GRANT_WRITE_URI_PERMISSION)==0)
                    throw new SecurityException("\u8bf7\u9009\u62e9\u539f\u5bfc\u5165\u6587\u4ef6\u5939\u5e76\u5141\u8bb8\u5199\u5165");
                getContentResolver().takePersistableUriPermission(uri,data.getFlags()
                        &(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION));
                Toast.makeText(this,"\u6388\u6743\u5b8c\u6210\uff0c\u8bf7\u91cd\u65b0\u9009\u62e9\u4f5c\u54c1\u5e76\u786e\u8ba4\u5220\u9664",Toast.LENGTH_LONG).show();
            } catch(Exception e) { error("\u672a\u83b7\u5f97\u5220\u9664\u6743\u9650",e); }
            return;
        }
        if(request!=72 || result!=RESULT_OK || data==null || data.getData()==null) return;
        try {
            Uri uri=data.getData();
            getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);
            rescan(uri.toString());
        } catch(Exception e) { error("\u6587\u4ef6\u5939\u6388\u6743\u5931\u8d25",e); }
    }
    private void rescan(String uri) {
        if(loading || busy) return;
        busy=true; cancel=false; add.setEnabled(false); status.setText("\u626b\u63cf\u4e2d\u2026");
        add.setVisibility(View.GONE); refresh.setVisibility(View.VISIBLE);
        refresh.setContentDescription("\u53d6\u6d88\u626b\u63cf");
        refresh.setImageResource(icon("ic_baseline_close_24",android.R.drawable.ic_menu_close_clear_cancel));
        Context context=getApplicationContext();
        LocalDocuments.IO.execute(()-> {
            try {
                LocalDocuments provider=new LocalDocuments(context,Uri.parse(uri)); LocalIndex.Entry root=provider.root();
                JSONObject scanned=LocalIndex.scan(root,provider,new LocalIndex.Progress() {
                    long last;
                    public boolean cancelled() { return cancel; }
                    public void update(int folders,int tracks) {
                        long now=SystemClock.elapsedRealtime(); if(now-last<200) return; last=now;
                        ui(()->status.setText("\u626b\u63cf\u4e2d\uff1a"+folders+" \u4e2a\u76ee\u5f55 / "+tracks+" \u9996\u97f3\u8f68"));
                    }
                }).put("document",root.uri).put("uri",uri);
                if(cancel) throw new CancellationException();
                JSONArray saved=LocalIndex.replace(LocalDocuments.load(context),scanned);
                LocalDocuments.save(context,saved);
                ui(()-> { roots=saved; source=""; parent=""; search.setText(""); done(); });
            } catch(CancellationException e) { ui(()-> { done(); Toast.makeText(this,"\u5df2\u53d6\u6d88\uff0c\u539f\u7d22\u5f15\u4fdd\u7559",Toast.LENGTH_SHORT).show(); }); }
            catch(Exception e) { ui(()-> { done(); error("\u626b\u63cf\u5931\u8d25\uff0c\u539f\u7d22\u5f15\u4fdd\u7559",e); }); }
        });
    }
    private void done() {
        busy=false; refresh.setContentDescription("\u91cd\u65b0\u626b\u63cf");
        refresh.setVisibility(View.GONE); add.setVisibility(View.VISIBLE);
        android.graphics.drawable.Drawable sf=GlassUi.sfDrawable(this,"ic_baseline_loop_24");
        if(sf!=null) refresh.setImageDrawable(sf);
        else refresh.setImageResource(icon("ic_baseline_loop_24",android.R.drawable.ic_popup_sync));
        refreshRows();
    }
    private void manage() {
        String[] names=new String[roots.length()]; for(int i=0;i<names.length;i++) names[i]=roots.optJSONObject(i).optString("name");
        showDialog(dialog("\u5bfc\u5165\u6e90").setItems(names,(dialog,which)->sourceMenu(roots.optJSONObject(which))));
    }
    private void sourceMenu(JSONObject root) {
        if(busy || loading) return;
        showDialog(dialog(root.optString("name"))
                .setItems(new String[]{"\u91cd\u65b0\u626b\u63cf","\u79fb\u9664\u5bfc\u5165"},(dialog,which)-> {
                    if(which==0) rescan(root.optString("uri"));
                    else showDialog(dialog("\u79fb\u9664\u5bfc\u5165\uff1f")
                            .setMessage("\u53ea\u79fb\u9664\u7d22\u5f15\uff0c\u4e0d\u5220\u9664\u539f\u6587\u4ef6\u3002")
                            .setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u79fb\u9664",(d,w)->remove(root.optString("uri"))));
                }));
    }
    private void showRowInfo(JSONObject row) {
        if(row.has("entries")) sourceMenu(row);
        else showDialog(dialog(row.optString("name")).setMessage(row.optString("path"))
                .setPositiveButton("\u786e\u5b9a",null));
    }
    void managementMenu() {
        if(busy || loading) return;
        LinearLayout body=new LinearLayout(this); body.setOrientation(1); body.setPadding(dp(10),0,dp(10),dp(14));
        LinearLayout toggleRow=new LinearLayout(this); toggleRow.setGravity(Gravity.CENTER_VERTICAL); toggleRow.setPadding(dp(12),0,dp(12),0);
        TextView title=text("\u5141\u8bb8\u5220\u9664\u539f\u6587\u4ef6",16,ThemePalettes.text(card));
        toggleRow.addView(title,new LinearLayout.LayoutParams(0,dp(64),1)); title.setGravity(Gravity.CENTER_VERTICAL);
        Switch toggle=new Switch(this); toggle.setContentDescription("\u5141\u8bb8\u5220\u9664\u672c\u5730\u539f\u6587\u4ef6"); toggle.setChecked(deleteEnabled);
        GlassUi.styleIosSwitch(this,toggle,danger());
        toggle.setOnCheckedChangeListener((button,checked)-> {
            if(busy) return;
            deleteEnabled=checked;
            button.invalidate();
            management.setImageTintList(ColorStateList.valueOf(deleteEnabled?
                    danger():ThemePalettes.text(page)));
            management.setContentDescription(deleteEnabled?"\u672c\u5730\u7ba1\u7406\uff0c\u5220\u9664\u6a21\u5f0f\u5df2\u5f00\u542f":"\u672c\u5730\u7ba1\u7406");
        });
        toggleRow.addView(toggle,new LinearLayout.LayoutParams(dp(50),dp(30))); body.addView(toggleRow);
        View divider=new View(this); divider.setBackgroundColor(ThemePalettes.light(card)?0x18202731:0x18e9edf6);
        LinearLayout.LayoutParams line=new LinearLayout.LayoutParams(-1,dp(1)); line.setMargins(dp(12),dp(4),dp(12),dp(4)); body.addView(divider,line);
        AlertDialog menu=dialog("\u672c\u5730\u7ba1\u7406").setView(body).setNegativeButton("\u5b8c\u6210",null).create();
        body.addView(menuAction("ic_baseline_sort_24","\u64ad\u653e\u5217\u8868",()-> { menu.dismiss(); PlayerNavigation.openQueue(host); }));
        body.addView(menuAction("ic_baseline_loop_24","\u91cd\u65b0\u626b\u63cf",()-> {
            menu.dismiss(); if(!source.isEmpty()) rescan(source); else if(roots.length()>0) manage(); else choose();
        }));
        body.addView(menuAction("ic_baseline_folder_24","\u5bfc\u5165\u6e90",()-> { menu.dismiss(); if(roots.length()>0) manage(); else choose(); }));
        body.addView(menuAction("ic_baseline_loop_24","\u67e5\u770b\u4e0a\u4f20\u4efb\u52a1",()-> { menu.dismiss(); showUploadProgress(BaiduTransfer.current()); }));
        body.addView(menuAction("ic_baseline_more_horiz_24","\u64ad\u653e\u8bbe\u7f6e",()-> { menu.dismiss(); startActivity(new Intent().setClassName(this,getPackageName()+".MoreActivity")); }));
        menu.show(); styleDialog(menu);
    }
    private View menuAction(String iconName,String label,Runnable action) {
        LinearLayout row=new LinearLayout(this); row.setGravity(Gravity.CENTER_VERTICAL); row.setPadding(dp(12),0,dp(12),0);
        ImageView iconView=new ImageView(this);
        android.graphics.drawable.Drawable sf=GlassUi.sfDrawable(this,iconName);
        if(sf!=null) iconView.setImageDrawable(sf);
        else iconView.setImageResource(icon(iconName,android.R.drawable.ic_menu_agenda));
        iconView.setImageTintList(ColorStateList.valueOf(accent()));
        row.addView(iconView,new LinearLayout.LayoutParams(dp(22),dp(22)));
        TextView title=text(label,16,ThemePalettes.text(card)); title.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams words=new LinearLayout.LayoutParams(-1,dp(52)); words.leftMargin=dp(14); row.addView(title,words);
        row.setBackground(GlassUi.iosPressable(this,card,10,0,0,0)); row.setOnClickListener(v-> {
            GlassUi.hapticTick(v); action.run();
        });
        return row;
    }
    private void prepareUpload(JSONObject row) {
        if(busy || loading) return;
        if(BaiduTransfer.running()) { showUploadProgress(BaiduTransfer.current()); return; }
        final String tree=row.optString("source"),target=row.has("entries")?row.optString("document"):row.optString("uri");
        final JSONObject imported=findRoot(tree);
        if(imported==null || target.isEmpty()) { error("\u65e0\u6cd5\u4e0a\u4f20",new IllegalStateException("\u8bf7\u91cd\u65b0\u5bfc\u5165\u672c\u5730\u4f5c\u54c1")); return; }
        busy=true; cancel=false; refreshRows(); status.setText("\u68c0\u67e5\u4f5c\u54c1\u6587\u4ef6\u2026"); Context context=getApplicationContext();
        LocalDocuments.IO.execute(()-> {
            try {
                String document=imported.getString("document"); JSONArray entries=imported.getJSONArray("entries"); boolean found=false;
                for(int i=0;i<entries.length();i++) { JSONObject node=entries.getJSONObject(i);
                    if(node.optBoolean("directory") && LocalDeletion.key(node.getString("uri")).equals(LocalDeletion.key(target))) { found=true; break; }
                }
                if(!found) throw new java.io.IOException("\u8bf7\u9009\u62e9\u5df2\u5bfc\u5165\u7684\u4f5c\u54c1\u6587\u4ef6\u5939");
                String account=BaiduCloud.api(context).state().optString("owner");
                if(account.isEmpty()) throw new java.io.IOException("\u8bf7\u5148\u5728\u4e91\u7aef\u4f5c\u54c1\u4e2d\u8fde\u63a5\u767e\u5ea6\u7f51\u76d8");
                String cloudRoot;
                try { cloudRoot=BaiduApi.libraryRoot(context.getSharedPreferences("baidu_library",0).getString("root:"+account,"")); }
                catch(Exception e) { throw new java.io.IOException("\u8bf7\u5148\u5728\u4e91\u7aef\u4f5c\u54c1\u4e2d\u9009\u62e9\u4f5c\u54c1\u76ee\u5f55"); }
                BaiduUpload.Progress progress=new BaiduUpload.Progress() {
                    long last;
                    public boolean cancelled() { return cancel; }
                    public void update(String phase,String name,int complete,int total,long done,long bytes) {
                        if(System.currentTimeMillis()-last>400) { last=System.currentTimeMillis(); ui(()->status.setText("\u68c0\u67e5\u6587\u4ef6\u4e2d\u2026  "+complete+" \u4e2a")); }
                    }
                };
                BaiduUpload.Plan plan=BaiduUpload.prepare(document,target,BaiduTransfer.source(context,tree),progress);
                ui(()-> { busy=false; refreshRows(); if(!cancel) confirmUpload(plan,account,cloudRoot); });
            } catch(CancellationException ignored) { ui(()-> { busy=false; refreshRows(); }); }
            catch(Exception e) { ui(()-> { busy=false; refreshRows(); error("\u65e0\u6cd5\u51c6\u5907\u4e0a\u4f20",e); }); }
        });
    }
    private void confirmUpload(BaiduUpload.Plan plan,String owner,String root) {
        LinearLayout body=new LinearLayout(this); body.setOrientation(1); body.setPadding(dp(22),0,dp(22),dp(8));
        String details="\u76ee\u6807\u7f51\u76d8\u76ee\u5f55\uff1a\n"+root+"\n\n"+plan.files+" \u4e2a\u6587\u4ef6\uff0c"+plan.folders+" \u4e2a\u6587\u4ef6\u5939\uff0c"+(plan.unknownSizes?"\u81f3\u5c11 ":"")+
                String.format(Locale.ROOT,"%.1f MB",plan.bytes/1048576.0)+"\n\n\u4f1a\u4e0a\u4f20\u8be5\u4f5c\u54c1\u7684\u5168\u90e8\u6587\u4ef6\u3002\u4e91\u7aef\u540c\u540d\u65f6\u4e0d\u4f1a\u8986\u76d6\uff1b\u672c\u5730\u539f\u6587\u4ef6\u4fdd\u7559\u3002\n\u8bf7\u4fdd\u6301\u8f6f\u4ef6\u6253\u5f00\uff0c\u7cfb\u7edf\u7ed3\u675f\u8fdb\u7a0b\u65f6\u4e0a\u4f20\u53ef\u80fd\u4e2d\u65ad\u3002";
        body.addView(text(details,14,ThemePalettes.text(card)));
        TextView caption=text("\u4e91\u7aef\u6587\u4ef6\u5939\u540d\u79f0",13,ThemePalettes.secondary(card)); caption.setPadding(0,dp(12),0,0); body.addView(caption);
        EditText name=new EditText(this); name.setSingleLine(); name.setText(plan.name); name.setTextColor(ThemePalettes.text(card)); body.addView(name);
        ScrollView scroll=new ScrollView(this); scroll.addView(body);
        AlertDialog prompt=showDialog(dialog("\u4e0a\u4f20\u4f5c\u54c1\u5230\u767e\u5ea6\u7f51\u76d8\uff1f").setView(scroll)
                .setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u786e\u8ba4\u4e0a\u4f20",null));
        prompt.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v-> {
            try { String selected=BaiduUpload.name(name.getText().toString());
                BaiduTransfer.Job job=BaiduTransfer.start(this,plan,owner,root,selected); prompt.dismiss(); showUploadProgress(job);
            } catch(Exception e) { name.setError(e.getMessage()); }
        });
    }
    private void showUploadProgress(BaiduTransfer.Job job) {
        if(job==null) { showDialog(dialog("\u4e0a\u4f20\u4efb\u52a1").setMessage("\u6682\u65e0\u4e0a\u4f20\u4efb\u52a1").setPositiveButton("\u77e5\u9053\u4e86",null)); return; }
        LinearLayout body=new LinearLayout(this); body.setOrientation(1); body.setPadding(dp(22),dp(4),dp(22),dp(10));
        TextView state=text("",15,ThemePalettes.text(card)); state.setMaxLines(6); body.addView(state);
        ProgressBar bar=new ProgressBar(this,null,android.R.attr.progressBarStyleHorizontal); bar.setMax(1000);
        LinearLayout.LayoutParams line=new LinearLayout.LayoutParams(-1,dp(12)); line.topMargin=dp(16); body.addView(bar,line);
        AlertDialog dialog=showDialog(dialog("\u4e0a\u4f20\u4efb\u52a1").setView(body).setNegativeButton("\u53d6\u6d88\u4e0a\u4f20",null).setPositiveButton("\u5173\u95ed",null));
        boolean wasKept=(getWindow().getAttributes().flags&WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)!=0;
        if(job.running && !wasKept) getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        Button cancelButton=dialog.getButton(AlertDialog.BUTTON_NEGATIVE); cancelButton.setOnClickListener(v->{ job.cancel=true; cancelButton.setEnabled(false); });
        final Runnable[] ticker=new Runnable[1];
        ticker[0]=()-> {
            if(!dialog.isShowing() || isFinishing() || isDestroyed()) return;
            cancelButton.setVisibility(job.running?View.VISIBLE:View.GONE); cancelButton.setEnabled(job.running && !job.cancel);
            if(job.running) {
                String label=job.cancel?"\u6b63\u5728\u53d6\u6d88\u2026":job.stage.equals("hash")?"\u6b63\u5728\u8ba1\u7b97\u6587\u4ef6\u6821\u9a8c\u503c\u2026":job.stage.equals("scan")?"\u6b63\u5728\u68c0\u67e5\u76ee\u5f55\u2026":"\u6b63\u5728\u4e0a\u4f20\u2026";
                state.setText(label+"\n"+job.name+"\n"+job.completed+" / "+job.total+" \u4e2a\u6587\u4ef6");
                boolean known=job.stage.equals("upload") && job.bytes>0 && job.done<=job.bytes;
                bar.setIndeterminate(!known); if(known) bar.setProgress((int)Math.min(1000,job.done*1000.0/job.bytes));
                main.postDelayed(ticker[0],350);
            } else { state.setText(job.message); bar.setIndeterminate(false); bar.setProgress(job.message.startsWith("\u4e0a\u4f20\u5b8c\u6210")?1000:0); }
        };
        dialog.setOnDismissListener(d->{ main.removeCallbacks(ticker[0]); if(!wasKept) getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); });
        ticker[0].run();
    }
    private void prepareDeletion(JSONObject row) {
        if(!deleteEnabled || busy || loading) return;
        if(BaiduTransfer.running()) { error("\u6682\u65e0\u6cd5\u5220\u9664",new IllegalStateException("\u8bf7\u7b49\u5f85\u4e0a\u4f20\u7ed3\u675f\u6216\u53d6\u6d88\u4e0a\u4f20")); return; }
        String tree=row.optString("source");
        String target=row.has("entries")?row.optString("document"):row.optString("uri");
        if(!LocalDeletion.hasWrite(this,tree)) {
            showDialog(dialog("\u9700\u8981\u6587\u4ef6\u5939\u5199\u6743\u9650")
                    .setMessage("\u539f\u5bfc\u5165\u4ec5\u6709\u8bfb\u53d6\u6743\u9650\u3002\u8bf7\u91cd\u65b0\u6388\u6743\u540c\u4e00\u4e2a\u5bfc\u5165\u6587\u4ef6\u5939\uff0c\u6388\u6743\u540e\u4ecd\u9700\u518d\u6b21\u786e\u8ba4\u5220\u9664\u3002")
                    .setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u6388\u6743\u6587\u4ef6\u5939",(d,w)-> {
                        if(!deleteEnabled || busy) return;
                        pendingWriteSource=tree;
                        Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
                        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                                |Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
                        intent.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI,Uri.parse(tree));
                        try { startActivityForResult(intent,73); }
                        catch(Exception e) { pendingWriteSource=""; error("\u65e0\u6cd5\u6388\u6743\u6587\u4ef6\u5939",e); }
                    })); return;
        }
        busy=true; cancel=false; add.setEnabled(false); management.setEnabled(false);
        status.setText("\u68c0\u67e5\u5220\u9664\u8303\u56f4\u2026");
        Context context=getApplicationContext();
        LocalDocuments.IO.execute(()-> {
            try {
                LocalDeletion.Snapshot snapshot=LocalDeletion.prepare(LocalDocuments.load(context),tree,target,
                        LocalDeletion.provider(context,tree),()->cancel);
                ui(()-> { busy=false; refreshRows(); if(!cancel && deleteEnabled) confirmDeletion(snapshot); });
            } catch(CancellationException e) { ui(()-> { busy=false; refreshRows(); }); }
            catch(Exception e) { ui(()-> { busy=false; refreshRows(); error("\u65e0\u6cd5\u5220\u9664\u6b64\u4f5c\u54c1",e); }); }
        });
    }
    private void confirmDeletion(LocalDeletion.Snapshot snapshot) {
        int ink=ThemePalettes.text(card),danger=ThemePalettes.light(card)?0xffb3261e:0xffffb4ab;
        LinearLayout body=new LinearLayout(this); body.setOrientation(1); body.setPadding(dp(20),dp(12),dp(20),dp(8));
        body.setBackgroundColor(card);
        String details=snapshot.name+"\n"+snapshot.path+"\n\n"+snapshot.files+" \u4e2a\u6587\u4ef6\uff0c"+
                snapshot.tracks+" \u9996\u97f3\u8f68\uff0c"+snapshot.folders+" \u4e2a\u6587\u4ef6\u5939\u3002\n\n"+
                "\u5c06\u5220\u9664\u8be5\u6587\u4ef6\u5939\u53ca\u5176\u5168\u90e8\u5185\u5bb9\uff0c\u5305\u62ec\u5b50\u76ee\u5f55\u3001\u5c01\u9762\u548c\u5b57\u5e55\u7b49\u539f\u6587\u4ef6\u3002\n"+
                "\u4e0d\u662f\u4ec5\u79fb\u9664\u5bfc\u5165\u8bb0\u5f55\uff0c\u6b64\u64cd\u4f5c\u4e0d\u53ef\u64a4\u9500\u3002";
        body.addView(text(details,15,ink),new LinearLayout.LayoutParams(-1,-2));
        CheckBox confirm=new CheckBox(this); confirm.setText("\u786e\u8ba4\u5220\u9664\u6b64\u6587\u4ef6\u5939\u53ca\u5168\u90e8\u5185\u5bb9");
        confirm.setTextColor(ink); confirm.setButtonTintList(ColorStateList.valueOf(danger)); body.addView(confirm);
        ScrollView scroll=new ScrollView(this); scroll.addView(body);
        AlertDialog dialog=dialog("\u5220\u9664\u672c\u5730\u539f\u6587\u4ef6\uff1f")
                .setView(scroll).setNegativeButton("\u53d6\u6d88",null).setPositiveButton("\u5220\u9664\u539f\u6587\u4ef6",null).create();
        dialog.setOnShowListener(d-> {
            styleDialog(dialog);
            Button positive=dialog.getButton(AlertDialog.BUTTON_POSITIVE); positive.setTextColor(ThemePalettes.secondary(card)); positive.setEnabled(false);
            confirm.setOnCheckedChangeListener((button,checked)-> {
                positive.setEnabled(checked);
                positive.setTextColor(checked?(ThemePalettes.light(card)?0xffffffff:0xff511512):ThemePalettes.secondary(card));
                positive.setBackground(new RippleDrawable(ColorStateList.valueOf(0x22999999),shape(checked?danger:card),null));
            });
            positive.setOnClickListener(v-> {
                if(!confirm.isChecked() || !deleteEnabled || busy) return;
                dialog.dismiss(); deleteConfirmed(snapshot);
            });
        });
        dialog.show();
    }
    private void deleteConfirmed(LocalDeletion.Snapshot snapshot) {
        try {
            if(binder==null) throw new IllegalStateException("\u64ad\u653e\u670d\u52a1\u672a\u8fde\u63a5\uff0c\u6682\u65e0\u6cd5\u68c0\u67e5\u64ad\u653e\u961f\u5217\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5");
            List<JSONObject> queue=binder.getPlaybackQueue();
            LocalDeletion.begin(snapshot,queue==null?Collections.emptyList():new ArrayList<>(queue),deleteEnabled,true);
        } catch(Exception e) { error("\u672a\u5220\u9664\u4f5c\u54c1",e); return; }
        busy=true; deleting=true; cancel=false; add.setEnabled(false); management.setEnabled(false);
        status.setText("\u5220\u9664\u539f\u6587\u4ef6\u4e2d\u2026");
        Context context=getApplicationContext();
        LocalDocuments.IO.execute(()-> {
            boolean deleted=false;
            try {
                JSONArray current=LocalDocuments.load(context);
                LocalDeletion.execute(snapshot,current,LocalDeletion.provider(context,snapshot.source),true,true); deleted=true;
                JSONArray next=LocalDeletion.prune(current,snapshot); LocalDocuments.save(context,next);
                ui(()-> { roots=next; Toast.makeText(this,"\u539f\u6587\u4ef6\u5df2\u5220\u9664",Toast.LENGTH_SHORT).show(); });
            } catch(Exception e) {
                final boolean physicalDeleted=deleted;
                ui(()->error(physicalDeleted?"\u539f\u6587\u4ef6\u5df2\u5220\u9664\uff0c\u5217\u8868\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u626b\u63cf":"\u5220\u9664\u672a\u5b8c\u6210\uff0c\u7d22\u5f15\u4fdd\u7559",e));
            } finally {
                LocalDeletion.finish(snapshot);
                ui(()-> { busy=false; deleting=false; refreshRows(); });
            }
        });
    }
    private void remove(String uri) {
        busy=true; Context context=getApplicationContext();
        LocalDocuments.IO.execute(()-> {
            try {
                JSONArray saved=LocalDocuments.load(context),next=new JSONArray();
                for(int i=0;i<saved.length();i++) if(!saved.getJSONObject(i).optString("uri").equals(uri)) next.put(saved.getJSONObject(i));
                LocalDocuments.save(context,next); ui(()-> { roots=next; done(); });
            } catch(Exception e) { ui(()-> { done(); error("\u79fb\u9664\u5931\u8d25",e); }); }
        });
    }
    boolean handleBack() {
        if(busy || !search.getText().toString().isEmpty() || !source.isEmpty()) { back(); return true; }
        return false;
    }
    void back() {
        if(busy) { if(!deleting) cancel=true; return; }
        if(!search.getText().toString().isEmpty()) { search.setText(""); return; }
        if(!source.isEmpty()) { source=""; parent=""; refreshRows(); list.setSelection(0); grid.setSelection(0); }
        else if(!embedded) host.finish();
    }
    void onNewIntent(Intent intent) {
        launchIntent=intent;
        if(intent.hasExtra(AppShell.EXTRA_TAB)) {
            boolean favorites=intent.getIntExtra(AppShell.EXTRA_TAB,0)==1;
            requestTab(favorites);
            return;
        }
        String nextSource=intent.getStringExtra("source"),nextParent=intent.getStringExtra("parent");
        if(nextSource==null || nextParent==null) return;
        resumeUri=""; resumeSeek=0;
        if(!source.equals(nextSource) || !parent.equals(nextParent)) {
            source=nextSource; parent=nextParent; search.setText(""); refreshRows();
            list.setSelection(0); grid.setSelection(0);
        }
    }
    void onConfigurationChanged(android.content.res.Configuration configuration) {
        main.postDelayed(()-> { if(!isDestroyed()) albumAdapter.notifyDataSetChanged(); },100);
    }
    void onSaveInstanceState(Bundle state) {
        state.putBoolean("favorites",favoritesMode);
        state.putString("write_source",pendingWriteSource);
        state.putString("resume_uri",resumeUri); state.putLong("resume_seek",resumeSeek);
        state.putString("source",source); state.putString("parent",parent); state.putString("query",search.getText().toString());
    }
    void onStart() { if(mini!=null) mini.active(true); }
    void onStop() { if(mini!=null) mini.active(false); }
    void onDestroy() { cancel=true; main.removeCallbacks(filter); if(mini!=null) mini.dispose(); if(bound) unbindService(this); }
    public void onServiceConnected(ComponentName name,IBinder service) { binder=(AudioService.CtrlBinder)service; if(mini!=null) mini.attach(binder); }
    public void onServiceDisconnected(ComponentName name) { binder=null; if(mini!=null) mini.attach(null); }
}
