package com.zinhao.kikoeru;

/** Navigation decisions kept independent of Android view and playback state. */
final class ShellState {
    private ShellState() {}
    static int catalogTab(int type) { return type>=0x1ec && type<=0x1f0 ? 1 : 0; }
    static int sourceAt(float x,float inset,float slot) {
        if (!(slot>0) || Float.isNaN(x)) return 0;
        return Math.max(0,Math.min(2,(int)((x-inset)/slot)));
    }
    static float indicator(float from,float to,float progress,float slot) {
        return Math.max(0f,Math.min(slot*3f,from+(to-from)*progress));
    }
    static int swipeTarget(int source,float delta) {
        if (source<0 || source>2 || Float.isNaN(delta) || delta==0) return source;
        int target=source+(delta<0?1:-1);
        return target<0 || target>2 ? source : target;
    }
    static boolean commitSwipe(int source,int target,float delta,float width,float velocity,float density) {
        if (source==target || !(width>0) || !(density>0)) return false;
        float direction=target>source?-1:1;
        float distance=delta*direction;
        return distance>=width*.22f || distance>=32f*density && velocity*direction>=650f*density;
    }
    static boolean horizontalGesture(float dx,float dy,float slop) {
        return Math.abs(dx)>slop && Math.abs(dx)>Math.abs(dy)*1.3f;
    }
    static int popupWidth(int screen,int preferred,int margin) {
        return Math.max(1,Math.min(preferred,Math.max(1,screen-margin)));
    }
    static boolean folderBackVisible(boolean embedded,boolean inFolder) { return !embedded || inFolder; }
    /** Only layout (0x9) and sort (0x10) stay in the toolbar; account/downloads/settings moved into 更多. */
    static boolean visibleToolbarItem(int activeSource,int itemId) { return activeSource==0 && (itemId==0x9 || itemId==0x10); }
    static boolean embeddedTitleVisible(boolean embedded,boolean inFolder) { return !embedded || inFolder; }
    static int glassBlurDp(boolean liquid) { return liquid ? 20 : 12; }
    static int glassFillColor(boolean light,boolean blurred,boolean liquid) {
        if (!liquid) {
            return light ? (blurred ? 0xb4f2f2f7 : 0xd8f2f2f7)
                    : (blurred ? 0xa81c1c1e : 0xd41c1c1e);
        }
        return light ? (blurred ? 0x8cf9f9fb : 0xc4f2f2f7)
                : (blurred ? 0x78161618 : 0xb81c1c1e);
    }
    static float largeTitleCollapse(int scrollY, int collapseDistance) {
        if (collapseDistance <= 0 || scrollY <= 0) return 0f;
        return Math.max(0f, Math.min(1f, scrollY / (float)collapseDistance));
    }
    static float rubberBand(float pull, float dimension) {
        if (!(dimension > 0f) || Float.isNaN(pull) || pull == 0f) return 0f;
        float sign = pull < 0f ? -1f : 1f;
        float abs = Math.abs(pull);
        float max = dimension * 0.35f;
        return sign * (1f - (1f / ((abs * 0.55f / max) + 1f))) * max;
    }
    static boolean commitSwipeBack(float dx, float width, float velocity, float density) {
        if (!(width > 0f) || !(density > 0f) || Float.isNaN(dx) || dx <= 0f) return false;
        if (velocity < -150f * density) return false;
        return dx >= width * 0.30f || (dx >= 28f * density && velocity >= 580f * density);
    }
    static String extractWorkCount(CharSequence rawTitle) {
        if (rawTitle == null) return "";
        String s = rawTitle.toString();
        int open = s.lastIndexOf('('), close = s.lastIndexOf(')');
        if (open >= 0 && close > open + 1) {
            String digits = s.substring(open + 1, close).trim();
            if (!digits.isEmpty() && digits.chars().allMatch(Character::isDigit)) {
                try {
                    long count = Long.parseLong(digits);
                    return String.format(java.util.Locale.US, "%,d \u90e8", count);
                } catch (NumberFormatException ignored) {
                    return digits + " \u90e8";
                }
            }
        }
        return "";
    }
    static String displayCatalogTitle(CharSequence rawTitle, int activeSource, int catalogType) {
        if (activeSource == 1) return "\u672c\u5730\u4f5c\u54c1";
        if (activeSource == 2) return "\u767e\u5ea6\u7f51\u76d8";
        if (rawTitle == null) return "\u4f5c\u54c1";
        String s = rawTitle.toString().trim();
        int open = s.lastIndexOf('('), close = s.lastIndexOf(')');
        if (open > 0 && close > open) {
            String head = s.substring(0, open).trim();
            if (!head.isEmpty()) s = head;
        }
        if (s.isEmpty() || "Kikoeru".equalsIgnoreCase(s)) {
            if (catalogType == 0x1ec) return "\u60f3\u542c";
            if (catalogType == 0x1ed) return "\u5728\u542c";
            if (catalogType == 0x1ee) return "\u542c\u8fc7";
            if (catalogType == 0x1ef) return "\u91cd\u542c";
            if (catalogType == 0x1f0) return "\u6401\u7f6e";
            return "\u4f5c\u54c1";
        }
        return s;
    }
}
