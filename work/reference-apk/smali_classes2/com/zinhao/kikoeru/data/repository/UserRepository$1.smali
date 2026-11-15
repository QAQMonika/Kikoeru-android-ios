.class Lcom/zinhao/kikoeru/data/repository/UserRepository$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "UserRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/data/repository/UserRepository;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private isCompleted:Z

.field final synthetic this$0:Lcom/zinhao/kikoeru/data/repository/UserRepository;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$password:Ljava/lang/String;

.field final synthetic val$result:Landroidx/lifecycle/MutableLiveData;

.field final synthetic val$username:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/data/repository/UserRepository;Landroidx/lifecycle/MutableLiveData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$result",
            "val$username",
            "val$password",
            "val$host"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->this$0:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    iput-object p2, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$result:Landroidx/lifecycle/MutableLiveData;

    iput-object p3, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$username:Ljava/lang/String;

    iput-object p4, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$password:Ljava/lang/String;

    iput-object p5, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$host:Ljava/lang/String;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    const/4 p1, 0x0

    .line 47
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->isCompleted:Z

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "response",
            "jsonObject"
        }
    .end annotation

    .line 52
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->isCompleted:Z

    const-string v1, "UserRepository"

    if-eqz v0, :cond_0

    .line 53
    const-string p0, "Callback already completed, ignore"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->isCompleted:Z

    .line 58
    const-string v0, "Login response received"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_3

    .line 60
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 61
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_2

    .line 62
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Network error: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 64
    :cond_2
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Login exception: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 65
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$result:Landroidx/lifecycle/MutableLiveData;

    invoke-static {p2, p1}, Lcom/zinhao/kikoeru/data/model/Result;->error(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/zinhao/kikoeru/data/model/Result;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    return-void

    :cond_3
    if-nez p3, :cond_4

    .line 69
    const-string p1, "Login response is null"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$result:Landroidx/lifecycle/MutableLiveData;

    const-string p1, "Network error"

    invoke-static {p1}, Lcom/zinhao/kikoeru/data/model/Result;->error(Ljava/lang/String;)Lcom/zinhao/kikoeru/data/model/Result;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    return-void

    .line 74
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Login response: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    if-eqz p2, :cond_5

    .line 75
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result v0

    goto :goto_0

    :cond_5
    move v0, p1

    .line 76
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HTTP status code: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->this$0:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    invoke-static {v0, p3}, Lcom/zinhao/kikoeru/data/repository/UserRepository;->access$000(Lcom/zinhao/kikoeru/data/repository/UserRepository;Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/data/model/LoginResponse;

    move-result-object p3

    if-eqz p2, :cond_6

    .line 80
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result v0

    const/16 v2, 0xc8

    if-ne v0, v2, :cond_6

    invoke-virtual {p3}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 82
    new-instance p1, Lcom/zinhao/kikoeru/db/User;

    invoke-direct {p1}, Lcom/zinhao/kikoeru/db/User;-><init>()V

    .line 83
    iget-object p2, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$username:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/db/User;->setName(Ljava/lang/String;)V

    .line 84
    iget-object p2, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$password:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/db/User;->setPassword(Ljava/lang/String;)V

    .line 85
    iget-object p2, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$host:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/db/User;->setHost(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p3}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getToken()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/db/User;->setToken(Ljava/lang/String;)V

    .line 88
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p2

    new-instance v0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;

    invoke-direct {v0, p0, p1, p3}, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;-><init>(Lcom/zinhao/kikoeru/data/repository/UserRepository$1;Lcom/zinhao/kikoeru/db/User;Lcom/zinhao/kikoeru/data/model/LoginResponse;)V

    invoke-virtual {p2, p1, v0}, Lcom/zinhao/kikoeru/App;->insertUser(Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V

    .line 100
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$result:Landroidx/lifecycle/MutableLiveData;

    invoke-static {p3}, Lcom/zinhao/kikoeru/data/model/Result;->success(Ljava/lang/Object;)Lcom/zinhao/kikoeru/data/model/Result;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    return-void

    .line 102
    :cond_6
    invoke-virtual {p3}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getErrorMessage()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_7

    .line 103
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_7
    if-eqz p2, :cond_8

    .line 104
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    .line 105
    :cond_8
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Login failed (HTTP "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 107
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Login failed: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$result:Landroidx/lifecycle/MutableLiveData;

    invoke-static {p3}, Lcom/zinhao/kikoeru/data/model/Result;->error(Ljava/lang/String;)Lcom/zinhao/kikoeru/data/model/Result;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "e",
            "response",
            "jsonObject"
        }
    .end annotation

    .line 46
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
