.class public Lcom/zinhao/kikoeru/AudioService;
.super Landroid/app/Service;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/AudioService$CtrlBinder;,
        Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;
    }
.end annotation


# static fields
.field private static final ACTION_NEXT:Ljava/lang/String; = "com.zinhao.kikoeru.ACTION_NEXT"

.field private static final ACTION_PAUSE:Ljava/lang/String; = "com.zinhao.kikoeru.ACTION_PAUSE"

.field private static final ACTION_PLAY:Ljava/lang/String; = "com.zinhao.kikoeru.ACTION_PLAY"

.field private static final ACTION_PREVIOUS:Ljava/lang/String; = "com.zinhao.kikoeru.ACTION_PREVIOUS"

.field private static final ACTION_SHOW_LRC:Ljava/lang/String; = "com.zinhao.kikoeru.ACTION_SHOW_LRC"

.field private static final NOTIFICATION_ID:I = 0xc

.field private static final NOTIFICATION_ID_CLOSE_DELAY:I = 0xd

.field private static final SSDF:Ljava/text/SimpleDateFormat;

.field private static final TAG:Ljava/lang/String; = "AudioService"


# instance fields
.field private final builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

.field private final callback:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private final headsetActionReceiver:Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

.field private lrcWindowParams:Landroid/view/WindowManager$LayoutParams;

.field private mHandler:Landroid/os/Handler;

.field private mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

.field private mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 71
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/AudioService;->SSDF:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 72
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$1;-><init>(Lcom/zinhao/kikoeru/AudioService;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->callback:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    .line 132
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;-><init>(Lcom/zinhao/kikoeru/AudioService;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->headsetActionReceiver:Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

    .line 379
    new-instance v0, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    invoke-direct {v0}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/zinhao/kikoeru/AudioService;)Landroid/os/Handler;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1900()Ljava/text/SimpleDateFormat;
    .locals 1

    .line 58
    sget-object v0, Lcom/zinhao/kikoeru/AudioService;->SSDF:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V
    .locals 0

    .line 58
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/zinhao/kikoeru/AudioService;)Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->lrcWindowParams:Landroid/view/WindowManager$LayoutParams;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    return-object p0
.end method

