import android.os.Looper;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/** Isolated ART linkage check: no installation, no application data or playback changes. */
public final class DeviceSmoke {
    private static Method method(Class<?> owner, String name, Class<?>... arguments) throws Exception {
        Method method = owner.getDeclaredMethod(name, arguments);
        method.setAccessible(true);
        return method;
    }
    public static void main(String[] args) throws Exception {
        if (Looper.getMainLooper() == null) Looper.prepareMainLooper();
        Class<?> palette = Class.forName("com.zinhao.kikoeru.ThemePalettes");
        Class<?> position = Class.forName("com.zinhao.kikoeru.PlaybackPosition");
        Class<?> settings = Class.forName("com.zinhao.kikoeru.ThemePaletteActivity");
        Class<?> binder = Class.forName("com.zinhao.kikoeru.AudioService$CtrlBinder");
        binder.getMethod("getPlaybackQueue");
        settings.getConstructor().newInstance();
        int checks = 2;
        for (int n=0; n<10; n++) for (int slot=1; slot<=3; slot++) {
            int bg = (Integer)method(palette,"color",int.class,int.class).invoke(null,n,slot);
            method(palette,"text",int.class).invoke(null,bg);
            method(palette,"secondary",int.class).invoke(null,bg);
            checks += 2;
        }
        String json = (String)method(position,"payload",List.class,int.class,long.class)
                .invoke(null,Arrays.asList(new JSONObject().put("title","A"),
                        new JSONObject().put("title","B")),1,123456L);
        JSONObject saved = new JSONObject(json);
        if (saved.getInt("index")!=1 || saved.getLong("seek")!=123456L
                || saved.getJSONArray("playlist").length()!=2) throw new AssertionError(json);
        checks++;
        Class<?> library=Class.forName("com.zinhao.kikoeru.LocalLibraryActivity");
        Class<?> index=Class.forName("com.zinhao.kikoeru.LocalIndex");
        Class<?> local=Class.forName("com.zinhao.kikoeru.LocalPlayback");
        library.getConstructor().newInstance(); checks++;
        binder.getMethod("setLocalLrc",String.class); checks++;
        binder.getMethod("getCurrent"); checks++;
        if(!(Boolean)index.getMethod("audio",String.class).invoke(null,"Track02.FLAC")) throw new AssertionError("Audio extension"); checks++;
        if((Integer)index.getMethod("natural",String.class,String.class).invoke(null,"Track2.wav","Track10.wav")>=0) throw new AssertionError("Natural order"); checks++;
        if(local.getMethod("coverRequest",String.class).invoke(null,"/api/cover/123")!=null) throw new AssertionError("Network cover changed"); checks++;
        String decoded=(String)method(local,"decode",byte[].class).invoke(null,(Object)"\ufeff[00:01.00]Test".getBytes("UTF-8"));
        if(!decoded.startsWith("[00:")) throw new AssertionError("Subtitle BOM"); checks++;
        Class<?> lrc=Class.forName("com.zinhao.kikoeru.Lrc");
        Object lyrics=lrc.getConstructor(String.class).newInstance("[00:00.00]First\n[00:05.00]Second\n[00:10.00]Third");
        if(((List)lrc.getMethod("getLrcRows").invoke(lyrics)).size()!=3) throw new AssertionError("Native LRC parser"); checks++;
        Class<?> catalog=Class.forName("com.zinhao.kikoeru.CatalogState");
        if(!"updated_at".equals(catalog.getMethod("reviewOrder",String.class).invoke(null,"release")))
            throw new AssertionError("Review default sort"); checks++;
        if(!(Boolean)catalog.getMethod("refreshOnResume",boolean.class,int.class,int.class,int.class)
                .invoke(null,true,491,1,0)) throw new AssertionError("Subtitle filter refresh"); checks++;
        Class<?> response=Class.forName("com.koushikdutta.async.http.AsyncHttpResponse");
        Object unauthorized=Class.forName("com.zinhao.kikoeru.LocalResponse").getConstructor(int.class).newInstance(401);
        Exception failure=(Exception)catalog.getMethod("reviewError",Exception.class,response,JSONObject.class)
                .invoke(null,null,unauthorized,new JSONObject());
        if(failure==null || !failure.getMessage().contains("401")) throw new AssertionError("Review error linkage"); checks++;
        Class<?> works=Class.forName("com.zinhao.kikoeru.WorksActivity");
        Object owner=works.getConstructor().newInstance();
        Class<?> callback=Class.forName("com.zinhao.kikoeru.WorksActivity$apisCallback$1");
        java.lang.reflect.Constructor<?> constructor=callback.getDeclaredConstructor(works);
        constructor.setAccessible(true);
        Object receiver=constructor.newInstance(owner);
        if(!(Boolean)callback.getMethod("isCurrent").invoke(receiver)) throw new AssertionError("Current generation"); checks++;
        java.lang.reflect.Field generation=works.getDeclaredField("catalogGeneration");
        generation.setAccessible(true); generation.setInt(owner,1);
        if((Boolean)callback.getMethod("isCurrent").invoke(receiver)) throw new AssertionError("Stale generation"); checks++;
        works.getDeclaredMethod("onResume"); checks++;
        Class.forName("com.zinhao.kikoeru.WorkTreeActivity$actionCallBack$1").getDeclaredMethods(); checks++;
        Class.forName("com.zinhao.kikoeru.Api$okhttpPutJsonObject$1").getDeclaredMethods(); checks++;
        if(((JSONObject)catalog.getMethod("reviewJson",String.class).invoke(null,"")).length()!=0)
            throw new AssertionError("Empty successful review JSON"); checks++;
        Class<?> adapterType=Class.forName("com.zinhao.kikoeru.LrcAdapter");
        Object adapter=adapterType.getConstructor(lrc).newInstance(lyrics);
        java.lang.reflect.Field selected=adapterType.getDeclaredField("oldIndex"); selected.setAccessible(true);
        for(long time:new long[]{10000,0,5000,10000,0,5000}) {
            lrc.getMethod("update",long.class).invoke(lyrics,time);
            adapterType.getMethod("update").invoke(adapter);
            if(selected.getInt(adapter)!=(Integer)lrc.getMethod("getCurrentIndex").invoke(lyrics))
                throw new AssertionError("Native subtitle selection mismatch"); checks++;
        }
        Class.forName("com.zinhao.kikoeru.AudioPlayerActivity").getDeclaredMethod("finish"); checks++;
        library.getDeclaredMethod("onNewIntent",android.content.Intent.class); checks++;
        if(args.length>0 && args[0].equals("fix18")) {
            Class.forName("com.zinhao.kikoeru.PlaybackQueueActivity").getConstructor().newInstance(); checks++;
            Class.forName("com.zinhao.kikoeru.PlayerNavigation").getMethod("openQueue",android.app.Activity.class); checks++;
            Class.forName("com.zinhao.kikoeru.PlayerArtwork").getMethod("bindLocal",android.content.Context.class,android.widget.ImageView.class,long.class); checks++;
            Class.forName("com.zinhao.kikoeru.MiniPlayer").getConstructor(android.app.Activity.class); checks++;
            binder.getMethod("isLrcWindowShow"); checks++;
            binder.getMethod("showLrcFloatWindow"); checks++;
            binder.getMethod("hideLrcFloatWindow"); checks++;
            Class.forName("com.zinhao.kikoeru.Api").getMethod("minCoverImageUrl",long.class); checks++;
            Class.forName("com.zinhao.kikoeru.PlayerArtworkTest").getMethod("main",String[].class)
                    .invoke(null,(Object)new String[0]);
        }
        if(args.length>0 && args[0].equals("fix17"))
            Class.forName("com.zinhao.kikoeru.LocalDeletionTest").getMethod("main",String[].class)
                    .invoke(null,(Object)new String[0]);
        System.out.println("PASS: " + checks + " isolated Android ART/JSON/linkage checks");
        // The production IO executor is intentionally process-lived.
        System.exit(0);
    }
}
