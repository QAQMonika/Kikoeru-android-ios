.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/AudioPlayerActivity$onCreate$2",
        "Landroid/view/View$OnClickListener;",
        "onClick",
        "",
        "v",
        "Landroid/view/View;",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 72
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    .line 74
    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 76
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 77
    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 78
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    return-void

    .line 80
    :cond_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    :cond_3
    :goto_0
    return-void
.end method
