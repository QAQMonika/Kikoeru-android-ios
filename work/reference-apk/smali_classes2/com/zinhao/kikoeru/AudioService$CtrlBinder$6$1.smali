.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V
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
.field final synthetic this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$2"
        }
    .end annotation

    .line 709
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;

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

    .line 712
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1400(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/zinhao/kikoeru/Lrc;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/zinhao/kikoeru/LrcRowChangeListener;->onLrcChange(Lcom/zinhao/kikoeru/Lrc;)V

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

    .line 709
    check-cast p1, Lcom/zinhao/kikoeru/LrcRowChangeListener;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;->accept(Lcom/zinhao/kikoeru/LrcRowChangeListener;)V

    return-void
.end method
