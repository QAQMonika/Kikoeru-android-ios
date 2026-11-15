package com.zinhao.kikoeru;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EdgeEffect;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import androidx.recyclerview.widget.RecyclerView;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/** Authentic iOS visual & interaction kit shared by the online, local and cloud libraries. */
public final class GlassUi {
    // Apple Music Pink-Red (#FA2D48) and iOS system palette accents.
    static final int RED = 0xfffa2d48;
    static final int IOS_GREEN = 0xff34c759;
    static final int IOS_BLUE = 0xff0a84ff;
    static final int IOS_RED = 0xffff453a;
    static final int IOS_ORANGE = 0xffff9f0a;
    static final int IOS_PURPLE = 0xffbf5af2;
    static final int IOS_INDIGO = 0xff5e5ce6;
    static final int IOS_TEAL = 0xff64d2ff;
    static final int IOS_GRAY = 0xff8e8e93;

    private static final Typeface MEDIUM_FONT = Typeface.create("sans-serif-medium", Typeface.NORMAL);
    private static final Typeface BOLD_FONT = Typeface.create("sans-serif", Typeface.BOLD);
    private static final WeakHashMap<View, Boolean> BOUNCE_ATTACHED = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> SWIPE_BACK_ATTACHED = new WeakHashMap<>();

    private GlassUi() {}

    static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
    static int resource(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }
    static Typeface mediumFont() { return MEDIUM_FONT != null ? MEDIUM_FONT : Typeface.DEFAULT_BOLD; }
    static Typeface boldFont() { return BOLD_FONT != null ? BOLD_FONT : Typeface.DEFAULT_BOLD; }

