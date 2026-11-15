package com.zinhao.kikoeru;

import android.content.Context;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import org.json.*;

public final class LocalHistoryTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static JSONObject track(String source,String parent,String audio) throws Exception {
        return new JSONObject().put("local_import",true).put("local_source",source).put("local_parent",parent)
                .put("mediaStreamUrl",audio).put("title","Track01.flac").put("workTitle","Library/Album").put("local_cover","cover");
    }
    public static void main(String[] args) throws Exception {
        JSONObject a=track("tree","album","audio-a");
        JSONArray rows=LocalHistory.update(new JSONArray(),a,12345,100);
        check(rows.length()==1,"First local play creates a record");
        JSONObject first=rows.getJSONObject(0); long id=first.getLong("id");
        check(id<0,"Local identity cannot collide with positive online RJ ids");
        check(first.getString("title").equals("Album"),"Folder title used instead of full path");
        check(first.getLong("seek")==12345,"Track position retained");
        check(first.getString("audio").equals("audio-a"),"Original URI retained");
        check(first.getString("cover").equals("cover"),"Cover retained");
        rows=LocalHistory.update(rows,track("tree","album","audio-b"),54321,200);
        check(rows.length()==1 && rows.getJSONObject(0).getLong("id")==id,"Same folder updates stable record, not duplicate");
        check(rows.getJSONObject(0).getString("audio").equals("audio-b"),"Latest heard track replaces old track");
        rows=LocalHistory.update(rows,track("other-tree","album","audio-c"),-1,150);
        check(rows.length()==2,"Same named folder in another source is separate");
        check(rows.getJSONObject(0).getLong("time")==200,"Descending recent-play order");
        check(rows.getJSONObject(1).getLong("seek")==0,"Negative position clamped");
        check(LocalHistory.update(rows,new JSONObject().put("local_import",false),0,300)==rows,"Online history never modified");
        for(int i=0;i<510;i++) rows=LocalHistory.update(rows,track("tree","album"+i,"audio"+i),i,1000+i);
        check(rows.length()==500,"History bounded to 500 local folders");
        check(rows.getJSONObject(0).getLong("time")==1509,"Newest record preserved at cap");
        Set<Long> ids=new HashSet<>(); for(int i=0;i<rows.length();i++) ids.add(rows.getJSONObject(i).getLong("id"));
        check(ids.size()==500,"Independent local record identities");
        check(LocalHistory.time(3601000).equals("01:00:01"),"Position formatting over an hour");
        check(LocalHistory.time(72*3600000L).equals("72:00:00"),"Long recording position does not wrap at a day");
        Context context=new Context(Files.createTempDirectory("kiko-local-history-").toFile());
        File file=new File(context.getFilesDir(),"local-listening-history.json");
        JSONObject t=track("test-tree","test-folder","test-audio");
        String payload=PlaybackPosition.payload(Collections.singletonList(t),0,17000);
        LocalHistory.checkpoint(context,payload,false);
        check(!file.exists(),"Paused startup restore does not invent a listening record");
        LocalHistory.notePlaying(Collections.singletonList(t),0);
        LocalHistory.checkpoint(context,payload,false);
        check(file.exists(),"Playback then pause before five seconds still records listening");
        LocalHistory.checkpoint(context,payload,true);
        check(new JSONArray(new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8)).length()==1,"Actual playback writes private history");
        LocalHistory.checkpoint(context,PlaybackPosition.payload(Collections.singletonList(t),0,30000),false);
        check(new JSONArray(new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8)).getJSONObject(0).getLong("seek")==30000,"Pause saves last heard position");
        byte[] damaged="bad-json".getBytes(StandardCharsets.UTF_8); Files.write(file.toPath(),damaged);
        LocalHistory.checkpoint(context,payload,true);
        check(Arrays.equals(Files.readAllBytes(file.toPath()),damaged),"Corrupt history is not silently replaced with empty data");
        Files.delete(file.toPath()); Files.delete(context.getFilesDir().toPath());
        System.out.println("PASS: "+checks+" local history checks against production bytecode");
    }
}
