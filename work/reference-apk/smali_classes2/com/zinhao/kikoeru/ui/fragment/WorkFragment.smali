.class public Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;
.super Landroidx/fragment/app/Fragment;
.source "WorkFragment.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0016\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J&\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016J\u001a\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00112\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016J\u0018\u0010\u001b\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0016R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001c\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000f\u00a8\u0006 "
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;",
        "Landroidx/fragment/app/Fragment;",
        "<init>",
        "()V",
        "binding",
        "Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;",
        "getBinding",
        "()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;",
        "setBinding",
        "(Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;)V",
        "worksAdapter",
        "Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;",
        "getWorksAdapter",
        "()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;",
        "setWorksAdapter",
        "(Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;)V",
        "onCreateView",
        "Landroid/view/View;",
        "inflater",
        "Landroid/view/LayoutInflater;",
        "container",
        "Landroid/view/ViewGroup;",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "onViewCreated",
        "",
        "view",
        "load",
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


# instance fields
.field public binding:Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

.field private worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;


# direct methods
.method public static synthetic $r8$lambda$uR74c9z-6rI1IcG3jIb0CvgQOg8(Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->load$lambda$0(Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private static final load$lambda$0(Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;Ljava/util/List;)Lkotlin/Unit;
    .locals 2

    if-eqz p2, :cond_1

    .line 46
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

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

    .line 47
    iget-object v0, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    .line 49
    invoke-virtual {v0, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->submitList(Ljava/util/List;)V

    .line 50
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p2

    iget-object p2, p2, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 51
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p0

    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 53
    invoke-virtual {v0, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->submitList(Ljava/util/List;)V

    .line 56
    :cond_1
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->binding:Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "binding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final getWorksAdapter()Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    return-object p0
.end method

.method public load(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V
    .locals 3

    const-string v0, "viewmodel"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "layoutManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->getWorksList()Landroidx/lifecycle/MutableLiveData;

    move-result-object v0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getViewLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;

    move-result-object v1

    new-instance v2, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p2}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$sam$androidx_lifecycle_Observer$0;

    invoke-direct {p0, v2}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment$sam$androidx_lifecycle_Observer$0;-><init>(Lkotlin/jvm/functions/Function1;)V

    check-cast p0, Landroidx/lifecycle/Observer;

    invoke-virtual {v0, v1, p0}, Landroidx/lifecycle/MutableLiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 57
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->getWorksList()Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 58
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->loadAllWorks()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    const-string p3, "inflater"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p3, 0x0

    .line 31
    invoke-static {p1, p2, p3}, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p1

    const-string p2, "inflate(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->setBinding(Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;)V

    .line 32
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getBinding()Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 37
    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    const-string v0, "requireActivity(...)"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Landroidx/lifecycle/ViewModelStoreOwner;

    invoke-direct {p1, p2}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class p2, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    invoke-virtual {p1, p2}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    .line 38
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit16 p2, p2, 0x18b

    const/4 v0, 0x2

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 39
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 40
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, p1, v0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->load(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public final setBinding(Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->binding:Lcom/zinhao/kikoeru/databinding/LayoutWorkFragmentBinding;

    return-void
.end method

.method public final setWorksAdapter(Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;->worksAdapter:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;

    return-void
.end method