.method static synthetic access$500(Lcom/zinhao/kikoeru/AudioService;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioService;->updateNotificationState()V

    return-void
.end method

.method static synthetic access$800(Lcom/zinhao/kikoeru/AudioService;)V
    .locals 0

    .line 58
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioService;->loadLrc()V

    return-void
.end method

.method private alertException(Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 489
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private loadLrc()V
    .locals 7

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/LocalPlayback;->loadSubtitle(Landroid/content/Context;Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Z

    move-result v0

    if-eqz v0, :remote_lrc

    return-void

    :remote_lrc

    .line 343
    const-string v0, "lrc_info"

    .line 0
    const-string v1, "loadLrc: local check:"

    const-string v2, "loadLrc: server check:"

    .line 343
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loadLrc: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v4}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "title"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "AudioService"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    :try_start_0
    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "local_file_path"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 346
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 347
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v3

    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v6}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1000(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/zinhao/kikoeru/LocalFileCache;->getLrcText(Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 349
    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, "hash"

    if-eqz v3, :cond_0

    .line 350
    :try_start_1
    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 351
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1000(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/zinhao/kikoeru/Api;->doGetMediaString(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    return-void

    .line 354
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 356
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1100(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/zinhao/kikoeru/Api;->checkLrc(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 360
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lorg/json/JSONException;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_1
    return-void
.end method

.method private static makeFloatWindowParams(FF)Landroid/view/WindowManager$LayoutParams;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "y"
        }
    .end annotation

    .line 365
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    const/16 v1, 0x7f6

    .line 366
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    const v1, 0x800033

    .line 367
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v1, -0x2

    .line 368
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 369
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    const v1, 0x40028

    .line 370
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/4 v1, 0x1

    .line 373
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    float-to-int p0, p0

    .line 374
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    float-to-int p0, p1

    .line 375
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    return-object v0
.end method

.method private setupFloatLrc()V
    .locals 4

    .line 308
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcFloatView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 309
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/zinhao/kikoeru/R$layout;->lrc_layout:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 310
    new-instance v1, Lcom/zinhao/kikoeru/AudioService$3;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$3;-><init>(Lcom/zinhao/kikoeru/AudioService;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 338
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setLrcView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method private updateNotificationState()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 383
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-ne v0, v5, :cond_0

    .line 384
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0, v3}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 385
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v6}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    invoke-virtual {v0, v5, v6, v7, v2}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_0

    .line 386
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 387
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0, v4}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 388
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v6}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    invoke-virtual {v0, v1, v6, v7, v2}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_0

    .line 389
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlaybackState()I

    move-result v0

    if-ne v0, v1, :cond_2

    .line 390
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0, v3}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 391
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v6}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    invoke-virtual {v0, v5, v6, v7, v2}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    goto :goto_0

    .line 393
    :cond_2
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0, v3}, Landroid/support/v4/media/session/MediaSessionCompat;->setActive(Z)V

    .line 394
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v6}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7, v2}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setState(IJF)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 396
    :goto_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    const-wide/16 v6, 0x3b7

    invoke-virtual {v0, v6, v7}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->setActions(J)Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    .line 404
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService;->builder:Landroid/support/v4/media/session/PlaybackStateCompat$Builder;

    invoke-virtual {v2}, Landroid/support/v4/media/session/PlaybackStateCompat$Builder;->build()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/media/session/MediaSessionCompat;->setPlaybackState(Landroid/support/v4/media/session/PlaybackStateCompat;)V

    .line 406
    new-instance v0, Landroidx/core/app/NotificationCompat$Builder;

    const-string v2, "com.zinhao.kikoeru.play_control"

    invoke-direct {v0, p0, v2}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 407
    new-instance v2, Landroidx/media/app/NotificationCompat$MediaStyle;

    invoke-direct {v2}, Landroidx/media/app/NotificationCompat$MediaStyle;-><init>()V

    .line 408
    filled-new-array {v4}, [I

    move-result-object v6

    invoke-virtual {v2, v6}, Landroidx/media/app/NotificationCompat$MediaStyle;->setShowActionsInCompactView([I)Landroidx/media/app/NotificationCompat$MediaStyle;

    .line 409
    iget-object v6, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v6}, Landroid/support/v4/media/session/MediaSessionCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroidx/media/app/NotificationCompat$MediaStyle;->setMediaSession(Landroid/support/v4/media/session/MediaSessionCompat$Token;)Landroidx/media/app/NotificationCompat$MediaStyle;

    .line 410
    invoke-virtual {v0, v2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 412
    new-instance v2, Landroid/content/Intent;

    const-class v6, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {v2, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 413
    const-string v7, "com.zinhao.kikoeru.ACTION_SHOW_LRC"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v7, 0x4000000

    .line 414
    invoke-static {p0, v4, v2, v7}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 416
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 417
    const-string v9, "com.zinhao.kikoeru.ACTION_PLAY"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 418
    invoke-static {p0, v5, v8, v7}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 420
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 421
    const-string v9, "com.zinhao.kikoeru.ACTION_PAUSE"

    invoke-virtual {v8, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 422
    invoke-static {p0, v1, v8, v7}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 424
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 425
    const-string v6, "com.zinhao.kikoeru.ACTION_NEXT"

    invoke-virtual {v8, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v6, 0x4

    .line 426
    invoke-static {p0, v6, v8, v7}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 428
    sget v8, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_text_fields_24:I

    const-string v9, "show lrc"

    invoke-virtual {v0, v8, v9, v2}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 429
    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 430
    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_pause_24:I

    const-string v5, "pause"

    invoke-virtual {v0, v2, v5, v1}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_1

    .line 432
    :cond_3
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_play_arrow_24:I

    const-string v2, "play"

    invoke-virtual {v0, v1, v2, v5}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 434
    :goto_1
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_skip_next_24:I

    const-string v2, "next"

    invoke-virtual {v0, v1, v2, v6}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 435
    const-string v1, "service"

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 436
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_audiotrack_24:I

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 437
    invoke-virtual {v0, v4}, Landroidx/core/app/NotificationCompat$Builder;->setShowWhen(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 438
    invoke-virtual {v0, v4}, Landroidx/core/app/NotificationCompat$Builder;->setColorized(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 439
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 440
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 441
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 442
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v3, v1, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 443
    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1200(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/zinhao/kikoeru/Api;->minCoverImageUrl(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestBuilder;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    new-instance v2, Lcom/zinhao/kikoeru/AudioService$4;

    invoke-direct {v2, p0, v0}, Lcom/zinhao/kikoeru/AudioService$4;-><init>(Lcom/zinhao/kikoeru/AudioService;Landroidx/core/app/NotificationCompat$Builder;)V

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;

    const/4 p0, -0x1

    .line 457
    invoke-virtual {v0, p0}, Landroidx/core/app/NotificationCompat$Builder;->setColor(I)Landroidx/core/app/NotificationCompat$Builder;

    return-void

    .line 459
    :cond_4
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 460
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    const/16 v1, 0xc

    .line 461
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/zinhao/kikoeru/AudioService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "intent"
        }
    .end annotation

    .line 182
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    return-object p0
.end method

.method public onCreate()V
    .locals 3

    .line 187
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 188
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    .line 189
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService;->callback:Landroid/support/v4/media/session/MediaSessionCompat$Callback;

    invoke-virtual {v0, v1}, Landroid/support/v4/media/session/MediaSessionCompat;->setCallback(Landroid/support/v4/media/session/MediaSessionCompat$Callback;)V

    .line 190
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->getPosition()[F

    move-result-object v0

    const/4 v1, 0x0

    .line 191
    aget v1, v0, v1

    const/4 v2, 0x1

    aget v0, v0, v2

    invoke-static {v1, v0}, Lcom/zinhao/kikoeru/AudioService;->makeFloatWindowParams(FF)Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->lrcWindowParams:Landroid/view/WindowManager$LayoutParams;

    .line 192
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mHandler:Landroid/os/Handler;

    .line 193
    new-instance v0, Lcom/google/android/exoplayer2/ExoPlayer$Builder;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer2/ExoPlayer$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/BaiduPlayback;->configure(Landroid/content/Context;Lcom/google/android/exoplayer2/ExoPlayer$Builder;)V

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/ExoPlayer$Builder;->build()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaPlayer:Lcom/google/android/exoplayer2/ExoPlayer;

    .line 194
    new-instance v1, Lcom/zinhao/kikoeru/AudioService$2;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$2;-><init>(Lcom/zinhao/kikoeru/AudioService;)V

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer2/ExoPlayer;->addListener(Lcom/google/android/exoplayer2/Player$Listener;)V

    .line 293
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 294
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->headsetActionReceiver:Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

    iget-object v1, v0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->intentFilter:Landroid/content/IntentFilter;

    const/4 v2, 0x4

    invoke-virtual {p0, v0, v1, v2}, Lcom/zinhao/kikoeru/AudioService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_0

    .line 296
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->headsetActionReceiver:Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

    iget-object v1, v0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->intentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/AudioService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 298
    :goto_0
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;-><init>(Lcom/zinhao/kikoeru/AudioService;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/PlaybackPosition;->attach(Landroid/content/Context;Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    .line 300
    :try_start_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioService;->updateNotificationState()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioService;->setupFloatLrc()V

    return-void

    :catch_0
    move-exception p0

    .line 302
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public onDestroy()V
    .locals 1

    .line 494
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 496
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->headsetActionReceiver:Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 497
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->hideLrcFloatWindow()V

    .line 498
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->close()V

    const/4 v0, 0x0

    .line 499
    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 501
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "intent",
            "flags",
            "startId"
        }
    .end annotation

    if-eqz p1, :cond_7

    .line 467
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    .line 469
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onStartCommand : flag: %d, startId: %d action:%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    const-string v0, "com.zinhao.kikoeru.ACTION_NEXT"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 471
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->skipToNext()V

    goto :goto_0

    .line 472
    :cond_1
    const-string v0, "com.zinhao.kikoeru.ACTION_PAUSE"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 473
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    goto :goto_0

    .line 474
    :cond_2
    const-string v0, "com.zinhao.kikoeru.ACTION_PREVIOUS"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 475
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->skipToPrevious()V

    goto :goto_0

    .line 476
    :cond_3
    const-string v0, "com.zinhao.kikoeru.ACTION_PLAY"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 477
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->mediaSession:Landroid/support/v4/media/session/MediaSessionCompat;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    goto :goto_0

    .line 478
    :cond_4
    const-string v0, "com.zinhao.kikoeru.ACTION_SHOW_LRC"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 479
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->isLrcWindowShow()Z

    move-result v0

    if-nez v0, :cond_5

    .line 480
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->showLrcFloatWindow()V

    goto :goto_0

    .line 482
    :cond_5
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->hideLrcFloatWindow()V

    .line 485
    :cond_6
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0

    .line 468
    :cond_7
    :goto_1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0
.end method
