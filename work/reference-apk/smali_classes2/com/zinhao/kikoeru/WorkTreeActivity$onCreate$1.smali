.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$onCreate$1;
.super Ljava/lang/Object;
.source "WorkTreeActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/BaseActivity$InsetReady;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/WorkTreeActivity$onCreate$1",
        "Lcom/zinhao/kikoeru/BaseActivity$InsetReady;",
        "onInsetReady",
        "",
        "insets",
        "Landroidx/core/graphics/Insets;",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$onCreate$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInsetReady(Landroidx/core/graphics/Insets;)V
    .locals 3

    const-string v0, "insets"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$onCreate$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "viewBinding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p0

    .line 156
    iget v0, p1, Landroidx/core/graphics/Insets;->left:I

    iget v1, p1, Landroidx/core/graphics/Insets;->right:I

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    const/4 v2, 0x0

    .line 155
    invoke-virtual {p0, v0, v2, v1, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setPadding(IIII)V

    return-void
.end method
