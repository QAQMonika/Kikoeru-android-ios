.class Lcom/koushikdutta/async/DatagramChannelWrapper;
.super Lcom/koushikdutta/async/ChannelWrapper;
.source "DatagramChannelWrapper.java"


# instance fields
.field address:Ljava/net/InetSocketAddress;

.field mChannel:Ljava/nio/channels/DatagramChannel;


# direct methods
.method constructor <init>(Ljava/nio/channels/DatagramChannel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/ChannelWrapper;-><init>(Ljava/nio/channels/spi/AbstractSelectableChannel;)V

    .line 36
    iput-object p1, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    return-void
.end method


# virtual methods
.method public disconnect()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0}, Ljava/nio/channels/DatagramChannel;->disconnect()Ljava/nio/channels/DatagramChannel;

    return-void
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result p0

    return p0
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .locals 0

    .line 27
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->address:Ljava/net/InetSocketAddress;

    return-object p0
.end method

.method public getSocket()Ljava/lang/Object;
    .locals 0

    .line 95
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object p0

    return-object p0
.end method

.method public isChunked()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public isConnected()Z
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0}, Ljava/nio/channels/DatagramChannel;->isConnected()Z

    move-result p0

    return p0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Lcom/koushikdutta/async/DatagramChannelWrapper;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 41
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 42
    iget-object v1, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v1, p1}, Ljava/nio/channels/DatagramChannel;->receive(Ljava/nio/ByteBuffer;)Ljava/net/SocketAddress;

    move-result-object v1

    check-cast v1, Ljava/net/InetSocketAddress;

    iput-object v1, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->address:Ljava/net/InetSocketAddress;

    if-nez v1, :cond_0

    const/4 p0, -0x1

    return p0

    .line 45
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result p0

    sub-int/2addr p0, v0

    return p0

    :cond_1
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->address:Ljava/net/InetSocketAddress;

    .line 48
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/DatagramChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result p0

    return p0
.end method

.method public read([Ljava/nio/ByteBuffer;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/DatagramChannel;->read([Ljava/nio/ByteBuffer;)J

    move-result-wide p0

    return-wide p0
.end method

.method public read([Ljava/nio/ByteBuffer;II)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1, p2, p3}, Ljava/nio/channels/DatagramChannel;->read([Ljava/nio/ByteBuffer;II)J

    move-result-wide p0

    return-wide p0
.end method

.method public register(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 72
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/DatagramChannelWrapper;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object p0

    return-object p0
.end method

.method public register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .line 64
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1, p2}, Ljava/nio/channels/DatagramChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object p0

    return-object p0
.end method

.method public shutdownInput()V
    .locals 0

    return-void
.end method

.method public shutdownOutput()V
    .locals 0

    return-void
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/DatagramChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result p0

    return p0
.end method

.method public write([Ljava/nio/ByteBuffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    iget-object p0, p0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/DatagramChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide p0

    long-to-int p0, p0

    return p0
.end method
