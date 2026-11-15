package android.animation;

import java.util.*;

public class ValueAnimator {
    public interface AnimatorUpdateListener { void onAnimationUpdate(ValueAnimator value); }
    public static boolean enabled=true;
    public static int allocations;
    private static final List<ValueAnimator> running=new ArrayList<>();
    private final List<AnimatorUpdateListener> listeners=new ArrayList<>();
    private float value;
    public static boolean areAnimatorsEnabled() { return enabled; }
    public static ValueAnimator ofFloat(float... values) { allocations++; return new ValueAnimator(); }
    public ValueAnimator setDuration(long duration) { return this; }
    public void setInterpolator(TimeInterpolator interpolator) {}
    public Object getAnimatedValue() { return value; }
    public void addUpdateListener(AnimatorUpdateListener listener) { listeners.add(listener); }
    public void start() { running.add(this); }
    public void cancel() { running.remove(this); }
    public static int pending() { return running.size(); }
    public static void advance(float fraction) {
        for(ValueAnimator animator:new ArrayList<>(running)) {
            animator.value=fraction;
            for(AnimatorUpdateListener listener:animator.listeners) listener.onAnimationUpdate(animator);
            if(fraction>=1) running.remove(animator);
        }
    }
    public static void reset() { running.clear(); allocations=0; enabled=true; }
}
