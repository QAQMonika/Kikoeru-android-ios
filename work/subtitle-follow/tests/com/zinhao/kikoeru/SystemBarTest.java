package com.zinhao.kikoeru;

import android.graphics.drawable.ColorDrawable;
import android.view.Window;

public final class SystemBarTest {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        Window window = new Window();
        // Simulate Android 15+ ignoring legacy bar colors, with stale light icons.
        window.ignoreBarColors = true;
        window.lightStatus = window.lightNavigation = true;
        for (int n = 0; n < ThemePalettes.PRESETS.length; n++) {
            int page = ThemePalettes.color(n, 1), bar = ThemePalettes.color(n, 3);
            ThemePalettes.systemBars(window, page, page, bar);
            check(((ColorDrawable)window.decor.getBackground()).getColor() == page,
                    "Inset backdrop follows preset " + n);
            check(window.lightStatus == ThemePalettes.light(page), "Status icons follow page " + n);
            check(window.lightNavigation == ThemePalettes.light(bar), "Navigation icons follow bar " + n);
            check(!window.statusContrast && !window.navigationContrast, "No contrasting system scrim " + n);
            int backgrounds = window.backgroundWrites, appearances = window.appearanceWrites;
            ThemePalettes.systemBars(window, page, page, bar);
            check(window.backgroundWrites == backgrounds, "Repeated layout keeps backdrop " + n);
            check(window.appearanceWrites == appearances, "Repeated layout keeps icon appearance " + n);
        }
        window.ignoreBarColors = false;
        int page = ThemePalettes.color(0, 1), bar = ThemePalettes.color(0, 3);
        ThemePalettes.systemBars(window, page, bar, bar);
        check(window.getStatusBarColor() == bar, "Legacy status color matches toolbar");
        check(window.getNavigationBarColor() == bar, "Legacy navigation color matches dock");
        check(window.getNavigationBarDividerColor() == bar, "Navigation divider matches dock");
        check(!window.lightStatus && !window.lightNavigation, "Light-to-dark transition restores light icons");
        System.out.println("PASS: " + checks + " system bar checks against production bytecode");
    }
}
