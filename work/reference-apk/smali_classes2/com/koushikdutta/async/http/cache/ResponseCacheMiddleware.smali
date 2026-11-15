.class public Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "ResponseCacheMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    }
.end annotation


# static fields
.field public static final CACHE:Ljava/lang/String; = "cache"

.field public static final CONDITIONAL_CACHE:Ljava/lang/String; = "conditional-cache"

.field public static final ENTRY_BODY:I = 0x1

.field public static final ENTRY_COUNT:I = 0x2

.field public static final ENTRY_METADATA:I = 0x0

.field private static final LOGTAG:Ljava/lang/String; = "AsyncHttpCache"

.field public static final SERVED_FROM:Ljava/lang/String; = "X-Served-From"


# instance fields
.field private cache:Lcom/koushikdutta/async/util/FileCache;

.field private cacheHitCount:I

.field private cacheStoreCount:I

.field private caching:Z

.field private conditionalCacheHitCount:I

.field private networkCount:I

.field private server:Lcom/koushikdutta/async/AsyncServer;

.field private writeAbortCount:I

.field private writeSuccessCount:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 69
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/AsyncServer;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    return-object p0
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/util/FileCache;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    return-object p0
.end method

.method static synthetic access$508(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I
    .locals 2

    .line 51
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeSuccessCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeSuccessCount:I

    return v0
.end method

.method static synthetic access$608(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I
    .locals 2

    .line 51
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeAbortCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeAbortCount:I

    return v0
.end method

.method public static addCache(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/io/File;J)Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getMiddleware()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 74
    instance-of v1, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    if-nez v1, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Response cache already added to http client"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 77
    :cond_1
    new-instance v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;-><init>()V

    .line 78
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    iput-object v1, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    .line 79
    new-instance v1, Lcom/koushikdutta/async/util/FileCache;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/koushikdutta/async/util/FileCache;-><init>(Ljava/io/File;JZ)V

    iput-object v1, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    .line 80
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 323
    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    if-eqz p0, :cond_0

    .line 324
    invoke-virtual {p0}, Lcom/koushikdutta/async/util/FileCache;->clear()V

    :cond_0
    return-void
.end method

.method public getCacheHitCount()I
    .locals 0

    .line 211
    iget p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    return p0
.end method

.method public getCacheStoreCount()I
    .locals 0

    .line 219
    iget p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    return p0
.end method

.method public getCaching()Z
    .locals 0

    .line 89
    iget-boolean p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    return p0
.end method

.method public getConditionalCacheHitCount()I
    .locals 0

    .line 207
    iget p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    return p0
.end method

.method public getFileCache()Lcom/koushikdutta/async/util/FileCache;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    return-object p0
.end method

.method public getNetworkCount()I
    .locals 0

    .line 215
    iget p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    return p0
.end method

.method public getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .locals 14

    .line 105
    new-instance v0, Lcom/koushikdutta/async/http/cache/RequestHeaders;

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v2

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v2

    invoke-static {v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/async/http/cache/RequestHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 106
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v2, "request-headers"

    invoke-virtual {v1, v2, v0}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 108
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    if-eqz v1, :cond_8

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->isNoCache()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_2

    .line 113
    :cond_0
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 118
    :try_start_0
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    const/4 v5, 0x2

    invoke-virtual {v4, v1, v5}, Lcom/koushikdutta/async/util/FileCache;->get(Ljava/lang/String;I)[Ljava/io/FileInputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v1, :cond_1

    .line 120
    :try_start_1
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    return-object v2

    .line 123
    :cond_1
    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/io/FileInputStream;->available()I

    move-result v4

    int-to-long v4, v4

    .line 124
    new-instance v6, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;

    const/4 v7, 0x0

    aget-object v7, v1, v7

    invoke-direct {v6, v7}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 134
    iget-object v7, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v7

    iget-object v8, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v8}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v9}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v9

    invoke-virtual {v9}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v9

    invoke-virtual {v6, v7, v8, v9}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->matches(Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 135
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 136
    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    return-object v2

    .line 140
    :cond_2
    new-instance v7, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    aget-object v8, v1, v3

    invoke-direct {v7, v6, v8}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;Ljava/io/FileInputStream;)V

    .line 145
    :try_start_2
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getHeaders()Ljava/util/Map;

    move-result-object v8

    .line 146
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v8, :cond_7

    if-nez v9, :cond_3

    goto/16 :goto_1

    .line 159
    :cond_3
    invoke-static {v8}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v8

    .line 160
    new-instance v9, Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    iget-object v10, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v10}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v9, v10, v8}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 161
    const-string v10, "Content-Length"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Lcom/koushikdutta/async/http/cache/RawHeaders;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-string v10, "Content-Encoding"

    invoke-virtual {v8, v10}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 163
    const-string v10, "Transfer-Encoding"

    invoke-virtual {v8, v10}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 164
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->setLocalTimestamps(JJ)V

    .line 166
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 167
    invoke-virtual {v9, v10, v11, v0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->chooseResponseSource(JLcom/koushikdutta/async/http/cache/RequestHeaders;)Lcom/koushikdutta/async/http/cache/ResponseSource;

    move-result-object v0

    .line 169
    sget-object v10, Lcom/koushikdutta/async/http/cache/ResponseSource;->CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    if-ne v0, v10, :cond_5

    .line 170
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "Response retrieved from cache"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 171
    invoke-static {v6}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->access$000(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;

    invoke-direct {v0, p0, v7, v4, v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    goto :goto_0

    :cond_4
    new-instance v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    invoke-direct {v0, p0, v7, v4, v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    .line 172
    :goto_0
    iget-object v1, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v8}, Lcom/koushikdutta/async/http/cache/RawHeaders;->toHeaderString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 174
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    new-instance v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;)V

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Lcom/koushikdutta/async/future/Cancellable;

    .line 181
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    .line 182
    iget-object p1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v0, "socket-owner"

    invoke-virtual {p1, v0, p0}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    new-instance p0, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;-><init>()V

    .line 184
    invoke-virtual {p0}, Lcom/koushikdutta/async/future/SimpleCancellable;->setComplete()Z

    return-object p0

    .line 187
    :cond_5
    sget-object v6, Lcom/koushikdutta/async/http/cache/ResponseSource;->CONDITIONAL_CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    if-ne v0, v6, :cond_6

    .line 188
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v0, "Response may be served from conditional cache"

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 189
    new-instance p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;-><init>()V

    .line 190
    iput-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    .line 191
    iput-wide v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->contentLength:J

    .line 192
    iput-object v9, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    .line 193
    iput-object v7, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->candidate:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    .line 194
    iget-object p1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v0, "cache-data"

    invoke-virtual {p1, v0, p0}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    .line 198
    :cond_6
    iget-object p1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v0, "Response can not be served from cache"

    invoke-virtual {p1, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 200
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 201
    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    return-object v2

    .line 154
    :cond_7
    :goto_1
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 155
    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    return-object v2

    .line 149
    :catch_0
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 150
    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    return-object v2

    :catch_1
    move-object v1, v2

    .line 128
    :catch_2
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 129
    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    return-object v2

    .line 109
    :cond_8
    :goto_2
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    return-object v2
.end method

.method public onBodyDecoder(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;)V
    .locals 8

    .line 226
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const-class v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    invoke-static {v0, v1}, Lcom/koushikdutta/async/Util;->getWrappedSocket(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/Class;)Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    .line 227
    const-string v1, "X-Served-From"

    if-eqz v0, :cond_0

    .line 228
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {p0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object p0

    const-string p1, "cache"

    invoke-virtual {p0, v1, p1}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    return-void

    .line 232
    :cond_0
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v2, "cache-data"

    invoke-virtual {v0, v2}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    .line 233
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v3

    invoke-static {v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v3

    .line 234
    const-string v4, "Content-Length"

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 235
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->protocol()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v6}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v7}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "%s %s %s"

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->setStatusLine(Ljava/lang/String;)V

    .line 236
    new-instance v4, Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 237
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v5, "response-headers"

    invoke-virtual {v3, v5, v4}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v3, 0x1

    if-eqz v0, :cond_2

    .line 239
    iget-object v5, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-virtual {v5, v4}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->validate(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 240
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v5, "Serving response from conditional cache"

    invoke-virtual {v2, v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 241
    iget-object v2, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-virtual {v2, v4}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->combine(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    move-result-object v2

    .line 242
    iget-object v4, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    new-instance v5, Lcom/koushikdutta/async/http/Headers;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v6

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/RawHeaders;->toMultimap()Ljava/util/Map;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/koushikdutta/async/http/Headers;-><init>(Ljava/util/Map;)V

    invoke-interface {v4, v5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 243
    iget-object v4, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v5

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseCode()I

    move-result v5

    invoke-interface {v4, v5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code(I)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 244
    iget-object v4, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v2

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 246
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v2}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v2

    const-string v4, "conditional-cache"

    invoke-virtual {v2, v1, v4}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 247
    iget v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    .line 249
    new-instance p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;

    iget-object v1, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->candidate:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    iget-wide v2, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->contentLength:J

    invoke-direct {p0, v1, v2, v3}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    .line 250
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 251
    iput-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 252
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedData()V

    return-void

    .line 257
    :cond_1
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/util/UntypedHashtable;->remove(Ljava/lang/String;)V

    .line 258
    iget-object v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 261
    :cond_2
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    if-nez v0, :cond_3

    return-void

    .line 264
    :cond_3
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v1, "request-headers"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/cache/RequestHeaders;

    if-eqz v0, :cond_5

    .line 265
    invoke-virtual {v4, v0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isCacheable(Lcom/koushikdutta/async/http/cache/RequestHeaders;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    .line 276
    :cond_4
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 277
    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v0

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getVaryFields()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getAll(Ljava/util/Set;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v0

    .line 278
    new-instance v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;

    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v5

    iget-object v6, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v4

    invoke-direct {v2, v5, v0, v6, v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 279
    new-instance v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;

    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;)V

    .line 280
    new-instance v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    invoke-direct {v4, p0, v1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Ljava/lang/String;)V

    .line 282
    :try_start_0
    invoke-virtual {v2, v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->writeTo(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;)V

    .line 284
    invoke-virtual {v4, v3}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->newOutputStream(I)Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    iput-object v4, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    .line 294
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 295
    iput-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 297
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v2, "body-cacher"

    invoke-virtual {v1, v2, v0}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 298
    iget-object p1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v0, "Caching response"

    invoke-virtual {p1, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 299
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    return-void

    .line 288
    :catch_0
    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->abort()V

    .line 289
    iget p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    return-void

    .line 271
    :cond_5
    :goto_0
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 272
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDecoderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string p1, "Response is not cacheable"

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    return-void
.end method

.method public onResponseComplete(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteData;)V
    .locals 2

    .line 305
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v0, "cache-data"

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    if-eqz p0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    if-eqz v0, :cond_0

    .line 307
    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    invoke-static {p0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 309
    :cond_0
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const-class v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    invoke-static {p0, v0}, Lcom/koushikdutta/async/Util;->getWrappedSocket(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/Class;)Lcom/koushikdutta/async/AsyncSocket;

    move-result-object p0

    check-cast p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    .line 311
    new-array v0, v0, [Ljava/io/Closeable;

    iget-object p0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object p0

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 313
    :cond_1
    iget-object p0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v0, "body-cacher"

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;

    if-eqz p0, :cond_3

    .line 315
    iget-object p1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteData;->exception:Ljava/lang/Exception;

    if-eqz p1, :cond_2

    .line 316
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V

    return-void

    .line 318
    :cond_2
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->commit()V

    :cond_3
    return-void
.end method

.method public removeFromCache(Landroid/net/Uri;)V
    .locals 0

    .line 97
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 98
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public setCaching(Z)V
    .locals 0

    .line 93
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    return-void
.end method
