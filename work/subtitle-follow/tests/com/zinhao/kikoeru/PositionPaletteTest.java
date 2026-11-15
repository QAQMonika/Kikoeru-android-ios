package com.zinhao.kikoeru;

import android.content.Context;
import android.os.Handler;
import android.util.AtomicFile;
import com.google.android.exoplayer2.Player;
import com.koushikdutta.async.http.AsyncHttpClient;
import java.io.File;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import org.json.JSONObject;

public final class PositionPaletteTest {
    private static int checks;
    private static ExecutorService io;
    private static void check(boolean value, String message) {
        checks++; if (!value) throw new AssertionError(message);
    }
    private static void drain() throws Exception { io.submit(() -> {}).get(5, TimeUnit.SECONDS); }
    private static JSONObject saved(Context c) throws Exception {
        drain(); return new JSONObject(new String(Files.readAllBytes(
                new File(c.getFilesDir(), "playList.json").toPath()), StandardCharsets.UTF_8));
    }
    private static JSONObject read(Context c) throws Exception {
        CompletableFuture<JSONObject> done = new CompletableFuture<>();
        PlaybackPosition.read(c, new AsyncHttpClient.JSONObjectCallback() {
            @Override public void onCompleted(Exception e, Object response, Object result) {
                done.complete((JSONObject)result);
            }
        });
        return done.get(5, TimeUnit.SECONDS);
    }
    private static double luminance(int c) {
        double result = 0; double[] weights = {.2126,.7152,.0722};
        for (int i = 0; i < 3; i++) {
            double v = ((c >> (16 - 8*i)) & 255) / 255.0;
            result += weights[i] * (v <= .04045 ? v / 12.92 : Math.pow((v + .055)/1.055,2.4));
        }
        return result;
    }
    private static double contrast(int a, int b) {
        double x = luminance(a), y = luminance(b);
        return (Math.max(x,y)+.05)/(Math.min(x,y)+.05);
    }
    public static void main(String[] args) throws Exception {
        Field field = PlaybackPosition.class.getDeclaredField("IO"); field.setAccessible(true);
        io = (ExecutorService)field.get(null);
        Handler.reset();
        Context c = new Context(Files.createTempDirectory("kiko-position-test").toFile());
        AudioService.CtrlBinder b = new AudioService().new CtrlBinder();
        List<JSONObject> queue = Arrays.asList(new JSONObject().put("title", "A"), new JSONObject().put("title", "B"));
        try {
            check(read(c).getJSONArray("playlist").length() == 0, "First launch returns an empty queue");
            PlaybackPosition.attach(c,b);
            b.play(queue,0);
            Handler.advance(2000);
            check(!new File(c.getFilesDir(),"playList.json").exists(), "Buffering before ready cannot replace a checkpoint");
            b.player.state=Player.STATE_READY; b.player.position=12000; b.player.event();
            check(saved(c).getLong("seek")==12000, "First ready checkpoint");
            b.player.position=17000; Handler.advance(5000);
            check(saved(c).getLong("seek")==17000, "Periodic checkpoint during background playback");
            b.player.position=17999; b.player.pause(); b.player.event();
            check(saved(c).getLong("seek")==17999, "Pause preserves exact position");
            b.player.position=24000; b.player.discontinuity();
            check(saved(c).getLong("seek")==24000, "Paused seek is saved");
            b.player.index=1; b.player.position=32000; b.player.discontinuity();
            check(saved(c).getInt("index")==1 && saved(c).getLong("seek")==32000, "Automatic track advance uses live player index");
            b.player.state=Player.STATE_BUFFERING; b.player.position=34000; PlaybackPosition.flush();
            check(saved(c).getLong("seek")==34000, "Rebuffering can flush the last known timeline");
            b.player.state=Player.STATE_READY; b.player.position=35000;
            PlaybackPosition.detach(b);
            check(saved(c).getLong("seek")==35000, "Service close flushes checkpoint");
            check(Handler.pending()==0 && b.player.listener==null, "Service close removes timer and listener");
            JSONObject snapshot = read(c);
            AudioService.CtrlBinder restored = new AudioService().new CtrlBinder();
            PlaybackPosition.restore(restored,queue,snapshot);
            check(restored.player.index==1 && restored.player.position==35000, "Restart restores index and position before ready");
            check(!restored.player.playing, "Restart does not autoplay");
            PlaybackPosition.restore(restored,queue,new JSONObject().put("index",0));
            check(restored.playCalls==1 && restored.player.index==1, "Delayed startup restore cannot overwrite user selection");
            AudioService.CtrlBinder invalid = new AudioService().new CtrlBinder();
            PlaybackPosition.restore(invalid,queue,new JSONObject().put("index",99).put("seek",-1));
            check(invalid.player.index==0 && invalid.player.position==0, "Invalid checkpoint is clamped");
            check(PlaybackPosition.payload(queue,-1,100)==null && PlaybackPosition.payload(queue,2,100)==null, "Invalid live index is rejected");
            check(PlaybackPosition.payload(Collections.emptyList(),0,100)==null, "Empty queue cannot overwrite saved data");
            AtomicFile.failNext=true;
            PlaybackPosition.attach(c,b); b.player.position=99999; b.player.event(); drain();
            check(saved(c).getLong("seek")==35000, "Failed write keeps previous checkpoint");
            Handler.advance(1000);
            check(saved(c).getLong("seek")==99999, "Failed write retries without another playback gesture");
            PlaybackPosition.detach(b);
            Context legacy = new Context(Files.createTempDirectory("kiko-legacy-test").toFile());
            Files.write(new File(legacy.getCacheDir(),"playList.json").toPath(), snapshot.toString().getBytes(StandardCharsets.UTF_8));
            check(read(legacy).getLong("seek")==35000, "Upgrade reads original cache format");
            Files.write(new File(legacy.getFilesDir(),"playList.json").toPath(), "broken".getBytes(StandardCharsets.UTF_8));
            check(read(legacy).getJSONArray("playlist").length()==0, "Corrupt checkpoint does not crash startup");
            for (int n=0;n<ThemePalettes.PRESETS.length;n++) for (int slot=1;slot<=3;slot++) {
                int bg=ThemePalettes.color(n,slot);
                check(contrast(bg,ThemePalettes.text(bg))>=4.5,"Primary contrast: preset " + n);
                check(contrast(bg,ThemePalettes.secondary(bg))>=4.5,"Secondary contrast: preset " + n);
            }
            check(ThemePalettes.PRESETS.length==12,"Twelve distinct presets including iOS Native Dark and Light");
            System.out.println("PASS: " + checks + " position/palette checks against production bytecode");
        } finally { io.shutdown(); io.awaitTermination(5,TimeUnit.SECONDS); }
    }
}
