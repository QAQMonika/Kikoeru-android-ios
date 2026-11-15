.class public final synthetic Lcom/koushikdutta/async/http/WebSocketImpl$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/http/WebSocketImpl;

.field public final synthetic f$1:[B


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/http/WebSocketImpl;[B)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/http/WebSocketImpl$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/http/WebSocketImpl;

    iput-object p2, p0, Lcom/koushikdutta/async/http/WebSocketImpl$$ExternalSyntheticLambda1;->f$1:[B

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/http/WebSocketImpl$$ExternalSyntheticLambda1;->f$0:Lcom/koushikdutta/async/http/WebSocketImpl;

    iget-object p0, p0, Lcom/koushikdutta/async/http/WebSocketImpl$$ExternalSyntheticLambda1;->f$1:[B

    invoke-virtual {v0, p0}, Lcom/koushikdutta/async/http/WebSocketImpl;->lambda$send$0$com-koushikdutta-async-http-WebSocketImpl([B)V

    return-void
.end method
