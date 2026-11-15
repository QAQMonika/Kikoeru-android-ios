.class public final synthetic Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/FailRecoverCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/FailCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/FailCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/future/FailCallback;

    return-void
.end method


# virtual methods
.method public final fail(Ljava/lang/Exception;)Lcom/koushikdutta/async/future/Future;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/future/SimpleFuture$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/future/FailCallback;

    invoke-static {p0, p1}, Lcom/koushikdutta/async/future/SimpleFuture;->lambda$fail$7(Lcom/koushikdutta/async/future/FailCallback;Ljava/lang/Exception;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method
