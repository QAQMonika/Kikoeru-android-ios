.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity;->updateSeek()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1",
        "Ljava/lang/Runnable;",
        "run",
        "",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 339
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 341
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    .line 342
    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    .line 345
    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/exoplayer2/ExoPlayer;->getBufferedPosition()J

    move-result-wide v2

    .line 346
    iget-object v4, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v4}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getTimeProgressView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/TimeProgressView;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    long-to-int v0, v0

    long-to-int v1, v2

    invoke-virtual {v4, v0, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setProgress(II)V

    .line 348
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$updateSeek$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$updateSeek(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    :cond_1
    return-void
.end method
