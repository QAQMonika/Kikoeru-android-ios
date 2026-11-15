package com.zinhao.kikoeru;

import org.json.JSONObject;

public final class PlayerArtworkTest {
    private static int checks;
    private static void check(boolean result,String message) {
        checks++; if(!result) throw new AssertionError(message);
    }
    public static void main(String[] args) throws Exception {
        JSONObject restored=new JSONObject().put("local_import",true).put("workId",-5678)
                .put("mediaStreamUrl","content://documents/tree/library/document/audio1")
                .put("local_cover","");
        check(PlayerArtwork.localCover(restored).isEmpty(),"No saved cover is not mistaken for an image");
        check(PlayerArtwork.candidates(restored).length()==1,"Cold restored track still has an embedded-art source");
        check(restored.getString("mediaStreamUrl").equals(PlayerArtwork.candidates(restored).getString(0)),"Artwork reads original content URI");
        for(String cover:new String[]{"content://documents/document/cover","file:///private/covers/cached.jpg"}) {
            restored.put("local_cover",cover);
            check(cover.equals(PlayerArtwork.localCover(restored)),"Real covers are preferred without rewriting metadata");
            check(PlayerArtwork.candidates(restored).length()==1,"An embedded fallback remains available for stale image paths");
        }
        restored.put("local_cover","file:///private/local-covers/audio.png");
        check(PlayerArtwork.localCover(restored).isEmpty(),"Old default music-note image must not suppress extraction");
        check(PlayerArtwork.candidates(new JSONObject()).length()==0,"Empty queue has no invalid source");
        java.lang.reflect.Field current=LocalPlayback.class.getDeclaredField("current"); current.setAccessible(true);
        Object previous=current.get(null);
        try {
            current.set(null,restored);
            check(LocalPlayback.artworkTrack(-5678)==restored,"Artwork can resolve a paused restored track without selecting it again");
            check(LocalPlayback.artworkTrack(-5679)==null,"A stale album callback cannot borrow another album cover");
            check(LocalPlayback.artworkTrack(5678)==null,"Online album never uses local artwork");
            check(!PlayerArtwork.bindLocal(null,null,-5678),"Uninitialized image is safely ignored");
            current.set(null,new JSONObject().put("workId",-5678));
            check(LocalPlayback.artworkTrack(-5678)==null,"Local marker is required even for a negative ID");
            long cloudAlbum=-5123456789012345L;
            JSONObject cloud=new JSONObject().put("baidu_cloud",true).put("workId",cloudAlbum);
            current.set(null,cloud);
            check(LocalPlayback.artworkTrack(cloudAlbum)==cloud,"Cloud artwork matches the complete 64-bit album ID");
            check(LocalPlayback.artworkTrack((long)(int)cloudAlbum)==null,"Truncating the album ID does not match cloud artwork");
            current.set(null,null);
            check(LocalPlayback.artworkTrack(-5678)==null,"No current track is supported");
        } finally { current.set(null,previous); }
        java.io.File temp=java.nio.file.Files.createTempDirectory("kiko-cloud-art-").toFile();
        android.content.Context context=new android.content.Context(temp);
        String owner="12345",other="67890",root="/Library",album="/Library/RJ123456",child=album+"/Audio";
        java.io.File rootArt=BaiduCloud.coverFile(context,owner,root),albumArt=BaiduCloud.coverFile(context,owner,album),childArt=BaiduCloud.coverFile(context,owner,child);
        try {
            context.getSharedPreferences("baidu_library",0).edit().putString("root:"+owner,root).putString("root:"+other,root).apply();
            java.nio.file.Files.write(rootArt.toPath(),new byte[]{1});
            check(BaiduCloud.trackCover(context,owner,child).isEmpty(),"Collection cover is not inherited by an album");
            java.nio.file.Files.write(albumArt.toPath(),new byte[]{2});
            check(BaiduCloud.trackCover(context,owner,child).equals(android.net.Uri.fromFile(albumArt).toString()),"Track can reuse the cached parent album cover");
            check(BaiduCloud.trackCover(context,owner,"/Library/RJ999999/Audio").isEmpty(),"Sibling album cover is never reused");
            check(BaiduCloud.trackCover(context,other,child).isEmpty(),"Cloud covers remain account-isolated");
            java.nio.file.Files.write(childArt.toPath(),new byte[]{3});
            check(BaiduCloud.trackCover(context,owner,child).equals(android.net.Uri.fromFile(childArt).toString()),"The nearest track-folder cover has priority");
            java.nio.file.Files.delete(childArt.toPath());
            context.getSharedPreferences("baidu_library",0).edit().putString("root:"+owner,album).apply();
            check(BaiduCloud.trackCover(context,owner,child).equals(android.net.Uri.fromFile(albumArt).toString()),"A selected RJ album can provide its own cover");
            context.getSharedPreferences("baidu_library",0).edit().putString("root:"+owner,"/Other").apply();
            check(BaiduCloud.trackCover(context,owner,child).isEmpty(),"A changed root does not expose an old cover");
        } finally {
            java.nio.file.Files.deleteIfExists(childArt.toPath()); java.nio.file.Files.deleteIfExists(albumArt.toPath()); java.nio.file.Files.deleteIfExists(rootArt.toPath());
            java.nio.file.Files.deleteIfExists(new java.io.File(temp,"cache/baidu-covers").toPath());
            java.nio.file.Files.deleteIfExists(new java.io.File(temp,"cache").toPath()); java.nio.file.Files.deleteIfExists(temp.toPath());
        }
        System.out.println("PASS: "+checks+" restored playback artwork checks against production bytecode");
    }
}
