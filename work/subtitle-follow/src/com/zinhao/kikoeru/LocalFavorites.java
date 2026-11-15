package com.zinhao.kikoeru;

import android.content.Context;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;

public final class LocalFavorites {
    static String key(JSONObject album) {
        if(album==null) return "";
        String uri=album.has("entries")?album.optString("document"):album.optString("uri");
        if(uri.isEmpty()) return "";
        try { uri=LocalDeletion.key(uri); } catch(Exception ignored) {}
        return UUID.nameUUIDFromBytes(uri.getBytes(StandardCharsets.UTF_8)).toString();
    }
    static boolean contains(Context context,JSONObject album) {
        return context.getSharedPreferences("local_favorites",0).getStringSet("works",Collections.emptySet()).contains(key(album));
    }
    static boolean toggle(Context context,JSONObject album) {
        String key=key(album); if(key.isEmpty()) return false;
        Set<String> keys=new HashSet<>(context.getSharedPreferences("local_favorites",0).getStringSet("works",Collections.emptySet()));
        boolean added=keys.add(key); if(!added) keys.remove(key);
        context.getSharedPreferences("local_favorites",0).edit().putStringSet("works",keys).apply(); return added;
    }
    static List<JSONObject> albums(Context context,JSONArray roots,String query) throws Exception {
        List<JSONObject> result=new ArrayList<>();
        String search=query.trim().toLowerCase(Locale.ROOT);
        for(JSONObject album:LocalIndex.albums(roots)) {
            if(contains(context,album) && (search.isEmpty()
                    || (album.optString("name")+" "+album.optString("path")).toLowerCase(Locale.ROOT).contains(search))) result.add(album);
        }
        return result;
    }
}
