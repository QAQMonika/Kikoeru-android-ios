.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
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

    .line 641
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "asyncHttpResponse",
            "lrcResult"
        }
    .end annotation

    .line 646
    const-string p2, "AudioService"

    const/4 v0, 0x0

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/LocalPlayback;->ignoreNetworkSubtitle(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Z

    move-result v0

    if-eqz v0, :network_lrc_check

    return-void

    :network_lrc_check

    if-eqz p1, :cond_0

    .line 647
    iget-object p3, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object v1, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p3, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    .line 648
    iget-object p3, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p3, p3, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p3, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    .line 649
    const-string p1, "LRC RESULT: ERR"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    if-nez p3, :cond_1

    .line 651
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object p3, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    .line 652
    const-string p1, "LRC RESULT: NULL"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 654
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "LRC RESULT:"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    :try_start_0
    const-string p1, "result"

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    .line 659
    :try_start_1
    const-string v0, "hash"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1000(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/zinhao/kikoeru/Api;->doGetMediaString(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move v0, p1

    goto :goto_1

    :catch_0
    move-exception p3

    move v0, p1

    goto :goto_0

    .line 661
    :cond_2
    :try_start_2
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object p3, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p3

    .line 664
    :goto_0
    invoke-virtual {p3}, Lorg/json/JSONException;->printStackTrace()V

    .line 665
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p1, p1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    .line 666
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    sget-object p3, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1402(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Lcom/zinhao/kikoeru/Lrc;)Lcom/zinhao/kikoeru/Lrc;

    :goto_1
    if-nez v0, :cond_3

    .line 670
    const-string p1, "onCompleted: use audio lrc bind"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1200(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)J

    move-result-wide p2

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "mediaStreamUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$1;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;)V

    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/zinhao/kikoeru/App;->getLrcBind(JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V

    .line 683
    :cond_3
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1700(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Ljava/util/List;

    move-result-object p1

    new-instance p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$2;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$2;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;)V

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
            "lrcResult"
        }
    .end annotation

    .line 641
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
