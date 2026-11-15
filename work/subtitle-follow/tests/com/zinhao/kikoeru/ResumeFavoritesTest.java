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
    private static void workLastPlayedAndProgress() throws Exception {
        Context c=context("work-last-played");
        // 1. Online work last-played + duration-weighted progress across nested tree
        JSONObject t1=new JSONObject().put("type","audio").put("hash","77/0").put("workId",77L).put("title","01_intro.wav").put("duration",60.0);
        JSONObject t2=new JSONObject().put("type","audio").put("hash","77/1").put("workId",77L).put("title","02_main.wav").put("duration",120.0);
        JSONObject t3=new JSONObject().put("type","audio").put("hash","77/2").put("title","03_outro.wav").put("duration",60.0); // missing workId in tree, tests fallback
        JSONArray trees=new JSONArray()
                .put(new JSONObject().put("type","folder").put("title","01_wav").put("children",new JSONArray().put(t1).put(t2)))
                .put(new JSONObject().put("type","folder").put("title","02_bonus").put("children",new JSONArray().put(t3)));

        TrackResume.remember(c,t1,60000,60000); // completed (60s / 60s)
        TrackResume.remember(c,new JSONObject(t3.toString()).put("workId",77L),30000,60000); // 50%
        JSONObject onlineLast=TrackResume.lastPlayedForOnlineWork(c,77L);
        check(onlineLast!=null && "03_outro.wav".equals(onlineLast.optString("title")),"Online work remembers most recent track");
        check(onlineLast.optInt("percent",-1)==50,"Last played retains track percent");
        check(TrackResume.lastPlayedForOnlineWork(c,88L)==null,"Unplayed online work has no last-played record");

        JSONObject onlineProg=TrackResume.workProgressOnline(c,77L,trees);
        // Total duration = 60 + 120 + 60 = 240s; listened = 60 + 0 + 30 = 90s => 37.5% -> 38%
        check(onlineProg!=null && onlineProg.optInt("playedTracks")==2 && onlineProg.optInt("totalTracks")==3,"Online work progress counts played tracks across nested folders");
        check(onlineProg.optInt("percent")==38,"Online work progress computes duration-weighted percentage");
        String t1Badge=TrackResume.buildTrackBadge(c,t1,77L,false,onlineLast);
        String t3Badge=TrackResume.buildTrackBadge(c,t3,77L,true,onlineLast);
        check(t1Badge.contains("100%"),"Completed track shows 100% badge even though resume seek restarts at zero");
        check(t3Badge.contains("00:30") && t3Badge.contains("50%"),"Last played track badge shows clock and percentage");

        // 2. Local folder last-played + nested subfolder isolation + whole-work progress
        String srcUri="content://provider/tree/primary%3AVoice";
        String workAPath="Voice/RJ01544069";
        String subA1Uri="content://provider/document/primary%3AVoice%2FRJ01544069%2F01_wav";
        String subB1Uri="content://provider/document/primary%3AVoice%2FRJ01599999";
        JSONObject locTrack1=new JSONObject().put("local_import",true).put("title","track1.wav")
                .put("workTitle",workAPath+"/01_wav").put("local_source",srcUri).put("local_parent",subA1Uri)
                .put("mediaStreamUrl","content://provider/document/primary%3AVoice%2FRJ01544069%2F01_wav%2Ftrack1.wav");
        JSONObject locTrack2=new JSONObject().put("local_import",true).put("title","track2.wav")
                .put("workTitle",workAPath+"/02_mp3").put("local_source",srcUri).put("local_parent","content://provider/document/primary%3AVoice%2FRJ01544069%2F02_mp3")
                .put("mediaStreamUrl","content://provider/document/primary%3AVoice%2FRJ01544069%2F02_mp3%2Ftrack2.wav");
        TrackResume.remember(c,locTrack1,45000,90000); // 50%

        JSONArray roots=new JSONArray().put(new JSONObject().put("uri",srcUri).put("name","Voice")
                .put("entries",new JSONArray()
                        .put(new JSONObject().put("directory",false).put("name","track1.wav").put("path",workAPath+"/01_wav/track1.wav")
                                .put("parent",subA1Uri).put("uri",locTrack1.getString("mediaStreamUrl")))
                        .put(new JSONObject().put("directory",false).put("name","track2.wav").put("path",workAPath+"/02_mp3/track2.wav")
                                .put("parent","content://provider/document/primary%3AVoice%2FRJ01544069%2F02_mp3").put("uri",locTrack2.getString("mediaStreamUrl")))));

        JSONObject localWorkLast=TrackResume.lastPlayedForLocalFolder(c,srcUri,workAPath,"content://provider/document/primary%3AVoice%2FRJ01544069");
        check(localWorkLast!=null && "track1.wav".equals(localWorkLast.optString("title")),"Local parent folder resolves descendant last-played track");
        check("01_wav".equals(localWorkLast.optString("subFolder")),"Local parent folder computes relative subfolder name");
        check(TrackResume.lastPlayedForLocalFolder(c,srcUri,"Voice/RJ01599999",subB1Uri)==null,"Sibling local work does not see Work A last-played track");
        JSONObject localProg=TrackResume.workProgressLocal(c,roots,srcUri,workAPath,"content://provider/document/primary%3AVoice%2FRJ01544069");
        check(localProg!=null && localProg.optInt("playedTracks")==1 && localProg.optInt("totalTracks")==2 && localProg.optInt("percent")==25,"Local work progress averages track completion across subfolders");

        // 3. Baidu Cloud folder last-played + folder progress
        JSONObject cloudTrack=new JSONObject().put("baidu_cloud",true).put("cloud_owner","100123").put("cloud_id","99881")
                .put("cloud_folder","/ASMR/RJ01/01_wav").put("title","c1.flac");
        TrackResume.remember(c,cloudTrack,120000,240000);
        JSONObject cloudParentLast=TrackResume.lastPlayedForCloudFolder(c,"100123","/ASMR/RJ01");
        check(cloudParentLast!=null && "c1.flac".equals(cloudParentLast.optString("title")) && "01_wav".equals(cloudParentLast.optString("subFolder")),"Baidu Cloud parent folder detects descendant last-played track");
        check(TrackResume.lastPlayedForCloudFolder(c,"999999","/ASMR/RJ01")==null,"Different cloud account keeps separate history");
        List<JSONObject> cloudVisible=Arrays.asList(
                new JSONObject().put("isdir",0).put("fs_id","99881").put("server_filename","c1.flac"),
                new JSONObject().put("isdir",0).put("fs_id","99882").put("server_filename","c2.flac"));
        JSONObject cloudProg=TrackResume.folderProgressCloud(c,"100123",cloudVisible);
        check(cloudProg!=null && cloudProg.optInt("playedTracks")==1 && cloudProg.optInt("totalTracks")==2 && cloudProg.optInt("percent")==25,"Cloud directory calculates current folder progress");

        // 4. Formatting + option gate + bounded work_last_tracks
        check("01:05".equals(TrackResume.formatDurationClock(65000)) && "1:01:05".equals(TrackResume.formatDurationClock(3665000)),"Duration clock formats mm:ss and h:mm:ss");
        check("\u521a\u521a".equals(TrackResume.formatRelativeTime(100000L,130000L)) && "2\u5929\u524d".equals(TrackResume.formatRelativeTime(1000L,1000L+2L*86400_000L)),"Relative time formats recent and day offsets");
        PlaybackOptions.enabled(c,false);
        check(TrackResume.lastPlayedForOnlineWork(c,77L)==null && TrackResume.trackProgress(c,t1,77L)==null,"Disabling remember option hides last-played & percentages");
        PlaybackOptions.enabled(c,true);
        check(TrackResume.lastPlayedForOnlineWork(c,77L)!=null,"Re-enabling remember option restores last-played visibility");

        Context bounded=context("work-last-bounded");
        for(int i=1;i<=501;i++) {
            TrackResume.remember(bounded,new JSONObject().put("workId",i).put("hash",i+"/0").put("title","t"+i),5000,10000);
        }
        check(bounded.getSharedPreferences("work_last_tracks",0).getAll().size()==500,"Work last-played storage is bounded to 500 works");
    }
    public static void main(String[] args) throws Exception {
        Field field=PlaybackPosition.class.getDeclaredField("IO"); field.setAccessible(true);
        ExecutorService io=(ExecutorService)field.get(null);
        try {
            bookmarks(); playback(); favorites(); workLastPlayedAndProgress();
            io.submit(()->{}).get(5,TimeUnit.SECONDS);
            System.out.println("PASS: "+checks+" per-track resume and independent local favorites checks");
        } finally { io.shutdown(); io.awaitTermination(5,TimeUnit.SECONDS); }
    }
}
