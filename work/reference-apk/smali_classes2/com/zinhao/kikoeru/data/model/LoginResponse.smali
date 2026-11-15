.class public Lcom/zinhao/kikoeru/data/model/LoginResponse;
.super Ljava/lang/Object;
.source "LoginResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;,
        Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;
    }
.end annotation


# instance fields
.field private error:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "error"
    .end annotation
.end field

.field private errors:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;",
            ">;"
        }
    .end annotation
.end field

.field private token:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "token"
    .end annotation
.end field

.field private user:Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getError()Ljava/lang/String;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->error:Ljava/lang/String;

    return-object p0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->error:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "null"

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->error:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 60
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->error:Ljava/lang/String;

    return-object p0

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->errors:Ljava/util/List;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->errors:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;

    .line 65
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->getMsg()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->getMsg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_2

    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    :cond_2
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->getMsg()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 70
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_4

    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method public getErrors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->errors:Ljava/util/List;

    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->token:Ljava/lang/String;

    return-object p0
.end method

.method public getUser()Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->user:Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;

    return-object p0
.end method

.method public setError(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "error"
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->error:Ljava/lang/String;

    return-void
.end method

.method public setErrors(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "errors"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;",
            ">;)V"
        }
    .end annotation

    .line 52
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->errors:Ljava/util/List;

    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "token"
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->token:Ljava/lang/String;

    return-void
.end method

.method public setUser(Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation

    .line 36
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;->user:Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;

    return-void
.end method
