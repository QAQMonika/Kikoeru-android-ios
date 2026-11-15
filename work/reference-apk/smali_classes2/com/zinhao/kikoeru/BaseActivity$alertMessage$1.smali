.class public final Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;
.super Ljava/lang/Object;
.source "BaseActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/BaseActivity;->alertMessage(Lcom/zinhao/kikoeru/AppMessage;)V
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
        "com/zinhao/kikoeru/BaseActivity$alertMessage$1",
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
.field final synthetic $e:Lcom/zinhao/kikoeru/AppMessage;

.field final synthetic this$0:Lcom/zinhao/kikoeru/BaseActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/BaseActivity;Lcom/zinhao/kikoeru/AppMessage;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->this$0:Lcom/zinhao/kikoeru/BaseActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 162
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->this$0:Lcom/zinhao/kikoeru/BaseActivity;

    check-cast v1, Landroid/content/Context;

    sget v2, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 163
    iget-object v1, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AppMessage;->getTitle()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    iget-object v2, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-virtual {v3}, Lcom/zinhao/kikoeru/AppMessage;->getMessage()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%s: %s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "format(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 165
    iget-object v1, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/AppMessage;->getActionName()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    new-instance v2, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1;-><init>(Lcom/zinhao/kikoeru/AppMessage;)V

    check-cast v2, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 171
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method
