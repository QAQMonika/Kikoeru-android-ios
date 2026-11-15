.class public Lcom/zinhao/kikoeru/VideoPlayerActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;
.implements Lcom/zinhao/kikoeru/MusicChangeListener;


# instance fields
.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private playerView:Lcom/google/android/exoplayer2/ui/StyledPlayerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onAlbumChange(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rjNumber"
        }
    .end annotation

    return-void
.end method

.method public onAudioChange(Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audio"
        }
    .end annotation

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 18
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    sget p1, Lcom/zinhao/kikoeru/R$layout;->activity_video_player:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/VideoPlayerActivity;->setContentView(I)V

    .line 20
    sget p1, Lcom/zinhao/kikoeru/R$id;->exoplayer:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/VideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/exoplayer2/ui/StyledPlayerView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/VideoPlayerActivity;->playerView:Lcom/google/android/exoplayer2/ui/StyledPlayerView;

    .line 21
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p0, v0}, Lcom/zinhao/kikoeru/VideoPlayerActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 53
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V

    .line 54
    invoke-virtual {p0, p0}, Lcom/zinhao/kikoeru/VideoPlayerActivity;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "service"
        }
    .end annotation

    .line 26
    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/VideoPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    .line 27
    invoke-virtual {p2, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->addMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    .line 28
    iget-object p1, p0, Lcom/zinhao/kikoeru/VideoPlayerActivity;->playerView:Lcom/google/android/exoplayer2/ui/StyledPlayerView;

    iget-object p0, p0, Lcom/zinhao/kikoeru/VideoPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/exoplayer2/ui/StyledPlayerView;->setPlayer(Lcom/google/android/exoplayer2/Player;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 33
    iget-object p1, p0, Lcom/zinhao/kikoeru/VideoPlayerActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->removeMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    return-void
.end method

.method public onStatusChange(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "status"
        }
    .end annotation

    return-void
.end method
