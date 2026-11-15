.class public Lcom/zinhao/kikoeru/LocalResponse;
.super Ljava/lang/Object;
.source "LocalResponse.java"

# interfaces
.implements Lcom/koushikdutta/async/http/AsyncHttpResponse;


# instance fields
.field private code:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "code"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/zinhao/kikoeru/LocalResponse;->code:I

    return-void
.end method


# virtual methods
.method public charset()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public code()I
    .locals 0

    .line 30
    iget p0, p0, Lcom/zinhao/kikoeru/LocalResponse;->code:I

    return p0
.end method

.method public detachSocket()Lcom/koushikdutta/async/AsyncSocket;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDataCallback()Lcom/koushikdutta/async/callback/DataCallback;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRequest()Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public headers()Lcom/koushikdutta/async/http/Headers;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public isChunked()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isPaused()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public message()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public pause()V
    .locals 0

    return-void
.end method

.method public protocol()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public resume()V
    .locals 0

    return-void
.end method

.method public setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataCallback"
        }
    .end annotation

    return-void
.end method

.method public setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "completedCallback"
        }
    .end annotation

    return-void
.end method
