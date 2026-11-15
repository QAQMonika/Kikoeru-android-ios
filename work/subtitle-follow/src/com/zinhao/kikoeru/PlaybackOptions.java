package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * "更多" settings page rebuilt in a ChatGPT-mobile style: centered title with a round back
 * button, large rounded cards with hairline borders, plain colored glyph icons, muted values
 * and chevrons on the right. Native MoreActivity rows stay in the tree (hidden) so their
 * original listeners keep working; their CheckBoxes are re-parented into the new rows.
 */
public final class PlaybackOptions {
    public static boolean enabled(Context context) {
        return context.getSharedPreferences("playback_options", 0).getBoolean("remember_position", true);
    }
    static void enabled(Context context, boolean value) {
        context.getSharedPreferences("playback_options", 0).edit().putBoolean("remember_position", value).apply();
    }
    static boolean subtitleBlur(Context context) {
        return context.getSharedPreferences("playback_options", 0).getBoolean("subtitle_blur", true);
    }
    static boolean subtitleMotion(Context context) {
        return context.getSharedPreferences("playback_options", 0).getBoolean("subtitle_motion", true);
    }
    public static boolean liquidGlass(Context context) {
        return context.getSharedPreferences("playback_options", 0).getBoolean("liquid_glass", true);
    }
    public static void liquidGlass(Context context, boolean value) {
        context.getSharedPreferences("playback_options", 0).edit().putBoolean("liquid_glass", value).apply();
    }

    private static final String TAG_CARD = "gpt_card";
    private static final String TAG_ROW = "gpt_row";
    private static final String TAG_DIVIDER = "gpt_divider";
    private static final String TAG_HEADER = "gpt_header";
    private static final String TAG_ICON = "gpt_icon";
    private static final String TAG_CHEVRON = "gpt_chevron";
    private static final String TAG_SWITCH = "gpt_switch";
    private static final String TAG_TITLE = "gpt_title";
    private static final String TAG_MUTED = "ios_muted";
    private static final WeakHashMap<Activity, String> STYLED = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Long> ACCOUNT_REFRESH = new WeakHashMap<>();

    public static void install(Activity activity) {
        int content = GlassUi.resource(activity, "id", "content");
        View found = activity.findViewById(content);
        if (!(found instanceof LinearLayout)) return;
        LinearLayout parent = (LinearLayout)found;
        parent.setTag("gpt_more_content");
        if (parent.findViewWithTag("ios_more_installed") == null) {
            View marker = new View(activity);
            marker.setTag("ios_more_installed");
            marker.setVisibility(View.GONE);
            parent.addView(marker, 0, new LinearLayout.LayoutParams(0, 0));
            build(activity, parent);
            installHeader(activity);
        }
        if (parent.getParent() instanceof LinearLayout) {
            LinearLayout owner = (LinearLayout)parent.getParent();
            int index = owner.indexOfChild(parent);
            ViewGroup.LayoutParams layout = parent.getLayoutParams();
            owner.removeView(parent);
            ScrollView scroll = new ScrollView(activity);
            scroll.setFillViewport(true);
            scroll.setClipToPadding(false);
            scroll.setVerticalScrollBarEnabled(false);
            GlassUi.attachIosBounce(scroll);
            parent.setPadding(0, GlassUi.dp(activity, 4), 0, GlassUi.dp(activity, 40));
            scroll.addView(parent, new ScrollView.LayoutParams(-1, -2));
            owner.addView(scroll, index, layout);
        }
        STYLED.remove(activity);
        styleMore(activity);
    }

    // ---------------------------------------------------------------- structure

    private static void build(Activity a, LinearLayout parent) {
        // Hide every native row; they remain attached so performClick() reaches original listeners.
        View nativeLrc = byId(a, parent, "relativeLayout");
        View nativeExternal = byId(a, parent, "saveExternal");
        View nativeDebug = byId(a, parent, "debug");
        View nativeLicense = byId(a, parent, "license");
        View nativeAbout = byId(a, parent, "about");
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (!"ios_more_installed".equals(child.getTag())) child.setVisibility(View.GONE);
        }

