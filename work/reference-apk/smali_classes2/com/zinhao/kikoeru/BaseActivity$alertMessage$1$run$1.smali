.class public final Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1;
.super Ljava/lang/Object;
.source "BaseActivity.kt"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;->run()V
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
        "com/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1",
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
.field final synthetic $e:Lcom/zinhao/kikoeru/AppMessage;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AppMessage;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const-string p2, "dialog"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    iget-object p0, p0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1$run$1;->$e:Lcom/zinhao/kikoeru/AppMessage;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AppMessage;->getAction()Ljava/lang/Runnable;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 168
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
