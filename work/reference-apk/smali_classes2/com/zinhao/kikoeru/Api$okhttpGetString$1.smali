.class public final Lcom/zinhao/kikoeru/Api$okhttpGetString$1;
.super Ljava/lang/Object;
.source "Api.kt"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/Api;->okhttpGetString(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/Api$okhttpGetString$1",
        "Lokhttp3/Callback;",
        "onFailure",
        "",
        "call",
        "Lokhttp3/Call;",
        "e",
        "Ljava/io/IOException;",
        "onResponse",
        "response",
        "Lokhttp3/Response;",
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
.field final synthetic $callback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/Api$okhttpGetString$1;->$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 1

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "e"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    iget-object p0, p0, Lcom/zinhao/kikoeru/Api$okhttpGetString$1;->$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    check-cast p2, Ljava/lang/Exception;

    new-instance p1, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v0, 0x194

    invoke-direct {p1, v0}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 2

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "response"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 161
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 162
    iget-object p0, p0, Lcom/zinhao/kikoeru/Api$okhttpGetString$1;->$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    new-instance p1, Lcom/zinhao/kikoeru/LocalResponse;

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-direct {p1, v1}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    move-object p2, v0

    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 164
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/Api$okhttpGetString$1;->$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    new-instance p1, Lcom/zinhao/kikoeru/LocalResponse;

    invoke-virtual {p2}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-direct {p1, v1}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_2
    move-object p2, v0

    :goto_1
    invoke-virtual {p0, v0, p1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
