.class public final synthetic Lcom/koushikdutta/async/AsyncSSLSocketWrapper$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/SimpleCancellable;

.field public final synthetic f$1:Lcom/koushikdutta/async/callback/ConnectCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/SimpleCancellable;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$$ExternalSyntheticLambda5;->f$0:Lcom/koushikdutta/async/future/SimpleCancellable;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$$ExternalSyntheticLambda5;->f$1:Lcom/koushikdutta/async/callback/ConnectCallback;

    return-void
.end method


# virtual methods
.method public final onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$$ExternalSyntheticLambda5;->f$0:Lcom/koushikdutta/async/future/SimpleCancellable;

    iget-object p0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$$ExternalSyntheticLambda5;->f$1:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-static {v0, p0, p1, p2}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->lambda$null$1(Lcom/koushikdutta/async/future/SimpleCancellable;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    return-void
.end method
