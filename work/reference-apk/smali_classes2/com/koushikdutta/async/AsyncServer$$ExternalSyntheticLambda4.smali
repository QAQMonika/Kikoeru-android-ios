.class public final synthetic Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/AsyncServer;

.field public final synthetic f$1:Lcom/koushikdutta/async/AsyncDatagramSocket;

.field public final synthetic f$2:Ljava/net/InetAddress;

.field public final synthetic f$3:I

.field public final synthetic f$4:Z


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/net/InetAddress;IZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$0:Lcom/koushikdutta/async/AsyncServer;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$1:Lcom/koushikdutta/async/AsyncDatagramSocket;

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$2:Ljava/net/InetAddress;

    iput p4, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$3:I

    iput-boolean p5, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$4:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$0:Lcom/koushikdutta/async/AsyncServer;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$1:Lcom/koushikdutta/async/AsyncDatagramSocket;

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$2:Ljava/net/InetAddress;

    iget v3, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$3:I

    iget-boolean p0, p0, Lcom/koushikdutta/async/AsyncServer$$ExternalSyntheticLambda4;->f$4:Z

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/koushikdutta/async/AsyncServer;->lambda$openDatagram$8$com-koushikdutta-async-AsyncServer(Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/net/InetAddress;IZ)V

    return-void
.end method
