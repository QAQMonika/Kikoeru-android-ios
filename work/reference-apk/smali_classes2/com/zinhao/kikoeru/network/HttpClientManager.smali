.class public final Lcom/zinhao/kikoeru/network/HttpClientManager;
.super Ljava/lang/Object;
.source "HttpClientManager.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0008\u001a\u00020\tJ\u000c\u0010\n\u001a\u00020\u000b*\u00020\u000bH\u0002R\u0014\u0010\u0004\u001a\u00020\u0005X\u0086D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/network/HttpClientManager;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "getTAG",
        "()Ljava/lang/String;",
        "getPacEnabledClient",
        "Lokhttp3/OkHttpClient;",
        "useNoSniSSL",
        "Lokhttp3/OkHttpClient$Builder;",
        "proxySelector",
        "Ljava/net/ProxySelector;",
        "getProxySelector",
        "()Ljava/net/ProxySelector;",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/zinhao/kikoeru/network/HttpClientManager;

.field private static final TAG:Ljava/lang/String;

.field private static final proxySelector:Ljava/net/ProxySelector;


# direct methods
.method public static synthetic $r8$lambda$74ThP19HTLiJaa3Bu1DGaeBrhcY(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/network/HttpClientManager;->useNoSniSSL$lambda$0(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/zinhao/kikoeru/network/HttpClientManager;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/network/HttpClientManager;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/network/HttpClientManager;->INSTANCE:Lcom/zinhao/kikoeru/network/HttpClientManager;

    .line 16
    const-string v0, "HttpClientManager"

    sput-object v0, Lcom/zinhao/kikoeru/network/HttpClientManager;->TAG:Ljava/lang/String;

    .line 42
    new-instance v0, Lcom/zinhao/kikoeru/network/HttpClientManager$proxySelector$1;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/network/HttpClientManager$proxySelector$1;-><init>()V

    check-cast v0, Ljava/net/ProxySelector;

    sput-object v0, Lcom/zinhao/kikoeru/network/HttpClientManager;->proxySelector:Ljava/net/ProxySelector;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final useNoSniSSL(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient$Builder;
    .locals 3

    .line 31
    sget-object p0, Lokhttp3/internal/platform/Platform;->Companion:Lokhttp3/internal/platform/Platform$Companion;

    invoke-virtual {p0}, Lokhttp3/internal/platform/Platform$Companion;->get()Lokhttp3/internal/platform/Platform;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/internal/platform/Platform;->platformTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object p0

    .line 32
    const-string v0, "TLS"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    const/4 v1, 0x1

    .line 34
    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 35
    new-instance v1, Lcom/zinhao/kikoeru/network/NoSniSSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/zinhao/kikoeru/network/NoSniSSLSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 36
    new-instance v0, Lcom/zinhao/kikoeru/network/CloudflareDoh;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/network/CloudflareDoh;-><init>()V

    check-cast v0, Lokhttp3/Dns;

    invoke-virtual {p1, v0}, Lokhttp3/OkHttpClient$Builder;->dns(Lokhttp3/Dns;)Lokhttp3/OkHttpClient$Builder;

    .line 37
    check-cast v1, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {p1, v1, p0}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    .line 38
    new-instance p0, Lcom/zinhao/kikoeru/network/HttpClientManager$$ExternalSyntheticLambda0;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/network/HttpClientManager$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {p1, p0}, Lokhttp3/OkHttpClient$Builder;->hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lokhttp3/OkHttpClient$Builder;

    return-object p1
.end method

.method private static final useNoSniSSL$lambda$0(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public final getPacEnabledClient()Lokhttp3/OkHttpClient;
    .locals 3

    .line 18
    new-instance p0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {p0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 19
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-virtual {p0, v1, v2, v0}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p0

    .line 20
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v0}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p0

    .line 21
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v0}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p0

    return-object p0
.end method

.method public final getProxySelector()Ljava/net/ProxySelector;
    .locals 0

    .line 42
    sget-object p0, Lcom/zinhao/kikoeru/network/HttpClientManager;->proxySelector:Ljava/net/ProxySelector;

    return-object p0
.end method

.method public final getTAG()Ljava/lang/String;
    .locals 0

    .line 16
    sget-object p0, Lcom/zinhao/kikoeru/network/HttpClientManager;->TAG:Ljava/lang/String;

    return-object p0
.end method
