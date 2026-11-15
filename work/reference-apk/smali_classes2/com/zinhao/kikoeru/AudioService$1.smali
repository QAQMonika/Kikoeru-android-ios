.class Lcom/zinhao/kikoeru/AudioService$1;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/AudioService;
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

    .line 72
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMediaButtonEvent(Landroid/content/Intent;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mediaButtonEvent"
        }
    .end annotation

    .line 113
    const-string v0, "android.intent.extra.KEY_EVENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/view/KeyEvent;

    if-eqz v0, :cond_1

    .line 114
    invoke-virtual {v0}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    invoke-virtual {v0}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onMediaButtonEvent: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-super {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onMediaButtonEvent(Landroid/content/Intent;)Z

    move-result p0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public onPause()V
    .locals 0

    .line 81
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onPause()V

    .line 82
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->pause()V

    return-void
.end method

.method public onPlay()V
    .locals 0

    .line 87
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onPlay()V

    .line 88
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->play()V

    return-void
.end method

.method public onPrepare()V
    .locals 2

    .line 124
    const-string v0, "AudioService"

    const-string v1, "onPrepare: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onPrepare()V

    return-void
.end method

.method public onSeekTo(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pos"
        }
    .end annotation

    .line 75
    invoke-super {p0, p1, p2}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onSeekTo(J)V

    .line 76
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/android/exoplayer2/ExoPlayer;->seekTo(J)V

    return-void
.end method

.method public onSkipToNext()V
    .locals 2

    .line 93
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onSkipToNext()V

    .line 94
    const-string v0, "AudioService"

    const-string v1, "onSkipToNext: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->seekToNextMediaItem()V

    return-void
.end method

.method public onSkipToPrevious()V
    .locals 2

    .line 100
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onSkipToPrevious()V

    .line 101
    const-string v0, "AudioService"

    const-string v1, "onSkipToPrevious: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->seekToPreviousMediaItem()V

    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-static {}, Lcom/zinhao/kikoeru/PlaybackPosition;->flush()V

    .line 107
    invoke-super {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;->onStop()V

    .line 108
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$1;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/android/exoplayer2/ExoPlayer;->stop()V

    return-void
.end method
