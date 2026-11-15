package androidx.core.view;

import android.view.View;
import android.view.Window;

public class WindowInsetsControllerCompat {
    private final Window window;
    public WindowInsetsControllerCompat(Window window, View decor) { this.window = window; }
    public boolean isAppearanceLightStatusBars() { return window.lightStatus; }
    public boolean isAppearanceLightNavigationBars() { return window.lightNavigation; }
    public void setAppearanceLightStatusBars(boolean value) {
        window.lightStatus = value; window.appearanceWrites++;
    }
    public void setAppearanceLightNavigationBars(boolean value) {
        window.lightNavigation = value; window.appearanceWrites++;
    }
}
