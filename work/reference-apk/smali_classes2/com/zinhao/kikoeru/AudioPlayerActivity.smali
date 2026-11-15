.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Landroid/content/ServiceConnection;
.implements Lcom/zinhao/kikoeru/MusicChangeListener;
.implements Lcom/zinhao/kikoeru/LrcRowChangeListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00ba\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005B\u0007\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0012\u0010\u001f\u001a\u00020 2\u0008\u0010!\u001a\u0004\u0018\u00010\"H\u0014J\u0008\u0010%\u001a\u00020 H\u0002J\u0008\u0010,\u001a\u00020 H\u0002J\u0008\u0010/\u001a\u00020 H\u0002J\u001c\u00100\u001a\u00020 2\u0008\u00101\u001a\u0004\u0018\u0001022\u0008\u00103\u001a\u0004\u0018\u000104H\u0016J\u0012\u00105\u001a\u00020 2\u0008\u00101\u001a\u0004\u0018\u000102H\u0016J\u0010\u00106\u001a\u00020 2\u0006\u00107\u001a\u000208H\u0016J\u0008\u00109\u001a\u00020 H\u0002J\u0012\u0010:\u001a\u00020 2\u0008\u0010;\u001a\u0004\u0018\u00010<H\u0016J\u0010\u0010=\u001a\u00020 2\u0006\u0010>\u001a\u00020\'H\u0016J\u0012\u0010?\u001a\u00020 2\u0008\u0010@\u001a\u0004\u0018\u00010AH\u0016J\u0012\u0010B\u001a\u00020 2\u0008\u0010C\u001a\u0004\u0018\u00010DH\u0016J\u0010\u0010E\u001a\u00020 2\u0006\u0010F\u001a\u00020GH\u0016J\u0008\u0010H\u001a\u00020 H\u0002J\u0008\u0010I\u001a\u00020 H\u0014J\"\u0010J\u001a\u00020 2\u0008\u0010K\u001a\u0004\u0018\u00010L2\u0006\u0010M\u001a\u00020G2\u0006\u0010N\u001a\u00020\u001cH\u0016J\u0012\u0010O\u001a\u00020 2\u0008\u0010K\u001a\u0004\u0018\u00010LH\u0016J\u0012\u0010P\u001a\u00020 2\u0008\u0010K\u001a\u0004\u0018\u00010LH\u0016R\u0014\u0010\u0008\u001a\u0008\u0018\u00010\tR\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u001eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010#\u001a\u0004\u0018\u00010$X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010&\u001a\u00020\'X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+R\u000e\u0010-\u001a\u00020.X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006Q"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/AudioPlayerActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Landroid/content/ServiceConnection;",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        "Lcom/zinhao/kikoeru/LrcRowChangeListener;",
        "Landroid/widget/SeekBar$OnSeekBarChangeListener;",
        "<init>",
        "()V",
        "ctrlBinder",
        "Lcom/zinhao/kikoeru/AudioService$CtrlBinder;",
        "Lcom/zinhao/kikoeru/AudioService;",
        "imageView",
        "Landroid/widget/ImageView;",
        "rootView",
        "Landroid/view/View;",
        "tvTitle",
        "Landroid/widget/TextView;",
        "ibPrevious",
        "Landroid/widget/ImageButton;",
        "ibPause",
        "ibNext",
        "ibSleep",
        "ibLoop",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "timeProgressView",
        "Lcom/zinhao/kikoeru/TimeProgressView;",
        "needShowLrcWhenDestroy",
        "",
        "lrcAdapter",
        "Lcom/zinhao/kikoeru/LrcAdapter;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "sleepMenu",
        "Landroidx/appcompat/widget/ListPopupWindow;",
        "setupSleepMenu",
        "lastScrollIDLE",
        "",
        "getLastScrollIDLE",
        "()J",
        "setLastScrollIDLE",
        "(J)V",
        "setupLrc",
        "searchWorkCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "updateLoopIcon",
        "onServiceConnected",
        "name",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
        "onSeekChange",
        "lrcRow",
        "Lcom/zinhao/kikoeru/Lrc$LrcRow;",
        "scrollToLrcPosition",
        "onLrcChange",
        "lrc",
        "Lcom/zinhao/kikoeru/Lrc;",
        "onAlbumChange",
        "rjNumber",
        "onAudioChange",
        "audio",
        "Lorg/json/JSONObject;",
        "setTitle",
        "title",
        "",
        "onStatusChange",
        "status",
        "",
        "updateSeek",
        "onDestroy",
        "onProgressChanged",
        "seekBar",
        "Landroid/widget/SeekBar;",
        "progress",
        "fromUser",
        "onStartTrackingTouch",
        "onStopTrackingTouch",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private ibLoop:Landroid/widget/ImageButton;

