.class public final Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "WorksActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->setupListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J \u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0007H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$setupListener$5",
        "Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;",
        "onScrollStateChanged",
        "",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "newState",
        "",
        "onScrolled",
        "dx",
        "dy",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 158
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 4

    const-string v0, "recyclerView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 161
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "works"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorksActivity;->access$getTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v3

    if-lt v0, v3, :cond_1

    .line 162
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->setLoading(Z)V

    return-void

    :cond_1
    if-nez p2, :cond_3

    .line 166
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object p2

    if-eqz p2, :cond_3

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 167
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/WorkAdapter;->isLoading()Z

    move-result p2

    if-nez p2, :cond_3

    const/4 p2, 0x1

    .line 168
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result p1

    if-nez p1, :cond_3

    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "work size:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;

    move-result-object p2

    if-nez p2, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, p2

    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ", total:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "WorksActivity"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getType$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    :cond_3
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1

    const-string v0, "recyclerView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    return-void
.end method
