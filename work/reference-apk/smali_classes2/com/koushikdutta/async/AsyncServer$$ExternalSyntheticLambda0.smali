.class public final synthetic Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;

.field public final synthetic f$1:Ljava/util/concurrent/Semaphore;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/Semaphore;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Runnable;

    iget-object p0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda0;->f$1:Ljava/util/concurrent/Semaphore;

    invoke-static {v0, p0}, Lcom/koushikdutta/async/AsyncServer;->lambda$run$2(Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;)V

    return-void
.end method
