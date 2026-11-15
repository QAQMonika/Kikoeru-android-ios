package com.zinhao.kikoeru;

import android.os.Handler;
import android.view.MotionEvent;
import androidx.recyclerview.widget.RecyclerView;

public final class LrcAutoFollowTest {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) { throw new AssertionError(message); }
    }
    private static final class Fixture {
        final AudioPlayerActivity activity = new AudioPlayerActivity();
        final RecyclerView view = new RecyclerView();
        final LrcAutoFollow follow;
        Fixture() {
            Handler.reset(); android.animation.ValueAnimator.enabled=false;
            view.context.getSharedPreferences("playback_options",0).edit().putBoolean("subtitle_blur",false).putBoolean("subtitle_motion",false).apply();
            follow=new LrcAutoFollow(activity,view);
        }
        void browse() {
            view.touch(MotionEvent.ACTION_DOWN);
            view.setState(RecyclerView.SCROLL_STATE_DRAGGING);
            view.touch(MotionEvent.ACTION_UP);
            view.setState(RecyclerView.SCROLL_STATE_IDLE);
        }
    }
    public static void main(String[] args) {
        Fixture f = new Fixture();
        f.browse();
        f.follow.follow();
        Handler.advance(2499);
        check(f.view.layout.target == -1, "Must not return before 2.5 idle seconds");
        f.activity.index = 14;
        Handler.advance(1);
        check(f.view.layout.target == 14 && f.view.layout.smoothCalls == 1,
                "Timer must return to the latest subtitle without a row-change event");
        f.view.setState(RecyclerView.SCROLL_STATE_SETTLING);
        f.view.setState(RecyclerView.SCROLL_STATE_IDLE);
        f.activity.index = 15;
        f.follow.follow();
        check(f.view.layout.target == 15, "Normal following must resume after return");
        check(Handler.pending() == 0, "Programmatic scrolling must not start a browsing timer");

        f = new Fixture();
        f.browse();
        Handler.advance(1000);
        f.view.touch(MotionEvent.ACTION_DOWN);
        Handler.advance(6000);
        check(f.view.layout.target == -1, "Holding a finger must suppress automatic scrolling");
        f.view.touch(MotionEvent.ACTION_UP);
        Handler.advance(2499);
        check(f.view.layout.target == -1, "Another touch must restart the full delay");
        Handler.advance(1);
        check(f.view.layout.target == 10, "Touch release must arm a new idle timer");

        f = new Fixture();
        f.view.touch(MotionEvent.ACTION_DOWN);
        f.view.setState(RecyclerView.SCROLL_STATE_DRAGGING);
        f.view.touch(MotionEvent.ACTION_UP);
        f.view.setState(RecyclerView.SCROLL_STATE_SETTLING);
        Handler.advance(7000);
        check(f.view.layout.target == -1, "Inertial scrolling must not count as idle");
        f.view.setState(RecyclerView.SCROLL_STATE_IDLE);
        Handler.advance(2499);
        check(f.view.layout.target == -1, "Delay must begin after inertia finishes");
        Handler.advance(1);
        check(f.view.layout.target == 10, "2.5 seconds after inertia must return");

        f = new Fixture();
        f.activity.playing = false;
        f.browse();
        Handler.advance(11000);
        check(f.view.layout.target == -1, "Paused playback must preserve browsing position");
        f.activity.index = 20;
        f.activity.playing = true;
        Handler.advance(250);
        check(f.view.layout.target == 20, "Restarted playback must recover current position");

        f = new Fixture();
        f.activity.playing = false;
        f.browse();
        Handler.advance(1000);
        f.follow.resumeAt(35);
        check(f.view.layout.target == 35, "Clicking a row must return immediately even when paused");
        check(Handler.pending() == 0, "Row clicks must cancel the old timer");
        f.view.setState(RecyclerView.SCROLL_STATE_SETTLING);
        f.view.setState(RecyclerView.SCROLL_STATE_IDLE);
        f.activity.playing = true;
        f.activity.index = 36;
        f.follow.follow();
        check(f.view.layout.target == 36, "Following must resume after row-click seek");

        f = new Fixture();
        f.browse();
        f.follow.setActive(false);
        Handler.advance(9000);
        check(f.view.layout.target == -1 && Handler.pending() == 0,
                "Hidden pages must cancel callbacks");
        f.follow.setActive(true);
        Handler.advance(2499);
        check(f.view.layout.target == -1, "Returning to a page must give a new delay");
        Handler.advance(1);
        check(f.view.layout.target == 10, "Visible page must resume following");

        f = new Fixture();
        f.browse();
        f.follow.dispose();
        Handler.advance(9000);
        check(f.view.layout.target == -1 && Handler.pending() == 0
                && f.view.scrollListeners.isEmpty() && f.view.touchListeners.isEmpty(),
                "Disposal must remove timers and listeners");

        f = new Fixture();
        f.activity.index = -1;
        f.browse();
        Handler.advance(2500);
        check(f.view.layout.target == -1, "Missing subtitles must not scroll to invalid indices");
        f.activity.index = 199;
        Handler.advance(250);
        check(f.view.layout.target == 199, "Last valid subtitle must be supported");
        f.view.setState(RecyclerView.SCROLL_STATE_SETTLING);
        f.view.setState(RecyclerView.SCROLL_STATE_IDLE);
        f.activity.index = 200;
        f.follow.follow();
        check(f.view.layout.target == 199, "Out-of-range indices must be ignored");

        f = new Fixture();
        f.view.laidOut = false; f.view.height = 0;
        f.follow.alignCurrent();
        Handler.advance(16);
        check(f.view.layout.target == -1 && f.view.layout.smoothCalls == 0,
                "Reopening must not start a smooth scroller on a zero-height list");
        check(Handler.pending() == 0,"Unlaid-out views wait for layout, not a polling loop");
        f.activity.index = 46; f.view.height = 400; f.view.completeLayout();
        Handler.advance(16);
        check(f.view.layout.target == 46 && f.view.layout.directCalls == 1,
                "Initial layout snaps to the latest row without a row-change callback");
        f.activity.index = 47; f.follow.follow();
        check(f.view.layout.target == 47,"Initial alignment cannot latch returning and block normal following");

        f = new Fixture();
        f.activity.playing = false; f.follow.setActive(false); f.follow.alignCurrent();
        Handler.advance(1000);
        check(f.view.layout.target == -1 && Handler.pending() == 0,"Setup before onStart waits while inactive");
        f.activity.index = 62; f.follow.setActive(true); Handler.advance(16);
        check(f.view.layout.target == 62,"onStart restores a paused current subtitle without a playback event");

        f = new Fixture();
        f.follow.setActive(false); f.activity.index = 88; f.follow.setActive(true);
        Handler.advance(16);
        check(f.view.layout.target == 88,"Existing page re-entry aligns even within a long subtitle");

        f = new Fixture();
        f.view.layoutRequested = true; f.follow.alignCurrent(); Handler.advance(16);
        check(f.view.layout.target == -1,"Alignment waits for adapter/restored-state layout");
        f.activity.index = 70; f.view.completeLayout(); Handler.advance(16);
        check(f.view.layout.target == 70,"Alignment after pending layout uses the current, not captured, row");

        f = new Fixture();
        f.view.computingLayout = true; f.follow.alignCurrent(); Handler.advance(16);
        check(f.view.layout.target == -1,"No adapter/scroll work during RecyclerView layout");
        f.view.computingLayout = false; Handler.advance(16);
        check(f.view.layout.target == 10,"Alignment retries after layout computation ends");

        f = new Fixture();
        f.follow.alignCurrent(); f.view.touch(MotionEvent.ACTION_DOWN); Handler.advance(500);
        check(f.view.layout.target == -1,"A user's touch cancels a queued entry snap");
        f.view.touch(MotionEvent.ACTION_UP); Handler.advance(2499);
        check(f.view.layout.target == -1,"Entry alignment cannot shorten 2.5-second manual browsing");
        Handler.advance(1);
        check(f.view.layout.target == 10,"Manual browsing returns after 2.5 idle seconds");

        f = new Fixture();
        f.follow.alignCurrent(); f.follow.setActive(false); Handler.advance(1000);
        check(f.view.layout.target == -1 && Handler.pending() == 0,"Stop cancels queued entry work");
        f.activity.index = 30; f.follow.setActive(true); Handler.advance(16);
        check(f.view.layout.target == 30,"Start after cancelled entry work refreshes current row");

        f = new Fixture();
        f.follow.alignCurrent(); f.follow.dispose(); f.view.completeLayout(); Handler.advance(1000);
        check(f.view.layout.target == -1 && Handler.pending() == 0 && f.view.layoutListeners.isEmpty(),
                "Disposed old page cannot reposition a newly opened page");

        f = new Fixture();
        f.activity.index = -1; f.view.count = 0; f.follow.alignCurrent(); Handler.advance(16);
        check(f.view.layout.target == -1 && Handler.pending() == 0,"Empty/late subtitles do not cause repeated polling");
        f.activity.index = 8; f.view.count = 20; f.view.completeLayout(); Handler.advance(16);
        check(f.view.layout.target == 8,"Late subtitle rows align once the list is ready");

        f = new Fixture();
        f.follow.resumeAt(15); f.view.layout.smooth = false; f.activity.index = 16; f.follow.follow();
        check(f.view.layout.target == 16,"Aborted smooth scrolling without a state callback cannot latch returning");

        f = new Fixture();
        f.follow.alignCurrent(); f.follow.resumeAt(35); Handler.advance(100);
        check(f.view.layout.target == 35 && Handler.pending() == 0,"Row-click seek cancels stale entry alignment");
        System.out.println("PASS: " + checks + " checks against production helper bytecode");
    }
}
