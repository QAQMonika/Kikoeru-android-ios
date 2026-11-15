.class public final synthetic Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/callback/CompletedCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

.field public final synthetic f$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$Asset;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$Asset;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$$ExternalSyntheticLambda3;->f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$$ExternalSyntheticLambda3;->f$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$Asset;

    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/Exception;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$$ExternalSyntheticLambda3;->f$0:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    iget-object p0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$$ExternalSyntheticLambda3;->f$1:Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$Asset;

    invoke-static {v0, p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter;->lambda$null$1(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;Lcom/koushikdutta/async/http/server/AsyncHttpServerRouter$Asset;Ljava/lang/Exception;)V

    return-void
.end method
