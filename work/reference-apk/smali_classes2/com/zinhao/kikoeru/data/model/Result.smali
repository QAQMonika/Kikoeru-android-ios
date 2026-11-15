.class public Lcom/zinhao/kikoeru/data/model/Result;
.super Ljava/lang/Object;
.source "Result.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/data/model/Result$Status;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final error:Ljava/lang/Throwable;

.field private final message:Ljava/lang/String;

.field private final status:Lcom/zinhao/kikoeru/data/model/Result$Status;


# direct methods
.method private constructor <init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "status",
            "data",
            "message",
            "error"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/data/model/Result$Status;",
            "TT;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    .line 32
    iput-object p2, p0, Lcom/zinhao/kikoeru/data/model/Result;->data:Ljava/lang/Object;

    .line 33
    iput-object p3, p0, Lcom/zinhao/kikoeru/data/model/Result;->message:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Lcom/zinhao/kikoeru/data/model/Result;->error:Ljava/lang/Throwable;

    return-void
.end method

.method public static error(Ljava/lang/String;)Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 50
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, v2}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static error(Ljava/lang/String;Ljava/lang/Object;)Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 58
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p0, v2}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static error(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "message",
            "error"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 54
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0, p1}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static loading()Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 38
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static loading(Ljava/lang/Object;)Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2, v2}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static success(Ljava/lang/Object;)Lcom/zinhao/kikoeru/data/model/Result;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "TT;>;"
        }
    .end annotation

    .line 46
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->SUCCESS:Lcom/zinhao/kikoeru/data/model/Result$Status;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2, v2}, Lcom/zinhao/kikoeru/data/model/Result;-><init>(Lcom/zinhao/kikoeru/data/model/Result$Status;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 68
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->data:Ljava/lang/Object;

    return-object p0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 0

    .line 78
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->error:Ljava/lang/Throwable;

    return-object p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 73
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->message:Ljava/lang/String;

    return-object p0
.end method

.method public getStatus()Lcom/zinhao/kikoeru/data/model/Result$Status;
    .locals 0

    .line 63
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    return-object p0
.end method

.method public isError()Z
    .locals 1

    .line 90
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    sget-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isLoading()Z
    .locals 1

    .line 82
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    sget-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public isSuccess()Z
    .locals 1

    .line 86
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    sget-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->SUCCESS:Lcom/zinhao/kikoeru/data/model/Result$Status;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Result{status="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/model/Result;->status:Lcom/zinhao/kikoeru/data/model/Result$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/model/Result;->data:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/model/Result;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/Result;->error:Ljava/lang/Throwable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v0, 0x7d

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
