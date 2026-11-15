.class public final Lcom/zinhao/kikoeru/WorksActivity$setupView$1;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/BaseActivity$InsetReady;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->setupView()V
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
        "com/zinhao/kikoeru/WorksActivity$setupView$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInsetReady(Landroidx/core/graphics/Insets;)V
    .locals 6

    const-string v0, "insets"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "viewBinding"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget v3, p1, Landroidx/core/graphics/Insets;->left:I

    iget v4, p1, Landroidx/core/graphics/Insets;->right:I

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5, v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setPadding(IIII)V

    .line 117
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-result-object p0

    if-nez p0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, p0

    :goto_0
    iget-object p0, v1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->linearLayout:Landroid/widget/LinearLayout;

    iget v0, p1, Landroidx/core/graphics/Insets;->left:I

    iget v1, p1, Landroidx/core/graphics/Insets;->right:I

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p0, v0, v5, v1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {v3, p1}, Lcom/zinhao/kikoeru/AppShell;->homeInsets(Landroid/app/Activity;I)V

    return-void
.end method
