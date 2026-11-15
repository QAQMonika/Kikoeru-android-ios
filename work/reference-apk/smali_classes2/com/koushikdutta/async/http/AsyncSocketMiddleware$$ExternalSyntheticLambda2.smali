.class public final synthetic Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/FailCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

.field public final synthetic f$1:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

.field public final synthetic f$2:Landroid/net/Uri;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$1:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iput-object p3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$2:Landroid/net/Uri;

    iput p4, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$3:I

    return-void
.end method


# virtual methods
.method public final fail(Ljava/lang/Exception;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$1:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$2:Landroid/net/Uri;

    iget p0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda2;->f$3:I

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->lambda$getSocket$2$com-koushikdutta-async-http-AsyncSocketMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;ILjava/lang/Exception;)V

    return-void
.end method
