package android.view;

import android.graphics.drawable.Drawable;

public class Window {
    public final View decor = new View();
    public boolean ignoreBarColors, lightStatus, lightNavigation;
    public boolean statusContrast = true, navigationContrast = true;
    public int backgroundWrites, appearanceWrites;
    private int status, navigation, divider;
    public View getDecorView() { return decor; }
    public void setBackgroundDrawable(Drawable value) { decor.background = value; backgroundWrites++; }
    public int getStatusBarColor() { return status; }
    public void setStatusBarColor(int value) { if (!ignoreBarColors) status = value; }
    public int getNavigationBarColor() { return navigation; }
    public void setNavigationBarColor(int value) { if (!ignoreBarColors) navigation = value; }
    public int getNavigationBarDividerColor() { return divider; }
    public void setNavigationBarDividerColor(int value) { divider = value; }
    public boolean isStatusBarContrastEnforced() { return statusContrast; }
    public void setStatusBarContrastEnforced(boolean value) { statusContrast = value; }
    public boolean isNavigationBarContrastEnforced() { return navigationContrast; }
    public void setNavigationBarContrastEnforced(boolean value) { navigationContrast = value; }
}
