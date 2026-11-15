.class Lcom/zinhao/kikoeru/DownloadUtils$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
.source "DownloadUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/DownloadUtils;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/DownloadUtils;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/DownloadUtils;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 371
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V
    .locals 0
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

    if-eqz p1, :cond_0

    .line 375
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void

    .line 379
    :cond_0
    :try_start_0
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, p3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 380
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge p1, p2, :cond_1

    .line 381
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p2

    .line 382
    new-instance p3, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-direct {p3, p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 385
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 386
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :cond_1
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

    .line 371
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/DownloadUtils$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V

    return-void
.end method
