.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;
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

    .line 569
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->val$this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 572
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object v0, v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object v0, v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/exoplayer2/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 573
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object v1, v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$000(Lcom/zinhao/kikoeru/AudioService;)Lcom/google/android/exoplayer2/ExoPlayer;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/exoplayer2/ExoPlayer;->getCurrentPosition()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/zinhao/kikoeru/Lrc;->update(J)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    move-result-object v0

    .line 574
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1500(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    move-result-object v1

    if-eq v1, v0, :cond_1

    .line 575
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1, v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1502(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc$LrcRow;)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 576
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 577
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1500(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    move-result-object v1

    iget-object v1, v1, Lcom/zinhao/kikoeru/Lrc$LrcRow;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 579
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;)V

    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    :cond_1
    return-void
.end method
