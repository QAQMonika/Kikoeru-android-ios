.class Lcom/koushikdutta/async/PushParser$ByteBufferListWaiter;
.super Lcom/koushikdutta/async/PushParser$Waiter;
.source "PushParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/PushParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ByteBufferListWaiter"
.end annotation


# instance fields
.field callback:Lcom/koushikdutta/async/PushParser$ParseCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/PushParser$ParseCallback<",
            "Lcom/koushikdutta/async/ByteBufferList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/koushikdutta/async/PushParser$ParseCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/koushikdutta/async/PushParser$ParseCallback<",
            "Lcom/koushikdutta/async/ByteBufferList;",
            ">;)V"
        }
    .end annotation

    .line 87
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/PushParser$Waiter;-><init>(I)V

    if-lez p1, :cond_0

    .line 89
    iput-object p2, p0, Lcom/koushikdutta/async/PushParser$ByteBufferListWaiter;->callback:Lcom/koushikdutta/async/PushParser$ParseCallback;

    return-void

    .line 88
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "length should be > 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/PushParser$Waiter;
    .locals 0

    .line 94
    iget-object p1, p0, Lcom/koushikdutta/async/PushParser$ByteBufferListWaiter;->callback:Lcom/koushikdutta/async/PushParser$ParseCallback;

    iget p0, p0, Lcom/koushikdutta/async/PushParser$ByteBufferListWaiter;->length:I

    invoke-virtual {p2, p0}, Lcom/koushikdutta/async/ByteBufferList;->get(I)Lcom/koushikdutta/async/ByteBufferList;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/koushikdutta/async/PushParser$ParseCallback;->parsed(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method
