package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.IBinder;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Bridges the existing library screens to the shared iOS visual shell. */
public final class AppShell {
    static final String EXTRA_SOURCE = "kiko_shell_source";
    static final String EXTRA_TAB = "kiko_shell_tab";
    private static final WeakHashMap<Activity, Home> HOMES = new WeakHashMap<>();
    private static final WeakHashMap<Activity, History> HISTORIES = new WeakHashMap<>();
    private static final WeakHashMap<Activity, OnlineTreeHost> WORK_TREES = new WeakHashMap<>();
    private AppShell() {}

    private static int dp(Activity a, float value) { return GlassUi.dp(a, value); }
    private static int id(Activity a, String name) { return GlassUi.resource(a, "id", name); }
    private static Intent target(Activity a, String name) {
        return new Intent().setClassName(a, a.getPackageName() + "." + name);
    }
    static void openSource(Activity activity, int source, int tab) {
        if (activity.getClass().getSimpleName().equals("LastWatchActivity")) {
            Intent intent = target(activity, "WorksActivity");
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            intent.putExtra(EXTRA_SOURCE, source); if (tab >= 0) intent.putExtra(EXTRA_TAB, tab);
            activity.startActivity(intent); activity.finish(); return;
        }
        Home home = HOMES.get(activity);
        if (home != null) { home.switchSource(source); if (tab >= 0) home.selectTab(tab); return; }
        String name = source == 0 ? "WorksActivity" : source == 1 ? "LocalLibraryActivity" : "BaiduCloudActivity";
        Intent intent = target(activity, name);
        if (source == 0) intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        else intent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
        if (tab >= 0) intent.putExtra(EXTRA_TAB, tab);
        activity.startActivity(intent);
    }
    static void openHistory(Activity activity, int source) {
        Intent intent = target(activity, "LastWatchActivity");
        intent.putExtra(EXTRA_SOURCE, source);
        activity.startActivity(intent);
    }
    static void openOnlineSearch(Activity activity) { activity.startActivity(target(activity, "SearchActivity")); }
    public static void openSettings(Activity activity) { activity.startActivity(target(activity, "MoreActivity")); }
    static GlassUi.Sources sources(Activity activity, int selected) {
        return new GlassUi.Sources(activity, selected, new Runnable[]{
                () -> openSource(activity, 0, -1),
                () -> openSource(activity, 1, -1),
                () -> openSource(activity, 2, -1)
        });
    }
    static GlassUi.Navigation navigation(Activity a, View content, ImageButton works,
            ImageButton favorite, ImageButton more, int source, Runnable search, int initial) {
        ImageButton history = GlassUi.icon(a, "ic_clock_black_24dp", "\u5386\u53f2", v -> {
            if (!a.getClass().getSimpleName().equals("LastWatchActivity")) openHistory(a, source);
        });
        ImageButton[] icons = {works, favorite, history, more};
        String[] names = {"\u4f5c\u54c1", "\u6536\u85cf", "\u5386\u53f2", "\u66f4\u591a"};
        Runnable[] actions = {works::performClick, favorite::performClick, history::performClick, more::performClick};
        return new GlassUi.Navigation(a, content, icons, names, actions, search, initial);
    }
    static void styleMini(Activity activity, View mini, View content) {
        if (!(mini.getBackground() instanceof GlassUi.FrostDrawable)) {
            mini.setBackground(new GlassUi.FrostDrawable(activity, content, mini, 18));
        } else {
            mini.getBackground().invalidateSelf();
        }
        refreshMini(activity, mini);
    }
    private static void refreshMini(Activity activity, View mini) {
        int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
        int ink = ThemePalettes.text(page), secondary = ThemePalettes.secondary(page);
        View title = mini.findViewById(id(activity, "textView"));
        View subtitle = mini.findViewById(id(activity, "textView2"));
        View play = mini.findViewById(id(activity, "button"));
        View lyrics = mini.findViewById(id(activity, "imageButton"));
        if (title instanceof TextView) {
            ((TextView)title).setTextColor(ink);
            ((TextView)title).setTypeface(GlassUi.mediumFont());
        }
        if (subtitle instanceof TextView) ((TextView)subtitle).setTextColor(secondary);
        if (play instanceof ImageButton) ((ImageButton)play).setImageTintList(ColorStateList.valueOf(ink));
        if (lyrics instanceof ImageButton) ((ImageButton)lyrics).setImageTintList(ColorStateList.valueOf(GlassUi.RED));
        mini.invalidate();
    }
    static void styleWorkTree(Activity activity) {
        View mini = activity.findViewById(id(activity, "bottomLayout"));
        View content = activity.findViewById(id(activity, "recyclerView"));
        if (mini == null || content == null) return;
        styleMini(activity, mini, content);
        if (mini.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams)mini.getLayoutParams();
            int mH = dp(activity, 12), mB = dp(activity, 8), h = dp(activity, 66);
            if (lp.leftMargin != mH || lp.rightMargin != mH || lp.bottomMargin != mB || lp.height != h) {
                lp.leftMargin = mH;
                lp.rightMargin = mH;
                lp.bottomMargin = mB;
                lp.height = h;
                mini.setLayoutParams(lp);
            }
        }
        OnlineTreeHost host = WORK_TREES.get(activity);
        if (host == null) {
            host = new OnlineTreeHost(activity, (RecyclerView)content, mini);
            WORK_TREES.put(activity, host);
            host.install();
        }
        host.refresh();
    }

    private static final class OnlineTreeHost {
        final Activity activity;
        final RecyclerView recycler;
        final View mini;
        android.widget.ScrollView preloadScroll;
        LinearLayout preloadHeader;
        LinearLayout embeddedHeader;
        LinearLayout upFolderRow;
        TextView upFolderText;
        RecyclerView.Adapter<?> observedAdapter;
        RecyclerView.Adapter<?> lastSeenAdapter;
        boolean navConfigured;

        OnlineTreeHost(Activity activity, RecyclerView recycler, View mini) {
            this.activity = activity;
            this.recycler = recycler;
            this.mini = mini;
        }

        void install() {
            View headerInfo = activity.findViewById(id(activity, "header_info"));
            if (headerInfo != null) {
                headerInfo.setVisibility(View.GONE);
            }
            View swipe = activity.findViewById(id(activity, "swipe"));
            if (swipe != null && swipe.getParent() instanceof ViewGroup) {
                ViewGroup parent = (ViewGroup)swipe.getParent();
                int idx = parent.indexOfChild(swipe);
                FrameLayout centerStage = new FrameLayout(activity);
                parent.removeViewAt(idx);
                parent.addView(centerStage, idx, new LinearLayout.LayoutParams(-1, 0, 1f));
                centerStage.addView(swipe, new FrameLayout.LayoutParams(-1, -1));

                preloadScroll = new android.widget.ScrollView(activity);
                preloadScroll.setTag("online_tree_header_host");
                preloadScroll.setFillViewport(true);
                preloadScroll.setPadding(dp(activity, 12), dp(activity, 4), dp(activity, 12), dp(activity, 24));
                preloadScroll.setClipToPadding(false);
                preloadHeader = GlassUi.buildWorkDetailHeader(activity);
                preloadScroll.addView(preloadHeader, new FrameLayout.LayoutParams(-1, -2));
                centerStage.addView(preloadScroll, new FrameLayout.LayoutParams(-1, -1));
            }

            Runnable pad = () -> {
                int bottom = mini.getVisibility() == View.VISIBLE ? dp(activity, 84) : dp(activity, 16);
                int hPad = isBrowsingWorks() ? dp(activity, 4) : dp(activity, 12);
                if (recycler.getPaddingBottom() != bottom || recycler.getPaddingLeft() != hPad) {
                    recycler.setClipToPadding(false);
                    recycler.setPadding(hPad, dp(activity, 4), hPad, bottom);
                }
                if (preloadScroll != null && preloadScroll.getPaddingBottom() != bottom) {
                    preloadScroll.setPadding(dp(activity, 12), dp(activity, 4), dp(activity, 12), bottom);
                }
            };
            mini.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> pad.run());
            recycler.post(pad);

            recycler.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                RecyclerView.Adapter<?> curr = recycler.getAdapter();
                if (curr != lastSeenAdapter) {
                    lastSeenAdapter = curr;
                    refresh();
                }
            });

            recycler.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override public void onChildViewAttachedToWindow(View view) {
                    styleAttachedRow(view);
                }
                @Override public void onChildViewDetachedFromWindow(View view) {}
            });

            recycler.getViewTreeObserver().addOnWindowFocusChangeListener(hasFocus -> {
                if (!hasFocus) return;
                recycler.post(() -> {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    refresh();
                    Object treeAdapter = getWorkTreeAdapter();
                    if (treeAdapter != null && !isBrowsingWorks()) {
                        invokeMethod(treeAdapter, "notifyDataSetChanged");
                    }
                });
            });
        }

        private Object getField(Object target, String name) {
            if (target == null) return null;
            try {
                Field f = target.getClass().getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (Throwable ignored) {
                return null;
            }
        }

        private org.json.JSONObject getWork() {
            Object w = getField(activity, "work");
            return w instanceof org.json.JSONObject ? (org.json.JSONObject)w : null;
        }

        private org.json.JSONArray getTrees() {
            Object t = getField(activity, "jsonWorkTrees");
            return t instanceof org.json.JSONArray ? (org.json.JSONArray)t : null;
        }

        private Object getWorkTreeAdapter() {
            return getField(activity, "workTreeAdapter");
        }

        private boolean isBrowsingWorks() {
            Object wa = getField(activity, "workAdapter");
            return wa != null && recycler.getAdapter() == wa;
        }

        private void configureToolbar() {
            View tb = activity.findViewById(id(activity, "toolbar"));
            if (!(tb instanceof ViewGroup)) return;
            ViewGroup toolbar = (ViewGroup)tb;
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            int ink = ThemePalettes.text(page);
            toolbar.setBackgroundColor(page);
            if (!navConfigured) {
                navConfigured = true;
                try {
                    Drawable back = GlassUi.sfDrawable(activity, "sf_chevron_left");
                    if (back != null) {
                        back.setTint(GlassUi.RED);
                        toolbar.getClass().getMethod("setNavigationIcon", Drawable.class).invoke(toolbar, back);
                        toolbar.getClass().getMethod("setNavigationOnClickListener", View.OnClickListener.class)
                                .invoke(toolbar, (View.OnClickListener)v -> {
                                    GlassUi.hapticTick(v);
                                    activity.onBackPressed();
                                });
                    }
                    Drawable more = GlassUi.sfDrawable(activity, "ic_baseline_more_horiz_24");
                    if (more != null) {
                        more.setTint(GlassUi.RED);
                        toolbar.getClass().getMethod("setOverflowIcon", Drawable.class).invoke(toolbar, more);
                    }
                } catch (Throwable ignored) {}
            }
            if (!isBrowsingWorks()) {
                org.json.JSONObject work = getWork();
                if (work != null) {
                    String rj = formatOnlineRj(work);
                    if (!rj.isEmpty() && !rj.contentEquals(activity.getTitle())) {
                        activity.setTitle(rj);
                    }
                }
            }
            for (int i = 0; i < toolbar.getChildCount(); i++) {
                View child = toolbar.getChildAt(i);
                if (child instanceof TextView) {
                    TextView tv = (TextView)child;
                    tv.setTextColor(ink);
                    tv.setTextSize(17.5f);
                    tv.setTypeface(GlassUi.boldFont());
                } else if (child instanceof ImageButton) {
                    ImageButton btn = (ImageButton)child;
                    if (btn.getDrawable() instanceof GlassUi.SfIconDrawable) {
                        btn.getDrawable().setTint(GlassUi.RED);
                    }
                }
            }
        }

        private static String formatOnlineRj(org.json.JSONObject work) {
            if (work == null) return "";
            String sourceId = work.optString("source_id", "");
            if (sourceId.startsWith("RJ") || sourceId.startsWith("BJ") || sourceId.startsWith("VJ")) {
                return sourceId;
            }
            long id = work.optLong("id", 0L);
            if (id <= 0L) return "";
            return GlassUi.extractRj("RJ" + id);
        }

        void refresh() {
            configureToolbar();
            View headerInfo = activity.findViewById(id(activity, "header_info"));
            if (headerInfo != null && headerInfo.getVisibility() != View.GONE) {
                headerInfo.setVisibility(View.GONE);
            }
            RecyclerView.Adapter<?> currentAdapter = recycler.getAdapter();
            Object treeAdapter = getWorkTreeAdapter();

            if (currentAdapter == null && treeAdapter == null && !isBrowsingWorks()) {
                if (preloadScroll != null) {
                    int pageColor = ThemePalettes.color(ThemePalettes.selected(activity), 1);
                    int cardColor = ThemePalettes.color(ThemePalettes.selected(activity), 2);
                    preloadScroll.setBackgroundColor(pageColor);
                    preloadScroll.setVisibility(View.VISIBLE);
                    bindOnlineHeader(preloadHeader, cardColor);
                }
            } else {
                if (preloadScroll != null && preloadScroll.getVisibility() != View.GONE) {
                    preloadScroll.setVisibility(View.GONE);
                }
            }

            if (currentAdapter != null && currentAdapter == treeAdapter) {
                while (recycler.getItemDecorationCount() > 0) {
                    recycler.removeItemDecorationAt(0);
                }
                if (observedAdapter != currentAdapter) {
                    observedAdapter = currentAdapter;
                    try {
                        currentAdapter.registerAdapterDataObserver(new RecyclerView.AdapterDataObserver() {
                            @Override public void onChanged() {
                                recycler.post(() -> refreshVisibleRows());
                            }
                            @Override public void onItemRangeChanged(int positionStart, int itemCount) {
                                recycler.post(() -> refreshVisibleRows());
                            }
                        });
                    } catch (Throwable ignored) {}
                }
            }
            refreshVisibleRows();
        }

        private void refreshVisibleRows() {
            configureToolbar();
            int count = recycler.getChildCount();
            for (int i = 0; i < count; i++) {
                styleAttachedRow(recycler.getChildAt(i));
            }
        }

        private void styleAttachedRow(View view) {
            if (view == null || isBrowsingWorks()) return;
            int tv7Id = id(activity, "textView7");
            int ivCoverId = id(activity, "ivCover");
            int tvCountId = id(activity, "tvCount");
            int tvTitleId = id(activity, "tvTitle");
            int tvRjId = id(activity, "tvRJ");

            View tv7 = tv7Id != 0 ? view.findViewById(tv7Id) : null;
            if (tv7 != null && view instanceof ViewGroup) {
                styleParentDirHost((ViewGroup)view, tv7, ivCoverId != 0 ? view.findViewById(ivCoverId) : null);
                return;
            }

            View tvCount = tvCountId != 0 ? view.findViewById(tvCountId) : null;
            View tvTitle = tvTitleId != 0 ? view.findViewById(tvTitleId) : null;
            View tvRj = tvRjId != 0 ? view.findViewById(tvRjId) : null;
            if (tvCount instanceof TextView && tvTitle instanceof TextView && tvRj == null) {
                styleTreeFileRow(view, (TextView)tvTitle, (TextView)tvCount,
                        ivCoverId != 0 ? view.findViewById(ivCoverId) : null);
            }
        }

        private void styleParentDirHost(ViewGroup itemView, View tv7, View ivCover) {
            itemView.setTag("online_tree_header_host");
            itemView.setBackground(null);
            itemView.setOnClickListener(null);
            itemView.setClickable(false);
            itemView.setPadding(0, 0, 0, 0);
            if (itemView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams)itemView.getLayoutParams();
                if (lp.height != ViewGroup.LayoutParams.WRAP_CONTENT || lp.leftMargin != 0 || lp.rightMargin != 0) {
                    lp.width = ViewGroup.LayoutParams.MATCH_PARENT;
                    lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                    lp.leftMargin = 0;
                    lp.rightMargin = 0;
                    lp.topMargin = 0;
                    lp.bottomMargin = dp(activity, 4);
                    itemView.setLayoutParams(lp);
                }
            }
            if (tv7.getVisibility() != View.GONE) tv7.setVisibility(View.GONE);
            if (ivCover != null && ivCover.getVisibility() != View.GONE) ivCover.setVisibility(View.GONE);

            View existing = itemView.findViewWithTag("online_tree_host_box");
            LinearLayout hostBox;
            if (existing instanceof LinearLayout) {
                hostBox = (LinearLayout)existing;
                embeddedHeader = (LinearLayout)hostBox.getChildAt(0);
                upFolderRow = (LinearLayout)hostBox.getChildAt(1);
                upFolderText = (TextView)upFolderRow.getChildAt(0);
            } else {
                hostBox = new LinearLayout(activity);
                hostBox.setTag("online_tree_host_box");
                hostBox.setOrientation(LinearLayout.VERTICAL);
                embeddedHeader = GlassUi.buildWorkDetailHeader(activity);
                hostBox.addView(embeddedHeader, new LinearLayout.LayoutParams(-1, -2));

                upFolderRow = new LinearLayout(activity);
                upFolderRow.setOrientation(LinearLayout.HORIZONTAL);
                upFolderRow.setGravity(Gravity.CENTER_VERTICAL);
                upFolderRow.setPadding(dp(activity, 14), dp(activity, 12), dp(activity, 14), dp(activity, 12));
                upFolderText = new TextView(activity);
                upFolderText.setTextSize(14.5f);
                upFolderText.setTypeface(GlassUi.mediumFont());
                upFolderRow.addView(upFolderText, new LinearLayout.LayoutParams(0, -2, 1f));
                LinearLayout.LayoutParams upLp = new LinearLayout.LayoutParams(-1, -2);
                upLp.topMargin = dp(activity, 4);
                upLp.bottomMargin = dp(activity, 4);
                hostBox.addView(upFolderRow, upLp);

                itemView.addView(hostBox, new ViewGroup.LayoutParams(-1, -2));
            }

            int n = ThemePalettes.selected(activity);
            int cardColor = ThemePalettes.color(n, 2);
            int ink = ThemePalettes.text(cardColor);
            boolean light = ThemePalettes.light(cardColor);
            bindOnlineHeader(embeddedHeader, cardColor);

            Object treeAdapter = getWorkTreeAdapter();
            Object parentDataObj = getField(treeAdapter, "parentData");
            boolean inSubfolder = parentDataObj instanceof java.util.List && !((java.util.List<?>)parentDataObj).isEmpty();
            if (inSubfolder) {
                String relPath = "";
                try {
                    Object r = treeAdapter.getClass().getMethod("getRelativePath").invoke(treeAdapter);
                    if (r != null) relPath = r.toString();
                } catch (Throwable ignored) {}
                GradientDrawable upBg = new GradientDrawable();
                upBg.setColor(cardColor);
                upBg.setCornerRadius(dp(activity, 12));
                upBg.setStroke(Math.max(1, dp(activity, 0.8f)), light ? 0x16000000 : 0x1affffff);
                upFolderRow.setBackground(upBg);
                upFolderText.setText("\ud83d\udcc1  \u8fd4\u56de\u4e0a\u4e00\u7ea7\u76ee\u5f55"
                        + (relPath.isEmpty() ? "" : "  \u00b7  " + relPath));
                upFolderText.setTextColor(ink);
                upFolderRow.setVisibility(View.VISIBLE);
                upFolderRow.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    Object listener = getField(treeAdapter, "parentDirClickListener");
                    if (listener instanceof View.OnClickListener) {
                        ((View.OnClickListener)listener).onClick(v);
                    }
                });
            } else {
                upFolderRow.setVisibility(View.GONE);
                upFolderRow.setOnClickListener(null);
            }
        }

        private void styleTreeFileRow(View row, TextView tvTitle, TextView tvCount, View ivCover) {
            int n = ThemePalettes.selected(activity);
            int cardColor = ThemePalettes.color(n, 2);
            int ink = ThemePalettes.text(cardColor);
            int muted = ThemePalettes.secondary(cardColor);
            boolean light = ThemePalettes.light(cardColor);

            if (row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams)row.getLayoutParams();
                int mV = dp(activity, 4);
                if (lp.height != ViewGroup.LayoutParams.WRAP_CONTENT || lp.leftMargin != 0 || lp.topMargin != mV) {
                    lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                    lp.leftMargin = 0;
                    lp.rightMargin = 0;
                    lp.topMargin = mV;
                    lp.bottomMargin = mV;
                    row.setLayoutParams(lp);
                }
            }
            row.setMinimumHeight(dp(activity, 62));
            row.setPadding(dp(activity, 12), dp(activity, 10), dp(activity, 12), dp(activity, 10));
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(cardColor);
            bg.setCornerRadius(dp(activity, 12));
            bg.setStroke(Math.max(1, dp(activity, 0.8f)), light ? 0x16000000 : 0x1affffff);
            row.setBackground(bg);

            tvTitle.setSingleLine(false);
            tvTitle.setMaxLines(2);
            tvTitle.setEllipsize(TextUtils.TruncateAt.END);
            tvTitle.setTextSize(15f);
            tvTitle.setLineSpacing(0f, 1.12f);

            Object tagObj = row.getTag();
            org.json.JSONObject work = getWork();
            long workId = work != null ? work.optLong("id", 0L) : 0L;
            org.json.JSONObject lastPlayed = workId != 0L ? TrackResume.lastPlayedForOnlineWork(activity, workId) : null;
            if (tagObj instanceof org.json.JSONObject) {
                org.json.JSONObject item = (org.json.JSONObject)tagObj;
                boolean cached = item.optBoolean("file_exists", false);
                String type = item.optString("type", "");
                boolean isLastAudio = "audio".equals(type) && isSameOnlineTrack(item, lastPlayed);
                if (isLastAudio) {
                    bg.setColor(light ? 0x16fa2d48 : 0x20fa2d48);
                    bg.setStroke(Math.max(1, dp(activity, 1.0f)), 0x55fa2d48);
                    tvTitle.setTextColor(GlassUi.RED);
                } else {
                    tvTitle.setTextColor(cached ? (light ? 0xff11685f : 0xff7ae0c6) : ink);
                }

                int pbId = id(activity, "pb1");
                View pb = pbId != 0 ? row.findViewById(pbId) : null;
                boolean downloading = pb != null && pb.getVisibility() == View.VISIBLE;
                if (!downloading) {
                    if ("audio".equals(type)) {
                        double sec = item.optDouble("duration", 0.0);
                        String durStr = formatTrackSeconds(sec);
                        boolean hasLrc = folderHasMatchingLrc(item.optString("title", ""));
                        StringBuilder sub = new StringBuilder();
                        if (!durStr.isEmpty()) sub.append(durStr);
                        else sub.append("\u97f3\u9891");
                        if (hasLrc) sub.append("   \ud83d\udcac");
                        if (cached) sub.append("   \u00b7 \u5df2\u7f13\u5b58");
                        String badge = TrackResume.buildTrackBadge(activity, item, workId, isLastAudio, lastPlayed);
                        GlassUi.setColoredSubtitle(tvCount, sub.toString(), badge, muted,
                                isLastAudio ? GlassUi.RED : ThemePalettes.accent(cardColor));
                    } else if ("text".equals(type)) {
                        tvCount.setText("\u5b57\u5e55 / \u6587\u672c" + (cached ? " \u00b7 \u5df2\u7f13\u5b58" : ""));
                        tvCount.setTextColor(muted);
                    } else if ("image".equals(type)) {
                        tvCount.setText("\u56fe\u7247" + (cached ? " \u00b7 \u5df2\u7f13\u5b58" : ""));
                        tvCount.setTextColor(muted);
                    } else {
                        tvCount.setTextColor(muted);
                    }
                }
            } else {
                // Folder row
                String folderName = tvTitle.getText() != null ? tvTitle.getText().toString() : "";
                org.json.JSONObject folderItem = findVisibleOnlineFolder(folderName);
                boolean hasLast = lastPlayed != null && folderItem != null && onlineFolderContainsTrack(folderItem, lastPlayed);
                String rawCount = tvCount.getText() != null ? tvCount.getText().toString() : "";
                int mark = rawCount.indexOf("   \u00b7   \u4e0a\u6b21\u542c\u5230\u6b64\u76ee\u5f55");
                if (mark >= 0) rawCount = rawCount.substring(0, mark);
                else if (rawCount.startsWith("\u4e0a\u6b21\u542c\u5230\u6b64\u76ee\u5f55")) rawCount = "";
                if (hasLast) {
                    bg.setColor(light ? 0x16fa2d48 : 0x20fa2d48);
                    bg.setStroke(Math.max(1, dp(activity, 1.0f)), 0x55fa2d48);
                    tvTitle.setTextColor(GlassUi.RED);
                    String badge = "\u4e0a\u6b21\u542c\u5230\u6b64\u76ee\u5f55 \u00b7 " + lastPlayed.optString("title");
                    GlassUi.setColoredSubtitle(tvCount, rawCount, badge, muted, GlassUi.RED);
                } else {
                    tvTitle.setTextColor(ink);
                    tvCount.setText(rawCount);
                    tvCount.setTextColor(muted);
                }
                if (ivCover instanceof ImageView) {
                    ((ImageView)ivCover).setImageTintList(ColorStateList.valueOf(hasLast ? GlassUi.RED : 0xff5aa7d4));
                }
            }
        }

        private boolean folderHasMatchingLrc(String audioTitle) {
            if (audioTitle == null || audioTitle.isEmpty()) return false;
            int dot = audioTitle.lastIndexOf('.');
            String stem = dot > 0 ? audioTitle.substring(0, dot).toLowerCase(java.util.Locale.ROOT)
                    : audioTitle.toLowerCase(java.util.Locale.ROOT);
            Object treeAdapter = getWorkTreeAdapter();
            Object dataObj = getField(treeAdapter, "data");
            if (dataObj instanceof org.json.JSONArray) {
                org.json.JSONArray arr = (org.json.JSONArray)dataObj;
                for (int i = 0; i < arr.length(); i++) {
                    org.json.JSONObject f = arr.optJSONObject(i);
                    if (f == null) continue;
                    String t = f.optString("title", "").toLowerCase(java.util.Locale.ROOT);
                    if ((t.endsWith(".lrc") || t.endsWith(".vtt") || t.endsWith(".srt") || t.endsWith(".ass"))
                            && t.startsWith(stem)) {
                        return true;
                    }
                }
            }
            return false;
        }

        private static String formatTrackSeconds(double sec) {
            int total = (int)Math.round(sec);
            if (total <= 0) return "";
            int h = total / 3600;
            int m = (total % 3600) / 60;
            int s = total % 60;
            if (h > 0) {
                return String.format(java.util.Locale.ROOT, "%d:%02d:%02d", h, m, s);
            }
            return String.format(java.util.Locale.ROOT, "%02d:%02d", m, s);
        }

        private void bindOnlineHeader(LinearLayout root, int cardColor) {
            if (root == null) return;
            org.json.JSONObject work = getWork();
            if (work == null) return;

            boolean light = ThemePalettes.light(cardColor);
            int ink = ThemePalettes.text(cardColor);
            int muted = ThemePalettes.secondary(cardColor);
            int chipBg = light ? 0x141c2430 : 0x2458687e;
            int chipStroke = light ? 0x38202731 : 0x4898a8bc;

            FrameLayout coverBox = (FrameLayout)root.getChildAt(0);
            int screenW = activity.getResources().getDisplayMetrics().widthPixels - dp(activity, 36);
            coverBox.getLayoutParams().height = Math.max(dp(activity, 210), Math.round(screenW * 0.75f));
            if (coverBox.getBackground() instanceof GradientDrawable) {
                ((GradientDrawable)coverBox.getBackground()).setColor(cardColor);
            }
            ImageView cover = (ImageView)coverBox.getChildAt(0);
            TextView titleView = (TextView)root.getChildAt(1);
            GlassUi.WrapLayout actionWrap = (GlassUi.WrapLayout)root.getChildAt(2);
            LinearLayout infoList = (LinearLayout)root.getChildAt(3);
            LinearLayout netBox = (LinearLayout)root.getChildAt(4);
            TextView filesHeader = (TextView)root.getChildAt(5);

            String rj = formatOnlineRj(work);
            long workId = work.optLong("id", 0L);

            // 1. Load online cover via Glide
            String coverUrl = buildOnlineCoverUrl(work);
            if (!coverUrl.isEmpty() && !coverUrl.equals(cover.getTag())) {
                cover.setTag(coverUrl);
                try {
                    Class<?> glideClass = Class.forName("com.bumptech.glide.Glide");
                    Object reqMgr = glideClass.getMethod("with", Activity.class).invoke(null, activity);
                    Object reqBuilder = reqMgr.getClass().getMethod("load", String.class).invoke(reqMgr, coverUrl);
                    reqBuilder.getClass().getMethod("into", ImageView.class).invoke(reqBuilder, cover);
                } catch (Throwable ignored) {}
            }

            // 2. Title
            String title = work.optString("title", rj);
            if (TitleTranslator.enabled(activity) && TitleTranslator.needsTranslation(title)
                    && TitleTranslator.cached(activity, title).isEmpty()) {
                TitleTranslator.translateBatch(activity, java.util.Collections.singletonList(title), this::refresh);
            }
            GlassUi.applyTranslatedTitle(activity, titleView, title, ink, muted, true);

            // 3. Interactive Review Status Chips + Play All + Copy RJ
            actionWrap.removeAllViews();
            String progress = work.optString("progress", "");
            String[][] statuses = {
                    {"marked", "\u2661 \u60f3\u542c"},
                    {"listening", "\u25ce \u5728\u542c"},
                    {"listened", "\u2713 \u542c\u8fc7"},
                    {"replay", "\u21bb \u56de\u5473"},
                    {"postponed", "\u23f0 \u6401\u7f6e"}
            };
            for (String[] st : statuses) {
                final String key = st[0];
                boolean active = key.equals(progress);
                TextView chip = GlassUi.makeChip(activity, st[1],
                        active ? 0x28fa2d48 : chipBg, active ? GlassUi.RED : chipStroke,
                        active ? GlassUi.RED : ink, 13f, 13, 7, 8);
                chip.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    submitReviewStatus(work, workId, key);
                });
                actionWrap.addView(chip);
            }

            org.json.JSONArray trees = getTrees();
            int[] treeStats = countOnlineTreeStats(trees);
            int trackCount = treeStats[0];
            int treeDurationSec = treeStats[1];
            boolean treeHasLrc = treeStats[2] > 0;

            if (trackCount > 0 || trees != null) {
                TextView playChip = GlassUi.makeChip(activity, "\u25b6 \u64ad\u653e\u5168\u90e8",
                        0x24fa2d48, GlassUi.RED, GlassUi.RED, 13f, 14, 7, 8);
                playChip.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    playFirstAvailableTrack();
                });
                actionWrap.addView(playChip);
            }
            if (!rj.isEmpty()) {
                final String rjCode = rj;
                TextView copyChip = GlassUi.makeChip(activity, "# \u590d\u5236 " + rjCode,
                        chipBg, chipStroke, ink, 13f, 13, 7, 8);
                copyChip.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    GlassUi.copyRj(activity, rjCode);
                });
                actionWrap.addView(copyChip);
            }
            GlassUi.addTranslateTitleChip(activity, actionWrap, title, chipBg, chipStroke, ink, this::refresh);

            // 4. Info lines
            TextView lineSource = (TextView)infoList.getChildAt(0);
            TextView lineCoverSrc = (TextView)infoList.getChildAt(1);
            TextView lineRj = (TextView)infoList.getChildAt(2);
            TextView lineTracks = (TextView)infoList.getChildAt(3);
            TextView linePrice = (TextView)infoList.getChildAt(4);

            boolean isCachedWork = work.optBoolean("is_local_work", false);
            lineSource.setText("\ud83d\udcc1  \u6765\u6e90\uff1a" + (isCachedWork ? "\u5728\u7ebf\u7f13\u5b58\u4f5c\u54c1" : "\u5728\u7ebf\u4f5c\u54c1"));
            lineSource.setTextColor(muted);

            lineCoverSrc.setText("\ud83d\uddbc  \u5c01\u9762\uff1a\u5728\u7ebf\u539f\u7248\u5c01\u9762");
            lineCoverSrc.setTextColor(muted);

            if (!rj.isEmpty()) {
                final String rjCode = rj;
                lineRj.setText("#   " + rjCode + "  \uff08\u70b9\u51fb\u590d\u5236\uff09");
                lineRj.setTextColor(ink);
                lineRj.setVisibility(View.VISIBLE);
                lineRj.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    GlassUi.copyRj(activity, rjCode);
                });
            } else {
                lineRj.setVisibility(View.GONE);
            }

            int durSec = work.optInt("duration", 0);
            if (durSec <= 0) durSec = treeDurationSec;
            String durCn = GlassUi.formatDurationCn(durSec);
            boolean hasSub = work.optBoolean("has_subtitle", false) || treeHasLrc;
            StringBuilder trackLine = new StringBuilder("\u266a  ");
            if (trackCount > 0) trackLine.append(trackCount).append(" \u4e2a\u97f3\u8f68");
            else if (trees == null) trackLine.append("\u6b63\u5728\u83b7\u53d6\u97f3\u8f68\u5217\u8868\u2026");
            else trackLine.append("\u4f5c\u54c1\u76ee\u5f55");
            if (!durCn.isEmpty()) trackLine.append(" \u00b7 ").append(durCn);
            if (hasSub) trackLine.append(" \u00b7 \u542b\u6b4c\u8bcd");
            lineTracks.setText(trackLine.toString());
            lineTracks.setTextColor(ink);

            int price = work.optInt("price", 0);
            int dlCount = work.optInt("dl_count", 0);
            if (price > 0 || dlCount > 0) {
                linePrice.setText("\ud83d\udcb4  " + price + " \u65e5\u5143 \u00b7 \u552e\u51fa " + dlCount);
                linePrice.setTextColor(muted);
                linePrice.setVisibility(View.VISIBLE);
            } else {
                linePrice.setVisibility(View.GONE);
            }

            // 5. Network Reference Section (Circle, CVs, Release, Rating, Tags)
            netBox.setVisibility(View.VISIBLE);
            LinearLayout netHeader = (LinearLayout)netBox.getChildAt(0);
            ((TextView)netHeader.getChildAt(0)).setTextColor(muted);
            TextView refreshBtn = (TextView)netHeader.getChildAt(1);
            refreshBtn.setTextColor(GlassUi.RED);
            refreshBtn.setOnClickListener(v -> {
                GlassUi.hapticTick(v);
                invokeMethod(activity, "loadTree");
            });

            GlassUi.WrapLayout circleWrap = (GlassUi.WrapLayout)netBox.getChildAt(1);
            GlassUi.WrapLayout cvWrap = (GlassUi.WrapLayout)netBox.getChildAt(2);
            TextView releaseText = (TextView)netBox.getChildAt(3);
            TextView ratingText = (TextView)netBox.getChildAt(4);
            GlassUi.WrapLayout tagsWrap = (GlassUi.WrapLayout)netBox.getChildAt(5);

            circleWrap.removeAllViews();
            cvWrap.removeAllViews();
            tagsWrap.removeAllViews();

            String circleName = work.optString("name", "");
            if (!circleName.isEmpty()) {
                circleWrap.setVisibility(View.VISIBLE);
                TextView circleChip = GlassUi.makeChip(activity, "\u793e\u56e2: " + circleName,
                        chipBg, chipStroke, ink, 13f, 12, 6, 8);
                circleChip.setOnClickListener(v -> {
                    GlassUi.hapticTick(v);
                    invokeTagClickListener(getField(activity, "circlesClickListener"), work);
                });
                circleWrap.addView(circleChip);
            } else {
                circleWrap.setVisibility(View.GONE);
            }

            org.json.JSONArray vas = work.optJSONArray("vas");
            if (vas != null && vas.length() > 0) {
                cvWrap.setVisibility(View.VISIBLE);
                for (int i = 0; i < vas.length(); i++) {
                    final org.json.JSONObject vaObj = vas.optJSONObject(i);
                    if (vaObj == null) continue;
                    String vn = vaObj.optString("name", "");
                    if (!vn.isEmpty()) {
                        TextView cvChip = GlassUi.makeChip(activity, "CV: " + vn,
                                chipBg, chipStroke, ink, 13f, 12, 6, 8);
                        cvChip.setOnClickListener(v -> {
                            GlassUi.hapticTick(v);
                            invokeTagClickListener(getField(activity, "vaClickListener"), vaObj);
                        });
                        cvWrap.addView(cvChip);
                    }
                }
            } else {
                cvWrap.setVisibility(View.GONE);
            }

            String release = work.optString("release", "");
            if (!release.isEmpty()) {
                releaseText.setText("\u53d1\u884c\uff1a" + release);
                releaseText.setTextColor(muted);
                releaseText.setVisibility(View.VISIBLE);
            } else {
                releaseText.setVisibility(View.GONE);
            }

            double rateAvg = work.optDouble("rate_average_2dp", 0.0);
            int rateCnt = work.optInt("rate_count", 0);
            if (rateAvg > 0) {
                ratingText.setText(String.format(java.util.Locale.ROOT,
                        "\u8bc4\u5206\uff1a\u2605 %.2f (%d \u8bc4\u4ef7)", rateAvg, rateCnt));
                ratingText.setTextColor(muted);
                ratingText.setVisibility(View.VISIBLE);
            } else {
                ratingText.setVisibility(View.GONE);
            }

            org.json.JSONArray tags = work.optJSONArray("tags");
            if (tags != null && tags.length() > 0) {
                tagsWrap.setVisibility(View.VISIBLE);
                for (int i = 0; i < tags.length(); i++) {
                    final org.json.JSONObject tagObj = tags.optJSONObject(i);
                    if (tagObj == null) continue;
                    String tn = tagObj.optString("name", "");
                    if (!tn.isEmpty()) {
                        TextView tagChip = GlassUi.makeChip(activity, tn,
                                0x00000000, chipStroke, ink, 12.5f, 11, 5, 8);
                        tagChip.setOnClickListener(v -> {
                            GlassUi.hapticTick(v);
                            invokeTagClickListener(activity, tagObj);
                        });
                        tagsWrap.addView(tagChip);
                    }
                }
            } else {
                tagsWrap.setVisibility(View.GONE);
            }

            // 6. Files Header
            Object treeAdapter = getWorkTreeAdapter();
            String relPath = "";
            if (treeAdapter != null) {
                try {
                    Object r = treeAdapter.getClass().getMethod("getRelativePath").invoke(treeAdapter);
                    if (r != null) relPath = r.toString();
                } catch (Throwable ignored) {}
            }
            if (trees == null && treeAdapter == null) {
                filesHeader.setText("\u6587\u4ef6\uff08\u6b63\u5728\u52a0\u8f7d\u76ee\u5f55\u2026\uff09");
            } else if (!relPath.isEmpty()) {
                filesHeader.setText("\u6587\u4ef6  \u00b7  " + relPath);
            } else {
                filesHeader.setText("\u6587\u4ef6");
            }
            filesHeader.setTextColor(ink);

            org.json.JSONObject lastPlayed = workId != 0L ? TrackResume.lastPlayedForOnlineWork(activity, workId) : null;
            org.json.JSONObject workProgress = trees != null ? TrackResume.workProgressOnline(activity, workId, trees) : null;
            String subPath = (lastPlayed != null && trees != null) ? findOnlineTrackSubpath(trees, lastPlayed, "") : "";
            final org.json.JSONObject resumeTarget = lastPlayed;
            GlassUi.bindLastPlayedBanner(activity, root, lastPlayed, workProgress, cardColor, subPath,
                    (resumeTarget != null && trees != null) ? () -> resumeOnlineLastPlayed(resumeTarget) : null);
        }

        private String buildOnlineCoverUrl(org.json.JSONObject work) {
            try {
                long id = work.optLong("id", 0L);
                if (id <= 0L) return "";
                String host = work.optString("host", "");
                if (host.isEmpty()) {
                    Class<?> appClass = Class.forName("com.zinhao.kikoeru.App");
                    Object app = appClass.getMethod("getInstance").invoke(null);
                    Object user = appClass.getMethod("currentUser").invoke(app);
                    if (user != null) {
                        Object h = user.getClass().getMethod("getHost").invoke(user);
                        if (h != null) host = h.toString();
                    }
                }
                Class<?> apiClass = Class.forName("com.zinhao.kikoeru.Api");
                Field tokenField = apiClass.getDeclaredField("token");
                tokenField.setAccessible(true);
                Object token = tokenField.get(null);
                return host + "/api/cover/" + id + "?token=" + (token != null ? token.toString() : "");
            } catch (Throwable ignored) {
                return "";
            }
        }

        private void submitReviewStatus(org.json.JSONObject work, long workId, String statusKey) {
            try {
                work.put("progress", statusKey);
                int cardColor = ThemePalettes.color(ThemePalettes.selected(activity), 2);
                if (preloadHeader != null) bindOnlineHeader(preloadHeader, cardColor);
                if (embeddedHeader != null) bindOnlineHeader(embeddedHeader, cardColor);
                Object callback = getField(activity, "actionCallBack");
                Class<?> apiClass = Class.forName("com.zinhao.kikoeru.Api");
                for (Method m : apiClass.getDeclaredMethods()) {
                    if (m.getName().equals("doPutReview") && m.getParameterTypes().length == 3) {
                        m.setAccessible(true);
                        m.invoke(null, workId, statusKey, callback);
                        break;
                    }
                }
            } catch (Throwable ignored) {}
        }

        private void invokeTagClickListener(Object listener, org.json.JSONObject tagJson) {
            if (listener == null || tagJson == null) return;
            try {
                Method m = listener.getClass().getMethod("onTagClick", org.json.JSONObject.class);
                m.setAccessible(true);
                m.invoke(listener, tagJson);
                recycler.postDelayed(this::refresh, 60);
            } catch (Throwable ignored) {}
        }

        private void invokeMethod(Object target, String methodName) {
            if (target == null) return;
            try {
                Method m = target.getClass().getDeclaredMethod(methodName);
                m.setAccessible(true);
                m.invoke(target);
            } catch (Throwable ignored) {}
        }

        private static int[] countOnlineTreeStats(org.json.JSONArray arr) {
            int[] stats = new int[3]; // [0]=audioCount, [1]=durationSec, [2]=lrcCount
            accumulateTreeStats(arr, stats);
            return stats;
        }

        private static void accumulateTreeStats(org.json.JSONArray arr, int[] stats) {
            if (arr == null) return;
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item == null) continue;
                String type = item.optString("type", "");
                if ("folder".equals(type)) {
                    accumulateTreeStats(item.optJSONArray("children"), stats);
                } else if ("audio".equals(type)) {
                    stats[0]++;
                    stats[1] += (int)Math.round(item.optDouble("duration", 0.0));
                } else if ("text".equals(type)) {
                    String title = item.optString("title", "").toLowerCase(java.util.Locale.ROOT);
                    if (title.endsWith(".lrc") || title.endsWith(".vtt") || title.endsWith(".srt") || title.endsWith(".ass")) {
                        stats[2]++;
                    }
                }
            }
        }

        private void playFirstAvailableTrack() {
            try {
                Object treeAdapter = getWorkTreeAdapter();
                if (treeAdapter == null) return;
                org.json.JSONObject firstAudio = findFirstAudioInCurrentOrNavigate(treeAdapter);
                if (firstAudio != null) {
                    Method openMethod = activity.getClass().getDeclaredMethod("openAudioOrVideo", org.json.JSONObject.class);
                    openMethod.setAccessible(true);
                    openMethod.invoke(activity, firstAudio);
                }
            } catch (Throwable ignored) {}
        }

        @SuppressWarnings("unchecked")
        private org.json.JSONObject findFirstAudioInCurrentOrNavigate(Object treeAdapter) {
            Object dataObj = getField(treeAdapter, "data");
            if (!(dataObj instanceof org.json.JSONArray)) return null;
            org.json.JSONArray current = (org.json.JSONArray)dataObj;
            for (int i = 0; i < current.length(); i++) {
                org.json.JSONObject item = current.optJSONObject(i);
                if (item != null && "audio".equals(item.optString("type"))) {
                    return item;
                }
            }
            // If current folder only has subfolders, descend into the first subfolder that contains audio
            for (int i = 0; i < current.length(); i++) {
                org.json.JSONObject item = current.optJSONObject(i);
                if (item != null && "folder".equals(item.optString("type"))) {
                    org.json.JSONArray children = item.optJSONArray("children");
                    int[] subStats = countOnlineTreeStats(children);
                    if (subStats[0] > 0 && children != null) {
                        try {
                            Object parentData = getField(treeAdapter, "parentData");
                            Object pathList = getField(treeAdapter, "pathList");
                            if (parentData instanceof java.util.List && pathList instanceof java.util.List) {
                                ((java.util.List<Object>)parentData).add(current);
                                ((java.util.List<Object>)pathList).add(item.optString("title", ""));
                                Field dataField = treeAdapter.getClass().getDeclaredField("data");
                                dataField.setAccessible(true);
                                dataField.set(treeAdapter, children);
                                treeAdapter.getClass().getMethod("mapFileExistValue").invoke(treeAdapter);
                                treeAdapter.getClass().getMethod("notifyDataSetChanged").invoke(treeAdapter);
                                return findFirstAudioInCurrentOrNavigate(treeAdapter);
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
            return null;
        }

        private org.json.JSONObject findVisibleOnlineFolder(String folderTitle) {
            if (folderTitle == null || folderTitle.isEmpty()) return null;
            Object treeAdapter = getWorkTreeAdapter();
            Object dataObj = getField(treeAdapter, "data");
            if (!(dataObj instanceof org.json.JSONArray)) return null;
            org.json.JSONArray arr = (org.json.JSONArray)dataObj;
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item != null && "folder".equals(item.optString("type"))
                        && folderTitle.equals(item.optString("title"))) {
                    return item;
                }
            }
            return null;
        }

        private static boolean isSameOnlineTrack(org.json.JSONObject item, org.json.JSONObject lastPlayed) {
            if (item == null || lastPlayed == null) return false;
            String targetHash = lastPlayed.optString("hash", "");
            if (!targetHash.isEmpty()) return targetHash.equals(item.optString("hash", ""));
            String targetTitle = lastPlayed.optString("title", "");
            return !targetTitle.isEmpty() && targetTitle.equals(item.optString("title", ""));
        }

        private static boolean onlineFolderContainsTrack(org.json.JSONObject folderItem, org.json.JSONObject lastPlayed) {
            if (folderItem == null || lastPlayed == null) return false;
            org.json.JSONArray children = folderItem.optJSONArray("children");
            if (children == null) return false;
            for (int i = 0; i < children.length(); i++) {
                org.json.JSONObject c = children.optJSONObject(i);
                if (c == null) continue;
                String t = c.optString("type", "");
                if ("audio".equals(t) && isSameOnlineTrack(c, lastPlayed)) return true;
                if ("folder".equals(t) && onlineFolderContainsTrack(c, lastPlayed)) return true;
            }
            return false;
        }

        private static String findOnlineTrackSubpath(org.json.JSONArray arr, org.json.JSONObject lastPlayed, String prefix) {
            if (arr == null || lastPlayed == null) return "";
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item == null) continue;
                String t = item.optString("type", "");
                if ("audio".equals(t) && isSameOnlineTrack(item, lastPlayed)) return prefix;
                if ("folder".equals(t)) {
                    String title = item.optString("title", "");
                    String next = prefix.isEmpty() ? title : prefix + "/" + title;
                    String found = findOnlineTrackSubpath(item.optJSONArray("children"), lastPlayed, next);
                    if (!found.isEmpty() || folderDirectlyContains(item.optJSONArray("children"), lastPlayed)) {
                        return found.isEmpty() ? next : found;
                    }
                }
            }
            return "";
        }

        private static boolean folderDirectlyContains(org.json.JSONArray arr, org.json.JSONObject lastPlayed) {
            if (arr == null || lastPlayed == null) return false;
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item != null && "audio".equals(item.optString("type")) && isSameOnlineTrack(item, lastPlayed)) {
                    return true;
                }
            }
            return false;
        }

        private static boolean collectOnlineResumeTarget(org.json.JSONArray arr, org.json.JSONObject lastPlayed,
                java.util.List<org.json.JSONArray> folderChain, java.util.List<String> titleChain,
                org.json.JSONObject[] foundTrack, org.json.JSONArray[] foundFolderData) {
            if (arr == null || lastPlayed == null) return false;
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item == null) continue;
                String t = item.optString("type", "");
                if ("audio".equals(t) && isSameOnlineTrack(item, lastPlayed)) {
                    foundTrack[0] = item;
                    foundFolderData[0] = arr;
                    return true;
                }
            }
            for (int i = 0; i < arr.length(); i++) {
                org.json.JSONObject item = arr.optJSONObject(i);
                if (item != null && "folder".equals(item.optString("type"))) {
                    org.json.JSONArray children = item.optJSONArray("children");
                    if (children == null) continue;
                    folderChain.add(arr);
                    titleChain.add(item.optString("title", ""));
                    if (collectOnlineResumeTarget(children, lastPlayed, folderChain, titleChain, foundTrack, foundFolderData)) {
                        return true;
                    }
                    folderChain.remove(folderChain.size() - 1);
                    titleChain.remove(titleChain.size() - 1);
                }
            }
            return false;
        }

        @SuppressWarnings("unchecked")
        private void resumeOnlineLastPlayed(org.json.JSONObject lastPlayed) {
            try {
                Object treeAdapter = getWorkTreeAdapter();
                org.json.JSONArray trees = getTrees();
                if (treeAdapter == null || trees == null || lastPlayed == null) return;
                Object curData = getField(treeAdapter, "data");
                if (curData instanceof org.json.JSONArray) {
                    org.json.JSONArray curArr = (org.json.JSONArray)curData;
                    for (int i = 0; i < curArr.length(); i++) {
                        org.json.JSONObject item = curArr.optJSONObject(i);
                        if (item != null && "audio".equals(item.optString("type")) && isSameOnlineTrack(item, lastPlayed)) {
                            Method openMethod = activity.getClass().getDeclaredMethod("openAudioOrVideo", org.json.JSONObject.class);
                            openMethod.setAccessible(true);
                            openMethod.invoke(activity, item);
                            return;
                        }
                    }
                }
                java.util.List<org.json.JSONArray> folderChain = new java.util.ArrayList<>();
                java.util.List<String> titleChain = new java.util.ArrayList<>();
                org.json.JSONObject[] foundTrack = new org.json.JSONObject[1];
                org.json.JSONArray[] foundFolderData = new org.json.JSONArray[1];
                if (!collectOnlineResumeTarget(trees, lastPlayed, folderChain, titleChain, foundTrack, foundFolderData)
                        || foundTrack[0] == null || foundFolderData[0] == null) {
                    GlassUi.toast(activity, "\u672a\u627e\u5230\u4e0a\u6b21\u64ad\u653e\u7684\u97f3\u8f68");
                    return;
                }
                Object parentData = getField(treeAdapter, "parentData");
                Object pathList = getField(treeAdapter, "pathList");
                if (parentData instanceof java.util.List && pathList instanceof java.util.List) {
                    ((java.util.List<Object>)parentData).clear();
                    ((java.util.List<Object>)parentData).addAll(folderChain);
                    ((java.util.List<Object>)pathList).clear();
                    ((java.util.List<Object>)pathList).addAll(titleChain);
                    Field dataField = treeAdapter.getClass().getDeclaredField("data");
                    dataField.setAccessible(true);
                    dataField.set(treeAdapter, foundFolderData[0]);
                    treeAdapter.getClass().getMethod("mapFileExistValue").invoke(treeAdapter);
                    treeAdapter.getClass().getMethod("notifyDataSetChanged").invoke(treeAdapter);
                    refresh();
                }
                Method openMethod = activity.getClass().getDeclaredMethod("openAudioOrVideo", org.json.JSONObject.class);
                openMethod.setAccessible(true);
                openMethod.invoke(activity, foundTrack[0]);
            } catch (Throwable ignored) {}
        }
    }
    static final class MiniHost extends FrameLayout {
        private final View mini;
        MiniHost(Activity activity, View mini, View content) {
            super(activity); this.mini = mini;
            if (mini.getParent() instanceof ViewGroup) ((ViewGroup)mini.getParent()).removeView(mini);
            styleMini(activity, mini, content);
            addView(mini, new FrameLayout.LayoutParams(-1, dp(activity, 66)));
        }
        @Override protected void onMeasure(int width, int height) {
            if (mini.getVisibility() == View.GONE) {
                setMeasuredDimension(MeasureSpec.getSize(width), 0);
                return;
            }
            super.onMeasure(width, height);
        }
    }
    static LinearLayout dock(Activity a, View content, View mini, GlassUi.Navigation navigation) {
        LinearLayout dock = new LinearLayout(a); dock.setOrientation(LinearLayout.VERTICAL);
        MiniHost host = new MiniHost(a, mini, content);
        LinearLayout.LayoutParams miniLp = new LinearLayout.LayoutParams(-1, -2);
        miniLp.leftMargin = dp(a, 12); miniLp.rightMargin = dp(a, 12); miniLp.bottomMargin = dp(a, 8);
        dock.addView(host, miniLp);
        dock.addView(navigation, new LinearLayout.LayoutParams(-1, dp(a, 62)));
        dock.setPadding(0, 0, 0, dp(a, 6));
        return dock;
    }
    static void keepVisible(Activity a, View content, View dock, int top) {
        Runnable update = () -> {
            int bottom = dock.getHeight() + dp(a, 10);
            if (content.getPaddingBottom() != bottom || content.getPaddingTop() != top)
                content.setPadding(content.getPaddingLeft(), top, content.getPaddingRight(), bottom);
        };
        dock.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> update.run());
        dock.post(update);
    }
    private static boolean popupDismiss(Activity activity, String field, View anchor, Runnable dismissed) {
        try {
            Field member = activity.getClass().getDeclaredField(field); member.setAccessible(true);
            Object popup = member.get(activity); if (popup == null) return false;
            popup.getClass().getMethod("setAnchorView", View.class).invoke(popup, anchor);
            int width = ShellState.popupWidth(activity.getResources().getDisplayMetrics().widthPixels, dp(activity, 236), dp(activity, 24));
            popup.getClass().getMethod("setWidth", int.class).invoke(popup, width);
            popup.getClass().getMethod("setDropDownGravity", int.class).invoke(popup, Gravity.END);
            Method setter = popup.getClass().getMethod("setOnDismissListener", PopupWindow.OnDismissListener.class);
            setter.invoke(popup, (PopupWindow.OnDismissListener)dismissed::run);
            GlassUi.stylePopup(activity, popup);
            return true;
        } catch (ReflectiveOperationException | RuntimeException ignored) { return false; }
    }
    private static void refreshPopupStyle(Activity activity, String field) {
        try {
            Field member = activity.getClass().getDeclaredField(field); member.setAccessible(true);
            Object popup = member.get(activity);
            if (popup != null) GlassUi.stylePopup(activity, popup);
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    public static void installHome(Activity activity) {
        if (HOMES.containsKey(activity)) return;
        View content = activity.findViewById(id(activity, "recyclerView"));
        View mini = activity.findViewById(id(activity, "bottomLayout"));
        ViewGroup original = activity.findViewById(id(activity, "linearLayout"));
        ViewGroup header = activity.findViewById(id(activity, "appBarLayout"));
        ImageButton first = activity.findViewById(id(activity, "bt1"));
        ImageButton favorite = activity.findViewById(id(activity, "bt2"));
        ImageButton more = activity.findViewById(id(activity, "bt3"));
        ViewGroup container = activity.findViewById(android.R.id.content);
        if (content == null || mini == null || original == null || header == null || first == null
                || favorite == null || more == null || !(container instanceof FrameLayout)) return;
        Home home = new Home(activity, content, mini, original, container, header, first, favorite, more);
        HOMES.put(activity, home);
        home.installHeader();
        home.install();
        Intent intent = activity.getIntent();
        if (intent != null && intent.hasExtra(EXTRA_SOURCE)) home.route(intent);
    }
    static final class PanelSlot extends FrameLayout {
        PanelSlot(Activity activity, View child) { super(activity); addView(child, new FrameLayout.LayoutParams(-1, -1)); }
    }
    private static final class Home {
        final Activity activity; final View content, mini; final ViewGroup original, container, header;
        final ImageButton first, favorite, more;
        final View[] modes = new View[3];
        GlassUi.Navigation nav; GlassUi.Sources tabs; LinearLayout overlay; ModeContainer body;
        LocalLibraryController local; BaiduCloudController cloud;
        LinearLayout largeTitleRow, searchPillRow;
        TextView largeTitleView, countBadgeView, compactTitleView, searchPlaceholderView;
        ImageView searchPillIcon;
        View headerHairline;
        CharSequence onlineTitle;
        int actual, bottom, active, transition, catalogType = 0x1eb, palette, scrollY;
        boolean favoritePopup, morePopup, liquid;

        Home(Activity a, View c, View m, ViewGroup o, ViewGroup parent, ViewGroup h,
                ImageButton x, ImageButton y, ImageButton z) {
            activity = a; content = c; mini = m; original = o; container = parent; header = h;
            first = x; favorite = y; more = z;
        }

        void installHeader() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            int card = ThemePalettes.color(ThemePalettes.selected(activity), 2);
            int ink = ThemePalettes.text(page);
            int muted = ThemePalettes.secondary(page);
            header.setElevation(0f);

            // Configure top compact toolbar (44dp height, centered small title when collapsed, SF overflow icon)
            View tb = header.findViewById(id(activity, "toolbar"));
            if (tb instanceof ViewGroup) {
                ViewGroup toolbar = (ViewGroup)tb;
                ViewGroup.LayoutParams tlp = toolbar.getLayoutParams();
                if (tlp != null) {
                    tlp.height = dp(activity, 42);
                    toolbar.setLayoutParams(tlp);
                }
                try {
                    Drawable overflow = new GlassUi.SfIconDrawable(activity, "ic_baseline_more_horiz_24");
                    overflow.setTint(GlassUi.RED);
                    toolbar.getClass().getMethod("setOverflowIcon", Drawable.class).invoke(toolbar, overflow);
                } catch (ReflectiveOperationException | RuntimeException ignored) {}
                syncToolbarPopupTheme(page);
            }

            // 1. iOS Large Title Block (32sp Bold left title + count badge on right)
            largeTitleRow = new LinearLayout(activity);
            largeTitleRow.setOrientation(LinearLayout.HORIZONTAL);
            largeTitleRow.setGravity(Gravity.BOTTOM);
            largeTitleRow.setPadding(dp(activity, 16), 0, dp(activity, 16), dp(activity, 4));

            largeTitleView = new TextView(activity);
            largeTitleView.setText("\u4f5c\u54c1");
            largeTitleView.setTextSize(31);
            largeTitleView.setTypeface(GlassUi.boldFont());
            largeTitleView.setLetterSpacing(-0.02f);
            largeTitleView.setTextColor(ink);
            largeTitleView.setSingleLine(true);
            largeTitleView.setEllipsize(TextUtils.TruncateAt.END);
            largeTitleRow.addView(largeTitleView, new LinearLayout.LayoutParams(0, -2, 1));

            countBadgeView = new TextView(activity);
            countBadgeView.setTag("ios_muted");
            countBadgeView.setTextSize(13.5f);
            countBadgeView.setTypeface(GlassUi.mediumFont());
            countBadgeView.setTextColor(muted);
            countBadgeView.setPadding(dp(activity, 8), 0, 0, dp(activity, 4));
            largeTitleRow.addView(countBadgeView, new LinearLayout.LayoutParams(-2, -2));
            header.addView(largeTitleRow, new LinearLayout.LayoutParams(-1, -2));

            // 2. iOS Segmented Control (34dp height: 在线 | 本地 | 网盘)
            tabs = new GlassUi.Sources(activity, 0, new Runnable[]{
                    () -> switchSource(0), () -> switchSource(1), () -> switchSource(2)});
            tabs.setNavigationAllowed(this::canSwitch);
            LinearLayout.LayoutParams tabsLp = new LinearLayout.LayoutParams(-1, dp(activity, 34));
            tabsLp.setMargins(dp(activity, 16), dp(activity, 4), dp(activity, 16), dp(activity, 6));
            header.addView(tabs, tabsLp);

            // 3. Inline iOS Search Capsule below Large Title / Segmented Control (C7)
            searchPillRow = new LinearLayout(activity);
            searchPillRow.setOrientation(LinearLayout.HORIZONTAL);
            searchPillRow.setGravity(Gravity.CENTER_VERTICAL);
            searchPillRow.setPadding(dp(activity, 11), 0, dp(activity, 11), 0);
            styleSearchPill(card, muted);
            GlassUi.attachIosPress(searchPillRow, 0.98f);
            searchPillRow.setOnClickListener(v -> {
                GlassUi.hapticTick(v);
                search();
            });
            searchPillIcon = new ImageView(activity);
            Drawable mag = new GlassUi.SfIconDrawable(activity, "ic_baseline_search_24");
            mag.setTint(muted);
            searchPillIcon.setImageDrawable(mag);
            LinearLayout.LayoutParams magLp = new LinearLayout.LayoutParams(dp(activity, 16), dp(activity, 16));
            magLp.rightMargin = dp(activity, 7);
            searchPillRow.addView(searchPillIcon, magLp);

            searchPlaceholderView = new TextView(activity);
            searchPlaceholderView.setTag("ios_muted");
            searchPlaceholderView.setText("\u641c\u7d22 RJ \u53f7\u3001\u4f5c\u54c1\u6216\u97f3\u8f68");
            searchPlaceholderView.setTextSize(14);
            searchPlaceholderView.setTextColor(muted);
            searchPlaceholderView.setSingleLine(true);
            searchPillRow.addView(searchPlaceholderView, new LinearLayout.LayoutParams(0, -2, 1));

            LinearLayout.LayoutParams searchLp = new LinearLayout.LayoutParams(-1, dp(activity, 35));
            searchLp.setMargins(dp(activity, 16), 0, dp(activity, 16), dp(activity, 8));
            header.addView(searchPillRow, searchLp);

            // 4. Bottom 0.5dp iOS separator hairline
            headerHairline = new View(activity);
            headerHairline.setBackgroundColor(ThemePalettes.light(page) ? 0x223c3c43 : 0x2e545458);
            header.addView(headerHairline, new LinearLayout.LayoutParams(-1, Math.max(1, dp(activity, 0.55f))));
        }

        private void styleSearchPill(int card, int muted) {
            if (searchPillRow == null) return;
            boolean light = ThemePalettes.light(card);
            GradientDrawable pill = GlassUi.rounded(light ? 0xffe5e5ea : 0xff1c1c1e, dp(activity, 10));
            if (PlaybackOptions.liquidGlass(activity)) {
                pill.setStroke(Math.max(1, dp(activity, 0.6f)), light ? 0x80ffffff : 0x22ffffff);
            }
            searchPillRow.setBackground(pill);
            if (searchPlaceholderView != null) searchPlaceholderView.setTextColor(muted);
            if (searchPillIcon != null && searchPillIcon.getDrawable() != null)
                searchPillIcon.getDrawable().setTint(muted);
        }

        void install() {
            palette = ThemePalettes.selected(activity);
            liquid = PlaybackOptions.liquidGlass(activity);
            ViewGroup parent = (ViewGroup)content.getParent(); int index = parent.indexOfChild(content);
            ViewGroup.LayoutParams constraints = content.getLayoutParams(); parent.removeView(content);
            body = new ModeContainer(activity, this); body.setId(View.generateViewId());
            parent.addView(body, index, constraints);
            body.addView(content, new FrameLayout.LayoutParams(-1, -1)); modes[0] = content;
            GlassUi.attachIosBounce(content);
            if (content instanceof RecyclerView) {
                ((RecyclerView)content).addOnScrollListener(new RecyclerView.OnScrollListener() {
                    @Override public void onScrolled(RecyclerView rv, int dx, int dy) {
                        if (active != 0) return;
                        scrollY = Math.max(0, rv.computeVerticalScrollOffset());
                        applyHeaderCollapse();
                    }
                });
            }
            nav = navigation(activity, body, first, favorite, more, 0, this::search, 0);
            ViewGroup capsule = (ViewGroup)nav.getChildAt(0);
            LinearLayout row = (LinearLayout)capsule.getChildAt(1);
            row.getChildAt(0).setOnClickListener(v -> { GlassUi.hapticTick(v); selectTab(0); });
            row.getChildAt(1).setOnClickListener(v -> { GlassUi.hapticTick(v); selectTab(1); });
            row.getChildAt(2).setOnClickListener(v -> { GlassUi.hapticTick(v); openHistory(activity, active); });
            row.getChildAt(3).setOnClickListener(v -> { GlassUi.hapticTick(v); showMore(); });
            favoritePopup = popupDismiss(activity, "progressMenu", row.getChildAt(1), () -> nav.post(this::updateNav));
            morePopup = popupDismiss(activity, "moreMenu", row.getChildAt(3), () -> nav.post(this::updateNav));
            original.setVisibility(View.INVISIBLE);
            styleMini(activity, mini, body); parent.bringChildToFront(mini);
            overlay = new LinearLayout(activity); overlay.setOrientation(LinearLayout.VERTICAL);
            overlay.addView(nav, new LinearLayout.LayoutParams(-1, dp(activity, 62)));
            container.addView(overlay, new FrameLayout.LayoutParams(-1, -2, Gravity.BOTTOM));
            WindowInsets insets = activity.getWindow().getDecorView().getRootWindowInsets();
            setBottom(insets == null ? 0 : insets.getSystemWindowInsetBottom());
            mini.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> adjust());
            overlay.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> adjust());
            content.getViewTreeObserver().addOnGlobalLayoutListener(this::adjust);
            overlay.requestApplyInsets();
            syncHeaderTitle();
        }

        private void applyHeaderCollapse() {
            if (largeTitleRow == null) return;
            float collapse = active == 0 ? ShellState.largeTitleCollapse(scrollY, dp(activity, 56)) : 0f;
            largeTitleRow.setAlpha(1f - collapse);
            View tb = header.findViewById(id(activity, "toolbar"));
            if (tb instanceof ViewGroup) {
                ViewGroup toolbar = (ViewGroup)tb;
                for (int i = 0; i < toolbar.getChildCount(); i++) {
                    View c = toolbar.getChildAt(i);
                    if (c instanceof TextView) {
                        TextView tv = (TextView)c;
                        tv.setTextSize(17);
                        tv.setTypeface(GlassUi.boldFont());
                        tv.setAlpha(collapse);
                    }
                }
            }
        }

        private void syncHeaderTitle() {
            CharSequence raw = active == 0 ? (onlineTitle != null ? onlineTitle : activity.getTitle()) : activity.getTitle();
            if (active == 0 && activity.getTitle() != null && !"Kikoeru".contentEquals(activity.getTitle())) {
                raw = activity.getTitle();
                onlineTitle = raw;
            }
            String display = ShellState.displayCatalogTitle(raw, active, catalogType);
            String count = active == 0 ? ShellState.extractWorkCount(raw) : "";
            if (largeTitleView != null) largeTitleView.setText(display);
            if (countBadgeView != null) {
                countBadgeView.setText(count);
                countBadgeView.setVisibility(count.isEmpty() ? View.GONE : View.VISIBLE);
            }
            if (searchPillRow != null) {
                searchPillRow.setVisibility(active == 0 ? View.VISIBLE : View.GONE);
            }
            View tb = header.findViewById(id(activity, "toolbar"));
            if (tb instanceof ViewGroup) {
                ViewGroup toolbar = (ViewGroup)tb;
                for (int i = 0; i < toolbar.getChildCount(); i++) {
                    View c = toolbar.getChildAt(i);
                    if (c instanceof TextView) {
                        TextView tv = (TextView)c;
                        if (!display.contentEquals(tv.getText())) tv.setText(display);
                    }
                }
            }
            applyHeaderCollapse();
        }

        boolean canSwitch() {
            return active == 1 ? local == null || local.canSwitch() : active != 2 || cloud == null || cloud.canSwitch();
        }
        void switchSource(int target) {
            if (target < 0 || target > 2 || target == active) { tabs.setSource(active, true); return; }
            if (!canSwitch()) { tabs.setSource(active, true); return; }
            try {
                if (target == 1 && local == null) {
                    local = new LocalLibraryController(activity, true); local.create(null);
                    modes[1] = new PanelSlot(activity, local.view()); body.addView(modes[1], new FrameLayout.LayoutParams(-1, -1));
                } else if (target == 2 && cloud == null) {
                    cloud = new BaiduCloudController(activity, true); cloud.create(null);
                    modes[2] = new PanelSlot(activity, cloud.view()); body.addView(modes[2], new FrameLayout.LayoutParams(-1, -1));
                }
            } catch (RuntimeException failure) {
                if (target == 1 && modes[1] == null && local != null) { local.onDestroy(); local = null; }
                if (target == 2 && modes[2] == null && cloud != null) { cloud.onDestroy(); cloud = null; }
                android.util.Log.e("Kikoeru", "Unable to open library source", failure);
                GlassUi.toast(activity, "\u65e0\u6cd5\u6253\u5f00\u4f5c\u54c1\u6765\u6e90");
                tabs.setSource(active, true); return;
            }
            View previous = modes[active], next = modes[target];
            if (active == 0) onlineTitle = activity.getTitle();
            active = target; tabs.setSource(active, true); updateNav(); activity.invalidateOptionsMenu();
            activity.setTitle(active == 0 && onlineTitle != null ? onlineTitle : "Kikoeru");
            syncHeaderTitle();
            final int generation = ++transition;
            for (View page : modes) if (page != null) { page.animate().cancel(); if (page != previous && page != next) page.setVisibility(View.GONE); }
            next.setVisibility(View.VISIBLE); next.setAlpha(0f);
            long duration = android.animation.ValueAnimator.areAnimatorsEnabled() ? 220 : 0;
            next.animate().alpha(1f).setDuration(duration).start();
            previous.animate().alpha(0f).setDuration(duration).withEndAction(() -> {
                if (generation == transition && previous != modes[active]) { previous.setVisibility(View.GONE); previous.setAlpha(1f); }
            }).start();
            adjust();
        }
        void selectTab(int tab) {
            if (tab == 0) {
                if (active == 0) { if (catalogType != 0x1eb) first.performClick(); }
                else if (active == 1) local.tab(false); else cloud.showWorks();
            } else {
                if (active == 0) {
                    refreshPopupStyle(activity, "progressMenu");
                    if (favoritePopup) nav.select(1, true);
                    favorite.performClick();
                } else if (active == 1) local.requestTab(true); else cloud.requestTab(true);
            }
        }
        void showMore() {
            if (active == 0) {
                refreshPopupStyle(activity, "moreMenu");
                if (morePopup) nav.select(3, true);
                more.performClick();
            } else if (active == 1) local.managementMenu(); else cloud.menu();
        }
        void search() {
            if (active == 0) openOnlineSearch(activity); else if (active == 1) local.toggleSearch(); else cloud.toggleSearch();
        }
        void updateNav() {
            int selected = active == 0 ? actual : active == 1 && local != null && local.isFavorite()
                    || active == 2 && cloud != null && cloud.isFavorite() ? 1 : 0;
            if (nav != null) nav.select(selected, true);
        }
        void route(Intent intent) {
            int target = Math.max(0, Math.min(2, intent.getIntExtra(EXTRA_SOURCE, 0)));
            switchSource(target);
            if (intent.hasExtra(EXTRA_TAB)) selectTab(intent.getIntExtra(EXTRA_TAB, 0));
        }
        void setBottom(int value) { bottom = Math.max(0, value); adjust(); }
        void adjust() {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            int reserved = dp(activity, 68) + bottom;
            ViewGroup.LayoutParams lp = original.getLayoutParams();
            if (lp.height != reserved) { lp.height = reserved; original.setLayoutParams(lp); }
            if (overlay != null && overlay.getPaddingBottom() != bottom + dp(activity, 6))
                overlay.setPadding(0, 0, 0, bottom + dp(activity, 6));
            int inset = reserved + (mini.getVisibility() == View.VISIBLE ? dp(activity, 74) : 0);
            int listBottom = inset + dp(activity, 8);
            if (content.getPaddingBottom() != listBottom)
                content.setPadding(content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(), listBottom);
            if (local != null) local.setBottomInset(inset);
            if (cloud != null) cloud.setBottomInset(inset);
            if (active != 0 && activity.getTitle() != null && !"Kikoeru".contentEquals(activity.getTitle())) {
                onlineTitle = activity.getTitle(); activity.setTitle("Kikoeru");
            }
            syncHeaderTitle();
        }
        void select(int type) {
            catalogType = type;
            actual = ShellState.catalogTab(type);
            if (active == 0) updateNav();
            syncHeaderTitle();
        }
        void syncToolbarPopupTheme(int page) {
            View tb = header == null ? null : header.findViewById(id(activity, "toolbar"));
            if (tb == null) return;
            boolean isLight = ThemePalettes.light(page);
            int resId = activity.getResources().getIdentifier(
                    isLight ? "ThemeOverlay.Material3.Light" : "ThemeOverlay.Material3.Dark",
                    "style", activity.getPackageName());
            if (resId == 0) {
                resId = activity.getResources().getIdentifier(
                        isLight ? "ThemeOverlay.AppCompat.Light" : "ThemeOverlay.AppCompat.Dark",
                        "style", activity.getPackageName());
            }
            if (resId != 0) {
                try {
                    tb.getClass().getMethod("setPopupTheme", int.class).invoke(tb, resId);
                } catch (ReflectiveOperationException | RuntimeException ignored) {}
            }
        }
        void refreshPalette() {
            if (local != null) local.onStart();
            if (cloud != null) cloud.onStart();
            int current = ThemePalettes.selected(activity);
            boolean currentLiquid = PlaybackOptions.liquidGlass(activity);
            int page = ThemePalettes.color(current, 1);
            int card = ThemePalettes.color(current, 2);
            int ink = ThemePalettes.text(page);
            int muted = ThemePalettes.secondary(page);
            if (largeTitleView != null) largeTitleView.setTextColor(ink);
            if (countBadgeView != null) countBadgeView.setTextColor(muted);
            styleSearchPill(card, muted);
            if (headerHairline != null)
                headerHairline.setBackgroundColor(ThemePalettes.light(page) ? 0x223c3c43 : 0x2e545458);
            if (current == palette && currentLiquid == liquid) return;
            palette = current;
            liquid = currentLiquid;
            syncToolbarPopupTheme(page);
            nav.refreshPalette();
            tabs.refreshPalette();
            refreshMini(activity, mini);
            refreshPopupStyle(activity, "progressMenu");
            refreshPopupStyle(activity, "moreMenu");
            if (local != null) local.refreshPalette();
            if (cloud != null) cloud.refreshPalette();
        }
        void dispose() { if (local != null) local.onDestroy(); if (cloud != null) cloud.onDestroy(); }
    }
    private static final class ModeContainer extends FrameLayout {
        final Home home; final int slop; float downX, downY, lastX, velocity; long lastTime; boolean eligible, dragging;
        ModeContainer(Activity activity, Home owner) {
            super(activity); home = owner; slop = Math.max(ViewConfiguration.get(activity).getScaledTouchSlop(), dp(activity, 10));
        }
        @Override public boolean onInterceptTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = lastX = event.getX(); downY = event.getY(); lastTime = event.getEventTime(); velocity = 0;
                    eligible = home.canSwitch(); return false;
                case MotionEvent.ACTION_MOVE:
                    if (!eligible) return false;
                    float dx = event.getX() - downX, dy = event.getY() - downY;
                    if (Math.abs(dy) > slop && Math.abs(dy) > Math.abs(dx)) { eligible = false; return false; }
                    if (ShellState.swipeTarget(home.active, dx) != home.active && ShellState.horizontalGesture(dx, dy, slop)) {
                        dragging = true; return true;
                    }
                    return false;
                case MotionEvent.ACTION_CANCEL: eligible = false; return false;
                default: return false;
            }
        }
        @Override public boolean onTouchEvent(MotionEvent event) {
            if (!dragging) return false;
            long elapsed = event.getEventTime() - lastTime;
            if (elapsed > 0) {
                float change = event.getX() - lastX;
                if (Math.abs(change) > .1f) velocity = change * 1000f / elapsed; else if (elapsed > 120) velocity = 0;
                lastX = event.getX(); lastTime = event.getEventTime();
            }
            float delta = event.getX() - downX;
            if (event.getActionMasked() == MotionEvent.ACTION_MOVE) {
                if (getWidth() > 0) home.tabs.swipePosition(home.active - delta / getWidth()); return true;
            }
            if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                int target = ShellState.swipeTarget(home.active, delta);
                boolean commit = home.canSwitch() && ShellState.commitSwipe(home.active, target, delta, getWidth(), velocity, getResources().getDisplayMetrics().density);
                dragging = false; eligible = false;
                if (commit) home.switchSource(target); else home.tabs.setSource(home.active, true);
                performClick(); return true;
            }
            if (event.getActionMasked() == MotionEvent.ACTION_CANCEL) {
                dragging = false; eligible = false; home.tabs.setSource(home.active, true); return true;
            }
            return true;
        }
        @Override public boolean performClick() { super.performClick(); return true; }
    }
    public static void homeInsets(Activity activity, int bottom) { Home home = HOMES.get(activity); if (home != null) home.setBottom(bottom); }
    public static void homeSelection(Activity activity, int type) { Home home = HOMES.get(activity); if (home != null) home.select(type); }
    public static void homeResume(Activity activity) { Home home = HOMES.get(activity); if (home != null) home.refreshPalette(); }
    public static void panelSelection(Activity activity, int source, int tab) {
        Home home = HOMES.get(activity); if (home != null && home.active == source) home.updateNav();
    }
    public static boolean showHomeSource(Activity activity, int source) {
        Home home = HOMES.get(activity); if (home == null) return false;
        home.switchSource(source); return true;
    }
    public static boolean homeBack(Activity activity) {
        Home home = HOMES.get(activity); if (home == null) return false;
        return home.active == 1 && home.local != null ? home.local.handleBack()
                : home.active == 2 && home.cloud != null && home.cloud.handleBack();
    }
    public static boolean homeResult(Activity activity, int request, int result, Intent data) {
        Home home = HOMES.get(activity);
        if (home == null || home.local == null || request != 72 && request != 73) return false;
        home.local.onActivityResult(request, result, data); return true;
    }
    public static void homeMenu(Activity activity, Menu menu) {
        Home home = HOMES.get(activity); if (home == null || menu == null) return;
        for (int i = 0; i < menu.size(); i++) {
            MenuItem item = menu.getItem(i);
            int id = item.getItemId();
            boolean vis = ShellState.visibleToolbarItem(home.active, id);
            item.setVisible(vis);
            if (vis && (id == 0x9 || id == 0x10)) {
                Drawable sf = GlassUi.sfDrawable(activity,
                        id == 0x9 ? "ic_baseline_view_column_24" : "ic_baseline_sort_24");
                if (sf != null) {
                    sf.setTint(GlassUi.RED);
                    item.setIcon(sf);
                }
            }
        }
    }
    public static void removeHome(Activity activity) {
        Home home = HOMES.remove(activity); if (home != null) home.dispose();
    }
    public static boolean homeIntent(Activity activity, Intent intent) {
        if (intent == null || !intent.hasExtra(EXTRA_SOURCE) && !intent.hasExtra(EXTRA_TAB)) return false;
        Home home = HOMES.get(activity); if (home == null) return false;
        home.route(intent); return true;
    }

    public static void installHistory(Activity activity) {
        if (HISTORIES.containsKey(activity)) return;
        View content = activity.findViewById(id(activity, "mainRecycler"));
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (content == null || !(root instanceof FrameLayout)) return;
        History history = new History(activity, content, root);
        HISTORIES.put(activity, history); history.install();
    }
    public static void resumeHistory(Activity activity) {
        History h = HISTORIES.get(activity);
        if (h != null) { h.mini.active(true); h.refreshPalette(); }
    }
    public static void pauseHistory(Activity activity) { History h = HISTORIES.get(activity); if (h != null) h.mini.active(false); }
    public static void destroyHistory(Activity activity) {
        History h = HISTORIES.remove(activity); if (h == null) return;
        h.mini.dispose(); if (h.bound) activity.unbindService(h);
    }
    private static final class History implements ServiceConnection {
        final Activity activity; final View content; final ViewGroup root; final MiniPlayer mini;
        final int source; boolean bound;
        LinearLayout header; ImageButton back; TextView backLabel, title; View hairline; GlassUi.Navigation nav;
        History(Activity a, View c, ViewGroup r) {
            activity = a; content = c; root = r; mini = new MiniPlayer(a);
            source = Math.max(0, Math.min(2, a.getIntent().getIntExtra(EXTRA_SOURCE, 0)));
        }
        void install() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            header = new LinearLayout(activity);
            header.setOrientation(LinearLayout.VERTICAL);
            header.setBackgroundColor(page);

            FrameLayout navRow = new FrameLayout(activity);
            LinearLayout leftBack = new LinearLayout(activity);
            leftBack.setGravity(Gravity.CENTER_VERTICAL);
            leftBack.setPadding(dp(activity, 6), 0, dp(activity, 12), 0);
            back = GlassUi.icon(activity, "ic_arrow_back_black_24", "\u8fd4\u56de", v -> {
                GlassUi.hapticTick(v);
                activity.finish();
            });
            back.setImageTintList(ColorStateList.valueOf(GlassUi.RED));
            back.setPadding(dp(activity, 6), dp(activity, 12), dp(activity, 2), dp(activity, 12));
            leftBack.addView(back, new LinearLayout.LayoutParams(dp(activity, 30), dp(activity, 48)));
            backLabel = new TextView(activity);
            backLabel.setTag("ios_accent");
            backLabel.setText("\u8fd4\u56de");
            backLabel.setTextSize(17);
            backLabel.setTextColor(GlassUi.RED);
            leftBack.addView(backLabel, new LinearLayout.LayoutParams(-2, -2));
            GlassUi.attachIosPress(leftBack, 0.94f);
            leftBack.setOnClickListener(v -> back.performClick());
            navRow.addView(leftBack, new FrameLayout.LayoutParams(-2, dp(activity, 48), Gravity.START | Gravity.CENTER_VERTICAL));

            title = new TextView(activity);
            title.setText("\u5386\u53f2\u8bb0\u53f2".replace("\u53f2\u8bb0\u53f2", "\u53f2\u8bb0\u5f55"));
            title.setTextSize(17.5f);
            title.setGravity(Gravity.CENTER);
            title.setTextColor(ThemePalettes.text(page));
            title.setTypeface(GlassUi.boldFont());
            navRow.addView(title, new FrameLayout.LayoutParams(-2, -2, Gravity.CENTER));
            header.addView(navRow, new LinearLayout.LayoutParams(-1, dp(activity, 48)));

            hairline = new View(activity);
            hairline.setBackgroundColor(ThemePalettes.light(page) ? 0x223c3c43 : 0x2e545458);
            header.addView(hairline, new LinearLayout.LayoutParams(-1, Math.max(1, dp(activity, 0.55f))));

            root.addView(header, new FrameLayout.LayoutParams(-1, -2, Gravity.TOP));
            ImageButton works = GlassUi.icon(activity, "ic_baseline_widgets_24", "\u4f5c\u54c1", v -> openSource(activity, source, 0));
            ImageButton favorites = GlassUi.icon(activity, "ic_baseline_favorite_24", "\u6536\u85cf", v -> openSource(activity, source, 1));
            ImageButton more = GlassUi.icon(activity, "ic_baseline_more_horiz_24", "\u66f4\u591a", v -> openSettings(activity));
            nav = navigation(activity, content, works, favorites, more, source, () -> openOnlineSearch(activity), 2);
            LinearLayout dock = dock(activity, content, mini.view, nav);
            root.addView(dock, new FrameLayout.LayoutParams(-1, -2, Gravity.BOTTOM));
            dock.setOnApplyWindowInsetsListener((v, insets) -> { v.setPadding(0, 0, 0, dp(activity, 6) + insets.getSystemWindowInsetBottom()); return insets; });
            dock.requestApplyInsets();
            keepVisible(activity, content, dock, dp(activity, 54));
            bound = activity.bindService(new Intent(activity, AudioService.class), this, Activity.BIND_AUTO_CREATE);
        }
        void refreshPalette() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            if (header != null) header.setBackgroundColor(page);
            if (back != null) back.setImageTintList(ColorStateList.valueOf(GlassUi.RED));
            if (backLabel != null) backLabel.setTextColor(GlassUi.RED);
            if (title != null) title.setTextColor(ThemePalettes.text(page));
            if (hairline != null) hairline.setBackgroundColor(ThemePalettes.light(page) ? 0x223c3c43 : 0x2e545458);
            if (nav != null) nav.refreshPalette();
            refreshMini(activity, mini.view);
        }
        @Override public void onServiceConnected(ComponentName name, IBinder binder) { mini.attach((AudioService.CtrlBinder)binder); }
        @Override public void onServiceDisconnected(ComponentName name) { mini.attach(null); }
    }
}
