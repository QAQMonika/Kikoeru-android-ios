package com.zinhao.kikoeru;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

public final class ThemePaletteActivity extends Activity {
    private ScrollView currentScroll;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        render();
    }

    private int dp(int n) { return Math.round(n * getResources().getDisplayMetrics().density); }
    private TextView label(String text, float size, int foreground) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(size);
        tv.setTextColor(foreground);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        return tv;
    }

    private void render() {
        int previousScroll = currentScroll == null ? 0 : currentScroll.getScrollY();
        int selected = ThemePalettes.selected(this);
        boolean liquid = PlaybackOptions.liquidGlass(this);
        int page = ThemePalettes.color(selected, 1), card = ThemePalettes.color(selected, 2);
        int ink = ThemePalettes.text(page), muted = ThemePalettes.secondary(page);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(page);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });

        // iOS Navigation Bar
        FrameLayout navBar = new FrameLayout(this);
        navBar.setBackgroundColor(page);
        View backBtn = GlassUi.iosBackButton(this, GlassUi.RED, () -> {
            finish();
            overridePendingTransition(0, 0);
        });
        navBar.addView(backBtn, new FrameLayout.LayoutParams(-2, dp(48), Gravity.START | Gravity.CENTER_VERTICAL));
        TextView headerTitle = label("\u5916\u89c2\u4e0e\u914d\u8272", 17.5f, ink);
        headerTitle.setTypeface(GlassUi.boldFont());
        headerTitle.setGravity(Gravity.CENTER);
        navBar.addView(headerTitle, new FrameLayout.LayoutParams(-2, -2, Gravity.CENTER));
        root.addView(navBar, new LinearLayout.LayoutParams(-1, dp(48)));

        View hairline = new View(this);
        hairline.setBackgroundColor(ThemePalettes.light(page) ? 0x223c3c43 : 0x2e545458);
        root.addView(hairline, new LinearLayout.LayoutParams(-1, Math.max(1, dp(1))));

        ScrollView scroll = new ScrollView(this);
        currentScroll = scroll;
        scroll.setClipToPadding(false);
        GlassUi.attachIosBounce(scroll);
        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(0, dp(8), 0, dp(32));

        // Section 1: Glass Texture Mode (Liquid Glass vs Frosted Glass)
        TextView glassSection = label("\u73bb\u7483\u6750\u8d28", 13f, muted);
        glassSection.setTypeface(GlassUi.mediumFont());
        glassSection.setPadding(dp(32), dp(6), dp(24), dp(6));
        list.addView(glassSection);

        LinearLayout glassCard = new LinearLayout(this);
        glassCard.setOrientation(LinearLayout.HORIZONTAL);
        glassCard.setGravity(Gravity.CENTER_VERTICAL);
        glassCard.setBackground(GlassUi.iosGroupedRow(this, card, 0, 1, 16, 56, 0));
        glassCard.setPadding(dp(30), dp(12), dp(30), dp(12));
        glassCard.addView(GlassUi.squircleBadge(this, GlassUi.IOS_BLUE, "sf_sparkles"));

        LinearLayout toggleWords = new LinearLayout(this);
        toggleWords.setOrientation(LinearLayout.VERTICAL);
        TextView toggleTitle = label("\u6db2\u6001\u73bb\u7483\u8d28\u611f (Liquid Glass)", 16f, ThemePalettes.text(card));
        toggleTitle.setTypeface(GlassUi.mediumFont());
        TextView toggleDesc = label(liquid
                ? "\u9ad8\u6298\u5c04\u900f\u4eae\u5149\u5b66\u91c7\u6837 + 3D \u9ad8\u5149\u8fb9\u7f18"
                : "\u7ecf\u5178 iOS \u67d4\u548c\u78e8\u7802\u6bdb\u73bb\u7483", 12.5f, ThemePalettes.secondary(card));
        toggleDesc.setPadding(0, dp(2), 0, 0);
        toggleWords.addView(toggleTitle);
        toggleWords.addView(toggleDesc);
        glassCard.addView(toggleWords, new LinearLayout.LayoutParams(0, -2, 1));

        Switch glassSwitch = new Switch(this);
        glassSwitch.setChecked(liquid);
        GlassUi.styleIosSwitch(this, glassSwitch, GlassUi.IOS_GREEN);
        glassSwitch.setOnCheckedChangeListener((btn, checked) -> {
            GlassUi.hapticTick(btn);
            PlaybackOptions.liquidGlass(this, checked);
            render();
        });
        glassCard.addView(glassSwitch, new LinearLayout.LayoutParams(dp(51), dp(31)));
        glassCard.setOnClickListener(v -> glassSwitch.setChecked(!glassSwitch.isChecked()));
        LinearLayout.LayoutParams glassLp = new LinearLayout.LayoutParams(-1, -2);
        glassLp.bottomMargin = dp(18);
        list.addView(glassCard, glassLp);

        // Section 2: Continuous iOS Inset Grouped Color Presets
        TextView paletteSection = label("iOS \u539f\u751f\u4e0e\u9884\u9009\u914d\u8272", 13f, muted);
        paletteSection.setTypeface(GlassUi.mediumFont());
        paletteSection.setPadding(dp(32), dp(2), dp(24), dp(6));
        list.addView(paletteSection);

        int total = ThemePalettes.PRESETS.length;
        for (int i = 0; i < total; i++) {
            final int choice = i;
            LinearLayout item = new LinearLayout(this);
            item.setGravity(Gravity.CENTER_VERTICAL);
            item.setPadding(dp(30), dp(8), dp(30), dp(8));
            item.setBackground(GlassUi.iosGroupedRow(this, card, i, total, 16, 76, 0));

            LinearLayout swatches = new LinearLayout(this);
            swatches.setGravity(Gravity.CENTER_VERTICAL);
            for (int slot = 1; slot <= 3; slot++) {
                View swatch = new View(this);
                GradientDrawable dot = new GradientDrawable();
                dot.setColor(ThemePalettes.color(i, slot));
                dot.setCornerRadius(dp(6));
                dot.setStroke(1, ThemePalettes.light(card) ? 0x22000000 : 0x33ffffff);
                swatch.setBackground(dot);
                LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(14), dp(28));
                if (slot > 1) dotLp.leftMargin = dp(3);
                swatches.addView(swatch, dotLp);
            }
            item.addView(swatches);

            TextView title = label(ThemePalettes.PRESETS[i][0], 16f, ThemePalettes.text(card));
            if (i == selected) title.setTypeface(GlassUi.boldFont());
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(0, dp(38), 1);
            titleParams.leftMargin = dp(14);
            item.addView(title, titleParams);

            ImageView checkIcon = new ImageView(this);
            GlassUi.SfIconDrawable checkSf = new GlassUi.SfIconDrawable(this, "sf_checkmark");
            checkSf.setTint(GlassUi.RED);
            checkIcon.setImageDrawable(checkSf);
            checkIcon.setVisibility(i == selected ? View.VISIBLE : View.INVISIBLE);
            item.addView(checkIcon, new LinearLayout.LayoutParams(dp(20), dp(20)));

            RadioButton radio = new RadioButton(this);
            radio.setChecked(i == selected);
            radio.setVisibility(View.GONE);
            radio.setContentDescription(ThemePalettes.PRESETS[i][0]);
            View.OnClickListener select = v -> {
                GlassUi.hapticTick(v);
                ThemePalettes.select(this, choice);
                render();
            };
            item.setOnClickListener(select);
            radio.setOnClickListener(select);
            item.addView(radio, new LinearLayout.LayoutParams(0, 0));
            list.addView(item, new LinearLayout.LayoutParams(-1, dp(52)));
        }
        scroll.addView(list);
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        setContentView(root);
        GlassUi.installIosPage(this);
        int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
        getWindow().getDecorView().setSystemUiVisibility(flags);
        ThemePalettes.systemBars(getWindow(), page, page, page);
        root.requestApplyInsets();
        scroll.post(() -> scroll.scrollTo(0, previousScroll));
    }
}
