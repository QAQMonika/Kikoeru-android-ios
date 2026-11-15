.class public final Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
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
        "com/zinhao/kikoeru/WorksActivity$onServiceConnected$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 413
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    if-nez p1, :cond_0

    .line 414
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    return-void

    .line 417
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 418
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    return-void

    .line 420
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    return-void
.end method
