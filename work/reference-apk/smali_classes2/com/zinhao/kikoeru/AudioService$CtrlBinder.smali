.class public Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
.super Landroid/os/Binder;
.source "AudioService.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/AudioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CtrlBinder"
.end annotation


# instance fields
.field private final checkLrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private current:Lorg/json/JSONObject;

.field private currentAlbumId:J

.field private currentIndex:I

.field private currentLrcRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

.field private final lastPlayListCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private lrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

.field private final lrcRowChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/LrcRowChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private lrcView:Landroid/view/View;

.field private lrcWindowShow:Z

.field private mLrc:Lcom/zinhao/kikoeru/Lrc;

.field private final mLrcUpdateTimer:Ljava/util/Timer;

.field private final musicChangeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/MusicChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private final playList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private final stopTask:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioService;

.field private final updateLrcTask:Ljava/lang/Runnable;

.field private final windowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/AudioService;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 565
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 508
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    .line 513
    sget-object v0, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    const/4 v0, 0x0

    .line 516
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    const/4 v0, 0x0

    .line 518
    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentLrcRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 521
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lastPlayListCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    .line 641
    new-instance v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->checkLrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    .line 692
    new-instance v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    .line 722
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->musicChangeListeners:Ljava/util/List;

    .line 723
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcRowChangeListeners:Ljava/util/List;

    .line 566
    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2}, Ljava/util/Timer;-><init>()V

    iput-object v2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrcUpdateTimer:Ljava/util/Timer;

    .line 567
    const-class v1, Landroid/view/WindowManager;

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/AudioService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->windowManager:Landroid/view/WindowManager;

    .line 568
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->readLastPlayList(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    .line 569
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/AudioService;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->updateLrcTask:Ljava/lang/Runnable;

    .line 590
    new-instance v3, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;

    invoke-direct {v3, p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/AudioService;)V

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0xc8

    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 597
    new-instance v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/AudioService;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->stopTask:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$1000(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->checkLrcCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)J
    .locals 2

    .line 507
    iget-wide v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    return-wide v0
.end method

.method static synthetic access$1400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;
    .locals 0

    .line 507
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentLrcRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc$LrcRow;)Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 0

    .line 507
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentLrcRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Landroid/view/View;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcRowChangeListeners:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/lang/Runnable;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->updateLrcTask:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->musicChangeListeners:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    return-object p0
.end method

