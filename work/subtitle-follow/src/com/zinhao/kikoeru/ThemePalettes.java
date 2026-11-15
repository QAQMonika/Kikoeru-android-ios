package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.core.view.WindowInsetsControllerCompat;
import java.util.HashMap;
import java.util.WeakHashMap;

public final class ThemePalettes {
    // name, page, card, bars; first two are iOS Native Dark & Light defaults.
    static final String[][] PRESETS = {
        {"iOS \u539f\u751f\u6df1\u8272", "#000000", "#1C1C1E", "#2C2C2E"},
        {"iOS \u539f\u751f\u6d45\u8272", "#F2F2F7", "#FFFFFF", "#E5E5EA"},
        {"\u9ed8\u8ba4\u591c\u8272", "#10131A", "#171A22", "#24212D"},
        {"\u77f3\u58a8\u9752", "#101819", "#1B2729", "#253C3E"},
        {"\u68ee\u6797\u7eff", "#111A16", "#1C2922", "#294436"},
        {"\u96fe\u6d77\u84dd", "#111820", "#1C2834", "#2B4357"},
        {"\u8393\u679c\u7ea2", "#1B1419", "#2C2028", "#4C2D3C"},
        {"\u6696\u7070\u91d1", "#191817", "#292725", "#3B3730"},
        {"\u70df\u7d2b\u7070", "#19171E", "#292630", "#3B3448"},
        {"\u975b\u9752\u591c", "#151620", "#222535", "#353B55"},
        {"\u67d4\u767d\u9752", "#EAF0EF", "#FAFCFB", "#CBDDDA"},
        {"\u96fe\u7070\u84dd", "#E9EDF2", "#F9FBFD", "#CBD6E5"}
    };
    private static final WeakHashMap<View, Integer> painted = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> watched = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> roles = new WeakHashMap<>();
    private static final WeakHashMap<View, String> names = new WeakHashMap<>();
    private static final HashMap<String, Integer> identifiers = new HashMap<>();

    static int selected(Context context) {
        int n = context.getSharedPreferences("appearance", Context.MODE_PRIVATE).getInt("palette", 0);
        return n >= 0 && n < PRESETS.length ? n : 0;
    }

    static void select(Context context, int n) {
        if (n >= 0 && n < PRESETS.length) context.getSharedPreferences("appearance", 0)
                .edit().putInt("palette", n).apply();
    }

    static int color(int n, int slot) { return Color.parseColor(PRESETS[n][slot]); }
    static boolean light(int color) {
        return 0.2126 * linear(Color.red(color)) + 0.7152 * linear(Color.green(color))
                + 0.0722 * linear(Color.blue(color)) > 0.35;
    }
    private static double linear(int value) {
        double c = value / 255.0;
        return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
    }
    static int text(int background) { return light(background) ? 0xff1c1c1e : 0xfff5f7fa; }
    static int secondary(int background) { return light(background) ? 0xff46535f : 0xffaeaeb2; }
    static int accent(int background) { return GlassUi.RED; }

