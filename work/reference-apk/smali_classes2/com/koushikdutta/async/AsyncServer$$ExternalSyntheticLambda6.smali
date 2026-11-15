.class public final synthetic Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/ThenCallback;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 0
    check-cast p1, [Ljava/net/InetAddress;

    invoke-static {p1}, Lcom/koushikdutta/async/AsyncServer;->lambda$getByName$4([Ljava/net/InetAddress;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method
