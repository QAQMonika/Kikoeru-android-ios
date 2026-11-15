.class public final Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;
.super Ljava/lang/Object;
.source "BaseActivity.kt"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/BaseActivity;->requestReadWriteExternalPermission(Ljava/lang/Runnable;)Z
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
        "com/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1",
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
.field final synthetic $callback:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/zinhao/kikoeru/BaseActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/BaseActivity;Ljava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;->this$0:Lcom/zinhao/kikoeru/BaseActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;->$callback:Ljava/lang/Runnable;

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    const-string p2, "dialog"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;->this$0:Lcom/zinhao/kikoeru/BaseActivity;

    const/16 v1, 0x17

    invoke-virtual {v0, p2, v1}, Lcom/zinhao/kikoeru/BaseActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 99
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 100
    iget-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;->this$0:Lcom/zinhao/kikoeru/BaseActivity;

    iget-object p0, p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;->$callback:Ljava/lang/Runnable;

    invoke-static {p1, p0}, Lcom/zinhao/kikoeru/BaseActivity;->access$setActivityResultCallBack$p(Lcom/zinhao/kikoeru/BaseActivity;Ljava/lang/Runnable;)V

    return-void
.end method