        parent.addView(accountCard(a));

        parent.addView(header(a, "\u5916\u89c2"));
        LinearLayout look = card(a);
        addRow(look, switchRow(a, "liquid_glass", "sf_sparkles", GlassUi.IOS_BLUE,
                "\u6db2\u6001\u73bb\u7483\u6548\u679c", "\u5bfc\u822a\u680f\u4e0e\u5361\u7247\u4f7f\u7528\u6a21\u7cca\u73bb\u7483\u6750\u8d28"));
        TextView paletteValue = value(a, "");
        paletteValue.setTag("palette_sub");
        addRow(look, navRow(a, "sf_palette", GlassUi.IOS_INDIGO, "\u914d\u8272\u4e0e\u5916\u89c2", null, paletteValue,
                v -> a.startActivity(new Intent(a, ThemePaletteActivity.class))));
        parent.addView(look);

        parent.addView(header(a, "\u64ad\u653e\u4e0e\u5b57\u5e55"));
        LinearLayout play = card(a);
        addRow(play, switchRow(a, "remember_position", "ic_clock_black_24dp", GlassUi.IOS_ORANGE,
                "\u8bb0\u4f4f\u64ad\u653e\u4f4d\u7f6e", "\u518d\u6b21\u6253\u5f00\u65f6\u4ece\u4e0a\u6b21\u8fdb\u5ea6\u7ee7\u7eed"));
        addRow(play, switchRow(a, "subtitle_blur", "sf_waveform", GlassUi.IOS_PURPLE,
                "\u5b57\u5e55\u6a21\u7cca\u6548\u679c", "\u975e\u5f53\u524d\u884c\u5b57\u5e55\u6a21\u7cca\u663e\u793a"));
        addRow(play, switchRow(a, "subtitle_motion", "sf_motion", GlassUi.IOS_TEAL,
                "\u5b57\u5e55\u4ea4\u9519\u6eda\u52a8", "\u5207\u6362\u6b4c\u8bcd\u65f6\u9010\u884c\u9519\u843d\u6eda\u52a8"));
        View lrc = nativeSwitchRow(a, nativeLrc, "checkBox", "sf_filter", GlassUi.IOS_GREEN,
                "\u4ec5\u52a0\u8f7d\u6709\u5b57\u5e55\u4f5c\u54c1", "\u5728\u7ebf\u5217\u8868\u53ea\u663e\u793a\u5e26\u5b57\u5e55\u7684\u4f5c\u54c1");
        if (lrc != null) addRow(play, lrc);
        parent.addView(play);

        parent.addView(header(a, "\u4e0b\u8f7d\u4e0e\u5b58\u50a8"));
        LinearLayout storage = card(a);
        addRow(storage, navRow(a, "sf_download", GlassUi.IOS_BLUE, "\u4e0b\u8f7d\u4efb\u52a1", null, null,
                v -> a.startActivity(target(a, "DownLoadMissionActivity"))));
        View external = nativeSwitchRow(a, nativeExternal, "checkBox3", "ic_baseline_folder_24", GlassUi.IOS_ORANGE,
                "\u4fdd\u5b58\u5230\u5916\u90e8\u6587\u4ef6\u5939", "\u4e0b\u8f7d\u6587\u4ef6\u5b58\u653e\u5230\u516c\u5171\u5b58\u50a8");
        if (external != null) addRow(storage, external);
        parent.addView(storage);

