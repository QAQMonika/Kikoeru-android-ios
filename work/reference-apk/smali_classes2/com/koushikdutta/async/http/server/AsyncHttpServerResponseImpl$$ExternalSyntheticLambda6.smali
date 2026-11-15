.class public final synthetic Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

.field public final synthetic f$1:Lcom/koushikdutta/async/http/AsyncHttpResponse;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$$ExternalSyntheticLambda6;->f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$$ExternalSyntheticLambda6;->f$1:Lcom/koushikdutta/async/http/AsyncHttpResponse;

    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/Exception;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$$ExternalSyntheticLambda6;->f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    iget-object p0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$$ExternalSyntheticLambda6;->f$1:Lcom/koushikdutta/async/http/AsyncHttpResponse;

    invoke-virtual {v0, p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->lambda$proxy$7$com-koushikdutta-async-http-server-AsyncHttpServerResponseImpl(Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;)V

    return-void
.end method
