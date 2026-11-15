.class public final Lcom/zinhao/kikoeru/ui/WorkPageActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "WorkPageActivity.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\nB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0014R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/WorkPageActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "<init>",
        "()V",
        "binding",
        "Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "WorkPagerAdapter",
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
.field private binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;


# direct methods
.method public static synthetic $r8$lambda$VqHSHkMnOWsgm6z62NfdTjfI-lI(Ljava/util/ArrayList;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->onCreate$lambda$0(Ljava/util/ArrayList;Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method

.method private static final onCreate$lambda$0(Ljava/util/ArrayList;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 1

    const-string v0, "tab"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 23
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    .line 25
    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    move-object v0, p0

    check-cast v0, Landroidx/lifecycle/ViewModelStoreOwner;

    invoke-direct {p1, v0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    .line 26
    iget-object p1, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    const-string v0, "binding"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->setContentView(Landroid/view/View;)V

    .line 27
    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/BaseActivity;

    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    if-nez v2, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_1
    iget-object v2, v2, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    const-string v3, "appBarLayout"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroid/view/View;

    const/4 v3, 0x2

    invoke-static {p1, v2, v1, v3, v1}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea$default(Lcom/zinhao/kikoeru/BaseActivity;Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;ILjava/lang/Object;)V

    const/4 p1, 0x6

    .line 29
    new-array p1, p1, [Ljava/lang/String;

    sget v2, Lcom/zinhao/kikoeru/R$string;->all_works:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, "getString(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x0

    aput-object v2, p1, v5

    sget v2, Lcom/zinhao/kikoeru/R$string;->listening:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x1

    aput-object v2, p1, v5

    .line 30
    sget v2, Lcom/zinhao/kikoeru/R$string;->listened:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    aput-object v2, p1, v3

    sget v2, Lcom/zinhao/kikoeru/R$string;->marked:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x3

    aput-object v2, p1, v3

    sget v2, Lcom/zinhao/kikoeru/R$string;->replay:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x4

    aput-object v2, p1, v3

    sget v2, Lcom/zinhao/kikoeru/R$string;->postponed:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x5

    aput-object v2, p1, v3

    .line 29
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->arrayListOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    .line 31
    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    if-nez v2, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_2
    iget-object v2, v2, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->vp:Landroidx/viewpager2/widget/ViewPager2;

    new-instance v3, Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;

    move-object v4, p0

    check-cast v4, Landroidx/fragment/app/FragmentActivity;

    invoke-direct {v3, v4}, Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, v3}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    new-instance v2, Lcom/google/android/material/tabs/TabLayoutMediator;

    iget-object v3, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    if-nez v3, :cond_3

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v1

    :cond_3
    iget-object v3, v3, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->tabLayout:Lcom/google/android/material/tabs/TabLayout;

    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/WorkPageActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;

    if-nez p0, :cond_4

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    move-object v1, p0

    :goto_0
    iget-object p0, v1, Lcom/zinhao/kikoeru/databinding/ActivityWorkPageBinding;->vp:Landroidx/viewpager2/widget/ViewPager2;

    .line 34
    new-instance v0, Lcom/zinhao/kikoeru/ui/WorkPageActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lcom/zinhao/kikoeru/ui/WorkPageActivity$$ExternalSyntheticLambda0;-><init>(Ljava/util/ArrayList;)V

    .line 32
    invoke-direct {v2, v3, p0, v0}, Lcom/google/android/material/tabs/TabLayoutMediator;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroidx/viewpager2/widget/ViewPager2;Lcom/google/android/material/tabs/TabLayoutMediator$TabConfigurationStrategy;)V

    .line 34
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayoutMediator;->attach()V

    return-void
.end method
