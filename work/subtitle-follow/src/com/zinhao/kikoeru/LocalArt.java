package com.zinhao.kikoeru;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.graphics.BitmapFactory;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.Handler;
import android.os.Looper;
import android.util.AtomicFile;
import android.widget.ImageView;
import com.bumptech.glide.Glide;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.resource.bitmap.FitCenter;
import com.bumptech.glide.load.resource.bitmap.RoundedCorners;
import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.id3.ApicFrame;
import com.google.android.exoplayer2.metadata.id3.Id3Decoder;
import java.io.*;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.JSONArray;

/** Lazy, coalesced embedded thumbnails for visible rows, not a full-library audio scan. */
public final class LocalArt {
    private static final ExecutorService IO=Executors.newFixedThreadPool(2);
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<ImageView,String> requests=new WeakHashMap<>();
    private static final HashMap<String,String> cache=new HashMap<>();
    private static final HashMap<String,List<WeakReference<ImageView>>> pending=new HashMap<>();
    static String extract(Context c,String uri) {
        if(uri.isEmpty()) return "";
        File folder=new File(c.getFilesDir(),"local-covers"); folder.mkdirs();
        String key=UUID.nameUUIDFromBytes(uri.getBytes(StandardCharsets.UTF_8)).toString();
        File image=new File(folder,key+".jpg");
        if(image.exists() && valid(c,Uri.fromFile(image).toString())) return Uri.fromFile(image).toString();
        byte[] art=null;
        MediaMetadataRetriever metadata=null;
        try {
            metadata=new MediaMetadataRetriever();
            metadata.setDataSource(c,Uri.parse(uri));
            art=metadata.getEmbeddedPicture();
        } catch(Exception ignored) {}
        finally { if(metadata!=null) try { metadata.release(); } catch(Exception ignored) {} }
        if(!valid(art)) {
            try(ParcelFileDescriptor fd=c.getContentResolver().openFileDescriptor(Uri.parse(uri),"r")) {
                if(fd!=null) try(FileInputStream in=new FileInputStream(fd.getFileDescriptor())) {
                    byte[] tag=LocalWaveArt.tag(in.getChannel());
                    if(tag!=null) {
                        Metadata frames=new Id3Decoder().decode(tag,tag.length);
                        if(frames!=null) for(int i=0;i<frames.length();i++) if(frames.get(i) instanceof ApicFrame) {
                            ApicFrame picture=(ApicFrame)frames.get(i);
                            if(valid(picture.pictureData)) {
                                art=picture.pictureData;
                                if(picture.pictureType==3) break;
                            }
                        }
                    }
                }
            } catch(Exception ignored) {}
        }
        if(!valid(art)) return "";
        Bitmap bitmap=null;
        try {
            BitmapFactory.Options bounds=new BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
            BitmapFactory.decodeByteArray(art,0,art.length,bounds);
            BitmapFactory.Options scaled=new BitmapFactory.Options(); scaled.inSampleSize=1;
            while(bounds.outWidth/scaled.inSampleSize>1600 || bounds.outHeight/scaled.inSampleSize>1600) scaled.inSampleSize*=2;
            bitmap=BitmapFactory.decodeByteArray(art,0,art.length,scaled);
            if(bitmap==null) return "";
            // Only artwork is cached. Never copy or change the source audio.
            synchronized(LocalArt.class) {
                AtomicFile atomic=new AtomicFile(image); FileOutputStream out=null;
                try {
                    out=atomic.startWrite();
                    Bitmap.CompressFormat format=bitmap.hasAlpha()?Bitmap.CompressFormat.PNG:Bitmap.CompressFormat.JPEG;
                    if(!bitmap.compress(format,88,out)) throw new IOException("Artwork encoding failed");
                    atomic.finishWrite(out);
                }
                catch(IOException e) { if(out!=null) atomic.failWrite(out); throw e; }
            }
            return Uri.fromFile(image).toString();
        } catch(Exception e) { return ""; }
        finally { if(bitmap!=null) bitmap.recycle(); }
    }
    private static boolean valid(byte[] image) {
        if(image==null || image.length==0 || image.length>20*1024*1024) return false;
        BitmapFactory.Options bounds=new BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
        BitmapFactory.decodeByteArray(image,0,image.length,bounds);
        return bounds.outWidth>0 && bounds.outHeight>0;
    }
    private static boolean valid(Context c,String uri) {
        if(uri.isEmpty()) return false;
        try(InputStream in=c.getContentResolver().openInputStream(Uri.parse(uri))) {
            BitmapFactory.Options bounds=new BitmapFactory.Options(); bounds.inJustDecodeBounds=true;
            BitmapFactory.decodeStream(in,null,bounds); return bounds.outWidth>0 && bounds.outHeight>0;
        } catch(Exception e) { return false; }
    }
    static void cancel(Context c,ImageView view) {
        requests.remove(view); Glide.with(c.getApplicationContext()).clear(view);
    }
    public static void show(Context c,ImageView view,String cover,JSONArray audios,int placeholder) {
        Context context=c.getApplicationContext();
        String key=cover+"\n"+audios.toString();
        requests.put(view,key);
        Glide.with(context).clear(view); view.setImageResource(placeholder);
        if(cover.isEmpty() && audios.length()==0) return;
        if(cache.containsKey(key)) {
            String saved=cache.get(key);
            if(!saved.startsWith("file:") || new File(Uri.parse(saved).getPath()).isFile()) {
                if(!saved.isEmpty()) load(context,view,saved,placeholder);
                return;
            }
            cache.remove(key);
        }
        List<WeakReference<ImageView>> waiters=pending.get(key);
        if(waiters!=null) { waiters.add(new WeakReference<>(view)); return; }
        waiters=new ArrayList<>(); waiters.add(new WeakReference<>(view)); pending.put(key,waiters);
        IO.execute(()-> {
            String found=valid(context,cover)?cover:"";
            for(int i=0;found.isEmpty() && i<audios.length();i++) found=extract(context,audios.optString(i));
            final String result=found;
            MAIN.post(()-> {
                if(cache.size()>2048) cache.clear();
                // Failed reads may be transient; allow the next visit to retry.
                if(!result.isEmpty()) cache.put(key,result);
                List<WeakReference<ImageView>> views=pending.remove(key);
                if(views==null || result.isEmpty()) return;
                for(WeakReference<ImageView> ref:views) {
                    ImageView image=ref.get();
                    if(image!=null && key.equals(requests.get(image))) load(context,image,result,placeholder);
                }
            });
        });
    }
    private static void load(Context context,ImageView image,String uri,int placeholder) {
        RequestOptions options=new RequestOptions().placeholder(placeholder).error(placeholder);
        if(image.getScaleType()==ImageView.ScaleType.FIT_CENTER) options=options.transforms(new FitCenter(),new RoundedCorners(15));
        else options=options.centerCrop();
        Glide.with(context).load(uri).apply(options).listener(new RequestListener<Drawable>() {
            public boolean onLoadFailed(GlideException error,Object model,Target<Drawable> target,boolean first) { return false; }
            public boolean onResourceReady(Drawable resource,Object model,Target<Drawable> target,DataSource source,boolean first) {
                PlayerArtwork.ready(image,resource); return false;
            }
        }).into(image);
    }
}
