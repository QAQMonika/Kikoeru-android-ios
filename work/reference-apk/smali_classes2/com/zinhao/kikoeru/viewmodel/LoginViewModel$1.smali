.class Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;
.super Ljava/lang/Object;
.source "LoginViewModel.java"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->login()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Lcom/zinhao/kikoeru/data/model/Result<",
        "Lcom/zinhao/kikoeru/data/model/LoginResponse;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

.field final synthetic val$result:Landroidx/lifecycle/LiveData;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;Landroidx/lifecycle/LiveData;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 106
    iput-object p1, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    iput-object p2, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->val$result:Landroidx/lifecycle/LiveData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Lcom/zinhao/kikoeru/data/model/Result;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loginResult"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/data/model/Result<",
            "Lcom/zinhao/kikoeru/data/model/LoginResponse;",
            ">;)V"
        }
    .end annotation

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Login result status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->getStatus()Lcom/zinhao/kikoeru/data/model/Result$Status;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LoginViewModel"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->isLoading()Z

    move-result v0

    const/4 v2, 0x1

    .line 113
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->access$000(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->val$result:Landroidx/lifecycle/LiveData;

    invoke-virtual {v0, p0}, Landroidx/lifecycle/LiveData;->removeObserver(Landroidx/lifecycle/Observer;)V

    .line 119
    iget-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->access$000(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 122
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->getData()Ljava/lang/Object;

    move-result-object v0

    const-string v3, "null"

    if-eqz v0, :cond_2

    .line 123
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/data/model/LoginResponse;

    .line 124
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getToken()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string v4, "***"

    goto :goto_0

    :cond_1
    move-object v4, v3

    :goto_0
    const-string v5, "Token: "

    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getError()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ErrorMessage: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getErrorMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :cond_2
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 130
    const-string p1, "Login success!"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->access$100(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Lcom/zinhao/kikoeru/utils/SingleLiveEvent;

    move-result-object p0

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/utils/SingleLiveEvent;->setValue(Ljava/lang/Object;)V

    return-void

    .line 133
    :cond_3
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/data/model/Result;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Login failed: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_4

    .line 135
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 136
    :cond_4
    const-string p1, "\u767b\u5f55\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u6216\u670d\u52a1\u5668\u5730\u5740"

    .line 138
    :cond_5
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->access$200(Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;)Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "loginResult"
        }
    .end annotation

    .line 106
    check-cast p1, Lcom/zinhao/kikoeru/data/model/Result;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel$1;->onChanged(Lcom/zinhao/kikoeru/data/model/Result;)V

    return-void
.end method
