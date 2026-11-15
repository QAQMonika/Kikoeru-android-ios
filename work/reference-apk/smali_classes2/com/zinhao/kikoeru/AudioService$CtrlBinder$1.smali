.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;
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

    .line 521
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

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
            "jsonObject"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 525
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    return-void

    .line 528
    :cond_0
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-ne p1, p2, :cond_2

    .line 530
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 532
    :try_start_0
    const-string p2, "playlist"

    invoke-virtual {p3, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    const/4 v0, 0x0

    .line 533
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 534
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 536
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-eqz p2, :cond_2

    .line 537
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p2, p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p2}, Lcom/zinhao/kikoeru/AudioService;->access$1300(Lcom/zinhao/kikoeru/AudioService;)Landroid/os/Handler;

    move-result-object p2

    new-instance v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;

    invoke-direct {v0, p0, p3, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;-><init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;Lorg/json/JSONObject;Ljava/util/List;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 558
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 559
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    :cond_2
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
            "jsonObject"
        }
    .end annotation

    .line 521
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
