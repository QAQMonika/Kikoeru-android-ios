.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1;
.super Ljava/lang/Object;
.source "WorkTreeActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity;->showBottomLayout()V
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
        "com/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 531
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setShouldShowAnim$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Z)V

    return-void
.end method
