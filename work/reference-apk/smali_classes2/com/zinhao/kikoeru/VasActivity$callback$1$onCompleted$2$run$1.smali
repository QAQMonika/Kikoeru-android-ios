.class public final Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;
.super Ljava/lang/Object;
.source "VasActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->run()V
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
        "com/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/VasActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/VasActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 119
    iget-object v0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "vasView"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/TagsView;->isInLayout()Z

    move-result v0

    if-nez v0, :cond_2

    .line 120
    iget-object p0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object p0

    if-nez p0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, p0

    :goto_0
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/TagsView;->requestLayout()V

    :cond_2
    return-void
.end method
