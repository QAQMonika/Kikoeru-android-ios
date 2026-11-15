.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lcom/zinhao/kikoeru/LrcRowChangeListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$2"
        }
    .end annotation

    .line 579
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 582
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1500(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc$LrcRow;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/zinhao/kikoeru/LrcRowChangeListener;->onSeekChange(Lcom/zinhao/kikoeru/Lrc$LrcRow;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "listener"
        }
    .end annotation

    .line 579
    check-cast p1, Lcom/zinhao/kikoeru/LrcRowChangeListener;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$2$1;->accept(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V

    return-void
.end method
