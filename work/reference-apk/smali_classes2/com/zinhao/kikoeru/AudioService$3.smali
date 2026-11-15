.class Lcom/zinhao/kikoeru/AudioService$3;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService;->setupFloatLrc()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private downX:F

.field private downY:F

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

    .line 310
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "v",
            "event"
        }
    .end annotation

    .line 315
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 316
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Lcom/zinhao/kikoeru/AudioService$3;->downX:F

    .line 317
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Lcom/zinhao/kikoeru/AudioService$3;->downY:F

    goto/16 :goto_0

    .line 318
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v0, :cond_1

    .line 319
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 320
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p2}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p2

    iget p2, p2, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float p2, p2

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object p0

    iget p0, p0, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float p0, p0

    invoke-virtual {p1, p2, p0}, Lcom/zinhao/kikoeru/App;->savePosition(FF)V

    goto :goto_0

    .line 321
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_3

    .line 323
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    .line 324
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    .line 325
    iget v1, p0, Lcom/zinhao/kikoeru/AudioService$3;->downX:F

    sub-float v1, p1, v1

    .line 326
    iget v2, p0, Lcom/zinhao/kikoeru/AudioService$3;->downY:F

    sub-float v2, p2, v2

    .line 327
    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v3}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 328
    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v3}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v4, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    int-to-float v4, v4

    add-float/2addr v4, v1

    float-to-int v1, v4

    iput v1, v3, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 329
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v3, v3

    add-float/2addr v3, v2

    float-to-int v2, v3

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 330
    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$900(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Landroid/view/WindowManager;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v2}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcFloatView()Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/AudioService$3;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {v3}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getLrcWindowParams()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 332
    :cond_2
    iput p1, p0, Lcom/zinhao/kikoeru/AudioService$3;->downX:F

    .line 333
    iput p2, p0, Lcom/zinhao/kikoeru/AudioService$3;->downY:F

    :cond_3
    :goto_0
    return v0
.end method
