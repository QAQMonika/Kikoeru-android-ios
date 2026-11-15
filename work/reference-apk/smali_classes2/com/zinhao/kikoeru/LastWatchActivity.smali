.class public final Lcom/zinhao/kikoeru/LastWatchActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "LastWatchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLastWatchActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LastWatchActivity.kt\ncom/zinhao/kikoeru/LastWatchActivity\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,83:1\n1021#2,2:84\n*S KotlinDebug\n*F\n+ 1 LastWatchActivity.kt\ncom/zinhao/kikoeru/LastWatchActivity\n*L\n29#1:84,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0014R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/LastWatchActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "<init>",
        "()V",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "searchWorkCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
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
.field private final searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 59
    new-instance v0, Lcom/zinhao/kikoeru/LastWatchActivity$searchWorkCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/LastWatchActivity$searchWorkCallback$1;-><init>(Lcom/zinhao/kikoeru/LastWatchActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LastWatchActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-void
.end method

.method public static final synthetic access$getSearchWorkCallback$p(Lcom/zinhao/kikoeru/LastWatchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/LastWatchActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-object p0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 21
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LastWatchActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/LastWatchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;

    .line 23
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LastWatchActivity;->setContentView(Landroid/view/View;)V

    .line 24
    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/BaseActivity;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LastWatchActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const-string v1, "getDecorView(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {p1, v0, v1, v2, v1}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea$default(Lcom/zinhao/kikoeru/BaseActivity;Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;ILjava/lang/Object;)V

    .line 25
    sget p1, Lcom/zinhao/kikoeru/R$string;->local_history:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LastWatchActivity;->setTitle(I)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->installHistory(Landroid/app/Activity;)V

    .line 27
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LastWatchActivity;->getApplication()Landroid/app/Application;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type com.zinhao.kikoeru.App"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/App;

    .line 28
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->getLocalWorkHistoryList()Ljava/util/List;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LocalHistory;->merge(Landroid/app/Activity;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 29
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 84
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    new-instance v0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$$inlined$sortBy$1;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$$inlined$sortBy$1;-><init>()V

    check-cast v0, Ljava/util/Comparator;

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->sortWith(Ljava/util/List;Ljava/util/Comparator;)V

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LastWatchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;->mainRecycler:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;

    invoke-direct {v1, p1, p0}, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;-><init>(Ljava/util/List;Lcom/zinhao/kikoeru/LastWatchActivity;)V

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 56
    iget-object p1, p0, Lcom/zinhao/kikoeru/LastWatchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityLocalHistoryBinding;->mainRecycler:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/zinhao/kikoeru/LocalHistory;->refresh(Landroid/app/Activity;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->resumeHistory(Landroid/app/Activity;)V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->pauseHistory(Landroid/app/Activity;)V
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onPause()V
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->destroyHistory(Landroid/app/Activity;)V
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V
    return-void
.end method
