.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 692
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "asyncHttpResponse",
            "s"
        }
    .end annotation

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/LocalPlayback;->ignoreNetworkSubtitle(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Z

    move-result v0

    if-eqz v0, :network_lrc_callback

    return-void

    :network_lrc_callback

    if-eqz p1, :cond_0

    .line 696
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object p3, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p2, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    .line 697
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-nez p2, :cond_1

    return-void

    .line 703
    :cond_1
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 v0, 0xc8

    if-ne p1, v0, :cond_2

    .line 704
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    new-instance p2, Lcom/zinhao/kikoeru/Lrc;

    invoke-direct {p2, p3}, Lcom/zinhao/kikoeru/Lrc;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    goto :goto_0

    .line 706
    :cond_2
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object p3, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    .line 707
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "onCompleted: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AudioService"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 709
    :goto_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object p1

    new-instance p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6$1;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;)V

    invoke-interface {p1, p2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "e",
            "asyncHttpResponse",
            "s"
        }
    .end annotation

    .line 692
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$6;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V

    return-void
.end method
