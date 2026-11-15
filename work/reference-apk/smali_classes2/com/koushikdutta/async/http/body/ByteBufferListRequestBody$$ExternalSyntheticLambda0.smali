.class public final synthetic Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody;

.field public final synthetic f$1:Lcom/koushikdutta/async/callback/CompletedCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody;

    iput-object p2, p0, Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody$$ExternalSyntheticLambda0;->f$1:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody;

    iget-object p0, p0, Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody$$ExternalSyntheticLambda0;->f$1:Lcom/koushikdutta/async/callback/CompletedCallback;

    check-cast p2, Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0, p0, p1, p2}, Lcom/koushikdutta/async/http/body/ByteBufferListRequestBody;->lambda$parse$0$com-koushikdutta-async-http-body-ByteBufferListRequestBody(Lcom/koushikdutta/async/callback/CompletedCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/ByteBufferList;)V

    return-void
.end method
