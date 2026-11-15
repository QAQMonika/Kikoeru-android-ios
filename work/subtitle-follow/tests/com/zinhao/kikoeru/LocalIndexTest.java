package com.zinhao.kikoeru;

import java.io.*;
import java.nio.charset.*;
import java.util.*;
import java.util.concurrent.CancellationException;
import org.json.*;

public final class LocalIndexTest {
    private static int checks;
    private static void check(boolean value,String message) { checks++; if(!value) throw new AssertionError(message); }
    private static LocalIndex.Entry dir(String uri,String name) { return new LocalIndex.Entry(uri,name,"folder",true,0); }
    private static LocalIndex.Entry file(String uri,String name) { return new LocalIndex.Entry(uri,name,"",false,1234); }
    private static final LocalIndex.Progress PROGRESS=new LocalIndex.Progress() {
        public boolean cancelled() { return false; }
        public void update(int folders,int tracks) {}
    };
    public static void main(String[] args) throws Exception {
        for(String ext:Arrays.asList("mp3","flac","wav","m4a","aac","ogg","opus","amr","3gp"))
            check(LocalIndex.audio("test."+ext.toUpperCase(Locale.ROOT)),"Audio extension "+ext);
        for(String name:Arrays.asList("notes.txt","archive.zip","subtitle.lrc","art.jpg","test.mp3.part","missing"))
            check(!LocalIndex.audio(name),"Non-audio excluded "+name);
        check(LocalIndex.natural("Track2.wav","Track10.wav")<0,"Natural numeric order");
        check(LocalIndex.natural("01.flac","1.flac")==-LocalIndex.natural("1.flac","01.flac"),"Sort antisymmetry");
        check(LocalIndex.natural("999999999999999999999.wav","1000000000000000000000.wav")<0,"Large numeric name");
        Map<String,List<LocalIndex.Entry>> tree=new HashMap<>();
        tree.put("root",Arrays.asList(dir("work","Work"),dir("empty","Images"),file("cover","cover.jpg")));
        tree.put("empty",Arrays.asList(file("picture","photo.png")));
        tree.put("work",Arrays.asList(file("a10","Track10.FLAC"),file("a2","Track2.wav"),
                file("lrc","TRACK2.LRC"),file("vtt","Track2.vtt"),file("vtt10","Track10.VTT"),dir("sub","Bonus")));
        tree.put("sub",Arrays.asList(file("bonus","Track2.mp3"),file("wrong","Other.lrc"),file("owncover","folder.png")));
        JSONObject scanned=LocalIndex.scan(dir("root","Library"),uri->new ArrayList<>(tree.get(uri)),PROGRESS);
        check(scanned.getInt("count")==3,"Recursive audio count");
        JSONArray roots=new JSONArray().put(scanned.put("document","root"));
        List<JSONObject> rows=LocalIndex.rows(roots,"root","root","");
        check(rows.size()==1 && rows.get(0).getString("name").equals("Work"),"Prune non-audio folders");
        check(rows.get(0).getInt("count")==3,"Ancestor recursive count");
        check(!rows.get(0).getString("artAudio").isEmpty(),"Folder gets an embedded-art source without reading audio");
        check(!scanned.getString("artAudio").isEmpty(),"Imported root gets an embedded-art source");
        check(LocalIndex.artworkSources(rows.get(0)).length()==3,"Album tries other tracks when the first lacks artwork");
        rows=LocalIndex.rows(roots,"root","work","");
        check(rows.size()==3 && rows.get(0).getString("name").equals("Bonus"),"Directories before audio");
        check(rows.get(1).getString("name").equals("Track2.wav"),"Audio natural order");
        check(rows.get(1).getString("subtitle").equals("lrc"),"Same stem case-insensitive LRC preferred");
        check(rows.get(2).getString("subtitle").equals("vtt10"),"VTT pairing");
        check(rows.get(1).getString("cover").equals("cover"),"Parent cover inherited");
        List<JSONObject> bonus=LocalIndex.rows(roots,"root","sub","");
        check(bonus.size()==1 && bonus.get(0).getString("subtitle").isEmpty(),"No cross-directory subtitle pairing");
        check(bonus.get(0).getString("cover").equals("owncover"),"Nearest cover wins");
        List<JSONObject> queue=LocalIndex.playlist(rows);
        check(queue.size()==2,"Directories do not enter queue");
        check(queue.get(0).getString("mediaStreamUrl").equals("a2"),"Original audio URI retained");
        check(queue.get(0).getString("local_file_path").isEmpty(),"No audio duplicate path");
        check(queue.get(0).getBoolean("local_import") && queue.get(0).getInt("workId")<0,"Local isolation marker");
        check(queue.get(0).getString("local_source").equals("root"),"Source saved in checkpoint queue");
        check(queue.get(0).getString("local_parent").equals("work"),"Folder saved in queue");
        check(LocalIndex.rows(roots,"","","track2").size()==2,"Search all imported folders");
        check(LocalIndex.rows(roots,"root","work","bonus").size()==1,"Search path matching");
        check(LocalIndex.rows(roots,"","","").size()==1,"Library lists imported roots");
        List<JSONObject> albums=LocalIndex.albums(roots);
        check(albums.size()==1 && albums.get(0).getString("name").equals("Work"),"Parent import presents works as albums");
        check(albums.get(0).getString("source").equals("root"),"Album keeps grant source");
        JSONObject single=new JSONObject(scanned.toString()).put("uri","work").put("document","work").put("name","Single work");
        check(LocalIndex.albums(new JSONArray().put(single)).get(0).has("entries"),"Single work import remains one album");
        check(LocalIndex.albums(new JSONArray().put(scanned).put(scanned)).size()==1,"Overlapping imports do not duplicate albums");
        JSONArray repeated=LocalIndex.replace(roots,scanned);
        check(repeated.length()==1,"Repeated import replaces index");
        JSONObject empty=new JSONObject().put("uri","root").put("entries",new JSONArray()).put("count",0);
        check(LocalIndex.replace(roots,empty).getJSONObject(0).getInt("count")==0,"Rescan removes deleted tracks");
        check(LocalIndex.replace(roots,new JSONObject().put("uri","second")).length()==2,"Multiple source folders");
        Map<String,List<LocalIndex.Entry>> artTree=new HashMap<>();
        artTree.put("library",Arrays.asList(dir("albumA","AlbumA"),dir("albumB","AlbumB")));
        artTree.put("albumA",Arrays.asList(dir("images","img"),dir("audioFolder","Audio")));
        artTree.put("images",Arrays.asList(file("nestedCover","cover.jpg")));
        artTree.put("audioFolder",Arrays.asList(file("songA","01.wav")));
        artTree.put("albumB",Arrays.asList(file("songB","01.wav")));
        JSONObject artScan=LocalIndex.scan(dir("library","Library"),uri->new ArrayList<>(artTree.get(uri)),PROGRESS);
        JSONArray artRoots=new JSONArray().put(artScan);
        List<JSONObject> artAlbums=LocalIndex.albums(artRoots);
        check(artAlbums.get(0).optString("cover").equals("nestedCover"),"Artwork-only img folder supplies album cover");
        check(artAlbums.get(1).optString("cover").isEmpty(),"Sibling albums never borrow another album cover");
        check(LocalIndex.rows(artRoots,"library","audioFolder","").get(0).optString("cover").equals("nestedCover"),"Nested audio receives its own album's cover");
        check(LocalIndex.rows(artRoots,"library","albumA","").size()==1,"Artwork-only folders remain hidden from audio list");
        check(LocalIndex.artworkSources(new JSONObject().put("directory",true).put("artAudio","legacy")).optString(0).equals("legacy"),"Legacy artwork hint supported");
        check(LocalIndex.artworkSources(new JSONObject().put("uri","track")).optString(0).equals("track"),"Track artwork stays track-specific");
        try {
            LocalIndex.scan(dir("root","Library"),uri->new ArrayList<>(tree.get(uri)),new LocalIndex.Progress() {
                public boolean cancelled() { return true; }
                public void update(int folders,int tracks) {}
            }); throw new AssertionError("Scan did not cancel");
        } catch(CancellationException expected) { check(roots.getJSONObject(0).getInt("count")==3,"Cancellation preserves old snapshot"); }
        try { LocalIndex.scan(dir("root","Library"),uri->{ throw new SecurityException(); },PROGRESS); throw new AssertionError("Read failure ignored"); }
        catch(SecurityException expected) { check(roots.length()==1,"Provider failure leaves index untouched"); }
        Map<String,List<LocalIndex.Entry>> deep=new HashMap<>();
        for(int i=0;i<1500;i++) deep.put("d"+i,Collections.singletonList(i==1499?file("deepaudio","1.mp3"):dir("d"+(i+1),"D")));
        JSONObject deepScan=LocalIndex.scan(dir("d0","Deep"),uri->new ArrayList<>(deep.get(uri)),PROGRESS);
        check(deepScan.getInt("count")==1,"Deep scan uses no call stack recursion");
        check(deepScan.getJSONArray("entries").length()==1501,"Deep hierarchy preserved");
        tree.put("work",Arrays.asList(file("a2","Track2.wav"),file("a2","Track2.wav"),dir("root","Cycle")));
        JSONObject cyclic=LocalIndex.scan(dir("root","Library"),uri->new ArrayList<>(tree.get(uri)),PROGRESS);
        check(cyclic.getInt("count")==1,"Provider cycles and duplicate audio deduplicated");
        check(LocalPlayback.decode("\ufeff[00:01.00]Test".getBytes(StandardCharsets.UTF_8)).startsWith("[00:"),"UTF8 BOM removed");
        check(LocalPlayback.decode("[00:01.00]Test".getBytes(StandardCharsets.UTF_16)).startsWith("[00:"),"UTF16 subtitle decoded");
        check(LocalPlayback.decode("[00:01.00]\u4e2d\u6587".getBytes(Charset.forName("GB18030"))).contains("\u4e2d\u6587"),"Legacy Chinese subtitle decoded");
        check(LocalDocuments.read(new ByteArrayInputStream(new byte[4]),4).length==4,"Bounded read exact limit");
        try { LocalDocuments.read(new ByteArrayInputStream(new byte[5]),4); throw new AssertionError("Unbounded read"); }
        catch(IOException expected) { check(true,"Oversize subtitle rejected"); }
        System.out.println("PASS: "+checks+" local library checks against production bytecode");
    }
}
