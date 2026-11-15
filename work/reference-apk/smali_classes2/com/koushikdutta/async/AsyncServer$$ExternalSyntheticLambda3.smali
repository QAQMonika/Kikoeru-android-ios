.class public final synthetic Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/callback/ValueFunction;


# instance fields
.field public final synthetic f$0:Ljava/net/InetAddress;


# direct methods
.method public synthetic constructor <init>(Ljava/net/InetAddress;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda3;->f$0:Ljava/net/InetAddress;

    return-void
.end method


# virtual methods
.method public final getValue()Ljava/lang/Object;
    .locals 0

    .line 0
    iget-object p0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda3;->f$0:Ljava/net/InetAddress;

    invoke-static {p0}, Lcom/koushikdutta/async/AsyncServer;->lambda$createDatagram$6(Ljava/net/InetAddress;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method
