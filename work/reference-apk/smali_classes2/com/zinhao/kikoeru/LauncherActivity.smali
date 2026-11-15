.class public Lcom/zinhao/kikoeru/LauncherActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "LauncherActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 12
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object p1

    if-nez p1, :cond_0

    .line 15
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 20
    :goto_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LauncherActivity;->finish()V

    return-void
.end method
