.class public Lcom/zinhao/kikoeru/network/CloudflareDoh;
.super Ljava/lang/Object;
.source "CloudflareDoh.java"

# interfaces
.implements Lokhttp3/Dns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CloudflareDoh"


# instance fields
.field private final bootstrapClient:Lokhttp3/OkHttpClient;

.field private final dnsAddressResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final gson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->gson:Lcom/google/gson/Gson;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    .line 23
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->bootstrapClient:Lokhttp3/OkHttpClient;

    return-void
.end method

.method private printInetAddress(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inetAddressList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;)V"
        }
    .end annotation

    const/4 p0, 0x0

    .line 92
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p0, v0, :cond_0

    .line 93
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "printInetAddress: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CloudflareDoh"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public lookup(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hostname"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 29
    const-string v0, "1.0.0.1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "1.1.1.1"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 33
    :cond_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 34
    iget-object p0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    return-object p0

    .line 36
    :cond_1
    const-string v1, "CloudflareDoh"

    const-string v2, "lookup: dns============================================"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :try_start_0
    new-instance v1, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v1}, Lokhttp3/HttpUrl$Builder;-><init>()V

    const-string v2, "https"

    .line 40
    invoke-virtual {v1, v2}, Lokhttp3/HttpUrl$Builder;->scheme(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v1

    .line 41
    invoke-virtual {v1, v0}, Lokhttp3/HttpUrl$Builder;->host(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    const-string v1, "/dns-query"

    .line 42
    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->encodedPath(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    const-string v1, "name"

    .line 43
    invoke-virtual {v0, v1, p1}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    const-string v1, "type"

    const-string v2, "A"

    .line 44
    invoke-virtual {v0, v1, v2}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v0

    .line 47
    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    .line 48
    invoke-virtual {v1, v0}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v1, "accept"

    const-string v2, "application/dns-json"

    .line 49
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 52
    iget-object v1, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->bootstrapClient:Lokhttp3/OkHttpClient;

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :try_start_1
    invoke-virtual {v0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 57
    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v1

    .line 58
    iget-object v2, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->gson:Lcom/google/gson/Gson;

    const-class v3, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;

    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;

    if-eqz v1, :cond_5

    .line 60
    iget-object v2, v1, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;->Answer:Ljava/util/List;

    if-eqz v2, :cond_5

    .line 61
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 62
    iget-object v1, v1, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;->Answer:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse$Answer;

    .line 64
    iget v4, v3, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse$Answer;->type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 65
    iget-object v3, v3, Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse$Answer;->data:Ljava/lang/String;

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 68
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 69
    iget-object v1, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 70
    iget-object v1, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    invoke-direct {p0, v1}, Lcom/zinhao/kikoeru/network/CloudflareDoh;->printInetAddress(Ljava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_4

    .line 74
    :try_start_2
    invoke-virtual {v0}, Lokhttp3/Response;->close()V

    :cond_4
    return-object v2

    :cond_5
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lokhttp3/Response;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 54
    :cond_6
    :try_start_3
    new-instance v1, Ljava/net/UnknownHostException;

    const-string v2, "Cloudflare DoH (1.0.0.1) request failed"

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_7

    .line 52
    :try_start_4
    invoke-virtual {v0}, Lokhttp3/Response;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_5
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_1
    throw v1
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    move-exception v0

    .line 77
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 78
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    .line 82
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    const-string v1, "104.21.50.254"

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    iget-object v0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    sget-object v1, Lokhttp3/Dns;->SYSTEM:Lokhttp3/Dns;

    invoke-interface {v1, p1}, Lokhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 87
    iget-object p1, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/network/CloudflareDoh;->printInetAddress(Ljava/util/List;)V

    .line 88
    iget-object p0, p0, Lcom/zinhao/kikoeru/network/CloudflareDoh;->dnsAddressResult:Ljava/util/List;

    return-object p0

    .line 30
    :cond_9
    :goto_3
    sget-object p0, Lokhttp3/Dns;->SYSTEM:Lokhttp3/Dns;

    invoke-interface {p0, p1}, Lokhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
