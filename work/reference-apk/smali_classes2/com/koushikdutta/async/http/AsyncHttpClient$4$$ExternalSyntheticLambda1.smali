.class public final synthetic Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/AsyncHttpClient$4;

.field public final synthetic f$1:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

.field public final synthetic f$4:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient$4;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/http/AsyncHttpClient$4;

    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$1:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iput p3, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$2:I

    iput-object p4, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$3:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iput-object p5, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$4:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/http/AsyncHttpClient$4;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$1:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$2:I

    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$3:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4$$ExternalSyntheticLambda1;->f$4:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->lambda$setDataEmitter$1$com-koushikdutta-async-http-AsyncHttpClient$4(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    return-void
.end method
