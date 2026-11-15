.class public final Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;
.super Ljava/lang/Object;
.source "LoginAccountActivity.kt"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LoginAccountActivity;->observeViewModel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u0017\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "com/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1",
        "Landroidx/lifecycle/Observer;",
        "",
        "onChanged",
        "",
        "isLoading",
        "(Ljava/lang/Boolean;)V",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/LoginAccountActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;->this$0:Lcom/zinhao/kikoeru/LoginAccountActivity;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Ljava/lang/Boolean;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 60
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;->this$0:Lcom/zinhao/kikoeru/LoginAccountActivity;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 61
    invoke-static {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->access$getBtSignIn$p(Lcom/zinhao/kikoeru/LoginAccountActivity;)Landroid/widget/Button;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 62
    invoke-static {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->access$getBtGuest$p(Lcom/zinhao/kikoeru/LoginAccountActivity;)Landroid/widget/Button;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0

    .line 58
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;->onChanged(Ljava/lang/Boolean;)V

    return-void
.end method
