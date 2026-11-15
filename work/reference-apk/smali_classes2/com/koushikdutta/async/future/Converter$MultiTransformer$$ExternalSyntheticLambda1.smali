.class public final synthetic Lcom/koushikdutta/async/future/Converter$MultiTransformer$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/MultiFuture;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/MultiFuture;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/future/Converter$MultiTransformer$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/future/MultiFuture;

    return-void
.end method


# virtual methods
.method public final onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/future/Converter$MultiTransformer$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/future/MultiFuture;

    check-cast p2, Lcom/koushikdutta/async/future/Future;

    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/future/Converter$MultiTransformer;->lambda$transform$1(Lcom/koushikdutta/async/future/MultiFuture;Ljava/lang/Exception;Lcom/koushikdutta/async/future/Future;)V

    return-void
.end method
