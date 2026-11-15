.class public Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "LoginViewModel.java"


# instance fields
.field private final errorMessage:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final host:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final isLoading:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final loginSuccess:Lcom/zinhao/kikoeru/utils/SingleLiveEvent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/utils/SingleLiveEvent<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final password:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final userRepository:Lcom/zinhao/kikoeru/data/repository/UserRepository;

.field private final username:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 32
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 23
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    const-string v1, ""

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->username:Landroidx/lifecycle/MutableLiveData;

    .line 24
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->password:Landroidx/lifecycle/MutableLiveData;

    .line 25
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    const-string v1, "https://api.asmr.one"

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->host:Landroidx/lifecycle/MutableLiveData;

    .line 28
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->isLoading:Landroidx/lifecycle/MutableLiveData;

    .line 29
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    .line 30
    new-instance v0, Lcom/zinhao/kikoeru/utils/SingleLiveEvent;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/utils/SingleLiveEvent;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->loginSuccess:Lcom/zinhao/kikoeru/utils/SingleLiveEvent;

    .line 33
    invoke-static {}, Lcom/zinhao/kikoeru/data/repository/UserRepository;->getInstance()Lcom/zinhao/kikoeru/data/repository/UserRepository;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->userRepository:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->isLoading:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Lcom/zinhao/kikoeru/utils/SingleLiveEvent;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->loginSuccess:Lcom/zinhao/kikoeru/utils/SingleLiveEvent;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method


# virtual methods
.method public getErrorMessage()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public getHost()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->host:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public getIsLoading()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->isLoading:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public getLoginSuccess()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 59
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->loginSuccess:Lcom/zinhao/kikoeru/utils/SingleLiveEvent;

    return-object p0
.end method

.method public getPassword()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 42
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->password:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public getUsername()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 38
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->username:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public hasExistingUser()Z
    .locals 0

    .line 157
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->userRepository:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/data/repository/UserRepository;->hasUsers()Z

    move-result p0

    return p0
.end method

.method public login()V
    .locals 5

    .line 79
    iget-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->username:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0}, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 80
    iget-object v1, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->password:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v1}, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 81
    iget-object v2, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->host:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v2}, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_2

    :cond_0
    if-eqz v1, :cond_5

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    if-eqz v2, :cond_4

    .line 91
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 98
    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "https://"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 99
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 102
    :cond_3
    iget-object v3, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->isLoading:Landroidx/lifecycle/MutableLiveData;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 103
    iget-object v3, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 105
    iget-object v3, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->userRepository:Lcom/zinhao/kikoeru/data/repository/UserRepository;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1, v2}, Lcom/zinhao/kikoeru/data/repository/UserRepository;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/lifecycle/LiveData;

    move-result-object v0

    .line 106
    new-instance v1, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;

    invoke-direct {v1, p0, v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;Landroidx/lifecycle/LiveData;)V

    invoke-virtual {v0, v1}, Landroidx/lifecycle/LiveData;->observeForever(Landroidx/lifecycle/Observer;)V

    return-void

    .line 92
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    const-string v0, "\u8bf7\u8f93\u5165\u670d\u52a1\u5668\u5730\u5740"

    invoke-virtual {p0, v0}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void

    .line 88
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    const-string v0, "\u8bf7\u8f93\u5165\u5bc6\u7801"

    invoke-virtual {p0, v0}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void

    .line 84
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->errorMessage:Landroidx/lifecycle/MutableLiveData;

    const-string v0, "\u8bf7\u8f93\u5165\u7528\u6237\u540d"

    invoke-virtual {p0, v0}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public loginAsGuest()V
    .locals 1

    .line 148
    const-string v0, "guest"

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->setUsername(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->setPassword(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->login()V

    return-void
.end method

.method protected onCleared()V
    .locals 0

    .line 162
    invoke-super {p0}, Landroidx/lifecycle/ViewModel;->onCleared()V

    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 72
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->host:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 68
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->password:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 64
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->username:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method
