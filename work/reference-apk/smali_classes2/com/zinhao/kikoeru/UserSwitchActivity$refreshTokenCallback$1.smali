.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "UserSwitchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J(\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    .line 66
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "errors"

    const-string v1, "error"

    const-string v2, "asyncHttpResponse"

    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "jsonObject"

    invoke-static {p3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 69
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    .line 72
    :cond_0
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 v2, 0xc8

    if-ne p1, v2, :cond_4

    .line 73
    const-string p1, "token"

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 75
    :try_start_0
    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;

    move-result-object p2

    if-nez p2, :cond_1

    goto :goto_0

    .line 76
    :cond_1
    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 77
    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 79
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p2

    const-string p3, "getHost(...)"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :cond_2
    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Lcom/zinhao/kikoeru/db/User;->setToken(Ljava/lang/String;)V

    .line 82
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/App;->updateUser(Lcom/zinhao/kikoeru/db/User;)V

    .line 83
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    new-instance p2, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1;

    iget-object p3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {p2, p3}, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 90
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 91
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity;->alertException(Ljava/lang/Exception;)V

    :cond_3
    :goto_0
    return-void

    .line 95
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    :try_start_1
    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 98
    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 99
    :cond_5
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 100
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p3

    .line 101
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_6

    .line 102
    invoke-virtual {p3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 103
    const-string v3, "msg"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 104
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 111
    :cond_6
    :goto_2
    iget-object p3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    new-instance v0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;

    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {v0, p0, p2, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/StringBuilder;)V

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p3, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :catch_1
    move-exception p1

    .line 108
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 66
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
