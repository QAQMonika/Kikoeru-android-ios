package com.zinhao.kikoeru;

import android.content.Context;
import android.os.Handler;
import com.google.android.exoplayer2.Player;
import java.io.File;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

public final class ResumeFavoritesTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static JSONObject track(String uri) throws Exception { return new JSONObject().put("title",uri).put("mediaStreamUrl",uri).put("local_import",true); }
    private static Context context(String name) throws Exception { return new Context(Files.createTempDirectory("kiko-"+name).toFile()); }
    private static void bookmarks() throws Exception {
        Context c=context("bookmarks");
        JSONObject a=track("content://provider/document/primary%3Aaudio%2FA.flac"),b=track("content://provider/document/primary%3Aaudio%2FB.flac");
        check(PlaybackOptions.enabled(c),"Remember position is on by default");
        check(PlaybackOptions.liquidGlass(c),"Liquid glass is on by default");
        PlaybackOptions.liquidGlass(c,false);
        check(!PlaybackOptions.liquidGlass(c),"Liquid glass can switch to classic frosted glass");
        PlaybackOptions.liquidGlass(c,true);
        check(PlaybackOptions.liquidGlass(c),"Liquid glass can be re-enabled");
        check(TrackResume.position(c,a)==0,"New track starts at zero");
        TrackResume.remember(c,a,12000,30000); TrackResume.remember(c,b,18000,40000);
        check(TrackResume.position(c,a)==12000 && TrackResume.position(c,b)==18000,"Each local track has an independent bookmark");
        JSONObject alias=track("content://provider/tree/primary%3Aaudio/document/primary%3Aaudio%2FA.flac");
        check(TrackResume.key(alias).equals(TrackResume.key(a)),"SAF aliases share the same document bookmark");
        check(TrackResume.position(c,alias)==12000,"Reimport through another tree does not lose bookmark");
        PlaybackOptions.enabled(c,false);
        check(!PlaybackOptions.enabled(c) && TrackResume.position(c,a)==0,"Disabled option starts tracks at zero");
        TrackResume.remember(c,a,2000,30000); PlaybackOptions.enabled(c,true);
        check(TrackResume.position(c,a)==12000,"Disabling does not overwrite stored bookmarks");
        TrackResume.remember(c,a,-10,30000); check(TrackResume.position(c,a)==0,"Negative seek clamped");
        TrackResume.remember(c,a,30000,30000); check(TrackResume.position(c,a)==0,"Completed track restarts from beginning");
        TrackResume.remember(c,a,80000,-1); check(TrackResume.position(c,a)==80000,"Unknown duration retains seek");
        c.getSharedPreferences("track_positions",0).edit().putString(TrackResume.key(a),"broken").apply();
        check(TrackResume.position(c,a)==0,"Corrupt bookmark safely defaults to zero");
        TrackResume.remember(c,a,5000,30000); check(TrackResume.position(c,a)==5000,"Next checkpoint repairs a corrupt bookmark");
        JSONObject remote=new JSONObject().put("hash","asset-one").put("workId",10).put("mediaStreamUrl","https://one/a?token=one");
        JSONObject remote2=new JSONObject(remote.toString()).put("mediaStreamUrl","https://cdn/a?token=two");
        check(TrackResume.key(remote).equals(TrackResume.key(remote2)),"Online hash survives expiring URL changes");
        check(!TrackResume.key(remote).equals(TrackResume.key(new JSONObject(remote.toString()).put("workId",11))),"Different works stay separate");
        TrackResume.remember(c,remote,9000,30000);
        check(TrackResume.position(c,remote2)==9000,"Online tracks resume as well as local tracks");
        remote.remove("hash"); remote2=new JSONObject(remote.toString()).put("mediaStreamUrl","https://one/a?token=two#x");
        check(TrackResume.key(remote).equals(TrackResume.key(remote2)),"Fallback remote identity excludes query credentials");
        check(TrackResume.key(null).isEmpty() && TrackResume.key(new JSONObject()).isEmpty(),"Missing identity is not stored");
        int size=c.getSharedPreferences("track_positions",0).getAll().size();
        TrackResume.remember(c,new JSONObject(),100,200);
        check(c.getSharedPreferences("track_positions",0).getAll().size()==size,"Invalid track cannot create bogus bookmark");
        JSONObject seed=new JSONObject().put("playlist",new JSONArray().put(a).put(b)).put("index",1).put("seek",999);
        TrackResume.seed(c,seed); check(TrackResume.position(c,b)==18000,"Migration never replaces newer per-track seek");
        Context migrated=context("migration"); TrackResume.seed(migrated,seed);
        check(TrackResume.position(migrated,b)==999 && TrackResume.position(migrated,a)==0,"Upgrade seeds only the last current track");
        TrackResume.seed(migrated,new JSONObject().put("playlist",new JSONArray().put(a)).put("index",9));
        check(TrackResume.position(migrated,a)==0,"Invalid legacy index ignored");
        Context bounded=context("bounded");
        for(int i=0;i<2001;i++) TrackResume.remember(bounded,track("file:///test/"+i),i+1,10000);
        check(bounded.getSharedPreferences("track_positions",0).getAll().size()==2000,"Track bookmarks have a bounded storage size");
        check(TrackResume.position(bounded,track("file:///test/2000"))==2001,"Newest bookmark survives eviction");
    }
    private static void playback() throws Exception {
        Context c=context("resume-service"); Handler.reset();
        AudioService.CtrlBinder binder=new AudioService().new CtrlBinder();
        List<JSONObject> queue=Arrays.asList(track("file:///test/A"),track("file:///test/B"));
        PlaybackPosition.attach(c,binder);
        try {
            binder.play(queue,0); binder.player.state=Player.STATE_READY; binder.player.position=21000; binder.player.event();
            binder.play(queue,1); check(binder.player.position==0,"Unheard track starts from zero");
            binder.player.state=Player.STATE_READY; binder.player.position=37000; binder.player.pause(); binder.player.event();
            binder.play(queue,0); check(binder.player.position==21000,"Switching back resumes first track before preparation");
            binder.player.state=Player.STATE_READY; binder.player.position=22500; binder.player.playing=false;
            PlaybackPosition.flush(); check(TrackResume.position(c,queue.get(0))==22500,"Explicit flush stores paused seek");
            int calls=binder.playCalls;
            PlayerNavigation.snapshot(binder); LocalFavorites.contains(c,new JSONObject().put("uri","file:///folder"));
            check(binder.playCalls==calls && !binder.player.playing && binder.player.position==22500,"Browsing queue/favorites never starts or seeks audio");
            PlaybackOptions.enabled(c,false); binder.play(queue,1);
            check(binder.player.position==0,"Switch off affects next selected track immediately");
            check(PlaybackPosition.startPosition(binder,queue,-1)==0 && PlaybackPosition.startPosition(binder,queue,2)==0,"Bad track indices rejected");
            AudioService.CtrlBinder other=new AudioService().new CtrlBinder();
            check(PlaybackPosition.startPosition(other,queue,0)==0,"Unattached service cannot read another service bookmark");
        } finally { PlaybackPosition.detach(binder); }
        AudioService.CtrlBinder restarted=new AudioService().new CtrlBinder(); PlaybackPosition.attach(c,restarted);
        try {
            JSONObject snapshot=new JSONObject().put("index",1).put("seek",37000);
            PlaybackPosition.restore(restarted,queue,snapshot);
            check(restarted.player.position==0 && !restarted.player.playing,"Disabled option also applies to cold-start restore without autoplay");
        } finally { PlaybackPosition.detach(restarted); }
        PlaybackOptions.enabled(c,true);
        AudioService.CtrlBinder fresh=new AudioService().new CtrlBinder(); PlaybackPosition.attach(c,fresh);
        try {
            fresh.play(queue,0); check(fresh.player.position==22500,"Service restart retains per-track progress");
        } finally { PlaybackPosition.detach(fresh); }
        check(Handler.pending()==0,"Service shutdown removes resume timer");
    }
    private static void favorites() throws Exception {
        Context c=context("favorites");
        JSONObject a=new JSONObject().put("name","Album A").put("uri","file:///A").put("document","file:///A").put("entries",new JSONArray());
        JSONObject b=new JSONObject().put("name","Album B").put("uri","file:///B").put("document","file:///B").put("entries",new JSONArray());
        JSONArray roots=new JSONArray().put(a).put(b); String original=roots.toString();
        check(!LocalFavorites.contains(c,a),"New local collection is empty");
        check(LocalFavorites.toggle(c,a) && LocalFavorites.contains(c,a),"Add local album favorite");
        check(LocalFavorites.albums(c,roots,"").size()==1,"Local favorites page only shows saved albums");
        check(LocalFavorites.albums(c,roots,"album a").size()==1 && LocalFavorites.albums(c,roots,"album b").isEmpty(),"Favorites search cannot leak uncollected albums");
        check(LocalFavorites.albums(c,new JSONArray(),"").isEmpty(),"Removed source disappears from favorites without touching files");
        check(LocalFavorites.contains(c,a),"Reimport can retain original favorite flag");
        check(LocalFavorites.albums(c,roots,"").get(0).optString("name").equals("Album A"),"Reimported favorite is available again");
        check(roots.toString().equals(original),"Favorites do not mutate import index");
        check(c.getSharedPreferences("track_positions",0).getAll().isEmpty(),"Favorite changes do not alter playback progress");
        check(!LocalFavorites.toggle(c,a) && !LocalFavorites.contains(c,a),"Remove favorite is metadata only");
        check(!LocalFavorites.toggle(c,new JSONObject()),"Invalid album rejected");
        JSONObject alias=new JSONObject().put("uri","content://provider/tree/primary%3ALibrary/document/primary%3ALibrary%2FA");
        JSONObject direct=new JSONObject().put("uri","content://provider/document/primary%3ALibrary%2FA");
        LocalFavorites.toggle(c,alias); check(LocalFavorites.contains(c,direct),"Local favorites canonicalize SAF document identities");
        check(!LocalFavorites.key(new JSONObject().put("uri","content://another/document/primary%3ALibrary%2FA")).equals(LocalFavorites.key(direct)),"Different storage providers cannot collide");
        check(LocalFavorites.key(null).isEmpty(),"Null album identity is safe");
    }
    public static void main(String[] args) throws Exception {
        Field field=PlaybackPosition.class.getDeclaredField("IO"); field.setAccessible(true);
        ExecutorService io=(ExecutorService)field.get(null);
        try {
            bookmarks(); playback(); favorites();
            io.submit(()->{}).get(5,TimeUnit.SECONDS);
            System.out.println("PASS: "+checks+" per-track resume and independent local favorites checks");
        } finally { io.shutdown(); io.awaitTermination(5,TimeUnit.SECONDS); }
    }
}
