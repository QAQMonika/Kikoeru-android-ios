.class Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;
.super Ljava/lang/Object;
.source "UserRepository.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/data/repository/UserRepository$1;

.field final synthetic val$loginResponse:Lcom/zinhao/kikoeru/data/model/LoginResponse;

.field final synthetic val$user:Lcom/zinhao/kikoeru/db/User;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/data/repository/UserRepository$1;Lcom/zinhao/kikoeru/db/User;Lcom/zinhao/kikoeru/data/model/LoginResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$1",
            "val$user",
            "val$loginResponse"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 88
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->this$1:Lcom/zinhao/kikoeru/data/repository/UserRepository$1;

    iput-object p2, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$user:Lcom/zinhao/kikoeru/db/User;

    iput-object p3, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$loginResponse:Lcom/zinhao/kikoeru/data/model/LoginResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Login success, userId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UserRepository"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$loginResponse:Lcom/zinhao/kikoeru/data/model/LoginResponse;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/data/model/LoginResponse;->getToken()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->this$1:Lcom/zinhao/kikoeru/data/repository/UserRepository$1;

    iget-object v1, v1, Lcom/zinhao/kikoeru/data/repository/UserRepository$1;->val$host:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string v3, "current_user_database_id"

    invoke-virtual {v0, v3, v1, v2}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 94
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    iget-object p0, p0, Lcom/zinhao/kikoeru/data/repository/UserRepository$1$1;->val$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/zinhao/kikoeru/App;->setCurrentUserId(J)V

    return-void
.end method