.method static synthetic access$602(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0

    .line 507
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    return-object p1
.end method

.method static synthetic access$700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$900(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Landroid/view/WindowManager;
    .locals 0

    .line 507
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->windowManager:Landroid/view/WindowManager;

    return-object p0
.end method

.method private setCurrentAlbumId(J)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "currentAlbumId"
        }
    .end annotation

    .line 774
    iput-wide p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    .line 775
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->musicChangeListeners:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;J)V

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method private updateLastBottomView(Lcom/zinhao/kikoeru/MusicChangeListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 913
    iget-wide v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    invoke-interface {p1, v0, v1}, Lcom/zinhao/kikoeru/MusicChangeListener;->onAlbumChange(J)V

    .line 914
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->isPlaying()Z

    move-result v0

    invoke-interface {p1, v0}, Lcom/zinhao/kikoeru/MusicChangeListener;->onStatusChange(I)V

    .line 915
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    invoke-interface {p1, p0}, Lcom/zinhao/kikoeru/MusicChangeListener;->onAudioChange(Lorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method public getPlaybackQueue()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    return-object v0
.end method

.method public addLrcChangeListener(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 766
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcRowChangeListeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public addMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 730
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->musicChangeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 731
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 732
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->updateLastBottomView(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    :cond_0
    return-void
.end method

.method public close()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 921
    invoke-static {p0}, Lcom/zinhao/kikoeru/PlaybackPosition;->detach(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrcUpdateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 923
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 925
    invoke-virtual {v0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 926
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    .line 927
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->stop()V

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    move-wide v6, v0

    .line 929
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    iget-object v4, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result v5

    invoke-virtual/range {v2 .. v7}, Lcom/zinhao/kikoeru/LocalFileCache;->savePlayList(Landroid/content/Context;Ljava/util/List;IJ)V

    :cond_1
    return-void
.end method

.method public equalsCurrentPlay(Ljava/lang/String;I)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lrcTitle",
            "workId"
        }
    .end annotation

    int-to-long v0, p2

    .line 736
    iget-wide v2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    cmp-long p2, v0, v2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    return v0

    :cond_0
    if-nez p1, :cond_1

    return v0

    .line 741
    :cond_1
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    const-string v1, ".lrc"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    return v0

    .line 743
    :cond_2
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    if-nez p2, :cond_3

    return v0

    .line 746
    :cond_3
    :try_start_0
    const-string v1, "title"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 747
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    return v0

    .line 749
    :cond_4
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    return v0

    :cond_5
    const/16 v1, 0x2e

    .line 751
    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 752
    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 753
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p1

    .line 755
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 756
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    return v0
.end method

.method public getController()Landroid/support/v4/media/session/MediaControllerCompat;
    .locals 0

    .line 726
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    return-object p0
.end method

.method public getCurrent()Lorg/json/JSONObject;
    .locals 0

    .line 825
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    return-object p0
.end method

.method public getCurrentAlbumId()J
    .locals 2

    .line 829
    iget-wide v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    return-wide v0
.end method

.method public getCurrentTitle()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 901
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    if-nez p0, :cond_0

    .line 902
    const-string p0, ""

    return-object p0

    .line 903
    :cond_0
    const-string v0, "title"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getCurrentWorkTitle()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 907
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    if-nez p0, :cond_0

    .line 908
    const-string p0, ""

    return-object p0

    .line 909
    :cond_0
    const-string v0, "workTitle"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;
    .locals 0

    .line 719
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    return-object p0
.end method

.method public getLrc()Lcom/zinhao/kikoeru/Lrc;
    .locals 0

    .line 833
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    return-object p0
.end method

.method public getLrcFloatView()Landroid/view/View;
    .locals 0

    .line 855
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcView:Landroid/view/View;

    return-object p0
.end method

.method public getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 851
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$2000(Lcom/zinhao/kikoeru/AudioService;)Landroid/view/WindowManager$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public getReapMode()I
    .locals 0

    .line 897
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->getRepeatMode()I

    move-result p0

    return p0
.end method

.method public hideLrcFloatWindow()V
    .locals 2

    .line 876
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcView:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    .line 878
    :cond_0
    iget-boolean v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    if-eqz v1, :cond_1

    .line 879
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v1, v0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    :cond_1
    const/4 v0, 0x0

    .line 881
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    return-void
.end method

.method public insertLrcBind(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcPath"
        }
    .end annotation

    .line 841
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    return-void

    .line 844
    :cond_0
    const-string v1, "mediaStreamUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 845
    iget-wide v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentAlbumId:J

    .line 846
    new-instance p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;

    invoke-direct {p0, v1, v2, v0, p1}, Lcom/zinhao/kikoeru/db/AudioLrcBind;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    .line 847
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->insertLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V

    return-void
.end method

.method public isLrcWindowShow()Z
    .locals 0

    .line 634
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    return p0
.end method

.method public play(Ljava/util/List;I)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "playList",
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 784
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 786
    :cond_0
    invoke-static {p1}, Lcom/zinhao/kikoeru/LocalDeletion;->checkPlayback(Ljava/util/List;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/PlaybackPosition;->beforePlay(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 787
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 788
    iput p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->currentIndex:I

    .line 789
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->current:Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1, v0}, Lcom/zinhao/kikoeru/LocalPlayback;->note(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 790
    const-string v1, "workId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 791
    invoke-direct {p0, v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setCurrentAlbumId(J)V

    .line 792
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 793
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 795
    new-instance v2, Lcom/google/android/exoplayer2/MediaItem$Builder;

    invoke-direct {v2}, Lcom/google/android/exoplayer2/MediaItem$Builder;-><init>()V

    .line 796
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 797
    const-string v4, "local_file_path"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 798
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 799
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 800
    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/MediaItem$Builder;->setUri(Landroid/net/Uri;)Lcom/google/android/exoplayer2/MediaItem$Builder;

    goto :goto_2

    .line 802
    :cond_1
    const-string v4, "mediaStreamUrl"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 803
    const-string v5, "content://"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :goto_1

    invoke-static {v4}, Lcom/zinhao/kikoeru/BaiduPlayback;->isUri(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :goto_1

    const-string v5, "http"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    const-string v6, "?token="

    if-eqz v5, :cond_2

    .line 804
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 806
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v7

    invoke-virtual {v7}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v7

    invoke-virtual {v7}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 808
    :goto_1
    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer2/MediaItem$Builder;->setUri(Ljava/lang/String;)Lcom/google/android/exoplayer2/MediaItem$Builder;

    .line 810
    :goto_2
    new-instance v4, Lcom/google/android/exoplayer2/MediaMetadata$Builder;

    invoke-direct {v4}, Lcom/google/android/exoplayer2/MediaMetadata$Builder;-><init>()V

    .line 811
    const-string v5, "title"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/google/android/exoplayer2/MediaMetadata$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/exoplayer2/MediaMetadata$Builder;

    .line 812
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/MediaMetadata$Builder;->build()Lcom/google/android/exoplayer2/MediaMetadata;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/MediaItem$Builder;->setMediaMetadata(Lcom/google/android/exoplayer2/MediaMetadata;)Lcom/google/android/exoplayer2/MediaItem$Builder;

    .line 814
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/MediaItem$Builder;->build()Lcom/google/android/exoplayer2/MediaItem;

    move-result-object v2

    .line 816
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 819
    :cond_3
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p1

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->playList:Ljava/util/List;

    invoke-static {p0, v1, p2}, Lcom/zinhao/kikoeru/PlaybackPosition;->startPosition(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Ljava/util/List;I)J

    move-result-wide v1

    invoke-interface {p1, v0, p2, v1, v2}, Lcom/google/android/exoplayer2/ExoPlayer;->setMediaItems(Ljava/util/List;IJ)V

    .line 820
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/exoplayer2/ExoPlayer;->prepare()V

    .line 821
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->play()V

    return-void
.end method

.method public removeLrcChangeListener(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 770
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcRowChangeListeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 762
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->musicChangeListeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setLrc(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcText"
        }
    .end annotation

    .line 837
    new-instance v0, Lcom/zinhao/kikoeru/Lrc;

    invoke-direct {v0, p1}, Lcom/zinhao/kikoeru/Lrc;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    return-void
.end method

.method public setLocalLrc(Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setLrc(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcRowChangeListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :local_lrc_listener
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :local_lrc_done

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/LrcRowChangeListener;

    invoke-interface {v2, v0}, Lcom/zinhao/kikoeru/LrcRowChangeListener;->onLrcChange(Lcom/zinhao/kikoeru/Lrc;)V

    goto :local_lrc_listener

    :local_lrc_done
    return-void
.end method

.method public setLrcView(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcView"
        }
    .end annotation

    .line 859
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcView:Landroid/view/View;

    return-void
.end method

.method public setLrcWindowShow(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcWindowShow"
        }
    .end annotation

    .line 638
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    return-void
.end method

.method public setReapAll()V
    .locals 1

    .line 885
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/ExoPlayer;->setRepeatMode(I)V

    return-void
.end method

.method public setReapOff()V
    .locals 1

    .line 893
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/ExoPlayer;->setRepeatMode(I)V

    return-void
.end method

.method public setReapOne()V
    .locals 1

    .line 889
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lcom/google/android/exoplayer2/ExoPlayer;->setRepeatMode(I)V

    return-void
.end method

.method public showLrcFloatWindow()V
    .locals 3

    .line 863
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_0

    .line 868
    :cond_0
    iget-boolean v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    if-nez v1, :cond_1

    .line 869
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->windowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService;->access$2000(Lcom/zinhao/kikoeru/AudioService;)Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    const/4 v0, 0x1

    .line 871
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->lrcWindowShow:Z

    return-void

    .line 864
    :cond_2
    :goto_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    const-class v2, Lcom/zinhao/kikoeru/LrcFloatWindow;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    .line 865
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 866
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioService;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public stopAfterMinutes(I)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minute"
        }
    .end annotation

    .line 619
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$1300(Lcom/zinhao/kikoeru/AudioService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->stopTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 620
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$1300(Lcom/zinhao/kikoeru/AudioService;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->stopTask:Ljava/lang/Runnable;

    mul-int/lit8 v2, p1, 0x3c

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 621
    new-instance v0, Landroidx/core/app/NotificationCompat$Builder;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    const-string v2, "com.zinhao.kikoeru.play_control"

    invoke-direct {v0, v1, v2}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 622
    const-string v1, "status"

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setCategory(Ljava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;

    .line 623
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_audiotrack_24:I

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 624
    const-string v1, "delay stop"

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v1, 0x1

    .line 625
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 626
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/16 v2, 0xc

    .line 627
    invoke-virtual {v1, v2, p1}, Ljava/util/Calendar;->add(II)V

    .line 628
    invoke-static {}, Lcom/zinhao/kikoeru/AudioService;->access$1900()Ljava/text/SimpleDateFormat;

    move-result-object p1

    new-instance v2, Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 629
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    const-class p1, Landroid/app/NotificationManager;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    const/16 p1, 0xd

    .line 630
    invoke-virtual {v0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    return-void
.end method
