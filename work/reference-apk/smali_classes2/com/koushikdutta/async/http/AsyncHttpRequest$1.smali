.class Lcom/koushikdutta/async/http/AsyncHttpRequest$1;
.super Ljava/lang/Object;
.source "AsyncHttpRequest.java"

# interfaces
.implements Lcom/koushikdutta/async/http/RequestLine;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/AsyncHttpRequest;->getRequestLine()Lcom/koushikdutta/async/http/RequestLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-static {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->access$000(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getProtocolVersion()Lcom/koushikdutta/async/http/ProtocolVersion;
    .locals 2

    .line 21
    new-instance p0, Lcom/koushikdutta/async/http/ProtocolVersion;

    const-string v0, "HTTP"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/koushikdutta/async/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    return-object p0
.end method

.method public getUri()Ljava/lang/String;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 31
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    const-string v1, "%s %s %s"

    if-eqz v0, :cond_0

    .line 32
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-static {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->access$000(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v3

    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-static {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->access$100(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v2, v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 34
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 35
    :cond_1
    const-string v0, "/"

    .line 36
    :cond_2
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 37
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3

    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    :cond_3
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-static {v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->access$000(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;

    move-result-object v3

    iget-object p0, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest$1;->this$0:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-static {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->access$100(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v3, v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v2, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
