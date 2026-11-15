.class Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;
.super Ljava/lang/Object;
.source "DownloadUtils.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/DownloadUtils$Mission;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 214
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "call",
            "e"
        }
    .end annotation

    .line 217
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$102(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/Exception;)Ljava/lang/Exception;

    .line 218
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    .line 219
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    .line 220
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "call",
            "response"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 226
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected code "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$102(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/Exception;)Ljava/lang/Exception;

    .line 227
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    return-void

    .line 232
    :cond_0
    const-string p1, "ETag"

    invoke-virtual {p2, p1}, Lokhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 234
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v1, p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$202(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/String;)Ljava/lang/String;

    .line 238
    :cond_1
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_2

    .line 240
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$400(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)J

    move-result-wide v5

    add-long/2addr v1, v5

    invoke-static {p1, v1, v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$302(Lcom/zinhao/kikoeru/DownloadUtils$Mission;J)J

    :cond_2
    const/4 p1, 0x0

    .line 247
    :try_start_0
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lokhttp3/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object p2

    invoke-static {p2}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 250
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$500(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/io/File;

    move-result-object v2

    iget-object v5, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v5}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$400(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)J

    move-result-wide v5

    cmp-long v3, v5, v3

    const/4 v4, 0x1

    if-lez v3, :cond_3

    move v3, v4

    goto :goto_0

    :cond_3
    move v3, v0

    :goto_0
    invoke-direct {v1, v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 251
    invoke-static {v1}, Lokio/Okio;->sink(Ljava/io/OutputStream;)Lokio/Sink;

    move-result-object v1

    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object p1

    const/16 v1, 0x2000

    .line 253
    new-array v1, v1, [B

    .line 255
    :goto_1
    invoke-interface {p2, v1}, Lokio/BufferedSource;->read([B)I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v5, -0x1

    cmp-long v5, v2, v5

    if-eqz v5, :cond_5

    long-to-int v5, v2

    .line 256
    invoke-interface {p1, v1, v0, v5}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 257
    iget-object v5, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v5, v2, v3}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$414(Lcom/zinhao/kikoeru/DownloadUtils$Mission;J)J

    .line 260
    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$600(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 261
    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$600(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 264
    :cond_4
    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v2, v4}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$702(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Z)Z

    goto :goto_1

    .line 266
    :cond_5
    invoke-interface {p1}, Lokio/BufferedSink;->flush()V

    .line 269
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v1, v4}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$802(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Z)Z

    .line 270
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$900(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 271
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$900(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_6
    if-eqz p2, :cond_7

    .line 278
    invoke-interface {p2}, Lokio/BufferedSource;->close()V

    :cond_7
    if-eqz p1, :cond_8

    .line 279
    invoke-interface {p1}, Lokio/BufferedSink;->close()V

    .line 280
    :cond_8
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    return-void

    :catchall_0
    move-exception v1

    move-object v7, p2

    move-object p2, p1

    move-object p1, v7

    goto :goto_3

    :catch_0
    move-exception v1

    move-object v7, p2

    move-object p2, p1

    move-object p1, v7

    goto :goto_2

    :catchall_1
    move-exception v1

    move-object p2, p1

    goto :goto_3

    :catch_1
    move-exception v1

    move-object p2, p1

    .line 274
    :goto_2
    :try_start_2
    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v2, v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$102(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/Exception;)Ljava/lang/Exception;

    .line 275
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 276
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p1, :cond_9

    .line 278
    invoke-interface {p1}, Lokio/BufferedSource;->close()V

    :cond_9
    if-eqz p2, :cond_a

    .line 279
    invoke-interface {p2}, Lokio/BufferedSink;->close()V

    .line 280
    :cond_a
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    return-void

    :catchall_2
    move-exception v1

    :goto_3
    if-eqz p1, :cond_b

    .line 278
    invoke-interface {p1}, Lokio/BufferedSource;->close()V

    :cond_b
    if-eqz p2, :cond_c

    .line 279
    invoke-interface {p2}, Lokio/BufferedSink;->close()V

    .line 280
    :cond_c
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;->this$0:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    .line 281
    throw v1
.end method
