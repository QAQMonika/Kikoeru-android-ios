.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;
.source "WorkTreeActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J,\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;",
        "onCompleted",
        "",
        "e",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "asyncHttpResponse",
        "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
        "jsonArray",
        "Lorg/json/JSONArray;",
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
.method public static synthetic $r8$lambda$PPWTL43cdn8DnZ99yUyc5MBbLKk(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$R2AUf0WWDABojoZbYJ1Z6PhlRr0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->onCompleted$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 110
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 1

    .line 112
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "viewBinding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method

.method private static final onCompleted$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 5

    .line 123
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getJsonWorkTrees$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWork$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const-string v2, "work"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v3

    :cond_0
    const-string v4, "id"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter;-><init>(Lorg/json/JSONArray;I)V

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/WorkTreeAdapter;)V

    .line 124
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->setItemClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    :cond_1
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->setParentDirClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    :cond_2
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object v0

    if-eqz v0, :cond_3

    move-object v1, p0

    check-cast v1, Landroid/view/View$OnLongClickListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->setItemLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 137
    :cond_3
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object v0

    if-eqz v0, :cond_4

    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->setPathChangeListener(Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;)V

    .line 139
    :cond_4
    new-instance v0, Landroidx/recyclerview/widget/DividerItemDecoration;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    .line 140
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getRecyclerView$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v2

    const-string v4, "recyclerView"

    if-nez v2, :cond_5

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v3

    :cond_5
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 141
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getRecyclerView$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    if-nez v0, :cond_6

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v3

    :cond_6
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 142
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getRecyclerView$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    if-nez v0, :cond_7

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v3

    :cond_7
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 143
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getRecyclerView$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    if-nez v0, :cond_8

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_8
    move-object v3, v0

    :goto_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object p0

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v3, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    new-instance v1, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_0

    .line 114
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-eqz p2, :cond_2

    .line 117
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_1

    goto :goto_0

    .line 120
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setJsonWorkTrees$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONArray;)V

    .line 122
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 110
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V

    return-void
.end method
