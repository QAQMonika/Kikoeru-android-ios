package android.os;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public final class Handler {
    private static final List<Task> tasks = new ArrayList<>();
    private static final class Task {
        final Runnable runnable;
        final long due;
        Task(Runnable runnable, long due) { this.runnable = runnable; this.due = due; }
    }
    public Handler(Looper looper) {}
    public boolean postDelayed(Runnable runnable, long delay) {
        tasks.add(new Task(runnable, SystemClock.now + delay));
        return true;
    }
    public void removeCallbacks(Runnable runnable) { tasks.removeIf(t -> t.runnable == runnable); }
    public static void reset() { tasks.clear(); SystemClock.now = 0; }
    public static int pending() { return tasks.size(); }
    public static void advance(long milliseconds) {
        long end = SystemClock.now + milliseconds;
        while (true) {
            Task task = tasks.stream().min(Comparator.comparingLong(t -> t.due)).orElse(null);
            if (task == null || task.due > end) { break; }
            tasks.remove(task);
            SystemClock.now = task.due;
            task.runnable.run();
        }
        SystemClock.now = end;
    }
}
