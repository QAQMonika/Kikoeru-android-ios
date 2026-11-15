package com.zinhao.kikoeru;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.util.Log;
import com.google.android.exoplayer2.Player;
import com.koushikdutta.async.http.AsyncHttpClient;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

/** Service-level checkpoints also cover notification controls and screen-off playback. */
public final class PlaybackPosition implements Player.Listener, Runnable {
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static PlaybackPosition active;
    private final Context context;
    private final AudioService.CtrlBinder binder;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private long savedAt = -5000;
    private String lastPayload;
    private boolean disposed;
    private boolean ready;
    private volatile boolean writeFailed;

    private PlaybackPosition(Context context, AudioService.CtrlBinder binder) {
        this.context = context.getApplicationContext();
        this.binder = binder;
        binder.getExoPlayer().addListener(this);
        handler.postDelayed(this, 1000);
    }

    public static void attach(Context context, AudioService.CtrlBinder binder) {
        if (active != null) active.dispose();
        active = new PlaybackPosition(context, binder);
    }

    public static void beforePlay(AudioService.CtrlBinder binder) {
        if (active != null && active.binder == binder) {
            active.checkpoint(true);
            active.ready = false;
        }
    }
    public static long startPosition(AudioService.CtrlBinder binder,List<JSONObject> queue,int index) {
        if(active==null || active.binder!=binder || queue==null || index<0 || index>=queue.size()) return 0;
        return TrackResume.position(active.context,queue.get(index));
    }

    public static void flush() {
        if (active != null) active.checkpoint(true);
    }

    public static void detach(AudioService.CtrlBinder binder) {
        if (active != null && active.binder == binder) {
            active.checkpoint(true);
            active.dispose();
            active = null;
        }
    }

    private void dispose() {
        disposed = true;
        handler.removeCallbacks(this);
        binder.getExoPlayer().removeListener(this);
    }

    @Override public void run() {
        if (disposed) return;
        checkpoint(false);
        handler.postDelayed(this, 1000);
    }

    @Override public void onEvents(Player player, Player.Events events) {
        checkpoint(!player.isPlaying());
    }

    @Override public void onPositionDiscontinuity(Player.PositionInfo oldPosition,
            Player.PositionInfo newPosition, int reason) {
        // Save the new index and position together, never the binder's stale initial index.
        checkpoint(true);
    }

    private void checkpoint(boolean force) {
        try {
            Player player = binder.getExoPlayer();
            int state = player.getPlaybackState();
            if (state == Player.STATE_READY || state == Player.STATE_ENDED) ready = true;
            if (!ready || state == Player.STATE_IDLE) return;
            if(player.isPlaying()) LocalHistory.notePlaying(binder.getPlaybackQueue(),player.getCurrentMediaItemIndex());
            if (writeFailed) {
                writeFailed = false;
                lastPayload = null;
                force = true;
            }
            long now = SystemClock.elapsedRealtime();
            if (!force && now - savedAt < 5000) return;
            String payload = payload(binder.getPlaybackQueue(), player.getCurrentMediaItemIndex(),
                    player.getCurrentPosition());
            if (payload == null || payload.equals(lastPayload)) return;
            lastPayload = payload;
            savedAt = now;
            List<JSONObject> queue=binder.getPlaybackQueue(); int index=player.getCurrentMediaItemIndex();
            TrackResume.remember(context,queue.get(index),player.getCurrentPosition(),player.getDuration());
            write(payload,player.isPlaying());
        } catch (Exception e) {
            Log.w("PlaybackPosition", "Cannot capture playback position", e);
        }
    }

    static String payload(List<JSONObject> queue, int index, long position) throws Exception {
        if (queue == null || queue.isEmpty() || index < 0 || index >= queue.size()) return null;
        return new JSONObject().put("playlist", new JSONArray(queue))
                .put("index", index).put("seek", Math.max(0, position)).toString();
    }

    private void write(String payload,boolean playing) {
        final File file = new File(context.getFilesDir(), "playList.json");
        IO.execute(() -> {
            AtomicFile atomic = new AtomicFile(file);
            FileOutputStream stream = null;
            try {
                stream = atomic.startWrite();
                stream.write(payload.getBytes(StandardCharsets.UTF_8));
                atomic.finishWrite(stream);
                if(!LocalHistory.checkpoint(context,payload,playing)) writeFailed=true;
            } catch (Exception e) {
                if (stream != null) atomic.failWrite(stream);
                writeFailed = true;
                Log.w("PlaybackPosition", "Cannot save playback position", e);
            }
        });
    }

    public static void read(Context context, AsyncHttpClient.JSONObjectCallback callback) {
        final Context app = context.getApplicationContext();
        IO.execute(() -> {
            JSONObject snapshot = new JSONObject();
            File file = new File(app.getFilesDir(), "playList.json");
            try {
                AtomicFile atomic = new AtomicFile(file);
                if (file.exists() || new File(file.getPath() + ".bak").exists()) {
                    snapshot = new JSONObject(new String(atomic.readFully(), StandardCharsets.UTF_8));
                } else {
                    // Upgrade without discarding the original version's cached queue.
                    File legacy = new File(app.getCacheDir(), "playList.json");
                    if (legacy.exists()) snapshot = new JSONObject(new String(
                            Files.readAllBytes(legacy.toPath()), StandardCharsets.UTF_8));
                }
            } catch (Exception e) {
                Log.w("PlaybackPosition", "Cannot read saved position", e);
            }
            if (!snapshot.has("playlist")) {
                try { snapshot.put("playlist", new JSONArray()); } catch (Exception ignored) {}
            }
            TrackResume.seed(app,snapshot);
            callback.onCompleted(null, new LocalResponse(200), snapshot);
        });
    }

    public static void restore(AudioService.CtrlBinder binder, List<JSONObject> queue,
            JSONObject snapshot) {
        try {
            // A delayed startup read must not replace a track the user has already selected.
            if (!binder.getPlaybackQueue().isEmpty() || queue.isEmpty()) return;
            int index = snapshot.optInt("index", 0);
            if (index < 0 || index >= queue.size()) index = 0;
            long position = active==null || PlaybackOptions.enabled(active.context)?Math.max(0,snapshot.optLong("seek",0)):0;
            binder.setReapAll();
            binder.play(queue, index);
            Player player = binder.getExoPlayer();
            player.pause();
            player.seekTo(index, position);
        } catch (Exception e) {
            Log.w("PlaybackPosition", "Cannot restore playback position", e);
        }
    }
}
