.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;
.super Ljava/util/TimerTask;
.source "AudioService.java"


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

    .line 590
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;->val$this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 593
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object v0, v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$1300(Lcom/zinhao/kikoeru/AudioService;)Landroid/os/Handler;

    move-result-object v0

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$3;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1800(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/lang/Runnable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
