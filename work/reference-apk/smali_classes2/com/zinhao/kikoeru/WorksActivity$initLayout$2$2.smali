.class public final Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->initLayout(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$initLayout$2$2",
        "Landroid/view/View$OnLongClickListener;",
        "onLongClick",
        "",
        "v",
        "Landroid/view/View;",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 639
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 7

    const-string v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 641
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getType$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v0

    const/16 v1, 0x1f2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    return v2

    .line 644
    :cond_0
    new-instance v0, Landroidx/appcompat/widget/ListPopupWindow;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    .line 645
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ListPopupWindow;->setModal(Z)V

    .line 646
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 647
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    sget v3, Lcom/zinhao/kikoeru/R$string;->delete_cache:I

    invoke-virtual {v1, v3}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "getString(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 649
    new-instance v3, Landroid/widget/ArrayAdapter;

    .line 650
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 652
    new-array v5, v2, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const v5, 0x1090003

    .line 649
    invoke-direct {v3, v4, v5, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    check-cast v3, Landroid/widget/ListAdapter;

    .line 648
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 655
    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {v1, p1, p0, v0}, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;-><init>(Landroid/view/View;Lcom/zinhao/kikoeru/WorksActivity;Landroidx/appcompat/widget/ListPopupWindow;)V

    check-cast v1, Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 673
    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    return v2
.end method
