.class public final synthetic Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/SimpleFuture$FutureCallbackInternal;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/FutureCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/FutureCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda3;->f$0:Lcom/koushikdutta/async/future/FutureCallback;

    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Lcom/koushikdutta/async/future/SimpleFuture$FutureCallsite;)V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda3;->f$0:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-static {p0, p1, p2, p3}, Lcom/koushikdutta/async/future/SimpleFuture;->lambda$setCallback$0(Lcom/koushikdutta/async/future/FutureCallback;Ljava/lang/Exception;Ljava/lang/Object;Lcom/koushikdutta/async/future/SimpleFuture$FutureCallsite;)V

    return-void
.end method
