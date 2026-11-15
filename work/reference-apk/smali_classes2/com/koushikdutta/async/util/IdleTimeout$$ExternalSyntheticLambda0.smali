.class public final synthetic Lcom/koushikdutta/async/util/IdleTimeout$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/util/IdleTimeout;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/util/IdleTimeout;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/util/IdleTimeout$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/util/IdleTimeout;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/util/IdleTimeout$$ExternalSyntheticLambda0;->f$0:Lcom/koushikdutta/async/util/IdleTimeout;

    invoke-virtual {p0}, Lcom/koushikdutta/async/util/IdleTimeout;->lambda$cancel$0$com-koushikdutta-async-util-IdleTimeout()V

    return-void
.end method
