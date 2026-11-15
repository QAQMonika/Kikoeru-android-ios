.class public Lcom/zinhao/kikoeru/data/repository/UserRepository;
.super Ljava/lang/Object;
.source "UserRepository.java"


# static fields
.field private static instance:Lcom/zinhao/kikoeru/data/repository/UserRepository;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/data/repository/UserRepository;Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/data/model/LoginResponse;
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/data/repository/UserRepository;->parseLoginResponse(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/data/model/LoginResponse;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance()Lcom/zinhao/kikoeru/data/repository/UserRepository;
    .locals 1

    .line 29
    sget-object v0, Lcom/zinhao/kikoeru/data/repository/UserRepository;->instance:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/zinhao/kikoeru/data/repository/UserRepository;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/data/repository/UserRepository;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/data/repository/UserRepository;->instance:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    .line 32
    :cond_0
    sget-object v0, Lcom/zinhao/kikoeru/data/repository/UserRepository;->instance:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    return-object v0
.end method

.method private parseLoginResponse(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/data/model/LoginResponse;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .line 160
    new-instance p0, Lcom/zinhao/kikoeru/data/model/LoginResponse;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;-><init>()V

    .line 161
    const-string v0, "token"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->setToken(Ljava/lang/String;)V

    .line 162
    const-string v0, "error"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->setError(Ljava/lang/String;)V

    .line 165
    const-string v0, "errors"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 166
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 167
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 168
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 169
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 171
    new-instance v4, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;

    invoke-direct {v4}, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;-><init>()V

    .line 172
    const-string v5, "msg"

    invoke-virtual {v3, v5, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->setMsg(Ljava/lang/String;)V

    .line 173
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 176
    :cond_1
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->setErrors(Ljava/util/List;)V

    :cond_2
    return-object p0
.end method


# virtual methods
.method public deleteUser(Lcom/zinhao/kikoeru/db/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation

    .line 142
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->deleteUser(Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method public getAllUsers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation

    .line 120
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getCurrentUser()Lcom/zinhao/kikoeru/db/User;
    .locals 0

    .line 127
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object p0

    return-object p0
.end method

.method public hasUsers()Z
    .locals 0

    .line 149
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public isLoggedIn()Z
    .locals 0

    .line 156
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "username",
            "password",
            "host"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "Lcom/zinhao/kikoeru/data/model/LoginResponse;",
            ">;>;"
        }
    .end annotation

    .line 42
    new-instance v2, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v2}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    .line 43
    invoke-static {}, Lcom/zinhao/kikoeru/data/model/Result;->loading()Lcom/zinhao/kikoeru/data/model/Result;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Login request: user="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UserRepository"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    new-instance v0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;-><init>(Lcom/zinhao/kikoeru/data/repository/UserRepository;Landroidx/lifecycle/MutableLiveData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3, v4, v5, v0}, Lcom/zinhao/kikoeru/Api;->doGetToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-object v2
.end method

.method public switchUser(Lcom/zinhao/kikoeru/db/User;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation

    .line 134
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->setCurrentUserId(J)V

    .line 135
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
