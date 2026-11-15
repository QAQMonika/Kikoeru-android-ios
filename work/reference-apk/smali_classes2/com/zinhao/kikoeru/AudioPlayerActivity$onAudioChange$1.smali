.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity;->onAudioChange(Lorg/json/JSONObject;)V
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
        "com/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 315
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getTimeProgressView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/TimeProgressView;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getExoPlayer()Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getDuration()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setMax(I)V

    .line 316
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrentTitle()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 318
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 319
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAudioChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
