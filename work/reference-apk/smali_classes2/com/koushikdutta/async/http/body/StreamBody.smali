.class public Lcom/koushikdutta/async/http/body/StreamBody;
.super Ljava/lang/Object;
.source "StreamBody.java"

# interfaces
.implements Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "application/binary"


# instance fields
.field contentType:Ljava/lang/String;

.field length:I

.field stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, "application/binary"

    iput-object v0, p0, Lcom/koushikdutta/async/http/body/StreamBody;->contentType:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/koushikdutta/async/http/body/StreamBody;->stream:Ljava/io/InputStream;

    .line 23
    iput p2, p0, Lcom/koushikdutta/async/http/body/StreamBody;->length:I

    return-void
.end method


# virtual methods
.method public get()Ljava/io/InputStream;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/koushikdutta/async/http/body/StreamBody;->stream:Ljava/io/InputStream;

    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 11
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/body/StreamBody;->get()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 0

    .line 39
    iget-object p0, p0, Lcom/koushikdutta/async/http/body/StreamBody;->contentType:Ljava/lang/String;

    return-object p0
.end method

.method public length()I
    .locals 0

    .line 53
    iget p0, p0, Lcom/koushikdutta/async/http/body/StreamBody;->length:I

    return p0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 33
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "not implemented"

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public readFullyOnRequest()Z
    .locals 1

    .line 48
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "not implemented"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public setContentType(Ljava/lang/String;)Lcom/koushikdutta/async/http/body/StreamBody;
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/koushikdutta/async/http/body/StreamBody;->contentType:Ljava/lang/String;

    return-object p0
.end method

.method public write(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 2

    .line 28
    iget-object p1, p0, Lcom/koushikdutta/async/http/body/StreamBody;->stream:Ljava/io/InputStream;

    iget p0, p0, Lcom/koushikdutta/async/http/body/StreamBody;->length:I

    if-gez p0, :cond_0

    const-wide/32 v0, 0x7fffffff

    goto :goto_0

    :cond_0
    int-to-long v0, p0

    :goto_0
    invoke-static {p1, v0, v1, p2, p3}, Lcom/koushikdutta/async/Util;->pump(Ljava/io/InputStream;JLcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
