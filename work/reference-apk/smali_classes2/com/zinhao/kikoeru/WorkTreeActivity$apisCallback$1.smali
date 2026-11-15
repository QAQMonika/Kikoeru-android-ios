.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "WorkTreeActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/WorkTreeActivity$apisCallback$1",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "onCompleted",
        "",
        "e",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "asyncHttpResponse",
        "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
        "jsonObject",
        "Lorg/json/JSONObject;",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 766
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "pagination"

    const-string v1, "jsonObject"

    invoke-static {p3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 769
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 770
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-eqz p2, :cond_3

    .line 773
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_1

    goto :goto_0

    .line 777
    :cond_1
    :try_start_0
    const-string p1, "works"

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 778
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v1, "totalCount"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    .line 779
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    const-string v0, "currentPage"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    invoke-static {v1, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setPage$p(Lcom/zinhao/kikoeru/WorkTreeActivity;I)V

    .line 781
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-eqz p3, :cond_2

    .line 782
    iget-object p3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getPage$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)I

    move-result v0

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    div-int/2addr p2, v1

    add-int/lit8 p2, p2, 0x1

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p3, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setPage$p(Lcom/zinhao/kikoeru/WorkTreeActivity;I)V

    .line 784
    :cond_2
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    new-instance p3, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-direct {p3, p1, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;-><init>(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast p3, Ljava/lang/Runnable;

    invoke-virtual {p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 806
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 807
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 766
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
