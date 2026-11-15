.class public Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;
.super Lcom/koushikdutta/async/FilteredDataSink;
.source "ChunkedOutputFilter.java"


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/DataSink;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/FilteredDataSink;-><init>(Lcom/koushikdutta/async/DataSink;)V

    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    const v0, 0x7fffffff

    .line 24
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;->setMaxBuffer(I)V

    .line 25
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    .line 26
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;->setMaxBuffer(I)V

    return-void
.end method

.method public filter(Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;
    .locals 2

    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    const/16 v1, 0x10

    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\r\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/koushikdutta/async/ByteBufferList;->addFirst(Ljava/nio/ByteBuffer;)V

    .line 18
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    return-object p1
.end method
