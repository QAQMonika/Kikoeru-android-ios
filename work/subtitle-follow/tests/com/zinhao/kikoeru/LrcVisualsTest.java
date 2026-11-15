package com.zinhao.kikoeru;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.RenderEffect;
import android.os.Build;
import android.os.Handler;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.widget.*;
import androidx.recyclerview.widget.RecyclerView;
import java.nio.file.Files;

public final class LrcVisualsTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static boolean close(float a,float b) { return Math.abs(a-b)<1.1f; }
    private static void draw(RecyclerView view) {
        for(int i=0;i<4;i++) { if(view.layoutRequested) view.completeLayout(); view.observer.draw(); }
    }
    private static final class Fixture {
        final Context context;
        final RecyclerView view=new RecyclerView();
        final ViewGroup[] rows=new ViewGroup[9];
        final TextView[] words=new TextView[9];
        final ImageView[] cues=new ImageView[9];
        final LrcVisuals visuals;
        Fixture(boolean blur,boolean motion,boolean accessibility) throws Exception {
            ValueAnimator.reset(); Build.VERSION.SDK_INT=34; RenderEffect.fail=false; RenderEffect.creations=0;
            context=new Context(Files.createTempDirectory("kiko-visuals-").toFile()); view.context=context;
            context.getSharedPreferences("playback_options",0).edit().putBoolean("subtitle_blur",blur).putBoolean("subtitle_motion",motion).apply();
            if(accessibility) { AccessibilityManager manager=new AccessibilityManager(); manager.exploration=true; context.accessibility=manager; }
            for(int i=0;i<rows.length;i++) {
                rows[i]=new ViewGroup(); rows[i].adapterPosition=i+8; rows[i].height=56; rows[i].top=i*56;
                words[i]=new TextView(); words[i].id=3; words[i].context=context;
                cues[i]=new ImageView(); rows[i].addView(words[i]); rows[i].addView(cues[i]); view.addView(rows[i]);
            }
            bind(10); visuals=new LrcVisuals(view); visuals.snap(10); draw();
        }
        void bind(int current) { for(int i=0;i<rows.length;i++) LrcVisuals.bind(words[i],cues[i],rows[i].adapterPosition==current); }
        void draw() {
            for(int i=0;i<4;i++) {
                if(view.layoutRequested) view.completeLayout();
                view.observer.draw();
            }
        }
        void move(int current) {
            visuals.focus(current,true); bind(current);
            check(visuals.scrollTo(current,false),"Modern follow uses the centered route"); draw();
        }
        void ordered() {
            float bottom=Float.NEGATIVE_INFINITY;
            for(ViewGroup row:rows) if(row.parent==view) {
                float top=row.top+row.translationY;
                check(top+.01f>=bottom,"Full subtitle rows cannot overlap during staggering"); bottom=top+row.height;
            }
        }
        float center(int row) { return rows[row].top+rows[row].translationY+rows[row].height/2f; }
        void dispose() { visuals.dispose(); }
    }
    public static void main(String[] args) throws Exception {
        for(int current:new int[]{-1,0,4,199,Integer.MAX_VALUE}) for(int row:new int[]{0,1,3,10,199}) {
            int distance=LrcVisuals.distance(row,current); check(distance>=0 && distance<=4,"Distance is bounded including extreme indices");
        }
        for(int d=0;d<=4;d++) {
            check(LrcVisuals.remaining(0,d)==1 && LrcVisuals.remaining(1,d)==0,"Every stagger settles within 640ms");
            float last=1;
            for(int frame=0;frame<=20;frame++) {
                float next=LrcVisuals.remaining(frame/20f,d); check(next<=last && next>=0,"No overshoot or reverse movement"); last=next;
            }
            if(d>0) check(LrcVisuals.radius(d)>LrcVisuals.radius(d-1) && LrcVisuals.opacity(d,false,true)<LrcVisuals.opacity(d-1,false,true),"Blur and contrast have progressive depth");
        }
        check(LrcVisuals.radius(4)>=4,"Distant blur is stronger than the old 2.3dp ceiling");
        check(LrcVisuals.remaining(.3f,4)>LrcVisuals.remaining(.3f,0),"Later rows lag in the direction of movement");
        Fixture f=new Fixture(true,true,false);
        check(close(f.center(2),200),"Entry centers the current sentence instead of pinning it to the top");
        for(int i=0;i<9;i++) {
            check(f.words[i].size==20,"Focused and surrounding sentences have the same font size");
            check(f.words[i].paint.bold==(i==2),"Only the current sentence is bold");
            check(f.cues[i].visibility==View.GONE,"Modern layout removes per-line triangle clutter");
            check(f.words[i].shadow==0 && !f.words[i].includeFontPadding,"Modern text has no heavy shadow or extra font inset");
            check(f.words[i].paddingTop==12 && f.words[i].minHeight>=48,"Line spacing and click targets stay stable");
        }
        check(f.words[2].effect==null && f.words[2].alpha==1,"Current sentence remains sharp and opaque");
        check(f.words[3].effect!=null && f.words[5].effect.radius>f.words[3].effect.radius,"Nearby/distant rows have distinct blur strengths");
        int allocated=RenderEffect.creations; f.draw(); f.draw(); check(RenderEffect.creations==allocated,"Steady frames reuse blur effects");
        int jumps=f.view.layout.directCalls; float origin=f.center(3);
        f.move(11); check(f.view.layout.directCalls==jumps && close(f.center(3),origin),"Adjacent changes do not teleport the list before animating");
        float last=origin;
        for(int frame=0;frame<=20;frame++) {
            ValueAnimator.advance(frame/20f); f.draw(); f.ordered();
            float center=f.center(3); check(center<=last+1 && center>=199,"Current sentence travels continuously toward center"); last=center;
        }
        check(close(f.center(3),200) && ValueAnimator.pending()==0,"Motion settles centered and releases callbacks");
        for(ViewGroup row:f.rows) check(row.translationY==0,"No translated rows remain after settling");
        check(f.view.scrollByCalls>10,"Scrolling advances the real RecyclerView across frames");
        f.move(12); ValueAnimator.advance(.2f); f.draw(); f.ordered();
        check(f.rows[2].translationY!=f.rows[4].translationY,"Rows retain a subtle stagger rather than rigid movement");
        float touched=f.center(4); f.visuals.browsing(true); f.draw();
        check(ValueAnimator.pending()==0 && close(f.center(4),touched),"Touch-down freezes the actual visual touch target");
        check(f.words[3].effect!=null,"A short tap does not flash every line sharp");
        f.visuals.drag(); f.draw();
        check(f.words[3].effect==null && f.words[3].alpha>=.6f,"Dragging makes visible surrounding text readable");
        check(!f.visuals.scrollTo(10,true),"Manual browsing suppresses automatic centering");
        f.visuals.browsing(false); f.move(9);
        for(float frame:new float[]{.1f,.25f,.5f,.75f,1}) { ValueAnimator.advance(frame); f.draw(); f.ordered(); }
        check(close(f.center(1),200),"Backward jumps also settle on the center anchor");
        f.move(11); ValueAnimator.advance(.2f); f.draw(); f.move(10);
        check(ValueAnimator.pending()==1,"Rapid reversed selections replace the previous animation");
        ValueAnimator.advance(1); f.draw(); check(close(f.center(2),200),"Rapid opposite jumps finish on the latest sentence");
        f.visuals.snap(8); f.draw(); check(close(f.center(0),200),"First sentence can center using real list padding");
        f.visuals.snap(16); f.draw(); check(close(f.center(8),200),"Last sentence can center without a top-edge clamp");
        f.rows[4].height=500; f.visuals.snap(12); f.draw(); check(close(f.rows[4].top,12),"Over-height sentences start below the top edge instead of losing their first line");
        f.rows[4].height=56; f.visuals.snap(10); f.draw();
        f.visuals.focus(44,true); f.visuals.scrollTo(44,true); f.draw();
        check(f.view.layout.target==44,"Far jumps first materialize a target neighborhood");
        for(int i=0;i<9;i++) { f.view.detach(f.rows[i]); f.rows[i].adapterPosition=i+40; f.rows[i].top=f.view.paddingTop+f.view.layout.offset+(i-4)*56; f.view.addView(f.rows[i]); }
        f.bind(44); f.draw(); ValueAnimator.advance(1); f.draw();
        check(close(f.center(4),200),"Measured far-jump rows receive an exact final center");
        f.visuals.focus(45,true); f.visuals.scrollTo(45,true); f.draw(); ValueAnimator.advance(.3f); f.view.detach(f.rows[5]);
        check(f.words[5].effect==null && f.rows[5].translationY==0,"Recycled rows retain neither blur nor translations");
        f.visuals.active(false);
        check(ValueAnimator.pending()==0 && f.view.observer.listeners.isEmpty(),"Hidden pages release motion and pre-draw callbacks");
        check(f.view.paddingTop==0 && f.view.clipToPadding,"Hidden pages restore the original viewport insets");
        f.context.getSharedPreferences("playback_options",0).edit().putBoolean("subtitle_blur",false).putBoolean("subtitle_motion",false).apply();
        f.visuals.active(true); f.bind(44); f.draw();
        check(!f.visuals.scrollTo(44,true) && f.words[4].size==36 && f.words[0].size==15,"Both switches off restore the original typography and scrolling route");
        check(f.cues[0].visibility==View.VISIBLE && f.cues[4].visibility==View.GONE,"Legacy triangles are restored when effects are disabled");
        f.dispose(); f.dispose(); check(f.view.childListeners.isEmpty() && f.view.scrollListeners.isEmpty() && f.view.observer.listeners.isEmpty(),"Disposal removes every callback exactly once");
        f=new Fixture(false,true,false); check(f.words[3].effect==null && f.words[3].size==20,"Motion without blur keeps modern typography"); f.move(11); f.dispose();
        f=new Fixture(true,false,false); f.move(11); check(ValueAnimator.pending()==0 && close(f.center(3),200),"Motion-off retains blur and centers without animation"); f.dispose();
        f=new Fixture(true,true,true); f.move(11); check(ValueAnimator.pending()==0 && f.words[3].effect==null && close(f.center(3),200),"Touch exploration stays sharp and uses unanimated centering"); f.dispose();
        f=new Fixture(true,true,false); ValueAnimator.enabled=false; f.move(11); check(ValueAnimator.pending()==0 && close(f.center(3),200),"System animation-off is respected"); f.dispose();
        f=new Fixture(true,true,false); Build.VERSION.SDK_INT=29;
        f.visuals.active(false); for(TextView word:f.words) word.effect=null; f.visuals.active(true); f.draw();
        for(TextView word:f.words) check(word.effect==null,"API 29 never calls hardware blur"); f.dispose(); Build.VERSION.SDK_INT=34;
        f=new Fixture(true,true,false); f.visuals.browsing(true); f.visuals.drag(); f.draw(); RenderEffect.fail=true;
        f.visuals.browsing(false); f.visuals.focus(12,false); f.draw(); f.draw();
        for(TextView word:f.words) check(word.effect==null,"Failed hardware effects clear safely"); f.dispose(); RenderEffect.fail=false;
        Handler.reset(); ValueAnimator.reset();
        AudioPlayerActivity activity=new AudioPlayerActivity(); RecyclerView view=new RecyclerView();
        view.context=new Context(Files.createTempDirectory("kiko-centered-follow-").toFile());
        LrcAutoFollow follow=new LrcAutoFollow(activity,view); follow.alignCurrent(); Handler.advance(16); draw(view);
        check(view.layout.target==10,"Centered presentation preserves layout-safe entry alignment");
        view.touch(MotionEvent.ACTION_DOWN); view.setState(RecyclerView.SCROLL_STATE_DRAGGING); view.touch(MotionEvent.ACTION_UP); view.setState(RecyclerView.SCROLL_STATE_IDLE);
        Handler.advance(2499); check(view.layout.target==10,"Manual browsing retains the 2.5-second idle window");
        activity.index=18; Handler.advance(1); draw(view); check(view.layout.target==18,"Idle return uses the latest subtitle");
        activity.playing=false; follow.resumeAt(25); draw(view); check(view.layout.target==25 && Handler.pending()==0,"Paused subtitle clicks center immediately without an audio timer");
        activity.index=30; follow.follow(); draw(view); check(view.layout.target==30,"A paused seek change also follows its new current sentence");
        follow.dispose(); check(view.childListeners.isEmpty() && view.observer.listeners.isEmpty() && Handler.pending()==0,"Follow disposal owns every visual callback");
        System.out.println("PASS: "+checks+" centered lyric typography, scrolling and lifecycle checks");
    }
}
