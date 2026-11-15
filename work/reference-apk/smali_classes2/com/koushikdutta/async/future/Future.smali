.class public interface abstract Lcom/koushikdutta/async/future/Future;
.super Ljava/lang/Object;
.source "Future.java"

# interfaces
.implements Lcom/koushikdutta/async/future/Cancellable;
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/Cancellable;",
        "Ljava/util/concurrent/Future<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public static synthetic lambda$executorThread$0(Lcom/koushikdutta/async/future/Future;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .locals 0
    .param p0, "_this"    # Lcom/koushikdutta/async/future/Future;

    .line 96
    invoke-virtual {p1, p0}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Lcom/koushikdutta/async/future/Future;)Lcom/koushikdutta/async/future/Future;

    return-void
.end method


# virtual methods
.method public abstract done(Lcom/koushikdutta/async/future/DoneCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/DoneCallback<",
            "TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation
.end method

.method public executorThread(Ljava/util/concurrent/Executor;)Lcom/koushikdutta/async/future/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation

    .line 95
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 96
    new-instance v1, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Lcom/koushikdutta/async/future/Future$$ExternalSyntheticLambda0;-><init>(Lcom/koushikdutta/async/future/Future;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-object v0
.end method

.method public abstract fail(Lcom/koushikdutta/async/future/FailCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/FailCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract failConvert(Lcom/koushikdutta/async/future/FailConvertCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/FailConvertCallback<",
            "TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract failRecover(Lcom/koushikdutta/async/future/FailRecoverCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/FailRecoverCallback<",
            "TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract setCallback(Lcom/koushikdutta/async/future/FutureCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/FutureCallback<",
            "TT;>;)V"
        }
    .end annotation
.end method

.method public abstract success(Lcom/koushikdutta/async/future/SuccessCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/SuccessCallback<",
            "TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TT;>;"
        }
    .end annotation
.end method

.method public abstract then(Lcom/koushikdutta/async/future/ThenFutureCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/future/ThenFutureCallback<",
            "TR;TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TR;>;"
        }
    .end annotation
.end method

.method public abstract thenConvert(Lcom/koushikdutta/async/future/ThenCallback;)Lcom/koushikdutta/async/future/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/future/ThenCallback<",
            "TR;TT;>;)",
            "Lcom/koushikdutta/async/future/Future<",
            "TR;>;"
        }
    .end annotation
.end method

.method public abstract tryGet()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public abstract tryGetException()Ljava/lang/Exception;
.end method
