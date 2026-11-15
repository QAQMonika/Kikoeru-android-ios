.class public final Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;
.super Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;
.source "WorkFragment.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;",
        "Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;",
        "<init>",
        "()V",
        "load",
        "",
        "viewmodel",
        "Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;",
        "layoutManager",
        "Landroidx/recyclerview/widget/RecyclerView$LayoutManager;",
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


# direct methods
.method public static synthetic $r8$lambda$r47m4NVugZtOwiQraOUqEmzCGos(Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->load$lambda$0(Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 124
    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;-><init>()V

    return-void
.end method

.method private static final load$lambda$0(Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;
    .locals 2

    if-eqz p2, :cond_2

    .line 128
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object v0

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->text:Landroid/widget/TextView;

    move-object v1, p2

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getWorksAdapter()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    move-result-object v0

    if-nez v0, :cond_1

    .line 130
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;-><init>()V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->setWorksAdapter(Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;)V

    .line 131
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getWorksAdapter()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->submitList(Ljava/util/List;)V

    .line 132
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p2

    iget-object p2, p2, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getWorksAdapter()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 133
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p0

    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    goto :goto_0

    .line 135
    :cond_1
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getWorksAdapter()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p0, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->submitList(Ljava/util/List;)V

    .line 138
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public load(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
    .locals 3

    const-string v0, "viewmodel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "layoutManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->getReplayWorksList()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;->getViewLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    new-instance v2, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p2}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$sam$androidx_lifecycle_Observer$0;

    invoke-direct {p0, v2}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast p0, Landroidx/lifecycle/Observer;

    invoke-virtual {v0, v1, p0}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 139
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->getReplayWorksList()Landroidx/lifecycle/LiveData;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 140
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->loadReplayWorks()V

    return-void
.end method