    public static void apply(Activity activity) {
        String name = activity.getClass().getSimpleName();
        if (name.equals("AudioPlayerActivity") || name.equals("VideoPlayerActivity")) return;
        if (!name.equals("WorksActivity") && !name.equals("WorkTreeActivity")
                && !name.equals("LastWatchActivity") && !name.equals("MoreActivity")
                && !name.equals("SearchActivity") && !name.equals("VasActivity")
                && !name.equals("TagsActivity") && !name.equals("CirclesActivity")
                && !name.equals("AboutActivity") && !name.equals("LicenseActivity")
                && !name.equals("DownLoadMissionActivity") && !name.equals("UserSwitchActivity")
                && !name.equals("LoginAccountActivity")) return;
        GlassUi.installIosPage(activity);
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null || content.getChildCount() == 0) return;
        View root = content.getChildAt(0);
        paintPage(activity, root);
        if (!watched.containsKey(root)) {
            watched.put(root, true);
            // Newly loaded/recycled rows inherit the current palette too.
            root.getViewTreeObserver().addOnGlobalLayoutListener(() -> paintPage(activity, root));
        }
    }

    private static void paintPage(Activity activity, View root) {
        int n = selected(activity);
        int page = color(n, 1), bar = color(n, 3);
        String simple = activity.getClass().getSimpleName();
        boolean shell = simple.equals("WorksActivity") || simple.equals("LastWatchActivity")
                || simple.equals("WorkTreeActivity") || simple.equals("MoreActivity")
                || simple.equals("SearchActivity") || simple.equals("AboutActivity")
                && simple.equals("LicenseActivity");
        background(root, page, 0);
        paint(root, n, page, false, true);
        if (!simple.equals("WorksActivity") && !simple.equals("MoreActivity")) styleSecondaryToolbar(activity, root, page);
        if (simple.equals("WorkTreeActivity")) AppShell.styleWorkTree(activity);
        else if (simple.equals("MoreActivity")) PlaybackOptions.styleMore(activity);
        else if (simple.equals("SearchActivity")) styleSearch(activity, n);
        systemBars(activity.getWindow(), page, page, page);
    }

    private static void styleSecondaryToolbar(Activity activity, View root, int page) {
        int toolbarId = GlassUi.resource(activity, "id", "toolbar");
        if (toolbarId == 0) return;
        View tb = root.findViewById(toolbarId);
        if (!(tb instanceof ViewGroup)) return;
        ViewGroup toolbar = (ViewGroup)tb;
        toolbar.setBackgroundColor(page);
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof ImageButton) {
                ImageButton navBtn = (ImageButton)child;
                Drawable sf = GlassUi.sfDrawable(activity, "sf_chevron_left");
                if (sf != null && !(navBtn.getDrawable() instanceof GlassUi.SfIconDrawable)) {
                    sf.setTint(GlassUi.RED);
                    navBtn.setImageDrawable(sf);
                    GlassUi.attachIosPress(navBtn, 0.90f);
                }
            } else if (child instanceof TextView) {
                TextView title = (TextView)child;
                title.setTextSize(17.5f);
                title.setTypeface(GlassUi.boldFont());
                title.setTextColor(text(page));
            }
        }
    }

    private static void styleSearch(Activity activity, int n) {
        int editId = activity.getResources().getIdentifier("editTextNumber", "id", activity.getPackageName());
        if (editId == 0) return;
        View found = activity.findViewById(editId);
        if (!(found instanceof EditText)) return;
        EditText edit = (EditText)found;
        int page = color(n, 1), card = color(n, 2);
        int ink = text(card), muted = secondary(card);
        int accent = GlassUi.RED;
        edit.setTextColor(ink);
        edit.setHintTextColor(muted);
        edit.setTextSize(15.5f);
        edit.setSingleLine(true);
        edit.setBackground(GlassUi.searchFieldBackground(activity, card));
        edit.setPadding(GlassUi.dp(activity, 24), GlassUi.dp(activity, 8),
                GlassUi.dp(activity, 24), GlassUi.dp(activity, 8));
        View parent = (View)edit.getParent();
        if (parent != null && parent.getParent() instanceof ViewGroup) {
            ViewGroup textInput = (ViewGroup)parent.getParent();
            textInput.setBackgroundColor(page);
            if (textInput.getParent() instanceof LinearLayout) {
                LinearLayout topRoot = (LinearLayout)textInput.getParent();
                View cancel = topRoot.findViewWithTag("ios_search_cancel");
                if (cancel == null && topRoot.getOrientation() == LinearLayout.VERTICAL) {
                    LinearLayout barRow = new LinearLayout(activity);
                    barRow.setTag("ios_search_bar");
                    barRow.setOrientation(LinearLayout.HORIZONTAL);
                    barRow.setGravity(Gravity.CENTER_VERTICAL);
                    barRow.setBackgroundColor(page);
                    barRow.setPadding(GlassUi.dp(activity, 4), GlassUi.dp(activity, 8),
                            GlassUi.dp(activity, 14), GlassUi.dp(activity, 8));
                    int idx = topRoot.indexOfChild(textInput);
                    topRoot.removeView(textInput);
                    barRow.addView(textInput, new LinearLayout.LayoutParams(0, -2, 1));
                    TextView cancelBtn = new TextView(activity);
                    cancelBtn.setTag("ios_search_cancel");
                    cancelBtn.setText("\u53d6\u6d88");
                    cancelBtn.setTextSize(16.5f);
                    cancelBtn.setTypeface(GlassUi.mediumFont());
                    cancelBtn.setTextColor(accent);
                    cancelBtn.setGravity(Gravity.CENTER);
                    cancelBtn.setPadding(GlassUi.dp(activity, 8), GlassUi.dp(activity, 8),
                            GlassUi.dp(activity, 6), GlassUi.dp(activity, 8));
                    GlassUi.attachIosPress(cancelBtn, 0.94f);
                    cancelBtn.setOnClickListener(v -> {
                        GlassUi.hapticTick(v);
                        activity.finish();
                        activity.overridePendingTransition(0, 0);
                    });
                    barRow.addView(cancelBtn, new LinearLayout.LayoutParams(-2, -2));
                    topRoot.addView(barRow, idx, new LinearLayout.LayoutParams(-1, -2));
                } else if (cancel instanceof TextView) {
                    ((TextView)cancel).setTextColor(accent);
                    if (cancel.getParent() instanceof View) ((View)cancel.getParent()).setBackgroundColor(page);
                }
            }
        }
    }

    static void systemBars(Window window, int page, int status, int navigation) {
        View decor = window.getDecorView();
        // Decor padding exposes the window background. On target 35+ the status-bar
        // color setter is ignored, so the background itself must cover that inset.
        if (!(decor.getBackground() instanceof ColorDrawable)
                || ((ColorDrawable)decor.getBackground()).getColor() != page)
            window.setBackgroundDrawable(new ColorDrawable(page));
        if (window.getStatusBarColor() != status) window.setStatusBarColor(status);
        if (window.getNavigationBarColor() != navigation) window.setNavigationBarColor(navigation);
        if (window.getNavigationBarDividerColor() != navigation)
            window.setNavigationBarDividerColor(navigation);
        if (window.isStatusBarContrastEnforced()) window.setStatusBarContrastEnforced(false);
        if (window.isNavigationBarContrastEnforced()) window.setNavigationBarContrastEnforced(false);
        WindowInsetsControllerCompat controller = new WindowInsetsControllerCompat(window, decor);
        boolean lightStatus = light(status), lightNavigation = light(navigation);
        if (controller.isAppearanceLightStatusBars() != lightStatus)
            controller.setAppearanceLightStatusBars(lightStatus);
        if (controller.isAppearanceLightNavigationBars() != lightNavigation)
            controller.setAppearanceLightNavigationBars(lightNavigation);
    }

    private static String id(View view) {
        String name = names.get(view);
        if (name == null) {
            try { name = view.getResources().getResourceEntryName(view.getId()); }
            catch (Exception e) { name = ""; }
            names.put(view, name);
        }
        return name;
    }

    private static boolean hasDirectCover(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++)
            if (id(group.getChildAt(i)).equals("ivCover")) return true;
        return false;
    }

    private static boolean contains(View view, String wanted) {
        Integer resource = identifiers.get(wanted);
        if (resource == null) {
            resource = view.getResources().getIdentifier(wanted, "id", view.getContext().getPackageName());
            identifiers.put(wanted, resource);
        }
        return resource != 0 && view.findViewById(resource) != null;
    }

    private static void paint(View view, int n, int inherited, boolean inBar, boolean shell) {
        if (view instanceof GlassUi.Sources || view instanceof AppShell.PanelSlot) return;
        Object tag = view.getTag();
        if ("rj_work_detail_header".equals(tag) || "rj_album_tile".equals(tag)
                || "online_tree_header_host".equals(tag) || "gpt_more_content".equals(tag)
                || "gpt_header_bar".equals(tag)) return;
        String name = id(view);
        int bg = inherited;
        if ((view.getBackground() instanceof ColorDrawable
                && ((ColorDrawable)view.getBackground()).getColor() == 0xff10131a)
                || (roles.containsKey(view) && roles.get(view) == 1)) {
            roles.put(view, 1);
            bg = color(n, 1);
            background(view, bg, 0);
        }
        if (name.equals("appBarLayout") || name.equals("toolbar")
                || name.equals("linearLayout") || name.equals("bottomLayout")) {
            bg = shell && (name.equals("appBarLayout") || name.equals("toolbar")
                    || name.equals("bottomLayout")) ? color(n, 1) : color(n, 3);
            inBar = true;
            if (!(view.getBackground() instanceof GlassUi.FrostDrawable))
                background(view, bg, name.equals("bottomLayout") ? 8 : 0);
        } else if (name.equals("recyclerView") || name.equals("mainRecycler")) {
            bg = color(n, 1);
            background(view, bg, 0);
            GlassUi.attachIosBounce(view);
        } else if (view instanceof ViewGroup && hasDirectCover((ViewGroup)view)) {
            if (contains(view, "tvCount") || contains(view, "textView7")) {
                bg = color(n, 2);
                iosTreeRow(view, bg);
            } else if (contains(view, "tvTitle")) {
                bg = color(n, 2);
                background(view, bg, contains(view, "tvRJ") ? 8 : 12);
            }
        }
        if (view instanceof TextView) {
            TextView tv = (TextView)view;
            int foreground = text(bg);
            if (name.equals("tvCount") || name.equals("tvRJ") || name.equals("textView2"))
                foreground = secondary(bg);
            if (name.equals("tvCount") && (tv.getCurrentTextColor() == 0xff8dd9c7
                    || tv.getCurrentTextColor() == 0xff11685f || tv.getCurrentTextColor() == GlassUi.RED))
                foreground = GlassUi.RED;
            if (name.equals("tvPrice")) foreground = light(bg) ? 0xffa73324 : 0xffff725c;
            if (name.equals("tvSaleCount")) foreground = light(bg) ? 0xff805600 : 0xfff0b04c;
            if (name.equals("tvDate") || name.equals("tvRjNumber") || name.equals("tvHost"))
                foreground = tv.getBackground() != null ? Color.WHITE : secondary(bg);
            if ("ios_search_cancel".equals(tv.getTag()) || "ios_accent".equals(tv.getTag()))
                foreground = GlassUi.RED;
            if ("ios_muted".equals(tv.getTag()))
                foreground = secondary(bg);
            if (tv.getCurrentTextColor() != foreground) tv.setTextColor(foreground);
        }
        if (view instanceof ImageView && !name.equals("ivCover") && !name.equals("imageView")) {
            if (!(view instanceof ImageButton && ((ImageButton)view).getDrawable() instanceof GlassUi.SfIconDrawable)) {
                int tint = text(bg);
                if (inBar && view.isSelected()) tint = GlassUi.RED;
                tint((ImageView)view, tint);
            }
        } else if (view instanceof ImageView && view.getParent() instanceof View
                && (contains((View)view.getParent(), "tvCount") || contains((View)view.getParent(), "textView7"))) {
            tint((ImageView)view, secondary(bg));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)view;
            for (int i = 0; i < group.getChildCount(); i++) paint(group.getChildAt(i), n, bg, inBar, shell);
        }
    }

    private static void iosTreeRow(View view, int color) {
        Integer old = painted.get(view);
        int token = color ^ 0x55aa;
        if (old != null && old == token) return;
        painted.put(view, token);
        Context ctx = view.getContext();
        int stroke = light(color) ? 0x16000000 : 0x1affffff;
        view.setBackground(GlassUi.iosCard(ctx, color, 12, 4, 3, stroke));
        int padH = GlassUi.dp(ctx, 12), padV = GlassUi.dp(ctx, 5);
        if (view.getPaddingLeft() != padH) view.setPadding(padH, padV, padH, padV);
    }

    private static void tint(ImageView image, int color) {
        ColorStateList current = image.getImageTintList();
        if (current == null || current.getDefaultColor() != color)
            image.setImageTintList(ColorStateList.valueOf(color));
    }

    private static void background(View view, int color, int radius) {
        Integer old = painted.get(view);
        int token = color ^ radius;
        if (old != null && old == token) return;
        painted.put(view, token);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        float r = radius * view.getResources().getDisplayMetrics().density;
        if (id(view).equals("bottomLayout")) shape.setCornerRadii(new float[]{r,r,r,r,0,0,0,0});
        else shape.setCornerRadius(r);
        if (radius >= 8 && !id(view).equals("bottomLayout")) {
            view.setBackground(GlassUi.iosPressable(view.getContext(), color, radius, 0));
        } else view.setBackground(shape);
    }
}