        parent.addView(header(a, "\u5173\u4e8e"));
        LinearLayout about = card(a);
        View debug = nativeSwitchRow(a, nativeDebug, "checkBox1", "sf_bug", GlassUi.IOS_GRAY,
                "\u8c03\u8bd5\u6a21\u5f0f", null);
        if (debug != null) addRow(about, debug);
        if (nativeLicense != null) addRow(about, navRow(a, "sf_doc", GlassUi.IOS_BLUE,
                "\u5f00\u6e90\u4ee3\u7801\u8bb8\u53ef", null, null, v -> nativeLicense.performClick()));
        if (nativeAbout != null) addRow(about, navRow(a, "sf_info", GlassUi.RED,
                "\u5173\u4e8e Kikoeru", null, value(a, versionName(a)), v -> nativeAbout.performClick()));
        parent.addView(about);
    }

    /** Replaces the native toolbar with a centered title and a round back button. */
    private static void installHeader(Activity a) {
        View bar = a.findViewById(GlassUi.resource(a, "id", "appBarLayout"));
        View toolbar = a.findViewById(GlassUi.resource(a, "id", "toolbar"));
        if (!(bar instanceof ViewGroup) || toolbar == null) return;
        ViewGroup appBar = (ViewGroup)bar;
        if (appBar.findViewWithTag("gpt_header_bar") != null) return;
        toolbar.setVisibility(View.GONE);
        FrameLayout header = new FrameLayout(a);
        header.setTag("gpt_header_bar");
        int pad = GlassUi.dp(a, 16);
        header.setPadding(pad, GlassUi.dp(a, 6), pad, GlassUi.dp(a, 6));

        FrameLayout back = new FrameLayout(a);
        back.setTag("gpt_back");
        back.setContentDescription("\u8fd4\u56de");
        View chevron = new View(a);
        chevron.setTag(TAG_CHEVRON + "_back");
        chevron.setBackground(new GlassUi.SfIconDrawable(a, "sf_chevron_left"));
        int icon = GlassUi.dp(a, 20);
        FrameLayout.LayoutParams clp = new FrameLayout.LayoutParams(icon, icon, Gravity.CENTER);
        back.addView(chevron, clp);
        GlassUi.attachIosPress(back, 0.9f);
        back.setOnClickListener(v -> { GlassUi.hapticTick(v); a.onBackPressed(); });
        int size = GlassUi.dp(a, 40);
        header.addView(back, new FrameLayout.LayoutParams(size, size, Gravity.START | Gravity.CENTER_VERTICAL));

        TextView title = new TextView(a);
        title.setTag("gpt_header_title");
        title.setText("\u66f4\u591a");
        title.setTextSize(17);
        title.setTypeface(GlassUi.mediumFont());
        title.setGravity(Gravity.CENTER);
        header.addView(title, new FrameLayout.LayoutParams(-2, -2, Gravity.CENTER));
        appBar.addView(header, new ViewGroup.LayoutParams(-1, GlassUi.dp(a, 56)));
    }

    private static View accountCard(Activity a) {
        LinearLayout card = card(a);
        card.setTag(TAG_CARD + "_account");
        LinearLayout row = new LinearLayout(a);
        row.setTag(TAG_ROW);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int h = GlassUi.dp(a, 16);
        row.setPadding(h, GlassUi.dp(a, 14), h, GlassUi.dp(a, 14));

        View avatar = new View(a);
        avatar.setTag("gpt_avatar");
        avatar.setBackground(new AvatarDrawable(a));
        int s = GlassUi.dp(a, 46);
        LinearLayout.LayoutParams alp = new LinearLayout.LayoutParams(s, s);
        alp.rightMargin = GlassUi.dp(a, 14);
        row.addView(avatar, alp);

        LinearLayout texts = new LinearLayout(a);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView name = new TextView(a);
        name.setTag("gpt_account_name");
        name.setTextSize(17);
        name.setTypeface(GlassUi.mediumFont());
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        texts.addView(name);
        TextView host = new TextView(a);
        host.setTag(TAG_MUTED);
        host.setContentDescription("gpt_account_host");
        host.setTextSize(13);
        host.setSingleLine(true);
        host.setEllipsize(TextUtils.TruncateAt.MIDDLE);
        host.setPadding(0, GlassUi.dp(a, 2), 0, 0);
        texts.addView(host);
        row.addView(texts, new LinearLayout.LayoutParams(0, -2, 1));

        TextView action = new TextView(a);
        action.setTag("ios_accent");
        action.setText("\u5207\u6362\u8d26\u53f7");
        action.setTextSize(15);
        action.setPadding(GlassUi.dp(a, 8), 0, GlassUi.dp(a, 4), 0);
        row.addView(action);
        row.addView(chevron(a));
        row.setOnClickListener(v -> {
            GlassUi.hapticTick(v);
            try {
                Object app = Class.forName("com.zinhao.kikoeru.App").getMethod("getInstance").invoke(null);
                app.getClass().getMethod("setValue", String.class, long.class).invoke(app, "update_time", 0L);
            } catch (Exception ignored) {}
            ACCOUNT_REFRESH.remove(a);
            a.startActivity(target(a, "UserSwitchActivity"));
        });
        card.addView(row, new LinearLayout.LayoutParams(-1, -2));
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams)card.getLayoutParams();
        lp.topMargin = GlassUi.dp(a, 8);
        return card;
    }

    private static void refreshAccount(Activity a, LinearLayout parent) {
        Long last = ACCOUNT_REFRESH.get(a);
        long now = android.os.SystemClock.uptimeMillis();
        if (last != null && now - last < 1500) return;
        ACCOUNT_REFRESH.put(a, now);
        String name = "", host = "";
        try {
            Object app = Class.forName("com.zinhao.kikoeru.App").getMethod("getInstance").invoke(null);
            Object user = app.getClass().getMethod("currentUser").invoke(app);
            if (user != null) {
                Object n = user.getClass().getMethod("getName").invoke(user);
                Object h = user.getClass().getMethod("getHost").invoke(user);
                name = n == null ? "" : n.toString();
                host = h == null ? "" : h.toString();
            }
        } catch (Exception ignored) {}
        if (name.isEmpty()) name = "\u672a\u767b\u5f55";
        if (host.isEmpty()) host = "\u70b9\u51fb\u767b\u5f55\u6216\u6dfb\u52a0\u8d26\u53f7";
        host = host.replaceFirst("^https?://", "");
        View nameView = parent.findViewWithTag("gpt_account_name");
        if (nameView instanceof TextView && !name.contentEquals(((TextView)nameView).getText()))
            ((TextView)nameView).setText(name);
        View avatar = parent.findViewWithTag("gpt_avatar");
        if (avatar != null && avatar.getBackground() instanceof AvatarDrawable)
            ((AvatarDrawable)avatar.getBackground()).set(name.substring(0, Math.min(1, name.length())).toUpperCase(), 0);
        View card = parent.findViewWithTag(TAG_CARD + "_account");
        if (card instanceof ViewGroup) {
            TextView hostView = findHost((ViewGroup)card);
            if (hostView != null && !host.contentEquals(hostView.getText())) hostView.setText(host);
        }
    }

    private static TextView findHost(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View c = group.getChildAt(i);
            if (c instanceof TextView && "gpt_account_host".contentEquals(
                    c.getContentDescription() == null ? "" : c.getContentDescription())) return (TextView)c;
            if (c instanceof ViewGroup) {
                TextView r = findHost((ViewGroup)c);
                if (r != null) return r;
            }
        }
        return null;
    }

    // ---------------------------------------------------------------- row builders

    private static LinearLayout card(Activity a) {
        LinearLayout card = new LinearLayout(a);
        card.setTag(TAG_CARD);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setClipToOutline(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        int m = GlassUi.dp(a, 16);
        lp.leftMargin = m;
        lp.rightMargin = m;
        card.setLayoutParams(lp);
        return card;
    }

    private static void addRow(LinearLayout card, View row) {
        if (card.getChildCount() > 0) {
            View divider = new View(card.getContext());
            divider.setTag(TAG_DIVIDER);
            card.addView(divider, new LinearLayout.LayoutParams(-1, Math.max(1, GlassUi.dp(card.getContext(), 0.6f))));
        }
        card.addView(row, new LinearLayout.LayoutParams(-1, -2));
    }

    private static TextView header(Activity a, String text) {
        TextView tv = new TextView(a);
        tv.setTag(TAG_HEADER);
        tv.setText(text);
        tv.setTextSize(13);
        tv.setPadding(GlassUi.dp(a, 30), GlassUi.dp(a, 22), GlassUi.dp(a, 24), GlassUi.dp(a, 8));
        tv.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        return tv;
    }

    private static TextView value(Activity a, String text) {
        TextView tv = new TextView(a);
        tv.setTag(TAG_MUTED);
        tv.setText(text);
        tv.setTextSize(15);
        tv.setSingleLine(true);
        tv.setPadding(GlassUi.dp(a, 8), 0, GlassUi.dp(a, 4), 0);
        return tv;
    }

    private static View chevron(Activity a) {
        View chevron = new View(a);
        chevron.setTag(TAG_CHEVRON);
        chevron.setBackground(new GlassUi.SfIconDrawable(a, "sf_chevron_right"));
        int s = GlassUi.dp(a, 16);
        chevron.setLayoutParams(new LinearLayout.LayoutParams(s, s));
        return chevron;
    }

    /** Icon + title (+ optional subtitle) shell shared by every row. */
    private static LinearLayout baseRow(Activity a, String symbol, int color, String title, String subtitle) {
        LinearLayout row = new LinearLayout(a);
        row.setTag(TAG_ROW);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(GlassUi.dp(a, 56));
        int h = GlassUi.dp(a, 16);
        row.setPadding(h, GlassUi.dp(a, 10), h, GlassUi.dp(a, 10));

        View icon = new View(a);
        icon.setTag(TAG_ICON);
        GlassUi.SfIconDrawable glyph = new GlassUi.SfIconDrawable(a, symbol);
        glyph.setTint(color);
        icon.setBackground(glyph);
        int s = GlassUi.dp(a, 22);
        LinearLayout.LayoutParams ilp = new LinearLayout.LayoutParams(s, s);
        ilp.rightMargin = GlassUi.dp(a, 16);
        row.addView(icon, ilp);

        LinearLayout texts = new LinearLayout(a);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView t = new TextView(a);
        t.setTag(TAG_TITLE);
        t.setText(title);
        t.setTextSize(16);
        texts.addView(t);
        if (subtitle != null) {
            TextView sub = new TextView(a);
            sub.setTag(TAG_MUTED);
            sub.setText(subtitle);
            sub.setTextSize(12.5f);
            sub.setPadding(0, GlassUi.dp(a, 2), 0, 0);
            texts.addView(sub);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, -2, 1));
        return row;
    }

    private static View navRow(Activity a, String symbol, int color, String title, String subtitle,
            TextView valueView, View.OnClickListener click) {
        LinearLayout row = baseRow(a, symbol, color, title, subtitle);
        if (valueView != null) row.addView(valueView, new LinearLayout.LayoutParams(-2, -2));
        row.addView(chevron(a));
        row.setOnClickListener(v -> { GlassUi.hapticTick(v); click.onClick(v); });
        return row;
    }

    private static View switchRow(Activity a, String key, String symbol, int color, String title, String subtitle) {
        LinearLayout row = baseRow(a, symbol, color, title, subtitle);
        Switch toggle = new Switch(a);
        toggle.setTag(TAG_SWITCH);
        toggle.setContentDescription(title);
        toggle.setChecked(a.getSharedPreferences("playback_options", 0).getBoolean(key, true));
        toggle.setOnCheckedChangeListener((button, checked) -> {
            GlassUi.hapticTick(button);
            a.getSharedPreferences("playback_options", 0).edit().putBoolean(key, checked).apply();
            button.invalidate();
            if ("liquid_glass".equals(key)) { STYLED.remove(a); styleMore(a); }
        });
        addSwitch(a, row, toggle);
        row.setOnClickListener(v -> toggle.setChecked(!toggle.isChecked()));
        return row;
    }

    /** Moves the native CheckBox (with its original listener) into a new styled row. */
    private static View nativeSwitchRow(Activity a, View nativeRow, String checkboxId, String symbol,
            int color, String title, String subtitle) {
        if (nativeRow == null) return null;
        View cb = nativeRow.findViewById(GlassUi.resource(a, "id", checkboxId));
        if (!(cb instanceof CompoundButton)) return null;
        CompoundButton box = (CompoundButton)cb;
        if (box.getParent() instanceof ViewGroup) ((ViewGroup)box.getParent()).removeView(box);
        box.setTag(TAG_SWITCH);
        box.setText("");
        box.setContentDescription(title);
        LinearLayout row = baseRow(a, symbol, color, title, subtitle);
        addSwitch(a, row, box);
        row.setOnClickListener(v -> nativeRow.performClick());
        return row;
    }

    private static void addSwitch(Activity a, LinearLayout row, CompoundButton toggle) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(GlassUi.dp(a, 51), GlassUi.dp(a, 31));
        lp.leftMargin = GlassUi.dp(a, 12);
        row.addView(toggle, lp);
        GlassUi.styleIosSwitch(a, toggle, GlassUi.RED);
    }

    // ---------------------------------------------------------------- styling

    static void styleMore(Activity activity) {
        int contentId = GlassUi.resource(activity, "id", "content");
        View found = activity.findViewById(contentId);
        if (!(found instanceof LinearLayout)) return;
        LinearLayout parent = (LinearLayout)found;
        refreshAccount(activity, parent);
        int n = ThemePalettes.selected(activity);
        String key = n + "|" + liquidGlass(activity);
        if (key.equals(STYLED.get(activity))) return;
        STYLED.put(activity, key);

        int page = ThemePalettes.color(n, 1);
        int card = ThemePalettes.color(n, 2);
        boolean light = ThemePalettes.light(card);
        int ink = ThemePalettes.text(card);
        int muted = ThemePalettes.secondary(card);
        int stroke = light ? 0x1a000000 : 0x1affffff;
        int divider = light ? 0x14000000 : 0x14ffffff;
        int pressed = light ? 0x0f000000 : 0x14ffffff;
        int accent = ThemePalettes.accent(card);

        parent.setBackgroundColor(page);
        View sub = parent.findViewWithTag("palette_sub");
        if (sub instanceof TextView) ((TextView)sub).setText(ThemePalettes.PRESETS[n][0]);

        List<View> all = new ArrayList<>();
        collect(parent, all);
        View bar = activity.findViewById(GlassUi.resource(activity, "id", "appBarLayout"));
        if (bar instanceof ViewGroup) collect((ViewGroup)bar, all);
        for (View v : all) {
            Object tag = v.getTag();
            if (TAG_CARD.equals(tag) || (TAG_CARD + "_account").equals(tag)) {
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(card);
                bg.setCornerRadius(GlassUi.dp(activity, 20));
                bg.setStroke(Math.max(1, GlassUi.dp(activity, 0.7f)), stroke);
                v.setBackground(bg);
            } else if (TAG_ROW.equals(tag)) {
                StateListDrawable states = new StateListDrawable();
                states.setExitFadeDuration(160);
                states.addState(new int[]{android.R.attr.state_pressed}, new ColorDrawable(pressed));
                states.addState(new int[]{}, new ColorDrawable(0));
                v.setBackground(states);
            } else if (TAG_DIVIDER.equals(tag)) {
                v.setBackgroundColor(divider);
            } else if (TAG_HEADER.equals(tag)) {
                ((TextView)v).setTextColor(ThemePalettes.secondary(page));
            } else if (TAG_CHEVRON.equals(tag)) {
                v.getBackground().setTint(light ? 0x66000000 : 0x66ffffff);
            } else if ((TAG_CHEVRON + "_back").equals(tag)) {
                v.getBackground().setTint(ink);
            } else if ("gpt_back".equals(tag)) {
                GradientDrawable circle = new GradientDrawable();
                circle.setShape(GradientDrawable.OVAL);
                circle.setColor(card);
                circle.setStroke(Math.max(1, GlassUi.dp(activity, 0.7f)), stroke);
                v.setBackground(circle);
            } else if ("gpt_header_bar".equals(tag)) {
                v.setBackgroundColor(page);
            } else if ("gpt_avatar".equals(tag) && v.getBackground() instanceof AvatarDrawable) {
                ((AvatarDrawable)v.getBackground()).set(null, accent);
            } else if (TAG_SWITCH.equals(tag) && v instanceof CompoundButton) {
                GlassUi.styleIosSwitch(activity, (CompoundButton)v, accent);
                v.invalidate();
            } else if (TAG_MUTED.equals(tag) && v instanceof TextView) {
                ((TextView)v).setTextColor(muted);
            } else if ("ios_accent".equals(tag) && v instanceof TextView) {
                ((TextView)v).setTextColor(accent);
            } else if ((TAG_TITLE.equals(tag) || "gpt_account_name".equals(tag)
                    || "gpt_header_title".equals(tag)) && v instanceof TextView) {
                ((TextView)v).setTextColor(ink);
            }
        }
    }

    private static void collect(ViewGroup group, List<View> out) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View c = group.getChildAt(i);
            if (c.getVisibility() == View.GONE && !(c instanceof CompoundButton)) continue;
            out.add(c);
            if (c instanceof ViewGroup && !(c instanceof CompoundButton)) collect((ViewGroup)c, out);
        }
    }

    // ---------------------------------------------------------------- helpers

    private static View byId(Activity a, ViewGroup parent, String name) {
        int id = GlassUi.resource(a, "id", name);
        return id != 0 ? parent.findViewById(id) : null;
    }

    private static Intent target(Activity a, String name) {
        return new Intent().setClassName(a, a.getPackageName() + "." + name);
    }

    /** Accent-filled circle with the account initial; a Drawable so the palette painter leaves it alone. */
    private static final class AvatarDrawable extends android.graphics.drawable.Drawable {
        private final android.graphics.Paint fill = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        private final android.graphics.Paint text = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        private String initial = "";
        AvatarDrawable(Context context) {
            fill.setColor(GlassUi.RED);
            text.setColor(0xffffffff);
            text.setTextAlign(android.graphics.Paint.Align.CENTER);
            text.setTypeface(GlassUi.boldFont());
            text.setTextSize(GlassUi.dp(context, 19));
        }
        void set(String letter, int color) {
            boolean changed = false;
            if (letter != null && !letter.equals(initial)) { initial = letter; changed = true; }
            if (color != 0 && color != fill.getColor()) { fill.setColor(color); changed = true; }
            if (changed) invalidateSelf();
        }
        @Override public void draw(android.graphics.Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float r = Math.min(b.width(), b.height()) / 2f;
            canvas.drawCircle(b.exactCenterX(), b.exactCenterY(), r, fill);
            android.graphics.Paint.FontMetrics fm = text.getFontMetrics();
            canvas.drawText(initial, b.exactCenterX(), b.exactCenterY() - (fm.ascent + fm.descent) / 2f, text);
        }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(android.graphics.ColorFilter filter) {}
        @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
    }

    private static String versionName(Activity a) {
        try {
            String v = a.getPackageManager().getPackageInfo(a.getPackageName(), 0).versionName;
            return v == null ? "" : "v" + v;
        } catch (Exception e) {
            return "";
        }
    }
}
