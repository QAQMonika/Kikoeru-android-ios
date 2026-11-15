.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;
.super Ljava/lang/Object;
.source "UserSwitchActivity.kt"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity;->switchUser(Lcom/zinhao/kikoeru/db/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "com/zinhao/kikoeru/UserSwitchActivity$switchUser$1",
        "Landroid/content/DialogInterface$OnClickListener;",
        "onClick",
        "",
        "dialog",
        "Landroid/content/DialogInterface;",
        "which",
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
.field final synthetic $user:Lcom/zinhao/kikoeru/db/User;

.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/db/User;Lcom/zinhao/kikoeru/UserSwitchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->$user:Lcom/zinhao/kikoeru/db/User;

    iput-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    const-string p2, "dialog"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 54
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p1

    const-string p2, "getToken(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p2

    const-string v0, "getHost(...)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    new-instance p2, Landroid/content/Intent;

    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->stopService(Landroid/content/Intent;)Z

    .line 56
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p2

    const-string v0, "getId(...)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-string p2, "current_user_database_id"

    invoke-virtual {p1, p2, v1, v2}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 57
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/zinhao/kikoeru/App;->setCurrentUserId(J)V

    .line 58
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    new-instance p2, Landroid/content/Intent;

    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/LauncherActivity;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->startActivity(Landroid/content/Intent;)V

    .line 59
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->finish()V

    return-void
.end method
