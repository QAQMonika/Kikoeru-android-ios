.class final Lcom/koushikdutta/async/AsyncSSLSocketWrapper$9;
.super Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;
.source "AsyncSSLSocketWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->listenSecure(Lcom/koushikdutta/async/AsyncServer;Ljavax/net/ssl/SSLContext;Ljava/net/InetAddress;ILcom/koushikdutta/async/callback/ListenCallback;)Lcom/koushikdutta/async/AsyncServerSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 772
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;-><init>()V

    return-void
.end method


# virtual methods
.method public createEngine(Ljavax/net/ssl/SSLContext;Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .locals 0

    .line 775
    invoke-super {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;->createEngine(Ljavax/net/ssl/SSLContext;Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    move-result-object p0

    const/4 p1, 0x1

    .line 782
    new-array p1, p1, [Ljava/lang/String;

    const/4 p2, 0x0

    const-string p3, "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"

    aput-object p3, p1, p2

    invoke-virtual {p0, p1}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    return-object p0
.end method