.field private ibNext:Landroid/widget/ImageButton;

.field private ibPause:Landroid/widget/ImageButton;

.field private ibPrevious:Landroid/widget/ImageButton;

.field private ibSleep:Landroid/widget/ImageButton;

.field private imageView:Landroid/widget/ImageView;

.field private lastScrollIDLE:J

.field private lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

.field private lrcFollowActive:Z

.field private lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

.field private needShowLrcWhenDestroy:Z

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private rootView:Landroid/view/View;

.field private final searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

.field private timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

.field private tvTitle:Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$AtaL8ljgkDc7h_nZ4tMd06zIE8U(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onCreate$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Ht2CVIc7SyuAgfKNhUJR4-LyRlo(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onSeekChange$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IdNTI3uORGf2pz2gy2U5F7f97Ic(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onServiceConnected$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Ks1nHIBhv-Q3ooVjM-x_f2YEFEc(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onLrcChange$lambda$2(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Oda9dwN1CaFLbK8w3yZ8_ZMOhto(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setupLrc$lambda$0$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$cyRi4_9U7yUnEeIaF9scfxplfQM(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setupSleepMenu$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic $r8$lambda$ewyMNtMwSIW5vbRlZRx2uqJHdYA(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onLrcChange$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jouraGvFLsjBZyy8ljdtWTZ5478(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onServiceConnected$lambda$1(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$nnaWnJi_Lh_p8cF8QyV8fuf0UA4(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->onLrcChange$lambda$1(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 180
    new-instance v0, Lcom/zinhao/kikoeru/AudioPlayerActivity$searchWorkCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$searchWorkCallback$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-void
.end method

.method public static final synthetic access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    return-object p0
.end method

.method public static final synthetic access$getImageView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Landroid/widget/ImageView;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method public static final synthetic access$getRootView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Landroid/view/View;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->rootView:Landroid/view/View;

    return-object p0
.end method

.method public static final synthetic access$getSleepMenu$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Landroidx/appcompat/widget/ListPopupWindow;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    return-object p0
.end method

.method public static final synthetic access$getTimeProgressView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/TimeProgressView;
    .locals 0

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    return-object p0
.end method

.method public static final synthetic access$updateLoopIcon(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->updateLoopIcon()V

    return-void
.end method

.method public static final synthetic access$updateSeek(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->updateSeek()V

    return-void
.end method

.method private static final onCreate$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V
    .locals 2

    .line 60
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/zinhao/kikoeru/LocalPlayback;->ignoreNetworkSubtitle(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Z

    move-result v0

    if-eqz v0, :remote_current_work

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->finish()V

    return-void

    :remote_current_work

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrentAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, v0, p0}, Lcom/zinhao/kikoeru/Api;->doGetWork(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method private static final onLrcChange$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 1

    .line 270
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    if-eqz p0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    :cond_0
    return-void
.end method

.method private static final onLrcChange$lambda$1(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 1

    .line 272
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    if-eqz p0, :cond_0

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    :cond_0
    return-void
.end method

.method private static final onLrcChange$lambda$2(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    .line 275
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setupLrc()V

    return-void
.end method

.method private static final onSeekChange$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LrcAdapter;->update()V

    .line 250
    :cond_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->scrollToLrcPosition()V

    return-void
.end method

.method private static final onServiceConnected$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 1

    .line 237
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    if-eqz p0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    :cond_0
    return-void
.end method

.method private static final onServiceConnected$lambda$1(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 1

    .line 239
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    if-eqz p0, :cond_0

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    :cond_0
    return-void
.end method

.method private final scrollToLrcPosition()V
    .locals 1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :done

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LrcAutoFollow;->follow()V

    :done
    return-void
.end method

.method private final setupLrc()V
    .locals 3

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :follow_disposed

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LrcAutoFollow;->dispose()V

    :follow_disposed
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    .line 155
    sget v0, Lcom/zinhao/kikoeru/R$id;->mainRecycler:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0}, Lcom/zinhao/kikoeru/LrcSelection;->configure(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 156
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 157
    new-instance v1, Lcom/zinhao/kikoeru/LrcAdapter;

    invoke-direct {v1, v0}, Lcom/zinhao/kikoeru/LrcAdapter;-><init>(Lcom/zinhao/kikoeru/Lrc;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

    .line 158
    new-instance v0, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda8;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/LrcAdapter;->setOnToHereClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 167
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/zinhao/kikoeru/LrcAutoFollow;

    invoke-direct {v1, p0, v0}, Lcom/zinhao/kikoeru/LrcAutoFollow;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    iget-boolean v2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcFollowActive:Z

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/LrcAutoFollow;->setActive(Z)V

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/LrcAutoFollow;->alignCurrent()V

    :cond_0
    return-void
.end method

.method private static final setupLrc$lambda$0$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/view/View;)V
    .locals 3

    if-eqz p1, :cond_1

    .line 159
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 160
    instance-of v0, p1, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->resumeLrcFollowAtRow(Lcom/zinhao/kikoeru/Lrc$LrcRow;)V

    iget-wide v1, p1, Lcom/zinhao/kikoeru/Lrc$LrcRow;->time:J

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->seekTo(J)V

    .line 162
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcAdapter;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method

.method private final setupSleepMenu()V
    .locals 7

    .line 128
    new-instance v0, Landroidx/appcompat/widget/ListPopupWindow;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    .line 129
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 130
    new-instance v2, Landroid/widget/ArrayAdapter;

    const/4 v3, 0x6

    .line 133
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "30 minutes"

    aput-object v5, v3, v4

    const-string v4, "1 hours"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    const-string v6, "90 minutes"

    aput-object v6, v3, v4

    const/4 v4, 0x3

    const-string v6, "2 hours"

    aput-object v6, v3, v4

    const/4 v4, 0x4

    const-string v6, "150 minutes"

    aput-object v6, v3, v4

    const/4 v4, 0x5

    const-string v6, "3 hours"

    aput-object v6, v3, v4

    .line 132
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v4, 0x1090003

    .line 130
    invoke-direct {v2, v1, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    check-cast v2, Landroid/widget/ListAdapter;

    .line 129
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 137
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/ListPopupWindow;->setModal(Z)V

    .line 138
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibSleep:Landroid/widget/ImageButton;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 139
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    const/high16 v2, 0x43020000    # 130.0f

    invoke-static {v5, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setWidth(I)V

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda4;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method private static final setupSleepMenu$lambda$0(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 141
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->sleepMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    const/4 p1, 0x1

    add-int/2addr p3, p1

    mul-int/lit8 p3, p3, 0x1e

    .line 146
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz p2, :cond_0

    invoke-virtual {p2, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->stopAfterMinutes(I)V

    .line 148
    :cond_0
    check-cast p0, Landroid/content/Context;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p4, "will stop after "

    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " minutes"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-static {p0, p2, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private final updateLoopIcon()V
    .locals 2

    .line 205
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-nez v0, :cond_0

    goto :goto_0

    .line 206
    :cond_0
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 207
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibLoop:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_flip_camera_android_24:I

    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void

    .line 208
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 209
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibLoop:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_loop_24:I

    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void

    .line 210
    :cond_2
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result v0

    if-nez v0, :cond_3

    .line 211
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibLoop:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_close_24:I

    invoke-virtual {p0, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    :cond_3
    :goto_0
    return-void
.end method

.method private final updateSeek()V
    .locals 4

    .line 339
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v1, Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/TimeProgressView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method public final getLastScrollIDLE()J
    .locals 2

    .line 152
    iget-wide v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lastScrollIDLE:J

    return-wide v0
.end method

.method public onAlbumChange(J)V
    .locals 3

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    invoke-static {p0, v0, p1, p2}, Lcom/zinhao/kikoeru/PlayerArtwork;->bindLocal(Landroid/content/Context;Landroid/widget/ImageView;J)Z

    move-result v0

    if-eqz v0, :native_remote_art

    return-void

    :native_remote_art

    .line 280
    move-object v0, p0

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/RequestManager;->asBitmap()Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string v2, "/api/cover/%d"

    invoke-static {v1, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "format(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/Api;->formatGetUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/RequestBuilder;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 281
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p2

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;

    invoke-direct {v0, p0, p2}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/widget/ImageView;)V

    check-cast v0, Lcom/bumptech/glide/request/target/Target;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;

    return-void
.end method

.method public onAudioChange(Lorg/json/JSONObject;)V
    .locals 0

    .line 312
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast p1, Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 55
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    sget p1, Lcom/zinhao/kikoeru/R$layout;->activity_player:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setContentView(I)V

    .line 57
    sget p1, Lcom/zinhao/kikoeru/R$id;->root:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string v0, "findViewById(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->rootView:Landroid/view/View;

    .line 58
    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/BaseActivity;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    const-string p1, "rootView"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_0
    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3, v2}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea$default(Lcom/zinhao/kikoeru/BaseActivity;Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;ILjava/lang/Object;)V

    .line 59
    sget p1, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->imageView:Landroid/widget/ImageView;

    .line 60
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda7;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    sget p1, Lcom/zinhao/kikoeru/R$id;->ib1:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPrevious:Landroid/widget/ImageButton;

    .line 62
    sget p1, Lcom/zinhao/kikoeru/R$id;->ib2:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPause:Landroid/widget/ImageButton;

    .line 63
    sget p1, Lcom/zinhao/kikoeru/R$id;->ib3:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibNext:Landroid/widget/ImageButton;

    .line 64
    sget p1, Lcom/zinhao/kikoeru/R$id;->imageButton2:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibSleep:Landroid/widget/ImageButton;

    .line 65
    sget p1, Lcom/zinhao/kikoeru/R$id;->ibLoop:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibLoop:Landroid/widget/ImageButton;

    .line 66
    sget p1, Lcom/zinhao/kikoeru/R$id;->textView13:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->tvTitle:Landroid/widget/TextView;

    .line 67
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setupSleepMenu()V

    .line 68
    sget p1, Lcom/zinhao/kikoeru/R$id;->time_view:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/TimeProgressView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    .line 69
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    sget v1, Lcom/zinhao/kikoeru/R$color;->play_control_icon_color:I

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setColor(I)V

    .line 70
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPause:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPrevious:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$3;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$3;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibNext:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$4;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$4;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibLoop:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, p0

    check-cast v1, Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 123
    new-instance p1, Landroid/content/Intent;

    const-class v1, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :follow_destroyed

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LrcAutoFollow;->dispose()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    :follow_destroyed

    .line 354
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :cond_0

    .line 355
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/LrcRowChangeListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->removeLrcChangeListener(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V

    .line 356
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->removeMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    .line 357
    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 358
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->isLrcWindowShow()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->needShowLrcWhenDestroy:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->showLrcFloatWindow()V

    .line 360
    :cond_0
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V

    return-void
.end method

.method public onLrcChange(Lcom/zinhao/kikoeru/Lrc;)V
    .locals 1

    .line 269
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    sget-object v0, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 270
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 272
    :cond_1
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda2;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda2;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 274
    :goto_1
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda3;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda3;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p3, :cond_0

    .line 365
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    int-to-long p1, p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->seekTo(J)V

    :cond_0
    return-void
.end method

.method public onSeekChange(Lcom/zinhao/kikoeru/Lrc$LrcRow;)V
    .locals 1

    const-string v0, "lrcRow"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 248
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    .line 216
    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    .line 217
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {p2, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->addMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    .line 218
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object p2, p0

    check-cast p2, Lcom/zinhao/kikoeru/LrcRowChangeListener;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->addLrcChangeListener(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V

    .line 219
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->isLrcWindowShow()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 220
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->needShowLrcWhenDestroy:Z

    .line 221
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->hideLrcFloatWindow()V

    .line 223
    :cond_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->updateLoopIcon()V

    .line 224
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibSleep:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance p2, Lcom/zinhao/kikoeru/AudioPlayerActivity$onServiceConnected$1;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onServiceConnected$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast p2, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 229
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p2

    invoke-interface {p2}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v0

    long-to-int p2, v0

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/TimeProgressView;->setMax(I)V

    .line 230
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz p1, :cond_1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 231
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p1

    invoke-interface {p1}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide p1

    .line 232
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getBufferedPosition()J

    move-result-wide v0

    .line 233
    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    long-to-int p1, p1

    long-to-int p2, v0

    invoke-virtual {v2, p1, p2}, Lcom/zinhao/kikoeru/TimeProgressView;->setProgress(II)V

    .line 235
    :cond_1
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->updateSeek()V

    .line 236
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    sget-object p2, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 237
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda5;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 239
    :cond_3
    new-instance p1, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda6;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$$ExternalSyntheticLambda6;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 241
    :goto_1
    invoke-direct {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setupLrc()V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStatusChange(I)V
    .locals 3

    .line 330
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->timeProgressView:Lcom/zinhao/kikoeru/TimeProgressView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setMax(I)V

    if-nez p1, :cond_0

    .line 332
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPause:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_play_arrow_24:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void

    .line 334
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ibPause:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_pause_24:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public final setLastScrollIDLE(J)V
    .locals 0

    .line 152
    iput-wide p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lastScrollIDLE:J

    return-void
.end method

.method public final getLrcFollowIndex()I
    .locals 1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :missing

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    if-eqz v0, :missing

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Lrc;->getCurrentIndex()I

    move-result v0

    return v0

    :missing
    const/4 v0, -0x1

    return v0
.end method

.method public final isLrcFollowPlaying()Z
    .locals 1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :paused

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    if-eqz v0, :paused

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->isPlaying()Z

    move-result v0

    return v0

    :paused
    const/4 v0, 0x0

    return v0
.end method

.method public final syncLrcFollowIndex()I
    .locals 4

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :missing

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    if-eqz v1, :missing

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    if-eqz v0, :missing

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/zinhao/kikoeru/Lrc;->update(J)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAdapter:Lcom/zinhao/kikoeru/LrcAdapter;

    if-eqz v3, :current_index

    invoke-virtual {v3}, Lcom/zinhao/kikoeru/LrcAdapter;->update()V

    :current_index
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Lrc;->getCurrentIndex()I

    move-result v0

    return v0

    :missing
    const/4 v0, -0x1

    return v0
.end method

.method public final resumeLrcFollowAtRow(Lcom/zinhao/kikoeru/Lrc$LrcRow;)V
    .locals 2

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :done

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrc()Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    if-eqz v0, :done

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Lrc;->getLrcRows()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :done

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LrcAutoFollow;->resumeAt(I)V

    :done
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public finish()V
    .locals 0

    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->finish()V

    return-void
.end method

.method protected onStart()V
    .locals 2

    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onStart()V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcFollowActive:Z

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :done

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LrcAutoFollow;->setActive(Z)V

    :done
    return-void
.end method

.method protected onStop()V
    .locals 2

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcFollowActive:Z

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->lrcAutoFollow:Lcom/zinhao/kikoeru/LrcAutoFollow;

    if-eqz v0, :done

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LrcAutoFollow;->setActive(Z)V

    :done
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onStop()V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 326
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity;->tvTitle:Landroid/widget/TextView;

    if-nez p0, :cond_0

    const-string p0, "tvTitle"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
