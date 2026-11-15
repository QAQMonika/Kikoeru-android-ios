.class public Lcom/zinhao/kikoeru/LrcFloatWindow;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "LrcFloatWindow.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "resultCode",
            "data"
        }
    .end annotation

    .line 72
    invoke-super {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 73
    iget-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz p1, :cond_1

    .line 74
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 75
    iget-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->showLrcFloatWindow()V

    .line 77
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->finishAndRemoveTask()V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 26
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 28
    new-instance p1, Landroid/app/AlertDialog$Builder;

    sget v0, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {p1, p0, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 29
    const-string v0, "\u8fd8\u6ca1\u6709\u663e\u793a\u60ac\u6d6e\u7a97\u53e3\u7684\u6743\u9650\uff01"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/LrcFloatWindow$2;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LrcFloatWindow$2;-><init>(Lcom/zinhao/kikoeru/LrcFloatWindow;)V

    .line 30
    const-string v2, "\u53d6\u6d88"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/LrcFloatWindow$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LrcFloatWindow$1;-><init>(Lcom/zinhao/kikoeru/LrcFloatWindow;)V

    .line 36
    const-string v2, "\u53bb\u5f00\u542f"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 42
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 43
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 45
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p0, v0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 66
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V

    .line 67
    invoke-virtual {p0, p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "service"
        }
    .end annotation

    .line 51
    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LrcFloatWindow;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    .line 52
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 54
    iget-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->showLrcFloatWindow()V

    .line 55
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->finishAndRemoveTask()V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    return-void
.end method
