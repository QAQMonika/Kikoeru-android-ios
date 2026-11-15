.class public final synthetic Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/Future;

.field public final synthetic f$1:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/Future;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/future/Future;

    iput-object p2, p0, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;->f$1:Lcom/koushikdutta/async/future/SimpleFuture;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/future/Future;

    iget-object p0, p0, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;->f$1:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-static {v0, p0}, Lcom/koushikdutta/async/future/Future;->lambda$executorThread$0(Lcom/koushikdutta/async/future/Future;Lcom/koushikdutta/async/future/SimpleFuture;)V

    return-void
.end method
