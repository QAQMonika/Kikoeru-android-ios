.class public final synthetic Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/SelectorWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/SelectorWrapper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda2;->f$0:Lcom/koushikdutta/async/SelectorWrapper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda2;->f$0:Lcom/koushikdutta/async/SelectorWrapper;

    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->lambda$stop$3(Lcom/koushikdutta/async/SelectorWrapper;)V

    return-void
.end method
