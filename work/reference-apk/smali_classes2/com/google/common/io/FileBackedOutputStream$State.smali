.class final Lcom/google/common/io/FileBackedOutputStream$State;
.super Ljava/lang/Object;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/FileBackedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field file:Ljava/io/File;

.field final fileThreshold:I

.field memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

.field out:Ljava/io/OutputStream;

.field final resetWhenGarbageCollected:Z


# direct methods
.method constructor <init>(IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fileThreshold",
            "resetWhenGarbageCollected"
        }
    .end annotation

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    iput p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileThreshold:I

    .line 252
    iput-boolean p2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->resetWhenGarbageCollected:Z

    .line 253
    new-instance p1, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;-><init>(Lcom/google/common/io/FileBackedOutputStream$1;)V

    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    .line 254
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 302
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method declared-synchronized flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 306
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method declared-synchronized getFile()Ljava/io/File;
    .locals 1

    monitor-enter p0

    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method declared-synchronized openInputStream()Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 262
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 263
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 266
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v1}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method declared-synchronized reset()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Could not delete: "

    const-string v1, "Could not delete: "

    monitor-enter p0

    const/4 v2, 0x0

    .line 273
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$State;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 275
    :try_start_1
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    if-nez v0, :cond_0

    .line 276
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-direct {v0, v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;-><init>(Lcom/google/common/io/FileBackedOutputStream$1;)V

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    goto :goto_0

    .line 278
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->reset()V

    .line 280
    :goto_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    .line 281
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    if-eqz v0, :cond_2

    .line 283
    iput-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    .line 284
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 285
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    goto :goto_3

    :catchall_1
    move-exception v1

    .line 275
    :try_start_2
    iget-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    if-nez v3, :cond_3

    .line 276
    new-instance v3, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-direct {v3, v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;-><init>(Lcom/google/common/io/FileBackedOutputStream$1;)V

    iput-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    goto :goto_2

    .line 278
    :cond_3
    iget-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v3}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->reset()V

    .line 280
    :goto_2
    iget-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    iput-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    .line 281
    iget-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    if-eqz v3, :cond_4

    .line 283
    iput-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    .line 284
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_4

    .line 285
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 288
    :cond_4
    throw v1

    :goto_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method update(I)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 315
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v0

    add-int/2addr v0, p1

    iget p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->fileThreshold:I

    if-le v0, p1, :cond_2

    .line 316
    sget-object p1, Lcom/google/common/io/TempFileCreator;->INSTANCE:Lcom/google/common/io/TempFileCreator;

    const-string v0, "FileBackedOutputStream"

    invoke-virtual {p1, v0}, Lcom/google/common/io/TempFileCreator;->createTempFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 317
    iget-boolean v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->resetWhenGarbageCollected:Z

    if-eqz v0, :cond_0

    .line 319
    invoke-virtual {p1}, Ljava/io/File;->deleteOnExit()V

    :cond_0
    const/4 v0, 0x0

    .line 323
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 324
    :try_start_1
    iget-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v2}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getBuffer()[B

    move-result-object v2

    iget-object v3, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    invoke-virtual {v3}, Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;->getCount()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 325
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 327
    iput-object v1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 340
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$State;->file:Ljava/io/File;

    .line 341
    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->memory:Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;

    return-void

    :catch_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_1

    .line 331
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    .line 333
    invoke-virtual {p0, v0}, Ljava/io/IOException;->addSuppressed(Ljava/lang/Throwable;)V

    .line 336
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 337
    throw p0

    :cond_2
    return-void
.end method

.method declared-synchronized write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x1

    .line 292
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/common/io/FileBackedOutputStream$State;->update(I)V

    .line 293
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method declared-synchronized write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 297
    :try_start_0
    invoke-virtual {p0, p3}, Lcom/google/common/io/FileBackedOutputStream$State;->update(I)V

    .line 298
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$State;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
