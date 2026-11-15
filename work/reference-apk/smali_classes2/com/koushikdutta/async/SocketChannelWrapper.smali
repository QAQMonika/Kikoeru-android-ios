.class Lcom/koushikdutta/async/SocketChannelWrapper;
.super Lcom/koushikdutta/async/ChannelWrapper;
.source "SocketChannelWrapper.java"


# instance fields
.field mChannel:Ljava/nio/channels/SocketChannel;


# direct methods
.method constructor <init>(Ljava/nio/channels/SocketChannel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/ChannelWrapper;-><init>(Ljava/nio/channels/spi/AbstractSelectableChannel;)V

    .line 26
    iput-object p1, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    return-void
.end method


# virtual methods
.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Socket;->getLocalPort()I

    move-result p0

    return p0
.end method

.method public getSocket()Ljava/lang/Object;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object p0

    return-object p0
.end method

.method public isConnected()Z
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result p0

    return p0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

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

    .line 69
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/SocketChannel;->read([Ljava/nio/ByteBuffer;)J

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

    .line 74
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0, p1, p2, p3}, Ljava/nio/channels/SocketChannel;->read([Ljava/nio/ByteBuffer;II)J

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

    const/16 v0, 0x8

    .line 46
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/SocketChannelWrapper;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object p0

    return-object p0
.end method

.method public shutdownInput()V
    .locals 0

    .line 61
    :try_start_0
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public shutdownOutput()V
    .locals 0

    .line 52
    :try_start_0
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

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

    .line 42
    iget-object p0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {p0, p1}, Ljava/nio/channels/SocketChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide p0

    long-to-int p0, p0

    return p0
.end method
