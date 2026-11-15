.class Lcom/zinhao/kikoeru/AudioService$2;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Lcom/google/android/exoplayer2/Player$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioService;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 194
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIsPlayingChanged(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "isPlaying"
        }
    .end annotation

    .line 218
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onIsPlayingChanged: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "AudioService"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lcom/zinhao/kikoeru/AudioService$2$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$2$1;-><init>(Lcom/zinhao/kikoeru/AudioService$2;)V

    invoke-interface {p1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 226
    :try_start_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$500(Lcom/zinhao/kikoeru/AudioService;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 228
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    return-void
.end method

.method public onMediaMetadataChanged(Lcom/google/android/exoplayer2/MediaMetadata;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mediaMetadata"
        }
    .end annotation

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onMediaMetadataChanged: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/google/android/exoplayer2/MediaMetadata;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", play state:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlaybackState()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result v2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$602(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 266
    new-instance v0, Landroid/support/v4/media/MediaMetadataCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/MediaMetadataCompat$Builder;-><init>()V

    iget-object p1, p1, Lcom/google/android/exoplayer2/MediaMetadata;->title:Ljava/lang/CharSequence;

    check-cast p1, Ljava/lang/String;

    .line 267
    const-string v1, "android.media.metadata.TITLE"

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    .line 268
    const-string v0, "android.media.metadata.MEDIA_ID"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.ARTIST"

    .line 269
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.ALBUM"

    .line 270
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    .line 271
    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v0

    const-string v2, "android.media.metadata.DURATION"

    invoke-virtual {p1, v2, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    .line 272
    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->build()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object p1

    .line 273
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat;->setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V

    .line 275
    :try_start_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$500(Lcom/zinhao/kikoeru/AudioService;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 277
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 279
    :goto_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lcom/zinhao/kikoeru/AudioService$2$3;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$2$3;-><init>(Lcom/zinhao/kikoeru/AudioService$2;)V

    invoke-interface {p1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 285
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$800(Lcom/zinhao/kikoeru/AudioService;)V

    return-void
.end method

.method public onMetadata(Lcom/google/android/exoplayer2/metadata/Metadata;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "metadata"
        }
    .end annotation

    .line 290
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "onMetadata: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/metadata/Metadata;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "AudioService"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onPlaybackStateChanged(I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "playbackState"
        }
    .end annotation

    .line 234
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onPlaybackStateChanged:playbackState: %d ,index: %d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 238
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/AudioService$2$2;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$2$2;-><init>(Lcom/zinhao/kikoeru/AudioService$2;)V

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 246
    :try_start_0
    new-instance p1, Landroid/support/v4/media/MediaMetadataCompat$Builder;

    invoke-direct {p1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;-><init>()V

    const-string v0, "android.media.metadata.TITLE"

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    .line 247
    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getMediaMetadata()Lcom/google/android/exoplayer2/MediaMetadata;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/exoplayer2/MediaMetadata;->title:Ljava/lang/CharSequence;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.MEDIA_ID"

    const/4 v1, 0x0

    .line 248
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.ARTIST"

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    .line 249
    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getMediaMetadata()Lcom/google/android/exoplayer2/MediaMetadata;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/exoplayer2/MediaMetadata;->artist:Ljava/lang/CharSequence;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.ALBUM"

    .line 250
    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    const-string v0, "android.media.metadata.DURATION"

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    .line 251
    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->putLong(Ljava/lang/String;J)Landroid/support/v4/media/MediaMetadataCompat$Builder;

    move-result-object p1

    .line 252
    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadataCompat$Builder;->build()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object p1

    .line 253
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat;->setMetadata(Landroid/support/v4/media/MediaMetadataCompat;)V

    .line 255
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$500(Lcom/zinhao/kikoeru/AudioService;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 257
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public onPlayerError(Lcom/google/android/exoplayer2/PlaybackException;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "error"
        }
    .end annotation

    .line 197
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    .line 198
    instance-of p0, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;

    if-eqz p0, :cond_0

    .line 199
    check-cast p1, Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 202
    iget p0, p1, Lcom/google/android/exoplayer2/ExoPlaybackException;->type:I

    if-nez p0, :cond_0

    .line 203
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object p0

    .line 205
    instance-of p0, p0, Lcom/google/android/exoplayer2/upstream/HttpDataSource$HttpDataSourceException;

    if-eqz p0, :cond_0

    .line 207
    const-string p0, "AudioService"

    const-string p1, "onPlayerError: \u7f51\u7edc\u8fde\u63a5\u5f02\u5e38\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
