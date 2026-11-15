.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1;
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
        "com/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 85
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast p0, Landroid/content/Context;

    const-string v0, "refresh token success!"

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 86
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
