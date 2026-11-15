.class public final synthetic Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/callback/ConnectCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/SimpleFuture;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda4;->f$0:Lcom/koushikdutta/async/future/SimpleFuture;

    return-void
.end method


# virtual methods
.method public final onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$$ExternalSyntheticLambda4;->f$0:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    return-void
.end method
