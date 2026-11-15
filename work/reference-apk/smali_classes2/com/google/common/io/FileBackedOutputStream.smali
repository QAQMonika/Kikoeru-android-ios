.class public final Lcom/google/common/io/FileBackedOutputStream;
.super Ljava/io/OutputStream;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/FileBackedOutputStream$State;,
        Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;,
        Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;,
        Lcom/google/common/io/FileBackedOutputStream$MemoryOutput;
    }
.end annotation


# static fields
.field private static final IS_REACHABILITY_FENCE_METHOD_USABLE:Z


# instance fields
.field private final byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

.field private final state:Lcom/google/common/io/FileBackedOutputStream$State;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 363
    invoke-static {}, Lcom/google/common/io/FileBackedOutputStream;->computeIsReachabilityFenceMethodUsable()Z

    move-result v0

    sput-boolean v0, Lcom/google/common/io/FileBackedOutputStream;->IS_REACHABILITY_FENCE_METHOD_USABLE:Z

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileThreshold"
        }
    .end annotation

    const/4 v0, 0x0

    .line 103
    invoke-direct {p0, p1, v0}, Lcom/google/common/io/FileBackedOutputStream;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 2
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

    .line 118
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 119
    :goto_0
    const-string v1, "fileThreshold must be non-negative, but was %s"

    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 121
    new-instance v0, Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-direct {v0, p1, p2}, Lcom/google/common/io/FileBackedOutputStream$State;-><init>(IZ)V

    iput-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    .line 122
    new-instance p1, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-direct {p1, v0}, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;-><init>(Lcom/google/common/io/FileBackedOutputStream$State;)V

    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    if-eqz p2, :cond_1

    .line 125
    invoke-static {p1}, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->register(Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;)V

    :cond_1
    return-void
.end method

.method private static computeIsReachabilityFenceMethodUsable()Z
    .locals 6

    const/4 v0, 0x0

    .line 367
    :try_start_0
    const-class v1, Ljava/lang/ref/Reference;

    const-string v2, "reachabilityFence"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Object;

    aput-object v5, v4, v0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 368
    const-class v2, Lcom/google/common/io/FileBackedOutputStream;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return v3

    :catch_0
    move-exception v0

    .line 384
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Throwables;->throwIfUnchecked(Ljava/lang/Throwable;)V

    .line 385
    new-instance v1, Ljava/lang/AssertionError;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    :catch_1
    return v0
.end method

.method static reachabilityFence(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 357
    sget-boolean v0, Lcom/google/common/io/FileBackedOutputStream;->IS_REACHABILITY_FENCE_METHOD_USABLE:Z

    if-eqz v0, :cond_0

    .line 358
    invoke-static {p0}, Ljava/lang/ref/Reference;->reachabilityFence(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public asByteSource()Lcom/google/common/io/ByteSource;
    .locals 0

    .line 174
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    return-object p0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 220
    throw v0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 229
    throw v0
.end method

.method getFile()Ljava/io/File;
    .locals 0

    .line 92
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$State;->getFile()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0}, Lcom/google/common/io/FileBackedOutputStream$State;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 188
    throw v0
.end method

.method public write(I)V
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

    .line 194
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0, p1}, Lcom/google/common/io/FileBackedOutputStream$State;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 197
    throw p1
.end method

.method public write([B)V
    .locals 2
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

    const/4 v0, 0x0

    .line 202
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/io/FileBackedOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
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

    .line 208
    :try_start_0
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/common/io/FileBackedOutputStream$State;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream;->byteSource:Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 211
    throw p1
.end method
