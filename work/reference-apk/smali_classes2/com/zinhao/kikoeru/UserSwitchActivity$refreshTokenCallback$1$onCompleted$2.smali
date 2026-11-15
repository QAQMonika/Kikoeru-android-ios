.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;
.super Ljava/lang/Object;
.source "UserSwitchActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2",
        "Ljava/lang/Runnable;",
        "run",
        "",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $asyncHttpResponse:Lcom/koushikdutta/async/http/AsyncHttpResponse;

.field final synthetic $stringBuilder:Ljava/lang/StringBuilder;

.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/StringBuilder;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->$asyncHttpResponse:Lcom/koushikdutta/async/http/AsyncHttpResponse;

    iput-object p3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->$stringBuilder:Ljava/lang/StringBuilder;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast v0, Landroid/content/Context;

    .line 115
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    iget-object v1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->$asyncHttpResponse:Lcom/koushikdutta/async/http/AsyncHttpResponse;

    invoke-interface {v1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$2;->$stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x2

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string v1, "%d:%s"

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "format(...)"

    invoke-static {p0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    .line 113
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 117
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
