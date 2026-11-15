.class public final Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J0\u0010\u0002\u001a\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016\u00a8\u0006\u000c"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "onItemClick",
        "",
        "parent",
        "Landroid/widget/AdapterView;",
        "view",
        "Landroid/view/View;",
        "position",
        "",
        "id",
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
.field final synthetic $listPopupWindow:Landroidx/appcompat/widget/ListPopupWindow;

.field final synthetic $v:Landroid/view/View;

.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/zinhao/kikoeru/WorksActivity;Landroidx/appcompat/widget/ListPopupWindow;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->$v:Landroid/view/View;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    iput-object p3, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->$listPopupWindow:Landroidx/appcompat/widget/ListPopupWindow;

    .line 655
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 657
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->$v:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lorg/json/JSONObject;

    .line 659
    :try_start_0
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object p2

    const-string p3, "id"

    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/zinhao/kikoeru/LocalFileCache;->removeWork(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 661
    invoke-virtual {p2}, Lorg/json/JSONException;->printStackTrace()V

    .line 662
    iget-object p3, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast p2, Ljava/lang/Exception;

    invoke-virtual {p3, p2}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    .line 665
    :goto_0
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;

    move-result-object p2

    const/4 p3, 0x0

    const-string p4, "works"

    if-nez p2, :cond_0

    invoke-static {p4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p2, p3

    :cond_0
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_2

    .line 667
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;

    move-result-object p2

    if-nez p2, :cond_1

    invoke-static {p4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    move-object p3, p2

    :goto_1
    invoke-interface {p3, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 668
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemRemoved(I)V

    .line 670
    :cond_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2$onLongClick$1;->$listPopupWindow:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    return-void
.end method