    static void hapticTick(View view) {
        if (view != null) {
            try { view.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK); }
            catch (RuntimeException ignored) {}
        }
    }
    static void hapticImpact(View view) {
        if (view != null) {
            try { view.performHapticFeedback(HapticFeedbackConstants.CONTEXT_CLICK); }
            catch (RuntimeException ignored) {}
        }
    }

    /** Attaches iOS spring scale/opacity touch feedback instead of Android ripples. */
    static void attachIosPress(View view, float minScale) {
        if (view == null) return;
        view.setOnTouchListener((v, event) -> {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                v.animate().cancel();
                v.animate().scaleX(minScale).scaleY(minScale).alpha(0.82f).setDuration(90)
                        .setInterpolator(new DecelerateInterpolator()).start();
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                v.animate().cancel();
                v.animate().scaleX(1f).scaleY(1f).alpha(1f).setDuration(220)
                        .setInterpolator(new OvershootInterpolator(1.2f)).start();
            }
            return false;
        });
    }

    static GradientDrawable rounded(int color, float radius) {
        GradientDrawable result = new GradientDrawable();
        result.setColor(color);
        result.setCornerRadius(radius);
        return result;
    }

    static Drawable iosPressable(Context context, int normalColor, float radiusDp, int strokeColor) {
        float r = dp(context, radiusDp);
        boolean light = ThemePalettes.light(normalColor);
        int pressedColor = blendColor(normalColor, light ? 0xff000000 : 0xffffffff, light ? 0.08f : 0.11f);
        GradientDrawable normal = new GradientDrawable();
        normal.setColor(normalColor);
        normal.setCornerRadius(r);
        if (strokeColor != 0) normal.setStroke(Math.max(1, dp(context, 0.6f)), strokeColor);
        GradientDrawable pressed = new GradientDrawable();
        pressed.setColor(pressedColor);
        pressed.setCornerRadius(r);
        if (strokeColor != 0) pressed.setStroke(Math.max(1, dp(context, 0.6f)), strokeColor);
        StateListDrawable states = new StateListDrawable();
        states.setEnterFadeDuration(40);
        states.setExitFadeDuration(160);
        states.addState(new int[]{android.R.attr.state_pressed}, pressed);
        states.addState(new int[]{}, normal);
        return states;
    }

    private static int blendColor(int base, int overlay, float ratio) {
        float inv = 1f - ratio;
        int a = Color.alpha(base);
        int r = Math.round(Color.red(base) * inv + Color.red(overlay) * ratio);
        int g = Math.round(Color.green(base) * inv + Color.green(overlay) * ratio);
        int b = Math.round(Color.blue(base) * inv + Color.blue(overlay) * ratio);
        return Color.argb(Math.max(a, 0x24), Math.min(255, r), Math.min(255, g), Math.min(255, b));
    }

    static Drawable iosCard(Context context, int cardColor, int radiusDp, int insetH, int insetV, int strokeColor) {
        Drawable states = iosPressable(context, cardColor, radiusDp, strokeColor);
        if (insetH <= 0 && insetV <= 0) return states;
        return new InsetDrawable(states, dp(context, insetH), dp(context, insetV), dp(context, insetH), dp(context, insetV));
    }

    static Drawable iosPressable(Context context, int cardColor, int radiusDp, int insetH, int insetV, int strokeColor) {
        return iosCard(context, cardColor, radiusDp, insetH, insetV, strokeColor);
    }

    static Drawable iosGroupedRow(Context context, int cardColor, boolean first, boolean last, int dividerStartDp) {
        int index = first ? 0 : (last ? 1 : 1);
        int size = (first && last) ? 1 : (last ? 2 : 3);
        int stroke = ThemePalettes.light(cardColor) ? 0x16202731 : 0x18ffffff;
        return iosGroupedRow(context, cardColor, index, size, 2, dividerStartDp, stroke);
    }

    /** Continuous UITableViewStyle.insetGrouped row background with indented hairline separator. */
    static Drawable iosGroupedRow(Context context, int cardColor, int indexInGroup, int groupSize,
            int insetH, int dividerStartDp, int strokeColor) {
        boolean first = indexInGroup <= 0;
        boolean last = indexInGroup >= groupSize - 1;
        boolean light = ThemePalettes.light(cardColor);
        int pressedColor = blendColor(cardColor, light ? 0xff000000 : 0xffffffff, light ? 0.08f : 0.11f);
        int dividerColor = light ? 0x223c3c43 : 0x2e545458;
        Drawable normal = new GroupedRowDrawable(context, cardColor, first, last, dividerStartDp, dividerColor, strokeColor);
        Drawable pressed = new GroupedRowDrawable(context, pressedColor, first, last, dividerStartDp, dividerColor, strokeColor);
        StateListDrawable states = new StateListDrawable();
        states.setEnterFadeDuration(35);
        states.setExitFadeDuration(150);
        states.addState(new int[]{android.R.attr.state_pressed}, pressed);
        states.addState(new int[]{}, normal);
        if (insetH <= 0) return states;
        return new InsetDrawable(states, dp(context, insetH), 0, dp(context, insetH), 0);
    }

    private static final class GroupedRowDrawable extends Drawable {
        private final Context context;
        private final int fillColor, dividerColor, strokeColor;
        private final boolean first, last;
        private final int dividerStartPx;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF rect = new RectF();

        GroupedRowDrawable(Context context, int fillColor, boolean first, boolean last,
                int dividerStartDp, int dividerColor, int strokeColor) {
            this.context = context;
            this.fillColor = fillColor;
            this.first = first;
            this.last = last;
            this.dividerStartPx = dp(context, dividerStartDp);
            this.dividerColor = dividerColor;
            this.strokeColor = strokeColor;
        }
        @Override public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            rect.set(b.left, b.top, b.right, b.bottom);
            float r = dp(context, 12);
            float[] radii = {
                    first ? r : 0f, first ? r : 0f,
                    first ? r : 0f, first ? r : 0f,
                    last ? r : 0f, last ? r : 0f,
                    last ? r : 0f, last ? r : 0f
            };
            path.reset();
            path.addRoundRect(rect, radii, Path.Direction.CW);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(fillColor);
            canvas.drawPath(path, paint);
            if (!last && dividerColor != 0) {
                float divH = Math.max(1f, dp(context, 0.55f));
                paint.setColor(dividerColor);
                canvas.drawRect(b.left + dividerStartPx, b.bottom - divH, b.right, b.bottom, paint);
            }
        }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    static Drawable searchFieldBackground(Context context, int cardColor) {
        boolean light = ThemePalettes.light(cardColor);
        boolean liquid = PlaybackOptions.liquidGlass(context);
        int fill = liquid ? (light ? 0xe6e5e5ea : 0xd81c1c1e) : (light ? 0xffe5e5ea : 0xff1c1c1e);
        int stroke = liquid ? (light ? 0x80ffffff : 0x28ffffff) : 0;
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(fill);
        shape.setCornerRadius(dp(context, 10));
        if (stroke != 0) shape.setStroke(Math.max(1, dp(context, 0.7f)), stroke);
        return new InsetDrawable(shape, dp(context, 12), dp(context, 4), dp(context, 12), dp(context, 4));
    }

    static Drawable dialogSurface(Context context, int cardColor, float radiusDp) {
        return new GlassSurfaceDrawable(context, cardColor, dp(context, radiusDp));
    }

    /** Creates an iOS Settings 29dp x 29dp colored rounded-square badge with a white SF Symbol inside. */
    static View squircleBadge(Context context, int badgeColor, String sfSymbol) {
        ImageView badge = new ImageView(context);
        int size = dp(context, 29);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(badgeColor);
        bg.setCornerRadius(dp(context, 7));
        badge.setBackground(bg);
        SfIconDrawable icon = new SfIconDrawable(context, sfSymbol);
        icon.setTint(Color.WHITE);
        badge.setImageDrawable(icon);
        int pad = dp(context, 5.5f);
        badge.setPadding(pad, pad, pad, pad);
        badge.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(size, size);
        lp.rightMargin = dp(context, 13);
        badge.setLayoutParams(lp);
        return badge;
    }

    /** Creates an iOS UINavigationBar `< 返回` button with SF chevron and accent text. */
    static View iosBackButton(Activity activity, int accentColor, Runnable onBack) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.HORIZONTAL);
        box.setGravity(Gravity.CENTER_VERTICAL);
        box.setPadding(dp(activity, 8), 0, dp(activity, 12), 0);
        ImageView chevron = new ImageView(activity);
        SfIconDrawable icon = new SfIconDrawable(activity, "sf_chevron_left");
        icon.setTint(accentColor);
        chevron.setImageDrawable(icon);
        box.addView(chevron, new LinearLayout.LayoutParams(dp(activity, 20), dp(activity, 22)));
        TextView label = new TextView(activity);
        label.setText("\u8fd4\u56de");
        label.setTextSize(17);
        label.setTextColor(accentColor);
        label.setSingleLine(true);
        label.setPadding(dp(activity, 1), 0, 0, 0);
        box.addView(label, new LinearLayout.LayoutParams(-2, -2));
        attachIosPress(box, 0.95f);
        box.setOnClickListener(v -> {
            hapticTick(v);
            onBack.run();
        });
        return box;
    }

    static void styleIosSwitch(Context context, CompoundButton button, int activeColor) {
        button.setButtonDrawable(null);
        if (button instanceof Switch) {
            Switch sw = (Switch)button;
            sw.setShowText(false);
            sw.setSplitTrack(false);
            sw.setTextOn("");
            sw.setTextOff("");
            sw.setThumbDrawable(new GradientDrawable());
            sw.setTrackDrawable(new GradientDrawable());
        }
        button.setBackground(new IosSwitchDrawable(context, button, activeColor));
        button.setPadding(0, 0, 0, 0);
        ViewGroup.LayoutParams lp = button.getLayoutParams();
        if (lp != null) {
            lp.width = dp(context, 51);
            lp.height = dp(context, 31);
            button.setLayoutParams(lp);
        }
    }

    /** Top Dynamic-Island / iOS glass capsule toast banner. */
    static void toast(Context context, CharSequence message) {
        if (message == null || message.length() == 0) return;
        Activity activity = context instanceof Activity ? (Activity)context
                : (context instanceof android.content.ContextWrapper
                && ((android.content.ContextWrapper)context).getBaseContext() instanceof Activity
                ? (Activity)((android.content.ContextWrapper)context).getBaseContext() : null);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
            return;
        }
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
            return;
        }
        FrameLayout root = (FrameLayout)content;
        View existing = root.findViewWithTag("ios_top_toast");
        if (existing != null) root.removeView(existing);

        int n = ThemePalettes.selected(activity);
        int card = ThemePalettes.color(n, 2);
        int ink = ThemePalettes.text(card);
        LinearLayout capsule = new LinearLayout(activity);
        capsule.setTag("ios_top_toast");
        capsule.setOrientation(LinearLayout.HORIZONTAL);
        capsule.setGravity(Gravity.CENTER_VERTICAL);
        capsule.setBackground(new GlassSurfaceDrawable(activity, card, dp(activity, 24)));
        capsule.setPadding(dp(activity, 16), dp(activity, 10), dp(activity, 18), dp(activity, 10));
        capsule.setElevation(dp(activity, 10));

        ImageView icon = new ImageView(activity);
        SfIconDrawable sf = new SfIconDrawable(activity, "sf_checkmark");
        sf.setTint(RED);
        icon.setImageDrawable(sf);
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(activity, 18), dp(activity, 18));
        iconLp.rightMargin = dp(activity, 8);
        capsule.addView(icon, iconLp);

        TextView tv = new TextView(activity);
        tv.setText(message);
        tv.setTextSize(14);
        tv.setTypeface(mediumFont());
        tv.setTextColor(ink);
        tv.setMaxLines(2);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        capsule.addView(tv, new LinearLayout.LayoutParams(-2, -2));

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        WindowInsets insets = activity.getWindow().getDecorView().getRootWindowInsets();
        int topInset = insets != null ? insets.getSystemWindowInsetTop() : dp(activity, 28);
        lp.topMargin = topInset + dp(activity, 8);
        lp.leftMargin = dp(activity, 20);
        lp.rightMargin = dp(activity, 20);
        root.addView(capsule, lp);

        capsule.setTranslationY(-dp(activity, 72));
        capsule.setAlpha(0f);
        capsule.setScaleX(0.88f);
        capsule.setScaleY(0.88f);
        capsule.animate().translationY(0f).alpha(1f).scaleX(1f).scaleY(1f)
                .setDuration(280).setInterpolator(new OvershootInterpolator(1.05f)).start();
        capsule.postDelayed(() -> {
            if (capsule.getParent() == root) {
                capsule.animate().translationY(-dp(activity, 64)).alpha(0f).scaleX(0.9f).scaleY(0.9f)
                        .setDuration(200).withEndAction(() -> {
                            if (capsule.getParent() == root) root.removeView(capsule);
                        }).start();
            }
        }, 2100);
    }

    static void stylePopup(Activity activity, Object popup) {
        if (popup == null) return;
        try {
            int card = ThemePalettes.color(ThemePalettes.selected(activity), 2);
            Drawable bg = new GlassSurfaceDrawable(activity, card, dp(activity, 14));
            popup.getClass().getMethod("setBackgroundDrawable", Drawable.class).invoke(popup, bg);
            popup.getClass().getMethod("setVerticalOffset", int.class).invoke(popup, -dp(activity, 6));
            Field adapterField = null;
            Class<?> cursor = popup.getClass();
            while (cursor != null && adapterField == null) {
                for (Field f : cursor.getDeclaredFields()) {
                    if (ListAdapter.class.isAssignableFrom(f.getType())) { adapterField = f; break; }
                }
                cursor = cursor.getSuperclass();
            }
            if (adapterField != null) {
                adapterField.setAccessible(true);
                Object current = adapterField.get(popup);
                if (current instanceof ListAdapter && !(current instanceof IosMenuAdapter)) {
                    ListAdapter wrapped = new IosMenuAdapter(activity, (ListAdapter)current);
                    popup.getClass().getMethod("setAdapter", ListAdapter.class).invoke(popup, wrapped);
                } else if (current instanceof IosMenuAdapter) {
                    ((IosMenuAdapter)current).refresh();
                }
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    /** Styles AlertDialogs as either an iOS bottom Action Sheet (when list-based) or a 280dp iOS Alert. */
    static void styleDialog(Context context, AlertDialog dialog, int card, int accent) {
        Window window = dialog.getWindow();
        if (window == null) return;
        ListView listView = dialog.getListView();
        boolean isActionSheet = listView != null && dialog.getButton(AlertDialog.BUTTON_POSITIVE) == null;
        int screenW = context.getResources().getDisplayMetrics().widthPixels;
        if (isActionSheet) {
            window.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            window.setBackgroundDrawable(new InsetDrawable(dialogSurface(context, card, 18),
                    dp(context, 10), dp(context, 6), dp(context, 10), dp(context, 12)));
            window.setDimAmount(0.48f);
            window.setLayout(Math.min(dp(context, 440), screenW), -2);
            View decor = window.getDecorView();
            if (decor != null && ValueAnimator.areAnimatorsEnabled()) {
                decor.setTranslationY(dp(context, 140));
                decor.animate().translationY(0f).setDuration(250)
                        .setInterpolator(new OvershootInterpolator(0.75f)).start();
            }
        } else {
            window.setGravity(Gravity.CENTER);
            window.setBackgroundDrawable(dialogSurface(context, card, 16));
            window.setDimAmount(0.48f);
            window.setLayout(Math.min(dp(context, 296), screenW - dp(context, 48)), -2);
            View decor = window.getDecorView();
            if (decor != null && ValueAnimator.areAnimatorsEnabled()) {
                decor.setScaleX(1.08f);
                decor.setScaleY(1.08f);
                decor.setAlpha(0f);
                decor.animate().scaleX(1f).scaleY(1f).alpha(1f).setDuration(190)
                        .setInterpolator(new DecelerateInterpolator()).start();
            }
        }
        if (listView != null) {
            listView.setBackgroundColor(Color.TRANSPARENT);
            GradientDrawable divider = new GradientDrawable();
            divider.setColor(ThemePalettes.light(card) ? 0x223c3c43 : 0x2e545458);
            divider.setSize(1, Math.max(1, dp(context, 0.55f)));
            listView.setDivider(divider);
            listView.setDividerHeight(Math.max(1, dp(context, 0.55f)));
            listView.setPadding(dp(context, 6), dp(context, 2), dp(context, 6), dp(context, 6));
        }
        int iosActionColor = RED;
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button button = dialog.getButton(which);
            if (button == null) continue;
            button.setAllCaps(false);
            button.setTextSize(16.5f);
            button.setTypeface(which == AlertDialog.BUTTON_POSITIVE ? boldFont() : Typeface.DEFAULT);
            button.setMinHeight(dp(context, 44));
            CharSequence txt = button.getText();
            boolean destructive = txt != null && (txt.toString().contains("\u5220\u9664")
                    || txt.toString().contains("\u79fb\u9664") || txt.toString().contains("\u65ad\u5f00"));
            button.setTextColor(destructive ? IOS_RED : (which == AlertDialog.BUTTON_POSITIVE ? iosActionColor : accent));
            button.setBackground(iosPressable(context, Color.TRANSPARENT, 10, 0));
        }
    }

    /** Attaches iOS rubber-band overscroll bounce to a RecyclerView, ListView, GridView or ScrollView. */
    static void attachIosBounce(View scrollable) {
        if (scrollable == null || BOUNCE_ATTACHED.containsKey(scrollable)) return;
        BOUNCE_ATTACHED.put(scrollable, true);
        scrollable.setOverScrollMode(View.OVER_SCROLL_ALWAYS);
        if (scrollable instanceof RecyclerView) {
            RecyclerView rv = (RecyclerView)scrollable;
            rv.setEdgeEffectFactory(new RecyclerView.EdgeEffectFactory() {
                @Override protected EdgeEffect createEdgeEffect(RecyclerView view, int direction) {
                    return new IosBounceEdgeEffect(view, direction);
                }
            });
        }
    }

    private static final class IosBounceEdgeEffect extends EdgeEffect {
        private final View target;
        private final int direction;
        private ValueAnimator spring;

        IosBounceEdgeEffect(View target, int direction) {
            super(target.getContext());
            this.target = target;
            this.direction = direction;
        }
        private boolean vertical() { return direction == RecyclerView.EdgeEffectFactory.DIRECTION_TOP || direction == RecyclerView.EdgeEffectFactory.DIRECTION_BOTTOM; }
        private int sign() { return (direction == RecyclerView.EdgeEffectFactory.DIRECTION_TOP || direction == RecyclerView.EdgeEffectFactory.DIRECTION_LEFT) ? 1 : -1; }
        @Override public void onPull(float deltaDistance) {
            onPull(deltaDistance, 0.5f);
        }
        @Override public void onPull(float deltaDistance, float displacement) {
            if (!vertical()) return;
            if (spring != null) { spring.cancel(); spring = null; }
            float dim = Math.max(1, target.getHeight());
            float current = target.getTranslationY();
            float next = current + sign() * dim * deltaDistance * 0.38f;
            float clamped = Math.max(-dim * 0.28f, Math.min(dim * 0.28f, next));
            target.setTranslationY(clamped);
        }
        @Override public void onRelease() {
            if (!vertical() || Math.abs(target.getTranslationY()) < 0.5f) return;
            springBack();
        }
        @Override public void onAbsorb(int velocity) {
            if (!vertical()) return;
            if (spring != null) { spring.cancel(); spring = null; }
            float delta = sign() * Math.min(dp(target.getContext(), 28), Math.max(dp(target.getContext(), 4), velocity / 180f));
            spring = ValueAnimator.ofFloat(target.getTranslationY(), delta, 0f);
            spring.setDuration(320);
            spring.setInterpolator(new DecelerateInterpolator());
            spring.addUpdateListener(a -> target.setTranslationY((Float)a.getAnimatedValue()));
            spring.start();
        }
        @Override public boolean draw(Canvas canvas) {
            return false; // Suppress Android stretch/glow completely
        }
        @Override public boolean isFinished() {
            return Math.abs(target.getTranslationY()) < 0.5f && (spring == null || !spring.isRunning());
        }
        private void springBack() {
            if (spring != null) spring.cancel();
            spring = ValueAnimator.ofFloat(target.getTranslationY(), 0f);
            spring.setDuration(280);
            spring.setInterpolator(new OvershootInterpolator(0.55f));
            spring.addUpdateListener(a -> target.setTranslationY((Float)a.getAnimatedValue()));
            spring.start();
        }
    }

    /** Installs left-edge interactive pop gesture on secondary pages without broken transition offsets. */
    static void installIosPage(Activity activity) {
        if (activity == null) return;
        String name = activity.getClass().getSimpleName();
        if (name.equals("WorksActivity") || name.equals("AudioPlayerActivity") || name.equals("VideoPlayerActivity")) return;
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;
        FrameLayout frame = (FrameLayout)content;
        if (frame.getChildCount() == 0) return;
        View child = frame.getChildAt(0);
        if (child instanceof IosSwipeBackLayout) {
            ((IosSwipeBackLayout)child).ensureReset();
            return;
        }
        if (SWIPE_BACK_ATTACHED.containsKey(activity)) return;
        SWIPE_BACK_ATTACHED.put(activity, true);
        child.animate().cancel();
        child.setTranslationX(0f);
        child.setAlpha(1f);
        frame.removeView(child);
        IosSwipeBackLayout wrapper = new IosSwipeBackLayout(activity, child);
        frame.addView(wrapper, new FrameLayout.LayoutParams(-1, -1));
    }

    private static final class IosSwipeBackLayout extends FrameLayout {
        private final Activity activity;
        private final View pageView;
        private final int edgePx, slopPx;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private float downX, downY, lastX, velocityX;
        private long lastTime;
        private boolean eligible, dragging, settling;

        IosSwipeBackLayout(Activity activity, View pageView) {
            super(activity);
            this.activity = activity;
            this.pageView = pageView;
            this.edgePx = dp(activity, 24);
            this.slopPx = Math.max(ViewConfiguration.get(activity).getScaledTouchSlop(), dp(activity, 8));
            setWillNotDraw(false);
            pageView.setTranslationX(0f);
            pageView.setAlpha(1f);
            addView(pageView, new FrameLayout.LayoutParams(-1, -1));
        }
        void ensureReset() {
            if (!dragging && !settling) {
                pageView.animate().cancel();
                if (pageView.getTranslationX() != 0f) pageView.setTranslationX(0f);
                if (pageView.getAlpha() != 1f) pageView.setAlpha(1f);
                invalidate();
            }
        }
        @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            super.onLayout(changed, left, top, right, bottom);
            if (!dragging && !settling && pageView.getTranslationX() != 0f) {
                pageView.setTranslationX(0f);
            }
        }
        @Override public boolean onInterceptTouchEvent(MotionEvent ev) {
            int action = ev.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                downX = lastX = ev.getX();
                downY = ev.getY();
                lastTime = ev.getEventTime();
                velocityX = 0f;
                eligible = downX <= edgePx;
                dragging = false;
                return false;
            }
            if (action == MotionEvent.ACTION_MOVE && eligible) {
                float dx = ev.getX() - downX, dy = ev.getY() - downY;
                if (Math.abs(dy) > slopPx && Math.abs(dy) > Math.abs(dx)) {
                    eligible = false;
                    return false;
                }
                if (dx > slopPx && dx > Math.abs(dy) * 1.2f) {
                    dragging = true;
                    hapticTick(this);
                    return true;
                }
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                eligible = false;
                dragging = false;
            }
            return false;
        }
        @Override public boolean onTouchEvent(MotionEvent ev) {
            if (!dragging) return false;
            int action = ev.getActionMasked();
            long dt = ev.getEventTime() - lastTime;
            if (dt > 0) {
                velocityX = (ev.getX() - lastX) * 1000f / dt;
                lastX = ev.getX();
                lastTime = ev.getEventTime();
            }
            float dx = Math.max(0f, ev.getX() - downX);
            if (action == MotionEvent.ACTION_MOVE) {
                pageView.setTranslationX(dx);
                invalidate();
                return true;
            }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                boolean commit = action == MotionEvent.ACTION_UP && ShellState.commitSwipeBack(
                        dx, getWidth(), velocityX, getResources().getDisplayMetrics().density);
                dragging = false;
                eligible = false;
                if (commit) {
                    settling = true;
                    hapticImpact(this);
                    pageView.animate().translationX(getWidth()).setDuration(190)
                            .setInterpolator(new DecelerateInterpolator())
                            .withEndAction(() -> {
                                settling = false;
                                activity.finish();
                                activity.overridePendingTransition(0, 0);
                            }).start();
                } else {
                    settling = true;
                    ValueAnimator va = ValueAnimator.ofFloat(pageView.getTranslationX(), 0f);
                    va.setDuration(200);
                    va.setInterpolator(new OvershootInterpolator(0.5f));
                    va.addUpdateListener(a -> {
                        pageView.setTranslationX((Float)a.getAnimatedValue());
                        invalidate();
                    });
                    va.addListener(new android.animation.AnimatorListenerAdapter() {
                        @Override public void onAnimationEnd(android.animation.Animator animation) {
                            settling = false;
                            pageView.setTranslationX(0f);
                            invalidate();
                        }
                        @Override public void onAnimationCancel(android.animation.Animator animation) {
                            settling = false;
                            pageView.setTranslationX(0f);
                            invalidate();
                        }
                    });
                    va.start();
                }
                return true;
            }
            return true;
        }
        @Override protected void dispatchDraw(Canvas canvas) {
            float tx = pageView.getTranslationX();
            if (tx > 1f) {
                float progress = Math.min(1f, tx / Math.max(1f, getWidth()));
                int scrimAlpha = Math.round((1f - progress) * 110);
                canvas.drawColor(Color.argb(scrimAlpha, 0, 0, 0));
                int shadowW = dp(activity, 16);
                shadowPaint.setShader(new LinearGradient(tx - shadowW, 0, tx, 0,
                        0x00000000, 0x44000000, Shader.TileMode.CLAMP));
                canvas.drawRect(tx - shadowW, 0, tx, getHeight(), shadowPaint);
                shadowPaint.setShader(null);
            }
            super.dispatchDraw(canvas);
        }
    }

    static int foreground(Context context) {
        return ThemePalettes.text(ThemePalettes.color(ThemePalettes.selected(context), 1));
    }

    static Drawable sfDrawable(Context context, String name) {
        if (name == null) return null;
        if (SfIconDrawable.supports(name)) return new SfIconDrawable(context, name);
        return null;
    }

    static ImageButton icon(Activity activity, String name, String description, View.OnClickListener click) {
        ImageButton button = new ImageButton(activity);
        Drawable sf = sfDrawable(activity, name);
        if (sf != null) {
            button.setImageDrawable(sf);
        } else {
            int id = resource(activity, "drawable", name);
            if (id != 0) button.setImageResource(id);
        }
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        button.setPadding(0, 0, 0, 0);
        button.setBackground(null);
        button.setContentDescription(description);
        button.setTooltipText(description);
        attachIosPress(button, 0.92f);
        button.setOnClickListener(click);
        return button;
    }

    private static void detach(View view) {
        if (view.getParent() instanceof ViewGroup) ((ViewGroup)view.getParent()).removeView(view);
    }

    /** Programmatic SF-Symbols-inspired fine-line vector icon renderer. */
    static final class SfIconDrawable extends Drawable {
        private final Context context;
        private final String kind;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF box = new RectF();
        private ColorStateList tintList;
        private int directTint = Color.WHITE;
        private boolean filled;

        SfIconDrawable(Context context, String kind) {
            this.context = context;
            this.kind = kind == null ? "" : kind;
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        static boolean supports(String name) {
            if (name == null) return false;
            switch (name) {
                case "ic_baseline_widgets_24":
                case "ic_baseline_favorite_24":
                case "ic_clock_black_24dp":
                case "ic_baseline_more_horiz_24":
                case "ic_baseline_search_24":
                case "ic_arrow_back_black_24":
                case "ic_baseline_arrow_back_24":
                case "ic_baseline_folder_24":
                case "ic_baseline_loop_24":
                case "ic_baseline_close_24":
                case "ic_baseline_sort_24":
                case "ic_baseline_view_column_24":
                case "ic_baseline_audiotrack_24":
                case "sf_chevron_left":
                case "sf_chevron_right":
                case "sf_checkmark":
                case "sf_sparkles":
                case "sf_palette":
                case "sf_captions":
                case "sf_waveform":
                case "sf_bug":
                case "sf_doc":
                case "sf_info":
                case "sf_cloud":
                case "sf_queue":
                case "sf_person":
                case "sf_download":
                case "sf_motion":
                case "sf_filter":
                    return true;
                default:
                    return false;
            }
        }

        void setFilled(boolean value) {
            if (filled != value) { filled = value; invalidateSelf(); }
        }

        @Override public void setTintList(ColorStateList tint) {
            this.tintList = tint;
            invalidateSelf();
        }
        @Override public void setTint(int tintColor) {
            this.directTint = tintColor;
            this.tintList = ColorStateList.valueOf(tintColor);
            invalidateSelf();
        }
        @Override public boolean isStateful() { return true; }
        @Override protected boolean onStateChange(int[] state) { invalidateSelf(); return true; }

        @Override public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            float size = Math.min(b.width(), b.height());
            float cx = b.exactCenterX(), cy = b.exactCenterY();
            float u = size / 24f;
            int color = tintList != null ? tintList.getColorForState(getState(), directTint) : directTint;
            paint.setColor(color);
            float sw = Math.max(1.4f, 1.85f * u);
            paint.setStrokeWidth(sw);

            switch (kind) {
                case "ic_baseline_widgets_24": { // SF square.grid.2x2
                    paint.setStyle(filled ? Paint.Style.FILL_AND_STROKE : Paint.Style.STROKE);
                    paint.setStrokeWidth(filled ? u * 0.8f : sw);
                    float r = 2.2f * u;
                    box.set(cx - 8.2f * u, cy - 8.2f * u, cx - 1.4f * u, cy - 1.4f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx + 1.4f * u, cy - 8.2f * u, cx + 8.2f * u, cy - 1.4f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx - 8.2f * u, cy + 1.4f * u, cx - 1.4f * u, cy + 8.2f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx + 1.4f * u, cy + 1.4f * u, cx + 8.2f * u, cy + 8.2f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    break;
                }
                case "ic_baseline_favorite_24": { // SF heart / heart.fill
                    path.reset();
                    path.moveTo(cx, cy + 7.6f * u);
                    path.cubicTo(cx - 9.8f * u, cy + 1.6f * u, cx - 9.5f * u, cy - 6.8f * u, cx - 4.4f * u, cy - 6.8f * u);
                    path.cubicTo(cx - 1.8f * u, cy - 6.8f * u, cx - 0.4f * u, cy - 4.8f * u, cx, cy - 3.6f * u);
                    path.cubicTo(cx + 0.4f * u, cy - 4.8f * u, cx + 1.8f * u, cy - 6.8f * u, cx + 4.4f * u, cy - 6.8f * u);
                    path.cubicTo(cx + 9.5f * u, cy - 6.8f * u, cx + 9.8f * u, cy + 1.6f * u, cx, cy + 7.6f * u);
                    path.close();
                    paint.setStyle(filled ? Paint.Style.FILL_AND_STROKE : Paint.Style.STROKE);
                    paint.setStrokeWidth(filled ? u * 0.6f : sw);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "ic_clock_black_24dp": { // SF clock
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(filled ? sw * 1.2f : sw);
                    canvas.drawCircle(cx, cy, 8.2f * u, paint);
                    path.reset();
                    path.moveTo(cx, cy - 4.6f * u);
                    path.lineTo(cx, cy + 0.4f * u);
                    path.lineTo(cx + 3.4f * u, cy + 2.4f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "ic_baseline_more_horiz_24": { // SF ellipsis.circle
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx, cy, 8.5f * u, paint);
                    paint.setStyle(Paint.Style.FILL);
                    float dotR = 1.25f * u;
                    canvas.drawCircle(cx - 3.8f * u, cy, dotR, paint);
                    canvas.drawCircle(cx, cy, dotR, paint);
                    canvas.drawCircle(cx + 3.8f * u, cy, dotR, paint);
                    break;
                }
                case "ic_baseline_search_24": { // SF magnifyingglass
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx - 1.3f * u, cy - 1.3f * u, 6.2f * u, paint);
                    canvas.drawLine(cx + 3.2f * u, cy + 3.2f * u, cx + 8.0f * u, cy + 8.0f * u, paint);
                    break;
                }
                case "ic_arrow_back_black_24":
                case "ic_baseline_arrow_back_24":
                case "sf_chevron_left": { // SF chevron.left
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(2.2f * u);
                    path.reset();
                    path.moveTo(cx + 2.8f * u, cy - 6.8f * u);
                    path.lineTo(cx - 3.8f * u, cy);
                    path.lineTo(cx + 2.8f * u, cy + 6.8f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "sf_chevron_right": { // SF chevron.right
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(2.0f * u);
                    path.reset();
                    path.moveTo(cx - 2.2f * u, cy - 5.2f * u);
                    path.lineTo(cx + 3.0f * u, cy);
                    path.lineTo(cx - 2.2f * u, cy + 5.2f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "ic_baseline_folder_24": { // SF folder.badge.plus
                    paint.setStyle(Paint.Style.STROKE);
                    path.reset();
                    path.moveTo(cx - 8.5f * u, cy - 4.8f * u);
                    path.lineTo(cx - 8.5f * u, cy + 6.2f * u);
                    path.lineTo(cx + 8.5f * u, cy + 6.2f * u);
                    path.lineTo(cx + 8.5f * u, cy - 3.2f * u);
                    path.lineTo(cx - 0.8f * u, cy - 3.2f * u);
                    path.lineTo(cx - 2.8f * u, cy - 5.8f * u);
                    path.lineTo(cx - 8.5f * u, cy - 5.8f * u);
                    path.close();
                    canvas.drawPath(path, paint);
                    canvas.drawLine(cx, cy - 0.8f * u, cx, cy + 3.8f * u, paint);
                    canvas.drawLine(cx - 2.3f * u, cy + 1.5f * u, cx + 2.3f * u, cy + 1.5f * u, paint);
                    break;
                }
                case "ic_baseline_loop_24": { // SF arrow.clockwise
                    paint.setStyle(Paint.Style.STROKE);
                    box.set(cx - 7.0f * u, cy - 7.0f * u, cx + 7.0f * u, cy + 7.0f * u);
                    canvas.drawArc(box, -45f, 285f, false, paint);
                    path.reset();
                    path.moveTo(cx + 1.6f * u, cy - 7.8f * u);
                    path.lineTo(cx + 5.6f * u, cy - 5.0f * u);
                    path.lineTo(cx + 1.4f * u, cy - 2.8f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "ic_baseline_close_24": { // SF xmark
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx - 5.5f * u, cy - 5.5f * u, cx + 5.5f * u, cy + 5.5f * u, paint);
                    canvas.drawLine(cx + 5.5f * u, cy - 5.5f * u, cx - 5.5f * u, cy + 5.5f * u, paint);
                    break;
                }
                case "ic_baseline_sort_24": { // SF arrow.up.arrow.down
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx - 3.6f * u, cy - 6.8f * u, cx - 3.6f * u, cy + 6.8f * u, paint);
                    path.reset();
                    path.moveTo(cx - 6.6f * u, cy - 3.4f * u);
                    path.lineTo(cx - 3.6f * u, cy - 6.8f * u);
                    path.lineTo(cx - 0.6f * u, cy - 3.4f * u);
                    canvas.drawPath(path, paint);
                    canvas.drawLine(cx + 3.6f * u, cy - 6.8f * u, cx + 3.6f * u, cy + 6.8f * u, paint);
                    path.reset();
                    path.moveTo(cx + 0.6f * u, cy + 3.4f * u);
                    path.lineTo(cx + 3.6f * u, cy + 6.8f * u);
                    path.lineTo(cx + 6.6f * u, cy + 3.4f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "ic_baseline_view_column_24": { // SF rectangle.grid.2x2
                    paint.setStyle(Paint.Style.STROKE);
                    float r = 1.8f * u;
                    box.set(cx - 8.2f * u, cy - 6.8f * u, cx - 1.2f * u, cy - 1.0f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx + 1.2f * u, cy - 6.8f * u, cx + 8.2f * u, cy - 1.0f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx - 8.2f * u, cy + 1.2f * u, cx - 1.2f * u, cy + 6.8f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    box.set(cx + 1.2f * u, cy + 1.2f * u, cx + 8.2f * u, cy + 6.8f * u);
                    canvas.drawRoundRect(box, r, r, paint);
                    break;
                }
                case "ic_baseline_audiotrack_24":
                case "sf_queue": { // SF music.note.list
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx + 1.5f * u, cy - 6.5f * u, cx + 1.5f * u, cy + 4.5f * u, paint);
                    canvas.drawLine(cx + 1.5f * u, cy - 6.5f * u, cx + 7.2f * u, cy - 4.8f * u, paint);
                    paint.setStyle(Paint.Style.FILL);
                    canvas.drawCircle(cx - 1.2f * u, cy + 4.8f * u, 2.8f * u, paint);
                    break;
                }
                case "sf_checkmark": { // SF checkmark
                    paint.setStyle(Paint.Style.STROKE);
                    paint.setStrokeWidth(2.3f * u);
                    path.reset();
                    path.moveTo(cx - 6.2f * u, cy + 0.4f * u);
                    path.lineTo(cx - 1.6f * u, cy + 5.2f * u);
                    path.lineTo(cx + 6.8f * u, cy - 4.8f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "sf_sparkles": {
                    paint.setStyle(Paint.Style.FILL);
                    path.reset();
                    path.moveTo(cx, cy - 8f * u);
                    path.quadTo(cx, cy, cx + 8f * u, cy);
                    path.quadTo(cx, cy, cx, cy + 8f * u);
                    path.quadTo(cx, cy, cx - 8f * u, cy);
                    path.quadTo(cx, cy, cx, cy - 8f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "sf_palette": {
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx, cy, 7.5f * u, paint);
                    paint.setStyle(Paint.Style.FILL);
                    canvas.drawCircle(cx - 2.6f * u, cy - 2.6f * u, 1.4f * u, paint);
                    canvas.drawCircle(cx + 2.6f * u, cy - 2.2f * u, 1.4f * u, paint);
                    canvas.drawCircle(cx - 2.2f * u, cy + 2.6f * u, 1.4f * u, paint);
                    break;
                }
                case "sf_captions": {
                    paint.setStyle(Paint.Style.STROKE);
                    box.set(cx - 8f * u, cy - 6f * u, cx + 8f * u, cy + 6f * u);
                    canvas.drawRoundRect(box, 2.4f * u, 2.4f * u, paint);
                    canvas.drawLine(cx - 4.5f * u, cy - 1.5f * u, cx + 4.5f * u, cy - 1.5f * u, paint);
                    canvas.drawLine(cx - 4.5f * u, cy + 2.0f * u, cx + 1.8f * u, cy + 2.0f * u, paint);
                    break;
                }
                case "sf_waveform": {
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx - 6f * u, cy - 3f * u, cx - 6f * u, cy + 3f * u, paint);
                    canvas.drawLine(cx - 2f * u, cy - 6.5f * u, cx - 2f * u, cy + 6.5f * u, paint);
                    canvas.drawLine(cx + 2f * u, cy - 4.5f * u, cx + 2f * u, cy + 4.5f * u, paint);
                    canvas.drawLine(cx + 6f * u, cy - 2f * u, cx + 6f * u, cy + 2f * u, paint);
                    break;
                }
                case "sf_cloud": {
                    paint.setStyle(Paint.Style.STROKE);
                    box.set(cx - 7.8f * u, cy - 3.5f * u, cx + 7.8f * u, cy + 5.5f * u);
                    canvas.drawRoundRect(box, 4.5f * u, 4.5f * u, paint);
                    break;
                }
                case "sf_person": { // SF person
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx, cy - 3.6f * u, 3.6f * u, paint);
                    box.set(cx - 7.2f * u, cy + 2.2f * u, cx + 7.2f * u, cy + 14.6f * u);
                    canvas.drawArc(box, 180f, 180f, false, paint);
                    break;
                }
                case "sf_download": { // SF arrow.down.circle
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx, cy, 8.2f * u, paint);
                    canvas.drawLine(cx, cy - 4.4f * u, cx, cy + 3.6f * u, paint);
                    path.reset();
                    path.moveTo(cx - 3.4f * u, cy + 0.4f * u);
                    path.lineTo(cx, cy + 3.8f * u);
                    path.lineTo(cx + 3.4f * u, cy + 0.4f * u);
                    canvas.drawPath(path, paint);
                    break;
                }
                case "sf_motion": { // staggered text lines
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx - 7.5f * u, cy - 5.5f * u, cx + 3.5f * u, cy - 5.5f * u, paint);
                    canvas.drawLine(cx - 4.5f * u, cy, cx + 7.5f * u, cy, paint);
                    canvas.drawLine(cx - 1.5f * u, cy + 5.5f * u, cx + 5.5f * u, cy + 5.5f * u, paint);
                    break;
                }
                case "sf_filter": { // SF line.3.horizontal.decrease
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawLine(cx - 8f * u, cy - 5.5f * u, cx + 8f * u, cy - 5.5f * u, paint);
                    canvas.drawLine(cx - 5f * u, cy, cx + 5f * u, cy, paint);
                    canvas.drawLine(cx - 2f * u, cy + 5.5f * u, cx + 2f * u, cy + 5.5f * u, paint);
                    break;
                }
                case "sf_bug": { // SF ladybug-ish
                    paint.setStyle(Paint.Style.STROKE);
                    box.set(cx - 5f * u, cy - 4.5f * u, cx + 5f * u, cy + 8f * u);
                    canvas.drawOval(box, paint);
                    canvas.drawLine(cx, cy - 4.5f * u, cx, cy + 8f * u, paint);
                    box.set(cx - 3f * u, cy - 8f * u, cx + 3f * u, cy - 3f * u);
                    canvas.drawArc(box, 180f, 180f, false, paint);
                    canvas.drawLine(cx - 5f * u, cy + 0.5f * u, cx - 8.5f * u, cy - 1f * u, paint);
                    canvas.drawLine(cx + 5f * u, cy + 0.5f * u, cx + 8.5f * u, cy - 1f * u, paint);
                    canvas.drawLine(cx - 5f * u, cy + 4.5f * u, cx - 8.5f * u, cy + 6f * u, paint);
                    canvas.drawLine(cx + 5f * u, cy + 4.5f * u, cx + 8.5f * u, cy + 6f * u, paint);
                    break;
                }
                case "sf_doc": { // SF doc.text
                    paint.setStyle(Paint.Style.STROKE);
                    path.reset();
                    path.moveTo(cx - 6f * u, cy - 8.5f * u);
                    path.lineTo(cx + 2f * u, cy - 8.5f * u);
                    path.lineTo(cx + 6.5f * u, cy - 4f * u);
                    path.lineTo(cx + 6.5f * u, cy + 8.5f * u);
                    path.lineTo(cx - 6f * u, cy + 8.5f * u);
                    path.close();
                    canvas.drawPath(path, paint);
                    canvas.drawLine(cx - 3f * u, cy, cx + 3.5f * u, cy, paint);
                    canvas.drawLine(cx - 3f * u, cy + 4f * u, cx + 3.5f * u, cy + 4f * u, paint);
                    break;
                }
                case "sf_info":
                default: {
                    paint.setStyle(Paint.Style.STROKE);
                    canvas.drawCircle(cx, cy, 7.6f * u, paint);
                    canvas.drawLine(cx, cy - 1.0f * u, cx, cy + 4.4f * u, paint);
                    paint.setStyle(Paint.Style.FILL);
                    canvas.drawCircle(cx, cy - 4.0f * u, 1.2f * u, paint);
                    break;
                }
            }
        }
        @Override public int getIntrinsicWidth() { return dp(context, 24); }
        @Override public int getIntrinsicHeight() { return dp(context, 24); }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** iOS 26 Floating Tab Bar capsule + circular Search capsule. */
    public static final class Navigation extends LinearLayout {
        private final Activity activity;
        private final FrameLayout capsule;
        private final FrameLayout searchFrame;
        private final View indicator;
        private final ImageButton[] icons = new ImageButton[4];
        private final SfIconDrawable[] sfIcons = new SfIconDrawable[4];
        private final TextView[] labels = new TextView[4];
        private int ink, unselectedInk;
        private ImageButton searchButton;
        private int selected;
        private ValueAnimator animator;
        private static final String[] TAB_SF_NAMES = {
                "ic_baseline_widgets_24",
                "ic_baseline_favorite_24",
                "ic_clock_black_24dp",
                "ic_baseline_more_horiz_24"
        };

        public Navigation(Activity activity, View content, ImageButton[] buttons,
                String[] names, Runnable[] actions, Runnable search, int initial) {
            super(activity);
            if (buttons.length != 4 || names.length != 4 || actions.length != 4)
                throw new IllegalArgumentException("Four navigation items are required");
            this.activity = activity;
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            this.ink = ThemePalettes.text(page);
            this.unselectedInk = ThemePalettes.secondary(page);
            this.selected = Math.max(0, Math.min(3, initial));
            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            setPadding(dp(activity, 12), 0, dp(activity, 12), 0);
            capsule = new FrameLayout(activity);
            capsule.setBackground(new FrostDrawable(activity, content, capsule, 32));
            LinearLayout.LayoutParams body = new LinearLayout.LayoutParams(0, dp(activity, 62), 1);
            addView(capsule, body);
            indicator = new View(activity);
            updateIndicatorStyle();
            indicator.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            FrameLayout.LayoutParams selection = new FrameLayout.LayoutParams(0, dp(activity, 54), Gravity.TOP | Gravity.LEFT);
            selection.leftMargin = dp(activity, 4);
            selection.topMargin = dp(activity, 4);
            capsule.addView(indicator, selection);
            LinearLayout row = new LinearLayout(activity);
            row.setPadding(dp(activity, 4), dp(activity, 4), dp(activity, 4), dp(activity, 4));
            capsule.addView(row, new FrameLayout.LayoutParams(-1, -1));
            for (int i = 0; i < 4; i++) {
                final int index = i;
                ImageButton icon = buttons[i];
                detach(icon);
                SfIconDrawable sf = new SfIconDrawable(activity, TAB_SF_NAMES[i]);
                sfIcons[i] = sf;
                icon.setImageDrawable(sf);
                icon.setPadding(0, 0, 0, 0);
                icon.setBackground(null);
                icon.setClickable(false);
                icon.setFocusable(false);
                icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                icons[i] = icon;
                LinearLayout item = new LinearLayout(activity);
                item.setOrientation(VERTICAL);
                item.setGravity(Gravity.CENTER);
                item.setContentDescription(names[i]);
                item.setClickable(true);
                item.setFocusable(true);
                attachIosPress(item, 0.92f);
                item.addView(icon, new LinearLayout.LayoutParams(dp(activity, 22), dp(activity, 22)));
                TextView label = new TextView(activity);
                label.setText(names[i]);
                label.setGravity(Gravity.CENTER);
                label.setTextSize(10.5f);
                label.setSingleLine(true);
                label.setIncludeFontPadding(false);
                label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                LinearLayout.LayoutParams text = new LinearLayout.LayoutParams(-1, dp(activity, 15));
                text.topMargin = dp(activity, 2);
                item.addView(label, text);
                labels[i] = label;
                item.setOnClickListener(v -> {
                    hapticTick(v);
                    actions[index].run();
                });
                row.addView(item, new LinearLayout.LayoutParams(0, -1, 1));
            }
            searchFrame = new FrameLayout(activity);
            searchFrame.setBackground(new FrostDrawable(activity, content, searchFrame, 32));
            LinearLayout.LayoutParams searchLp = new LinearLayout.LayoutParams(dp(activity, 56), dp(activity, 62));
            searchLp.leftMargin = dp(activity, 8);
            addView(searchFrame, searchLp);
            ImageButton searchIcon = icon(activity, "ic_baseline_search_24", "\u641c\u7d22", v -> {
                hapticTick(v);
                search.run();
            });
            searchButton = searchIcon;
            searchIcon.setImageTintList(ColorStateList.valueOf(ink));
            FrameLayout.LayoutParams searchButtonLp = new FrameLayout.LayoutParams(-1, -1);
            searchIcon.setPadding(dp(activity, 15), dp(activity, 15), dp(activity, 15), dp(activity, 15));
            searchFrame.addView(searchIcon, searchButtonLp);
            capsule.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, oright, ob) -> {
                if (r - l != oright - ol || b - t != ob - ot) align();
            });
            paint(selected, 1f);
            post(this::align);
        }

        private void updateIndicatorStyle() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            boolean light = ThemePalettes.light(page);
            if (PlaybackOptions.liquidGlass(activity)) {
                indicator.setBackground(new LiquidPillDrawable(activity,
                        light ? 0x94ffffff : 0x28ffffff, light, dp(activity, 27)));
            } else {
                indicator.setBackground(rounded(light ? 0x16000000 : 0x22ffffff, dp(activity, 27)));
            }
        }
        private float slot() { return Math.max(0, capsule.getWidth() - dp(activity, 8)) / 4f; }
        private void align() {
            if (capsule.getWidth() <= 0) return;
            if (animator != null) { animator.cancel(); animator = null; }
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams)indicator.getLayoutParams();
            int width = Math.max(1, Math.round(slot()));
            if (lp.width != width) { lp.width = width; indicator.setLayoutParams(lp); }
            indicator.setTranslationX(slot() * selected);
            indicator.setScaleX(1f);
            indicator.setScaleY(1f);
            paint(selected, 1f);
        }
        private void paint(int target, float progress) {
            for (int i = 0; i < 4; i++) {
                boolean active = i == target;
                int color = active ? RED : unselectedInk;
                if (sfIcons[i] != null) sfIcons[i].setFilled(active);
                icons[i].setImageTintList(ColorStateList.valueOf(color));
                labels[i].setTextColor(color);
                labels[i].setTypeface(active ? boldFont() : mediumFont());
            }
        }
        void refreshPalette() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            ink = ThemePalettes.text(page);
            unselectedInk = ThemePalettes.secondary(page);
            updateIndicatorStyle();
            if (searchButton != null) searchButton.setImageTintList(ColorStateList.valueOf(ink));
            paint(selected, 1f);
            invalidate();
            capsule.invalidate();
            searchFrame.invalidate();
        }
        public void select(int next, boolean animated) {
            if (next < 0 || next > 3) return;
            int old = selected;
            selected = next;
            if (capsule.getWidth() <= 0) { paint(next, 1f); post(this::align); return; }
            if (animator != null) { animator.cancel(); animator = null; }
            final float from = indicator.getTranslationX();
            final float target = slot() * next;
            if (!animated || old == next || !ValueAnimator.areAnimatorsEnabled()) {
                indicator.setTranslationX(target);
                indicator.setScaleX(1f);
                indicator.setScaleY(1f);
                paint(next, 1f);
                return;
            }
            ArgbEvaluator colors = new ArgbEvaluator();
            boolean liquid = PlaybackOptions.liquidGlass(activity);
            animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(300);
            animator.setInterpolator(new OvershootInterpolator(.65f));
            animator.addUpdateListener(value -> {
                float raw = (Float)value.getAnimatedValue();
                float position = ShellState.indicator(from, target, raw, slot());
                indicator.setTranslationX(position);
                float blend = Math.max(0f, Math.min(1f, value.getAnimatedFraction()));
                if (liquid) {
                    float wave = (float)Math.sin(Math.PI * blend);
                    indicator.setScaleX(1f + .08f * wave);
                    indicator.setScaleY(1f - .03f * wave);
                }
                for (int i = 0; i < 4; i++) {
                    int color = i == old ? (Integer)colors.evaluate(blend, RED, unselectedInk)
                            : i == next ? (Integer)colors.evaluate(blend, unselectedInk, RED) : unselectedInk;
                    icons[i].setImageTintList(ColorStateList.valueOf(color));
                    labels[i].setTextColor(color);
                }
            });
            animator.addListener(new android.animation.AnimatorListenerAdapter() {
                @Override public void onAnimationEnd(android.animation.Animator animation) {
                    indicator.setScaleX(1f);
                    indicator.setScaleY(1f);
                    paint(selected, 1f);
                }
            });
            animator.start();
        }
    }

    /** Authentic iOS UISegmentedControl (34dp height, subtle separators, raised thumb & haptics). */
    public static final class Sources extends FrameLayout {
        private final Activity activity;
        private final View thumb;
        private final TextView[] labels = new TextView[3];
        private final Runnable[] actions;
        private int source;
        private java.util.function.BooleanSupplier navigationAllowed = () -> true;
        private int selected, generation;
        private float downX;
        private boolean dragging;
        private ValueAnimator animator;

        public Sources(Activity activity, int initial, Runnable[] actions) {
            super(activity);
            this.activity = activity;
            this.actions = actions;
            this.selected = Math.max(0, Math.min(2, initial));
            this.source = this.selected;
            if (actions.length != 3) throw new IllegalArgumentException("Three sources are required");
            setPadding(dp(activity, 2), dp(activity, 2), dp(activity, 2), dp(activity, 2));
            setClickable(true);
            thumb = new View(activity);
            thumb.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            FrameLayout.LayoutParams marker = new FrameLayout.LayoutParams(0, -1, Gravity.LEFT | Gravity.TOP);
            marker.setMargins(dp(activity, 2), dp(activity, 2), 0, dp(activity, 2));
            addView(thumb, marker);
            LinearLayout row = new LinearLayout(activity);
            addView(row, new FrameLayout.LayoutParams(-1, -1));
            String[] names = {"\u5728\u7ebf", "\u672c\u5730", "\u7f51\u76d8"};
            for (int i = 0; i < 3; i++) {
                final int index = i;
                TextView text = new TextView(activity);
                text.setText(names[i]);
                text.setTextSize(13.5f);
                text.setGravity(Gravity.CENTER);
                text.setSingleLine();
                text.setClickable(true);
                text.setFocusable(true);
                text.setOnClickListener(v -> choose(index));
                labels[i] = text;
                row.addView(text, new LinearLayout.LayoutParams(0, -1, 1));
            }
            addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> {
                if (r - l != orr - ol || b - t != ob - ot) align();
            });
            refreshPalette();
            paint();
            post(this::align);
        }
        private float slot() { return Math.max(0, getWidth() - dp(activity, 4)) / 3f; }
        private void paint() {
            for (int i = 0; i < 3; i++) {
                boolean active = i == selected;
                labels[i].setAlpha(active ? 1f : .68f);
                labels[i].setTypeface(active ? boldFont() : mediumFont());
            }
        }
        private void align() {
            if (getWidth() <= 0) return;
            if (animator != null) { animator.cancel(); animator = null; }
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams)thumb.getLayoutParams();
            int width = Math.max(1, Math.round(slot()));
            if (lp.width != width) { lp.width = width; thumb.setLayoutParams(lp); }
            thumb.setTranslationX(slot() * selected);
            thumb.setScaleX(1f);
            paint();
        }
        public void setNavigationAllowed(java.util.function.BooleanSupplier allowed) {
            navigationAllowed = allowed;
        }
        void refreshPalette() {
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            boolean light = ThemePalettes.light(page);
            boolean liquid = PlaybackOptions.liquidGlass(activity);
            int track = light ? 0xffe5e5ea : 0xff1c1c1e;
            int marker = light ? 0xffffffff : 0xff3a3a3c;
            if (liquid) {
                GradientDrawable trackShape = rounded(light ? 0xdce5e5ea : 0xd01c1c1e, dp(activity, 11));
                trackShape.setStroke(Math.max(1, dp(activity, 0.7f)), light ? 0x70ffffff : 0x22ffffff);
                setBackground(trackShape);
                thumb.setBackground(new LiquidPillDrawable(activity,
                        light ? 0xf8ffffff : 0xe03a3a3c, light, dp(activity, 9)));
            } else {
                setBackground(rounded(track, dp(activity, 9)));
                thumb.setBackground(rounded(marker, dp(activity, 7.5f)));
            }
            int textInk = ThemePalettes.text(page);
            for (TextView label : labels) label.setTextColor(textInk);
            paint();
            invalidate();
        }
        void swipePosition(float position) {
            if (animator != null) { animator.cancel(); animator = null; }
            float bounded = Math.max(0f, Math.min(2f, position));
            thumb.setTranslationX(slot() * bounded);
            thumb.setScaleX(1f);
            for (int i = 0; i < 3; i++) labels[i].setAlpha(1f - .32f * Math.min(1f, Math.abs(i - bounded)));
        }
        void resetSelection() { generation++; selected = source; align(); }
        void setSource(int next, boolean animated) {
            next = Math.max(0, Math.min(2, next));
            source = next; selected = next; generation++;
            float from = thumb.getTranslationX(), to = slot() * next;
            if (animator != null) { animator.cancel(); animator = null; }
            paint();
            if (!animated || !ValueAnimator.areAnimatorsEnabled() || Math.abs(from - to) < .5f) {
                thumb.setTranslationX(to); thumb.setScaleX(1f); return;
            }
            animator = ValueAnimator.ofFloat(from, to);
            animator.setDuration(250);
            animator.setInterpolator(new OvershootInterpolator(.35f));
            animator.addUpdateListener(v -> thumb.setTranslationX((Float)v.getAnimatedValue()));
            animator.start();
        }
        private void choose(int next) {
            if (!navigationAllowed.getAsBoolean()) { selected = source; align(); return; }
            next = Math.max(0, Math.min(2, next));
            final int destination = next;
            final int token = ++generation;
            boolean changed = next != selected;
            if (changed) hapticTick(this);
            float from = thumb.getTranslationX(), to = slot() * next;
            selected = next; paint();
            if (animator != null) { animator.cancel(); animator = null; }
            if (getWidth() > 0 && ValueAnimator.areAnimatorsEnabled() && Math.abs(to - from) > .5f) {
                animator = ValueAnimator.ofFloat(0f, 1f);
                animator.setDuration(270);
                animator.setInterpolator(new OvershootInterpolator(.45f));
                animator.addUpdateListener(v -> {
                    float f = (Float)v.getAnimatedValue();
                    thumb.setTranslationX(Math.max(0f, Math.min(slot() * 2f, from + (to - from) * f)));
                    thumb.setScaleX(1f + .06f * (float)Math.sin(Math.PI * Math.max(0f, Math.min(1f, v.getAnimatedFraction()))));
                });
                animator.addListener(new android.animation.AnimatorListenerAdapter() {
                    @Override public void onAnimationEnd(android.animation.Animator animation) { thumb.setScaleX(1f); }
                });
                animator.start();
            } else thumb.setTranslationX(to);
            if (!changed) return;
            post(() -> {
                if (token == generation && isAttachedToWindow() && !activity.isFinishing() && !activity.isDestroyed()) {
                    if (navigationAllowed.getAsBoolean()) actions[destination].run();
                    else { selected = source; align(); }
                }
            });
        }
        @Override public boolean onInterceptTouchEvent(MotionEvent event) { return true; }
        @Override public boolean onTouchEvent(MotionEvent event) {
            if (!navigationAllowed.getAsBoolean()) return false;
            float width = slot();
            if (width <= 0) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getX(); dragging = false;
                    if (animator != null) { animator.cancel(); animator = null; }
                    return true;
                case MotionEvent.ACTION_MOVE:
                    if (Math.abs(event.getX() - downX) > dp(activity, 6)) dragging = true;
                    if (dragging) thumb.setTranslationX(Math.max(0f, Math.min(width * 2f, event.getX() - dp(activity, 2) - width / 2f)));
                    return true;
                case MotionEvent.ACTION_UP:
                    choose(ShellState.sourceAt(event.getX(), dp(activity, 2), width));
                    performClick(); return true;
                case MotionEvent.ACTION_CANCEL:
                    choose(selected); return true;
                default: return true;
            }
        }
        @Override public boolean performClick() { return super.performClick(); }
        @Override public void onWindowFocusChanged(boolean focused) {
            super.onWindowFocusChanged(focused);
            if (focused) resetSelection();
        }
        @Override protected void onDetachedFromWindow() { generation++; if (animator != null) animator.cancel(); super.onDetachedFromWindow(); }
    }

    /** Real-time optical background sampling + Liquid Glass / Frosted Glass shader. */
    public static final class FrostDrawable extends Drawable implements View.OnAttachStateChangeListener {
        private final Activity activity;
        private final View source, host;
        private final float radius;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF bounds = new RectF();
        private final RectF inner = new RectF();
        private final Path clip = new Path();
        private final ViewTreeObserver.OnScrollChangedListener scroll = this::invalidateSelf;
        private boolean registered, disabled;
        private Object renderer;

        public FrostDrawable(Activity activity, View source, View host, int radiusDp) {
            this.activity = activity; this.source = source; this.host = host; this.radius = dp(activity, radiusDp);
            host.addOnAttachStateChangeListener(this);
            if (host.isAttachedToWindow()) onViewAttachedToWindow(host);
        }
        @Override public void onViewAttachedToWindow(View view) {
            if (!registered && source != null && source.getViewTreeObserver().isAlive()) {
                source.getViewTreeObserver().addOnScrollChangedListener(scroll); registered = true;
            }
            invalidateSelf();
        }
        @Override public void onViewDetachedFromWindow(View view) {
            if (registered && source != null && source.getViewTreeObserver().isAlive())
                source.getViewTreeObserver().removeOnScrollChangedListener(scroll);
            registered = false;
        }
        @Override public void draw(Canvas canvas) {
            Rect b = getBounds(); if (b.width() <= 0 || b.height() <= 0) return;
            bounds.set(b.left, b.top, b.right, b.bottom);
            float r = Math.min(radius, Math.min(bounds.width(), bounds.height()) / 2f);
            boolean liquid = PlaybackOptions.liquidGlass(activity);
            clip.reset(); clip.addRoundRect(bounds, r, r, Path.Direction.CW);
            int state = canvas.save(); canvas.clipPath(clip);
            boolean blurred = false;
            if (!disabled && Build.VERSION.SDK_INT >= 31 && canvas.isHardwareAccelerated()
                    && source != null && source.isAttachedToWindow() && source.getWidth() > 0 && source.getHeight() > 0) {
                try {
                    if (renderer == null) renderer = new Api31();
                    ((Api31)renderer).draw(canvas, source, host, b.width(), b.height(),
                            dp(activity, ShellState.glassBlurDp(liquid)));
                    blurred = true;
                } catch (RuntimeException | LinkageError failure) { disabled = true; renderer = null; }
            }
            int page = ThemePalettes.color(ThemePalettes.selected(activity), 1);
            boolean light = ThemePalettes.light(page);
            paint.setShader(null);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(ShellState.glassFillColor(light, blurred, liquid));
            canvas.drawRoundRect(bounds, r, r, paint);
            if (liquid) {
                paint.setShader(new LinearGradient(bounds.left, bounds.top, bounds.right, bounds.bottom,
                        new int[]{
                                light ? 0x68ffffff : 0x2effffff,
                                light ? 0x10ffffff : 0x05ffffff,
                                light ? 0x38ffffff : 0x16ffffff
                        },
                        new float[]{0f, 0.52f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(bounds, r, r, paint);
                float sheenHeight = Math.max(dp(activity, 12), bounds.height() * 0.44f);
                inner.set(bounds.left + dp(activity, 1.5f), bounds.top + dp(activity, 1f),
                        bounds.right - dp(activity, 1.5f), bounds.top + sheenHeight);
                paint.setShader(new LinearGradient(0, inner.top, 0, inner.bottom,
                        light ? 0x80ffffff : 0x38ffffff, 0x00ffffff, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(inner, r, r, paint);
                paint.setShader(null);
            }
            canvas.restoreToCount(state);
            paint.setStyle(Paint.Style.STROKE);
            float stroke = Math.max(1f, dp(activity, liquid ? 1.15f : 0.75f));
            paint.setStrokeWidth(stroke);
            float inset = stroke / 2f;
            if (liquid) {
                paint.setShader(new LinearGradient(bounds.left, bounds.top, bounds.right, bounds.bottom,
                        new int[]{
                                light ? 0xe8ffffff : 0x88ffffff,
                                light ? 0x44ffffff : 0x1cffffff,
                                light ? 0x98ffffff : 0x48ffffff
                        },
                        new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            } else {
                paint.setShader(null);
                paint.setColor(light ? 0x38000000 : 0x32ffffff);
            }
            canvas.drawRoundRect(bounds.left + inset, bounds.top + inset,
                    bounds.right - inset, bounds.bottom - inset, r, r, paint);
            paint.setShader(null);
        }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        @Override public void getOutline(Outline outline) {
            Rect b = getBounds(); outline.setRoundRect(b, Math.min(radius, Math.min(b.width(), b.height()) / 2f));
        }
    }

    /** 3D Liquid Glass droplet pill used for active navigation & segmented control thumbs. */
    private static final class LiquidPillDrawable extends Drawable {
        private final Context context;
        private final int baseColor;
        private final boolean light;
        private final float radius;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        LiquidPillDrawable(Context context, int baseColor, boolean light, float radius) {
            this.context = context;
            this.baseColor = baseColor;
            this.light = light;
            this.radius = radius;
        }
        @Override public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            rect.set(b.left, b.top, b.right, b.bottom);
            float r = Math.min(radius, Math.min(rect.width(), rect.height()) / 2f);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            paint.setColor(baseColor);
            canvas.drawRoundRect(rect, r, r, paint);
            paint.setShader(new LinearGradient(rect.left, rect.top, rect.left, rect.bottom,
                    light ? 0x70ffffff : 0x32ffffff, 0x00ffffff, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, paint);
            float stroke = Math.max(1f, dp(context, 0.9f));
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setShader(new LinearGradient(rect.left, rect.top, rect.right, rect.bottom,
                    light ? 0xd8ffffff : 0x68ffffff,
                    light ? 0x38ffffff : 0x18ffffff, Shader.TileMode.CLAMP));
            float inset = stroke / 2f;
            canvas.drawRoundRect(rect.left + inset, rect.top + inset,
                    rect.right - inset, rect.bottom - inset, r, r, paint);
            paint.setShader(null);
        }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** Standalone glass surface for context menus, action sheets and alerts. */
    private static final class GlassSurfaceDrawable extends Drawable {
        private final Context context;
        private final int cardColor;
        private final float radius;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        GlassSurfaceDrawable(Context context, int cardColor, float radius) {
            this.context = context;
            this.cardColor = cardColor;
            this.radius = radius;
        }
        @Override public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            rect.set(b.left, b.top, b.right, b.bottom);
            boolean light = ThemePalettes.light(cardColor);
            boolean liquid = PlaybackOptions.liquidGlass(context);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            int fill = liquid ? ((cardColor & 0x00ffffff) | (light ? 0xf2000000 : 0xee000000)) : cardColor;
            paint.setColor(fill);
            canvas.drawRoundRect(rect, radius, radius, paint);
            if (liquid) {
                paint.setShader(new LinearGradient(rect.left, rect.top, rect.right, rect.bottom,
                        new int[]{
                                light ? 0x58ffffff : 0x22ffffff,
                                0x00ffffff,
                                light ? 0x24ffffff : 0x10ffffff
                        }, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawRoundRect(rect, radius, radius, paint);
            }
            float stroke = Math.max(1f, dp(context, liquid ? 1.0f : 0.7f));
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            if (liquid) {
                paint.setShader(new LinearGradient(rect.left, rect.top, rect.right, rect.bottom,
                        light ? 0xd8ffffff : 0x6cffffff,
                        light ? 0x40ffffff : 0x1effffff, Shader.TileMode.CLAMP));
            } else {
                paint.setShader(null);
                paint.setColor(light ? 0x26000000 : 0x2cffffff);
            }
            float inset = stroke / 2f;
            canvas.drawRoundRect(rect.left + inset, rect.top + inset,
                    rect.right - inset, rect.bottom - inset, radius, radius, paint);
            paint.setShader(null);
        }
        @Override public boolean getPadding(Rect padding) {
            int p = dp(context, 4);
            padding.set(p, p, p, p);
            return true;
        }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** Authentic iOS UISwitch capsule toggle drawable (51dp x 31dp). */
    private static final class IosSwitchDrawable extends Drawable {
        private final Context context;
        private final CompoundButton host;
        private final int activeColor;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        IosSwitchDrawable(Context context, CompoundButton host, int activeColor) {
            this.context = context;
            this.host = host;
            this.activeColor = activeColor != 0 ? activeColor : IOS_GREEN;
        }
        @Override public boolean isStateful() { return true; }
        @Override protected boolean onStateChange(int[] state) { invalidateSelf(); return true; }
        @Override public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            float w = dp(context, 51), h = dp(context, 31);
            float left = b.exactCenterX() - w / 2f;
            float top = b.exactCenterY() - h / 2f;
            rect.set(left, top, left + w, top + h);
            float r = h / 2f;
            boolean checked = host.isChecked();
            int page = ThemePalettes.color(ThemePalettes.selected(context), 1);
            boolean light = ThemePalettes.light(page);
            int trackColor = checked ? activeColor : (light ? 0xffe5e5ea : 0xff39393d);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(null);
            paint.setColor(trackColor);
            canvas.drawRoundRect(rect, r, r, paint);
            float pad = dp(context, 2f);
            float thumbRadius = (h - pad * 2f) / 2f;
            float cx = checked ? (rect.right - pad - thumbRadius) : (rect.left + pad + thumbRadius);
            float cy = rect.centerY();
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0x28000000);
            canvas.drawCircle(cx, cy + dp(context, 1f), thumbRadius, paint);
            paint.setColor(0xffffffff);
            canvas.drawCircle(cx, cy, thumbRadius, paint);
        }
        @Override public int getIntrinsicWidth() { return dp(context, 51); }
        @Override public int getIntrinsicHeight() { return dp(context, 31); }
        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter filter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** Wraps ListPopupWindow's adapter so items render like UIContextMenuInteraction (label left, SF icon right, hairlines). */
    private static final class IosMenuAdapter implements ListAdapter {
        private final Activity activity;
        private final ListAdapter delegate;

        IosMenuAdapter(Activity activity, ListAdapter delegate) {
            this.activity = activity;
            this.delegate = delegate;
        }
        void refresh() {}
        @Override public boolean areAllItemsEnabled() { return delegate.areAllItemsEnabled(); }
        @Override public boolean isEnabled(int position) { return delegate.isEnabled(position); }
        @Override public void registerDataSetObserver(DataSetObserver observer) { delegate.registerDataSetObserver(observer); }
        @Override public void unregisterDataSetObserver(DataSetObserver observer) { delegate.unregisterDataSetObserver(observer); }
        @Override public int getCount() { return delegate.getCount(); }
        @Override public Object getItem(int position) { return delegate.getItem(position); }
        @Override public long getItemId(int position) { return delegate.getItemId(position); }
        @Override public boolean hasStableIds() { return delegate.hasStableIds(); }
        @Override public int getItemViewType(int position) { return 0; }
        @Override public int getViewTypeCount() { return 1; }
        @Override public boolean isEmpty() { return delegate.isEmpty(); }

        private String sfIconForText(String text) {
            if (text == null) return "sf_chevron_right";
            if (text.contains("\u60f3\u542c") || text.contains("\u6536\u85cf")) return "ic_baseline_favorite_24";
            if (text.contains("\u5728\u542c") || text.contains("\u64ad\u653e")) return "sf_queue";
            if (text.contains("\u542c\u8fc7")) return "sf_checkmark";
            if (text.contains("\u91cd\u542c")) return "ic_baseline_loop_24";
            if (text.contains("\u6401\u7f6e") || text.contains("\u5386\u53f2")) return "ic_clock_black_24dp";
            if (text.contains("\u4e91\u7aef") || text.contains("\u7f51\u76d8")) return "sf_cloud";
            if (text.contains("\u672c\u5730") || text.contains("\u7f13\u5b58") || text.contains("\u4e0b\u8f7d")) return "ic_baseline_folder_24";
            if (text.contains("\u8bbe\u7f6e") || text.contains("\u66f4\u591a")) return "ic_baseline_more_horiz_24";
            return "sf_chevron_right";
        }

        @Override public View getView(int position, View convertView, ViewGroup parent) {
            int card = ThemePalettes.color(ThemePalettes.selected(activity), 2);
            int ink = ThemePalettes.text(card);
            int muted = ThemePalettes.secondary(card);
            LinearLayout box;
            TextView label;
            ImageView icon;
            View divider;
            if (convertView instanceof LinearLayout && "ios_menu_item".equals(convertView.getTag())) {
                box = (LinearLayout)convertView;
                LinearLayout row = (LinearLayout)box.getChildAt(0);
                label = (TextView)row.getChildAt(0);
                icon = (ImageView)row.getChildAt(1);
                divider = box.getChildAt(1);
            } else {
                box = new LinearLayout(activity);
                box.setTag("ios_menu_item");
                box.setOrientation(LinearLayout.VERTICAL);
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(activity, 16), 0, dp(activity, 14), 0);
                label = new TextView(activity);
                label.setTextSize(15.5f);
                label.setGravity(Gravity.CENTER_VERTICAL);
                label.setSingleLine(true);
                row.addView(label, new LinearLayout.LayoutParams(0, dp(activity, 44), 1));
                icon = new ImageView(activity);
                row.addView(icon, new LinearLayout.LayoutParams(dp(activity, 19), dp(activity, 19)));
                box.addView(row, new LinearLayout.LayoutParams(-1, dp(activity, 44)));
                divider = new View(activity);
                LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(-1, Math.max(1, dp(activity, 0.55f)));
                box.addView(divider, divLp);
            }
            Object item = delegate.getItem(position);
            String text = item == null ? "" : item.toString();
            label.setText(text);
            label.setTextColor(ink);
            SfIconDrawable sf = new SfIconDrawable(activity, sfIconForText(text));
            sf.setTint(muted);
            icon.setImageDrawable(sf);
            divider.setBackgroundColor(ThemePalettes.light(card) ? 0x223c3c43 : 0x2e545458);
            divider.setVisibility(position < getCount() - 1 ? View.VISIBLE : View.GONE);
            return box;
        }
    }

    private static final java.util.concurrent.ConcurrentHashMap<String, org.json.JSONObject> RJ_MEM = new java.util.concurrent.ConcurrentHashMap<>();
    private static final java.util.Set<String> RJ_INFLIGHT = java.util.Collections.synchronizedSet(new java.util.HashSet<>());
    private static final java.util.concurrent.ExecutorService RJ_POOL = java.util.concurrent.Executors.newFixedThreadPool(3);
    private static final java.util.regex.Pattern RJ_PATTERN = java.util.regex.Pattern.compile("(?i)(RJ[0-9]{5,10})");

    public static String extractRj(String text) {
        if (text == null || text.isEmpty()) return "";
        java.util.regex.Matcher m = RJ_PATTERN.matcher(text);
        return m.find() ? m.group(1).toUpperCase(java.util.Locale.ROOT) : "";
    }

    public static String stripRj(String rawName) {
        if (rawName == null || rawName.isEmpty()) return "";
        String s = rawName.trim();
        s = s.replaceAll("(?i)^(?:\\[\\s*RJ[0-9]{5,10}\\s*\\]|\u3010\\s*RJ[0-9]{5,10}\\s*\u3011|\\(\\s*RJ[0-9]{5,10}\\s*\\)|RJ[0-9]{5,10})[\\s_\\-\u00b7:：]*", "");
        s = s.replaceAll("(?i)[\\s_\\-\u00b7]*(?:\\[\\s*RJ[0-9]{5,10}\\s*\\]|\u3010\\s*RJ[0-9]{5,10}\\s*\u3011|\\(\\s*RJ[0-9]{5,10}\\s*\\)|RJ[0-9]{5,10})$", "");
        return s.trim();
    }

    public static void copyRj(Context context, String rj) {
        if (context == null || rj == null || rj.isEmpty()) return;
        try {
            android.content.ClipboardManager cm = (android.content.ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) cm.setPrimaryClip(android.content.ClipData.newPlainText("RJ", rj));
            toast(context, "\u5df2\u590d\u5236 " + rj);
        } catch (Throwable ignored) {}
    }

    public static String formatDurationCn(int seconds) {
        int mins = (seconds + 30) / 60;
        if (mins <= 0) return "";
        int h = mins / 60, m = mins % 60;
        return h > 0 ? (m > 0 ? h + "\u5c0f\u65f6" + m + "\u5206" : h + "\u5c0f\u65f6") : (m + "\u5206");
    }

    public static boolean matchesRjQuery(Context context, String rawName, String query) {
        if (query == null || query.isEmpty()) return true;
        String q = query.toLowerCase(java.util.Locale.ROOT);
        if (rawName != null && rawName.toLowerCase(java.util.Locale.ROOT).contains(q)) return true;
        org.json.JSONObject meta = rjMeta(context, rawName, null);
        if (meta == null) return false;
        return meta.optString("title").toLowerCase(java.util.Locale.ROOT).contains(q)
                || meta.optString("cv").toLowerCase(java.util.Locale.ROOT).contains(q)
                || meta.optString("circle").toLowerCase(java.util.Locale.ROOT).contains(q);
    }

    public static org.json.JSONObject rjMeta(Context context, String rawName, Runnable onResolved) {
        final String rj = extractRj(rawName);
        if (rj.isEmpty() || context == null) return null;
        org.json.JSONObject mem = RJ_MEM.get(rj);
        if (mem != null && mem.optInt("v", 0) >= 2) return mem.optString("title").isEmpty() ? null : mem;
        final Context app = context.getApplicationContext();
        android.content.SharedPreferences prefs = app.getSharedPreferences("rj_meta_cache", 0);
        String saved = prefs.getString(rj, "");
        if (!saved.isEmpty()) {
            try {
                org.json.JSONObject parsed = new org.json.JSONObject(saved);
                if (parsed.optInt("v", 0) >= 2 && !parsed.optString("title").isEmpty()) {
                    RJ_MEM.put(rj, parsed);
                    return parsed;
                }
            } catch (Exception ignored) {}
        }
        if (!RJ_INFLIGHT.add(rj)) return null;
        RJ_POOL.execute(() -> {
            try {
                org.json.JSONObject fetched = fetchRjOnline(rj);
                if (fetched != null && !fetched.optString("title").isEmpty()) {
                    RJ_MEM.put(rj, fetched);
                    prefs.edit().putString(rj, fetched.toString()).apply();
                    if (onResolved != null) new android.os.Handler(android.os.Looper.getMainLooper()).post(onResolved);
                }
            } catch (Throwable ignored) {
            } finally {
                RJ_INFLIGHT.remove(rj);
            }
        });
        return null;
    }

    private static String httpGetText(String urlText) {
        java.net.HttpURLConnection conn = null;
        try {
            java.net.URL url = new java.net.URL(urlText);
            conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(6000);
            conn.setReadTimeout(6000);
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            if (conn.getResponseCode() != 200) return "";
            try (java.io.InputStream in = conn.getInputStream();
                 java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream()) {
                byte[] buf = new byte[4096];
                int n;
                while ((n = in.read(buf)) > 0 && out.size() < 262144) out.write(buf, 0, n);
                return out.toString("UTF-8");
            }
        } catch (Throwable ignored) {
            return "";
        } finally {
            if (conn != null) try { conn.disconnect(); } catch (Throwable ignored) {}
        }
    }

    public static void refreshRjMeta(Context context, String rawName, Runnable onResolved) {
        String rj = extractRj(rawName);
        if (rj.isEmpty() || context == null) return;
        RJ_MEM.remove(rj);
        context.getApplicationContext().getSharedPreferences("rj_meta_cache", 0).edit().remove(rj).apply();
        rjMeta(context, rawName, onResolved);
    }

    public static String cachedRjCoverUri(Context context, String rawPathOrName) {
        String rj = extractRj(rawPathOrName);
        if (rj.isEmpty() || context == null) return "";
        java.io.File dir = new java.io.File(context.getCacheDir(), "rj-covers");
        java.io.File file = new java.io.File(dir, rj + ".jpg");
        return file.isFile() && file.length() > 1024 ? android.net.Uri.fromFile(file).toString() : "";
    }

    public static void fetchRjCoverFallback(Context context, String rawPathOrName, java.util.function.Consumer<String> onReady) {
        final String rj = extractRj(rawPathOrName);
        if (rj.isEmpty() || context == null || onReady == null) return;
        final Context app = context.getApplicationContext();
        String existing = cachedRjCoverUri(app, rj);
        if (!existing.isEmpty()) {
            onReady.accept(existing);
            return;
        }
        final String inflightKey = "COVER:" + rj;
        if (!RJ_INFLIGHT.add(inflightKey)) return;
        RJ_POOL.execute(() -> {
            try {
                long numId = Long.parseLong(rj.substring(2));
                java.util.List<String> urls = new java.util.ArrayList<>();
                urls.add("https://api.asmr-200.com/api/cover/" + numId + ".jpg?type=main");
                urls.add("https://api.asmr-200.com/api/cover/" + rj + ".jpg");
                urls.add("https://api.asmr.one/api/cover/" + numId + ".jpg?type=main");
                org.json.JSONObject meta = rjMeta(app, rj, null);
                if (meta != null && !meta.optString("coverUrl").isEmpty()) {
                    urls.add(0, meta.optString("coverUrl"));
                }
                for (String u : urls) {
                    byte[] bytes = httpGetBytes(u);
                    if (bytes != null && bytes.length > 2048) {
                        android.graphics.BitmapFactory.Options bounds = new android.graphics.BitmapFactory.Options();
                        bounds.inJustDecodeBounds = true;
                        android.graphics.BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
                        if (bounds.outWidth > 0 && bounds.outHeight > 0) {
                            java.io.File dir = new java.io.File(app.getCacheDir(), "rj-covers");
                            dir.mkdirs();
                            java.io.File file = new java.io.File(dir, rj + ".jpg");
                            try (java.io.FileOutputStream out = new java.io.FileOutputStream(file)) {
                                out.write(bytes);
                            }
                            final String uri = android.net.Uri.fromFile(file).toString();
                            new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> onReady.accept(uri));
                            return;
                        }
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                RJ_INFLIGHT.remove(inflightKey);
            }
        });
    }

    private static byte[] httpGetBytes(String urlText) {
        java.net.HttpURLConnection conn = null;
        try {
            java.net.URL url = new java.net.URL(urlText);
            conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(6000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            if (conn.getResponseCode() != 200) return null;
            try (java.io.InputStream in = conn.getInputStream();
                 java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream()) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) > 0 && out.size() < 12 * 1024 * 1024) out.write(buf, 0, n);
                return out.toByteArray();
            }
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (conn != null) try { conn.disconnect(); } catch (Throwable ignored) {}
        }
    }

    private static org.json.JSONObject fetchRjOnline(String rj) {
        long numId;
        try { numId = Long.parseLong(rj.substring(2)); } catch (Exception e) { return null; }
        for (String host : new String[]{"https://api.asmr-200.com", "https://api.asmr.one", "https://api.asmr-100.com"}) {
            String body = httpGetText(host + "/api/workInfo/" + numId);
            if (body.isEmpty()) continue;
            try {
                org.json.JSONObject obj = new org.json.JSONObject(body);
                String title = obj.optString("title").trim();
                if (title.isEmpty()) continue;
                StringBuilder cv = new StringBuilder();
                org.json.JSONArray vaNames = new org.json.JSONArray();
                org.json.JSONArray vas = obj.optJSONArray("vas");
                if (vas != null) {
                    for (int i = 0; i < vas.length(); i++) {
                        org.json.JSONObject va = vas.optJSONObject(i);
                        String vn = va != null ? va.optString("name").trim() : "";
                        if (!vn.isEmpty()) {
                            vaNames.put(vn);
                            if (cv.length() > 0) cv.append(" / ");
                            cv.append(vn);
                        }
                    }
                }
                org.json.JSONObject circleObj = obj.optJSONObject("circle");
                String circle = circleObj != null ? circleObj.optString("name").trim() : obj.optString("name").trim();
                int duration = obj.optInt("duration", 0);
                boolean lyric = obj.optBoolean("has_subtitle", false);
                String release = obj.optString("release").trim();
                double rating = obj.optDouble("rate_average_2dp", 0.0);
                int rateCount = obj.optInt("rate_count", 0);
                org.json.JSONArray tagNames = new org.json.JSONArray();
                org.json.JSONArray tags = obj.optJSONArray("tags");
                if (tags != null) {
                    for (int i = 0; i < tags.length(); i++) {
                        org.json.JSONObject t = tags.optJSONObject(i);
                        if (t == null) continue;
                        String tn = "";
                        org.json.JSONObject i18n = t.optJSONObject("i18n");
                        if (i18n != null) {
                            org.json.JSONObject zh = i18n.optJSONObject("zh-cn");
                            if (zh != null) tn = zh.optString("name").trim();
                        }
                        if (tn.isEmpty()) tn = t.optString("name").trim();
                        if (!tn.isEmpty()) tagNames.put(tn);
                    }
                }
                return new org.json.JSONObject()
                        .put("v", 2)
                        .put("title", title)
                        .put("cv", cv.length() > 0 ? "CV: " + cv : "")
                        .put("vas", vaNames)
                        .put("circle", circle)
                        .put("release", release)
                        .put("rating", rating)
                        .put("rateCount", rateCount)
                        .put("tags", tagNames)
                        .put("duration", duration)
                        .put("lyric", lyric);
            } catch (Exception ignored) {}
        }
        String dlBody = httpGetText("https://www.dlsite.com/maniax/api/=/product.json?workno=" + rj);
        if (!dlBody.isEmpty()) {
            try {
                org.json.JSONArray arr = new org.json.JSONArray(dlBody);
                if (arr.length() > 0) {
                    org.json.JSONObject item = arr.getJSONObject(0);
                    String title = item.optString("work_name").trim();
                    if (!title.isEmpty()) {
                        String circle = item.optString("maker_name").trim();
                        StringBuilder cv = new StringBuilder();
                        org.json.JSONArray vaNames = new org.json.JSONArray();
                        org.json.JSONObject creaters = item.optJSONObject("creaters");
                        if (creaters != null) {
                            org.json.JSONArray voices = creaters.optJSONArray("voice_by");
                            if (voices != null) {
                                for (int i = 0; i < voices.length(); i++) {
                                    org.json.JSONObject v = voices.optJSONObject(i);
                                    String vn = v != null ? v.optString("name").trim() : "";
                                    if (!vn.isEmpty()) {
                                        vaNames.put(vn);
                                        if (cv.length() > 0) cv.append(" / ");
                                        cv.append(vn);
                                    }
                                }
                            }
                        }
                        String release = item.optString("regist_date").trim();
                        if (release.length() >= 10) release = release.substring(0, 10);
                        double rating = item.optInt("rate_average_2dp", 0) / 100.0;
                        int rateCount = item.optInt("rate_count", 0);
                        org.json.JSONArray tagNames = new org.json.JSONArray();
                        org.json.JSONArray genres = item.optJSONArray("genres");
                        if (genres != null) {
                            for (int i = 0; i < genres.length(); i++) {
                                org.json.JSONObject g = genres.optJSONObject(i);
                                String gn = g != null ? g.optString("name").trim() : "";
                                if (!gn.isEmpty()) tagNames.put(gn);
                            }
                        }
                        String coverUrl = item.optString("image_main").trim();
                        if (coverUrl.startsWith("//")) coverUrl = "https:" + coverUrl;
                        return new org.json.JSONObject()
                                .put("v", 2)
                                .put("title", title)
                                .put("cv", cv.length() > 0 ? "CV: " + cv : "")
                                .put("vas", vaNames)
                                .put("circle", circle)
                                .put("release", release)
                                .put("rating", rating)
                                .put("rateCount", rateCount)
                                .put("tags", tagNames)
                                .put("coverUrl", coverUrl)
                                .put("duration", 0)
                                .put("lyric", false);
                    }
                }
            } catch (Exception ignored) {}
        }
        return null;
    }

    public static LinearLayout buildAlbumTile(Context context, int cardColor) {
        LinearLayout tile = new LinearLayout(context);
        tile.setTag("rj_album_tile");
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setBackground(iosPressable(context, 0x00000000, 10, 0, 0, 0));
        tile.setPadding(0, 0, 0, dp(context, 8));

        FrameLayout coverBox = new FrameLayout(context);
        GradientDrawable coverClip = new GradientDrawable();
        coverClip.setColor(cardColor);
        coverClip.setCornerRadius(dp(context, 10));
        coverBox.setBackground(coverClip);
        coverBox.setClipToOutline(true);

        ImageView cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        coverBox.addView(cover, new FrameLayout.LayoutParams(-1, -1));

        TextView rjBadge = new TextView(context);
        rjBadge.setTextSize(11f);
        rjBadge.setTypeface(Typeface.DEFAULT_BOLD);
        rjBadge.setTextColor(0xffffffff);
        rjBadge.setPadding(dp(context, 6), dp(context, 2), dp(context, 6), dp(context, 2));
        GradientDrawable rjBg = new GradientDrawable();
        rjBg.setColor(0xd85aa7d4);
        rjBg.setCornerRadius(dp(context, 5));
        rjBadge.setBackground(rjBg);
        FrameLayout.LayoutParams rjLp = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.START);
        rjLp.setMargins(dp(context, 6), 0, dp(context, 6), dp(context, 6));
        coverBox.addView(rjBadge, rjLp);

        TextView durBadge = new TextView(context);
        durBadge.setTextSize(11f);
        durBadge.setTextColor(0xffffffff);
        durBadge.setPadding(dp(context, 6), dp(context, 2), dp(context, 6), dp(context, 2));
        GradientDrawable durBg = new GradientDrawable();
        durBg.setColor(0xcc16181e);
        durBg.setCornerRadius(dp(context, 5));
        durBadge.setBackground(durBg);
        FrameLayout.LayoutParams durLp = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.END);
        durLp.setMargins(dp(context, 6), 0, dp(context, 6), dp(context, 6));
        coverBox.addView(durBadge, durLp);

        tile.addView(coverBox, new LinearLayout.LayoutParams(-1, dp(context, 125)));

        TextView titleView = new TextView(context);
        titleView.setTextSize(14f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setMaxLines(4);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        titleView.setLineSpacing(0f, 1.12f);
        titleView.setPadding(dp(context, 2), dp(context, 7), dp(context, 2), dp(context, 1));
        tile.addView(titleView, new LinearLayout.LayoutParams(-1, -2));

        TextView cvView = new TextView(context);
        cvView.setTextSize(12f);
        cvView.setMaxLines(1);
        cvView.setEllipsize(TextUtils.TruncateAt.END);
        cvView.setPadding(dp(context, 2), dp(context, 2), dp(context, 2), dp(context, 1));
        tile.addView(cvView, new LinearLayout.LayoutParams(-1, -2));

        LinearLayout bottomRow = new LinearLayout(context);
        bottomRow.setOrientation(LinearLayout.HORIZONTAL);
        bottomRow.setGravity(Gravity.CENTER_VERTICAL);
        bottomRow.setPadding(dp(context, 2), dp(context, 3), dp(context, 2), dp(context, 2));

        TextView metaText = new TextView(context);
        metaText.setTextSize(12f);
        metaText.setMaxLines(1);
        metaText.setEllipsize(TextUtils.TruncateAt.END);
        bottomRow.addView(metaText, new LinearLayout.LayoutParams(0, -2, 1f));

        TextView lyricBadge = new TextView(context);
        lyricBadge.setText("\ud83d\udcac \u6b4c\u8bcd");
        lyricBadge.setTextSize(10.5f);
        lyricBadge.setTypeface(Typeface.DEFAULT_BOLD);
        lyricBadge.setPadding(dp(context, 6), dp(context, 2), dp(context, 6), dp(context, 2));
        GradientDrawable lyricBg = new GradientDrawable();
        lyricBg.setColor(0x285aa7d4);
        lyricBg.setCornerRadius(dp(context, 5));
        lyricBadge.setBackground(lyricBg);
        LinearLayout.LayoutParams lyricLp = new LinearLayout.LayoutParams(-2, -2);
        lyricLp.leftMargin = dp(context, 6);
        bottomRow.addView(lyricBadge, lyricLp);

        tile.addView(bottomRow, new LinearLayout.LayoutParams(-1, -2));
        return tile;
    }

    public static ImageView bindAlbumTile(Context context, LinearLayout tile, int coverHeight, String rawName,
            int trackCount, boolean localHasLyric, int cardColor, Runnable onMetaResolved) {
        boolean light = ThemePalettes.light(cardColor);
        int ink = ThemePalettes.text(cardColor);
        int muted = ThemePalettes.secondary(cardColor);

        FrameLayout coverBox = (FrameLayout) tile.getChildAt(0);
        if (coverBox.getBackground() instanceof GradientDrawable) {
            ((GradientDrawable) coverBox.getBackground()).setColor(cardColor);
        }
        coverBox.getLayoutParams().height = coverHeight;
        ImageView cover = (ImageView) coverBox.getChildAt(0);
        TextView rjBadge = (TextView) coverBox.getChildAt(1);
        TextView durBadge = (TextView) coverBox.getChildAt(2);
        TextView titleView = (TextView) tile.getChildAt(1);
        TextView cvView = (TextView) tile.getChildAt(2);
        LinearLayout bottomRow = (LinearLayout) tile.getChildAt(3);
        TextView metaText = (TextView) bottomRow.getChildAt(0);
        TextView lyricBadge = (TextView) bottomRow.getChildAt(1);

        String rj = extractRj(rawName);
        String stripped = stripRj(rawName);
        org.json.JSONObject meta = rjMeta(context, rawName, onMetaResolved);

        if (!rj.isEmpty()) {
            rjBadge.setText(rj);
            rjBadge.setVisibility(View.VISIBLE);
            rjBadge.setOnClickListener(v -> {
                hapticTick(v);
                copyRj(context, rj);
            });
        } else {
            rjBadge.setVisibility(View.GONE);
            rjBadge.setOnClickListener(null);
        }

        String dur = meta != null ? formatDurationCn(meta.optInt("duration", 0)) : "";
        if (!dur.isEmpty()) {
            durBadge.setText(dur);
            durBadge.setVisibility(View.VISIBLE);
        } else if (trackCount > 0) {
            durBadge.setText(trackCount + " \u8f68");
            durBadge.setVisibility(View.VISIBLE);
        } else {
            durBadge.setVisibility(View.GONE);
        }

        String displayTitle;
        if (!stripped.isEmpty()) {
            displayTitle = stripped;
        } else if (meta != null && !meta.optString("title").isEmpty()) {
            displayTitle = meta.optString("title");
        } else {
            displayTitle = rawName;
        }
        titleView.setText(displayTitle);
        titleView.setTextColor(ink);

        String cv = meta != null ? meta.optString("cv") : "";
        if (cv.isEmpty() && meta != null && !meta.optString("circle").isEmpty()) {
            cv = meta.optString("circle");
        }
        if (!cv.isEmpty()) {
            cvView.setText(cv);
            cvView.setTextColor(muted);
            cvView.setVisibility(View.VISIBLE);
        } else {
            cvView.setVisibility(View.GONE);
        }

        String bottomLeft;
        if (!dur.isEmpty() && trackCount > 0) {
            bottomLeft = dur + " \u00b7 " + trackCount + " \u8f68";
        } else if (trackCount > 0) {
            bottomLeft = trackCount + " \u8f68";
        } else if (!dur.isEmpty()) {
            bottomLeft = dur;
        } else if (meta != null && !meta.optString("circle").isEmpty()) {
            bottomLeft = meta.optString("circle");
        } else {
            bottomLeft = rj.isEmpty() ? "\u4f5c\u54c1" : "\u70b9\u51fb\u5c01\u9762\u5de6\u4e0b\u89d2\u53ef\u590d\u5236 RJ";
        }
        metaText.setText(bottomLeft);
        metaText.setTextColor(muted);

        boolean hasLyric = localHasLyric || (meta != null && meta.optBoolean("lyric"));
        lyricBadge.setTextColor(light ? 0xff1e70a8 : 0xff7cc6f2);
        lyricBadge.setVisibility(hasLyric ? View.VISIBLE : View.GONE);
        return cover;
    }

    public static final class WrapLayout extends ViewGroup {
        private final int hGap, vGap;
        public WrapLayout(Context context, int hGapDp, int vGapDp) {
            super(context);
            this.hGap = dp(context, hGapDp);
            this.vGap = dp(context, vGapDp);
        }
        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int maxWidth = MeasureSpec.getSize(widthMeasureSpec);
            if (maxWidth <= 0) maxWidth = getResources().getDisplayMetrics().widthPixels;
            int avail = Math.max(0, maxWidth - getPaddingLeft() - getPaddingRight());
            int x = 0, y = getPaddingTop(), rowH = 0;
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) continue;
                child.measure(MeasureSpec.makeMeasureSpec(avail, MeasureSpec.AT_MOST),
                        MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
                int cw = child.getMeasuredWidth();
                int ch = child.getMeasuredHeight();
                if (x > 0 && x + cw > avail) {
                    x = 0;
                    y += rowH + vGap;
                    rowH = 0;
                }
                x += cw + hGap;
                if (ch > rowH) rowH = ch;
            }
            int totalH = y + rowH + getPaddingBottom();
            setMeasuredDimension(maxWidth, resolveSize(totalH, heightMeasureSpec));
        }
        @Override
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            int avail = Math.max(0, (r - l) - getPaddingLeft() - getPaddingRight());
            int x = getPaddingLeft(), y = getPaddingTop(), rowH = 0;
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == GONE) continue;
                int cw = child.getMeasuredWidth();
                int ch = child.getMeasuredHeight();
                if (x > getPaddingLeft() && x - getPaddingLeft() + cw > avail) {
                    x = getPaddingLeft();
                    y += rowH + vGap;
                    rowH = 0;
                }
                child.layout(x, y, x + cw, y + ch);
                x += cw + hGap;
                if (ch > rowH) rowH = ch;
            }
        }
    }

    static TextView makeChip(Context context, String label, int bgColor, int strokeColor, int textColor, float textSizeSp, int hPadDp, int vPadDp, int radiusDp) {
        TextView tv = new TextView(context);
        tv.setText(label);
        tv.setTextSize(textSizeSp);
        tv.setTextColor(textColor);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        tv.setGravity(Gravity.CENTER);
        tv.setPadding(dp(context, hPadDp), dp(context, vPadDp), dp(context, hPadDp), dp(context, vPadDp));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(context, radiusDp));
        if (strokeColor != 0) bg.setStroke(Math.max(1, dp(context, 0.9f)), strokeColor);
        tv.setBackground(bg);
        return tv;
    }

    public static LinearLayout buildWorkDetailHeader(Context context) {
        LinearLayout root = new LinearLayout(context);
        root.setTag("rj_work_detail_header");
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(context, 4), dp(context, 6), dp(context, 4), dp(context, 6));

        FrameLayout coverBox = new FrameLayout(context);
        GradientDrawable coverClip = new GradientDrawable();
        coverClip.setCornerRadius(dp(context, 14));
        coverBox.setBackground(coverClip);
        coverBox.setClipToOutline(true);
        ImageView cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        coverBox.addView(cover, new FrameLayout.LayoutParams(-1, -1));
        root.addView(coverBox, new LinearLayout.LayoutParams(-1, dp(context, 250)));

        TextView titleView = new TextView(context);
        titleView.setTextSize(18.5f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setLineSpacing(0f, 1.15f);
        titleView.setPadding(dp(context, 2), dp(context, 14), dp(context, 2), dp(context, 8));
        root.addView(titleView, new LinearLayout.LayoutParams(-1, -2));

        WrapLayout actionWrap = new WrapLayout(context, 8, 8);
        actionWrap.setPadding(dp(context, 2), dp(context, 2), dp(context, 2), dp(context, 10));
        root.addView(actionWrap, new LinearLayout.LayoutParams(-1, -2));

        LinearLayout infoList = new LinearLayout(context);
        infoList.setOrientation(LinearLayout.VERTICAL);
        infoList.setPadding(dp(context, 2), dp(context, 2), dp(context, 2), dp(context, 10));
        for (int i = 0; i < 5; i++) {
            TextView line = new TextView(context);
            line.setTextSize(14f);
            line.setPadding(0, dp(context, 3), 0, dp(context, 3));
            infoList.addView(line, new LinearLayout.LayoutParams(-1, -2));
        }
        root.addView(infoList, new LinearLayout.LayoutParams(-1, -2));

        LinearLayout netBox = new LinearLayout(context);
        netBox.setOrientation(LinearLayout.VERTICAL);
        netBox.setPadding(dp(context, 2), dp(context, 6), dp(context, 2), dp(context, 10));

        LinearLayout netHeader = new LinearLayout(context);
        netHeader.setOrientation(LinearLayout.HORIZONTAL);
        netHeader.setGravity(Gravity.CENTER_VERTICAL);
        TextView netTitle = new TextView(context);
        netTitle.setText("\u7f51\u7edc\u53c2\u8003\u4fe1\u606f");
        netTitle.setTextSize(15.5f);
        netTitle.setTypeface(Typeface.DEFAULT_BOLD);
        netHeader.addView(netTitle, new LinearLayout.LayoutParams(0, -2, 1f));
        TextView refreshBtn = new TextView(context);
        refreshBtn.setText("\u21bb \u5237\u65b0");
        refreshBtn.setTextSize(13f);
        refreshBtn.setPadding(dp(context, 10), dp(context, 4), dp(context, 6), dp(context, 4));
        netHeader.addView(refreshBtn, new LinearLayout.LayoutParams(-2, -2));
        netBox.addView(netHeader, new LinearLayout.LayoutParams(-1, -2));

        WrapLayout circleWrap = new WrapLayout(context, 8, 8);
        circleWrap.setPadding(0, dp(context, 8), 0, dp(context, 4));
        netBox.addView(circleWrap, new LinearLayout.LayoutParams(-1, -2));

        WrapLayout cvWrap = new WrapLayout(context, 8, 8);
        cvWrap.setPadding(0, dp(context, 4), 0, dp(context, 4));
        netBox.addView(cvWrap, new LinearLayout.LayoutParams(-1, -2));

        TextView releaseText = new TextView(context);
        releaseText.setTextSize(14f);
        releaseText.setPadding(0, dp(context, 4), 0, dp(context, 2));
        netBox.addView(releaseText, new LinearLayout.LayoutParams(-1, -2));

        TextView ratingText = new TextView(context);
        ratingText.setTextSize(14f);
        ratingText.setPadding(0, dp(context, 2), 0, dp(context, 6));
        netBox.addView(ratingText, new LinearLayout.LayoutParams(-1, -2));

        WrapLayout tagsWrap = new WrapLayout(context, 7, 7);
        tagsWrap.setPadding(0, dp(context, 4), 0, dp(context, 4));
        netBox.addView(tagsWrap, new LinearLayout.LayoutParams(-1, -2));

        root.addView(netBox, new LinearLayout.LayoutParams(-1, -2));

        TextView filesHeader = new TextView(context);
        filesHeader.setText("\u6587\u4ef6");
        filesHeader.setTextSize(16f);
        filesHeader.setTypeface(Typeface.DEFAULT_BOLD);
        filesHeader.setPadding(dp(context, 2), dp(context, 8), dp(context, 2), dp(context, 4));
        root.addView(filesHeader, new LinearLayout.LayoutParams(-1, -2));
        return root;
    }

    public static ImageView bindWorkDetailHeader(Context context, LinearLayout root, String rawName,
            String sourceLabel, String displayPath, int trackCount, boolean localHasLyric,
            boolean isFavorite, int cardColor, Runnable onToggleFavorite, Runnable onUpload,
            Runnable onPlayAll, Runnable onMetaResolved) {
        boolean light = ThemePalettes.light(cardColor);
        int ink = ThemePalettes.text(cardColor);
        int muted = ThemePalettes.secondary(cardColor);
        int chipBg = light ? 0x141c2430 : 0x2458687e;
        int chipStroke = light ? 0x38202731 : 0x4898a8bc;

        FrameLayout coverBox = (FrameLayout) root.getChildAt(0);
        int screenW = context.getResources().getDisplayMetrics().widthPixels - dp(context, 36);
        coverBox.getLayoutParams().height = Math.max(dp(context, 210), Math.round(screenW * 0.75f));
        if (coverBox.getBackground() instanceof GradientDrawable) {
            ((GradientDrawable) coverBox.getBackground()).setColor(cardColor);
        }
        ImageView cover = (ImageView) coverBox.getChildAt(0);
        TextView titleView = (TextView) root.getChildAt(1);
        WrapLayout actionWrap = (WrapLayout) root.getChildAt(2);
        LinearLayout infoList = (LinearLayout) root.getChildAt(3);
        LinearLayout netBox = (LinearLayout) root.getChildAt(4);
        TextView filesHeader = (TextView) root.getChildAt(5);

        String rj = extractRj(rawName);
        if (rj.isEmpty()) rj = extractRj(displayPath);
        String stripped = stripRj(rawName);
        org.json.JSONObject meta = rjMeta(context, !rj.isEmpty() ? rj : rawName, onMetaResolved);

        String displayTitle;
        if (!stripped.isEmpty()) displayTitle = stripped;
        else if (meta != null && !meta.optString("title").isEmpty()) displayTitle = meta.optString("title");
        else displayTitle = rawName;
        titleView.setText(displayTitle);
        titleView.setTextColor(ink);

        actionWrap.removeAllViews();
        if (onToggleFavorite != null) {
            TextView favChip = makeChip(context, isFavorite ? "\u2665 \u5df2\u559c\u6b22" : "\u2661 \u559c\u6b22",
                    isFavorite ? 0x28fa2d48 : chipBg, isFavorite ? RED : chipStroke,
                    isFavorite ? RED : ink, 13f, 14, 7, 8);
            favChip.setOnClickListener(v -> { hapticTick(v); onToggleFavorite.run(); });
            actionWrap.addView(favChip);
        }
        if (onPlayAll != null && trackCount > 0) {
            TextView playChip = makeChip(context, "\u25b6 \u64ad\u653e\u5168\u90e8",
                    chipBg, chipStroke, ink, 13f, 14, 7, 8);
            playChip.setOnClickListener(v -> { hapticTick(v); onPlayAll.run(); });
            actionWrap.addView(playChip);
        }
        if (!rj.isEmpty()) {
            final String rjCode = rj;
            TextView copyChip = makeChip(context, "# \u590d\u5236 " + rjCode,
                    chipBg, chipStroke, ink, 13f, 14, 7, 8);
            copyChip.setOnClickListener(v -> { hapticTick(v); copyRj(context, rjCode); });
            actionWrap.addView(copyChip);
        }
        if (onUpload != null) {
            TextView upChip = makeChip(context, "\u2601 \u4e0a\u4f20\u767e\u5ea6\u7f51\u76d8",
                    chipBg, chipStroke, ink, 13f, 14, 14, 7);
            upChip.setOnClickListener(v -> { hapticTick(v); onUpload.run(); });
            actionWrap.addView(upChip);
        }

        TextView lineSource = (TextView) infoList.getChildAt(0);
        TextView lineCoverSrc = (TextView) infoList.getChildAt(1);
        TextView lineRj = (TextView) infoList.getChildAt(2);
        TextView lineTracks = (TextView) infoList.getChildAt(3);
        TextView linePath = (TextView) infoList.getChildAt(4);

        String[] parts = sourceLabel.split("\\|\\|", 2);
        String actualSource = parts[0];
        String coverOrigin = parts.length > 1 ? parts[1] : "\u81ea\u5df1\u7684\u6587\u4ef6";

        lineSource.setText("\ud83d\udcc1  \u6765\u6e90\uff1a" + actualSource);
        lineSource.setTextColor(muted);

        lineCoverSrc.setText("\ud83d\uddbc  \u5c01\u9762\uff1a" + coverOrigin);
        lineCoverSrc.setTextColor(coverOrigin.contains("\u5b98\u65b9") ? 0xff5aa7d4 : muted);

        if (!rj.isEmpty()) {
            final String rjCode = rj;
            lineRj.setText("#   " + rjCode + "  \uff08\u70b9\u51fb\u590d\u5236\uff09");
            lineRj.setTextColor(ink);
            lineRj.setVisibility(View.VISIBLE);
            lineRj.setOnClickListener(v -> { hapticTick(v); copyRj(context, rjCode); });
        } else {
            lineRj.setVisibility(View.GONE);
        }

        String dur = meta != null ? formatDurationCn(meta.optInt("duration", 0)) : "";
        boolean hasLyric = localHasLyric || (meta != null && meta.optBoolean("lyric"));
        StringBuilder trackSummary = new StringBuilder("\u266a  ");
        if (trackCount > 0) trackSummary.append(trackCount).append(" \u4e2a\u97f3\u8f68");
        else trackSummary.append("\u4f5c\u54c1\u76ee\u5f55");
        if (!dur.isEmpty()) trackSummary.append(" \u00b7 ").append(dur);
        if (hasLyric) trackSummary.append(" \u00b7 \u542b\u6b4c\u8bcd");
        lineTracks.setText(trackSummary.toString());
        lineTracks.setTextColor(ink);

        linePath.setText("\ud83d\udcc2  " + displayPath);
        linePath.setTextColor(muted);

        if (!rj.isEmpty()) {
            netBox.setVisibility(View.VISIBLE);
            LinearLayout netHeader = (LinearLayout) netBox.getChildAt(0);
            ((TextView) netHeader.getChildAt(0)).setTextColor(muted);
            TextView refreshBtn = (TextView) netHeader.getChildAt(1);
            refreshBtn.setTextColor(RED);
            final String refreshTarget = rj;
            refreshBtn.setOnClickListener(v -> {
                hapticTick(v);
                toast(context, "\u6b63\u5728\u5237\u65b0 " + refreshTarget + " \u4fe1\u606f\u2026");
                refreshRjMeta(context, refreshTarget, onMetaResolved);
            });

            WrapLayout circleWrap = (WrapLayout) netBox.getChildAt(1);
            WrapLayout cvWrap = (WrapLayout) netBox.getChildAt(2);
            TextView releaseText = (TextView) netBox.getChildAt(3);
            TextView ratingText = (TextView) netBox.getChildAt(4);
            WrapLayout tagsWrap = (WrapLayout) netBox.getChildAt(5);

            circleWrap.removeAllViews();
            cvWrap.removeAllViews();
            tagsWrap.removeAllViews();

            String circle = meta != null ? meta.optString("circle") : "";
            if (!circle.isEmpty()) {
                circleWrap.setVisibility(View.VISIBLE);
                circleWrap.addView(makeChip(context, "\u793e\u56e2: " + circle, chipBg, chipStroke, ink, 13f, 12, 6, 8));
            } else {
                circleWrap.setVisibility(View.GONE);
            }

            org.json.JSONArray vas = meta != null ? meta.optJSONArray("vas") : null;
            if (vas != null && vas.length() > 0) {
                cvWrap.setVisibility(View.VISIBLE);
                for (int i = 0; i < vas.length(); i++) {
                    String vn = vas.optString(i);
                    if (!vn.isEmpty()) {
                        cvWrap.addView(makeChip(context, "CV: " + vn, chipBg, chipStroke, ink, 13f, 12, 6, 8));
                    }
                }
            } else if (meta != null && !meta.optString("cv").isEmpty()) {
                cvWrap.setVisibility(View.VISIBLE);
                cvWrap.addView(makeChip(context, meta.optString("cv"), chipBg, chipStroke, ink, 13f, 12, 6, 8));
            } else {
                cvWrap.setVisibility(View.GONE);
            }

            String release = meta != null ? meta.optString("release") : "";
            if (!release.isEmpty()) {
                releaseText.setText("\u53d1\u884c\uff1a" + release);
                releaseText.setTextColor(muted);
                releaseText.setVisibility(View.VISIBLE);
            } else {
                releaseText.setVisibility(View.GONE);
            }

            double rating = meta != null ? meta.optDouble("rating", 0.0) : 0.0;
            int rateCount = meta != null ? meta.optInt("rateCount", 0) : 0;
            if (rating > 0) {
                ratingText.setText(String.format(java.util.Locale.ROOT, "\u8bc4\u5206\uff1a\u2605 %.1f (%d \u8bc4\u4ef7)", rating, rateCount));
                ratingText.setTextColor(muted);
                ratingText.setVisibility(View.VISIBLE);
            } else {
                ratingText.setVisibility(View.GONE);
            }

            org.json.JSONArray tags = meta != null ? meta.optJSONArray("tags") : null;
            if (tags != null && tags.length() > 0) {
                tagsWrap.setVisibility(View.VISIBLE);
                for (int i = 0; i < tags.length(); i++) {
                    String tn = tags.optString(i);
                    if (!tn.isEmpty()) {
                        tagsWrap.addView(makeChip(context, tn, 0x00000000, chipStroke, ink, 12.5f, 11, 5, 8));
                    }
                }
            } else if (meta == null) {
                tagsWrap.setVisibility(View.VISIBLE);
                tagsWrap.addView(makeChip(context, "\u6b63\u5728\u83b7\u53d6\u4f5c\u54c1\u8be6\u60c5\u2026", 0x00000000, chipStroke, muted, 12.5f, 11, 5, 8));
            } else {
                tagsWrap.setVisibility(View.GONE);
            }
        } else {
            netBox.setVisibility(View.GONE);
        }

        filesHeader.setTextColor(ink);
        return cover;
    }

    private static final class Api31 {
        private final android.graphics.RenderNode node = new android.graphics.RenderNode("KikoeruGlass");
        private int lastRadius;
        void draw(Canvas canvas, View source, View host, int width, int height, int radius) {
            node.setPosition(0, 0, width, height);
            if (lastRadius != radius) {
                node.setRenderEffect(android.graphics.RenderEffect.createBlurEffect(
                        radius, radius, android.graphics.Shader.TileMode.CLAMP));
                lastRadius = radius;
            }
            android.graphics.RecordingCanvas recording = node.beginRecording(width, height);
            try {
                int page = ThemePalettes.color(ThemePalettes.selected(host.getContext()), 1);
                recording.drawColor(page);
                int[] under = new int[2], above = new int[2];
                source.getLocationOnScreen(under); host.getLocationOnScreen(above);
                recording.translate(under[0] - above[0], under[1] - above[1]);
                source.draw(recording);
            } finally { node.endRecording(); }
            canvas.drawRenderNode(node);
        }
    }
}
