.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder;-><init>(Lcom/zinhao/kikoeru/AudioService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field final synthetic val$this$0:Lcom/zinhao/kikoeru/AudioService;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/AudioService;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$this$0"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 597
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;->val$this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 600
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 603
    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 606
    :cond_1
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v1

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/App;->noActiveActivity()Z

    move-result v1

    const-string v2, "AudioService"

    if-eqz v1, :cond_2

    .line 607
    const-string v1, "timer stop: stop service"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 608
    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->stop()V

    .line 609
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$4;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService;->stopSelf()V

    return-void

    .line 611
    :cond_2
    const-string p0, "timer stop: pause media"

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    return-void
.end method
