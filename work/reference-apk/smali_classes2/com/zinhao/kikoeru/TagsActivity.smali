.class public final Lcom/zinhao/kikoeru/TagsActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "TagsActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/TagsView$TagClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/TagsActivity$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 \u001f2\u00020\u00012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002:\u0001\u001fB\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0014J\u0012\u0010\u0015\u001a\u0004\u0018\u00010\u000c2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u0008\u0010\u0018\u001a\u00020\u0012H\u0014J\u0012\u0010\u001d\u001a\u00020\u00122\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0003H\u0016R\u0016\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00080\u0007X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082.\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0019\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u001aX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lcom/zinhao/kikoeru/TagsActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "Lorg/json/JSONObject;",
        "<init>",
        "()V",
        "tagsView",
        "Lcom/zinhao/kikoeru/TagsView;",
        "",
        "etInput",
        "Landroid/widget/EditText;",
        "allTags",
        "Lorg/json/JSONArray;",
        "imm",
        "Landroid/view/inputmethod/InputMethodManager;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "filterTag",
        "text",
        "",
        "onResume",
        "textGet",
        "Lcom/zinhao/kikoeru/TagsView$TextGet;",
        "callback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;",
        "onTagClick",
        "jsonObject",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/zinhao/kikoeru/TagsActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "TagsActivity"


# instance fields
.field private allTags:Lorg/json/JSONArray;

.field private final callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

.field private etInput:Landroid/widget/EditText;

.field private imm:Landroid/view/inputmethod/InputMethodManager;

.field private tagsView:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;


# direct methods
.method public static synthetic $r8$lambda$4qtwKiXZWBuwb-HkFxIfTV9Icig(Lcom/zinhao/kikoeru/TagsActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->onCreate$lambda$0(Lcom/zinhao/kikoeru/TagsActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Ctn881Ea32oMwhih_SIgl4-X41I(Lcom/zinhao/kikoeru/TagsActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/TagsActivity;->onCreate$lambda$1(Lcom/zinhao/kikoeru/TagsActivity;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/TagsActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/TagsActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/TagsActivity;->Companion:Lcom/zinhao/kikoeru/TagsActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 100
    new-instance v0, Lcom/zinhao/kikoeru/TagsActivity$textGet$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/TagsActivity$textGet$1;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView$TextGet;

    iput-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 112
    new-instance v0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/TagsActivity$callback$1;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    return-void
.end method

.method public static final synthetic access$filterTag(Lcom/zinhao/kikoeru/TagsActivity;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->filterTag(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getTagsView$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->tagsView:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public static final synthetic access$getTextGet$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    return-object p0
.end method

.method public static final synthetic access$getViewBinding$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    return-object p0
.end method

.method public static final synthetic access$setAllTags$p(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->allTags:Lorg/json/JSONArray;

    return-void
.end method

.method private final filterTag(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 10

    .line 71
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 72
    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 73
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->allTags:Lorg/json/JSONArray;

    return-object p0

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/TagsActivity;->allTags:Lorg/json/JSONArray;

    if-eqz v1, :cond_2

    .line 76
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    .line 78
    :try_start_0
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 79
    iget-object v6, p0, Lcom/zinhao/kikoeru/TagsActivity;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-interface {v6, v5}, Lcom/zinhao/kikoeru/TagsView$TextGet;->onGetText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 80
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v6, Ljava/lang/CharSequence;

    move-object v7, p1

    check-cast v7, Ljava/lang/CharSequence;

    const/4 v8, 0x2

    const/4 v9, 0x0

    invoke-static {v6, v7, v3, v8, v9}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 81
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    .line 84
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private static final onCreate$lambda$0(Lcom/zinhao/kikoeru/TagsActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 1

    const-string v0, "$this$addCallback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 38
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->setResult(I)V

    .line 39
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsActivity;->finish()V

    .line 40
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final onCreate$lambda$1(Lcom/zinhao/kikoeru/TagsActivity;)V
    .locals 0

    .line 65
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-static {p0}, Lcom/zinhao/kikoeru/Api;->doGetAllTags(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 33
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    .line 35
    const-string v0, "viewBinding"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->setContentView(Landroid/view/View;)V

    .line 36
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const-string v2, "getDecorView(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v1}, Lcom/zinhao/kikoeru/TagsActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 37
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object p1

    const-string v2, "<get-onBackPressedDispatcher>(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v2, p0

    check-cast v2, Landroidx/lifecycle/LifecycleOwner;

    new-instance v3, Lcom/zinhao/kikoeru/TagsActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/TagsActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    const/4 v4, 0x1

    invoke-static {p1, v2, v4, v3}, Landroidx/activity/OnBackPressedDispatcherKt;->addCallback(Landroidx/activity/OnBackPressedDispatcher;Landroidx/lifecycle/LifecycleOwner;ZLkotlin/jvm/functions/Function1;)Landroidx/activity/OnBackPressedCallback;

    .line 41
    const-string p1, "input_method"

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->imm:Landroid/view/inputmethod/InputMethodManager;

    .line 42
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    if-nez p1, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_1
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->tagsView:Lcom/zinhao/kikoeru/TagsView;

    const-string v2, "tagsView"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->tagsView:Lcom/zinhao/kikoeru/TagsView;

    if-nez p1, :cond_2

    .line 43
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    move-object v2, p0

    check-cast v2, Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {p1, v2}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 44
    sget p1, Lcom/zinhao/kikoeru/R$id;->editText:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string v2, "findViewById(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    .line 45
    const-string v2, "etInput"

    if-nez p1, :cond_3

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_3
    new-instance v3, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    check-cast v3, Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {p1, v3}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 54
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    if-nez p1, :cond_4

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_4
    new-instance v2, Lcom/zinhao/kikoeru/TagsActivity$onCreate$3;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/TagsActivity$onCreate$3;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    check-cast v2, Landroid/text/TextWatcher;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 65
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    if-nez p1, :cond_5

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_5
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v2, Lcom/zinhao/kikoeru/TagsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/TagsActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/TagsActivity;)V

    invoke-virtual {p1, v2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 66
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    if-nez p1, :cond_6

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    move-object v1, p1

    :goto_0
    iget-object p1, v1, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {p1, v4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 67
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-static {p0}, Lcom/zinhao/kikoeru/Api;->doGetAllTags(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    return-void
.end method

.method protected onResume()V
    .locals 4

    .line 93
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onResume()V

    .line 94
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    const/4 v1, 0x0

    const-string v2, "etInput"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 95
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 96
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_2
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 97
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity;->imm:Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_4

    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity;->etInput:Landroid/widget/EditText;

    if-nez p0, :cond_3

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v1, p0

    :goto_0
    check-cast v1, Landroid/view/View;

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    :cond_4
    return-void
.end method

.method public bridge synthetic onTagClick(Ljava/lang/Object;)V
    .locals 0

    .line 26
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->onTagClick(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onTagClick(Lorg/json/JSONObject;)V
    .locals 6

    const-string v0, "onTagClick: "

    .line 131
    const-string v1, "id"

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v2

    .line 132
    :goto_0
    const-string v4, "TagsActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    const-string v0, "name"

    if-eqz p1, :cond_1

    :try_start_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 134
    :cond_1
    move-object p1, v2

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 135
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 136
    const-string v4, "resultType"

    const-string v5, "tag"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    check-cast v3, Ljava/io/Serializable;

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 138
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, -0x1

    .line 139
    invoke-virtual {p0, v0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->setResult(ILandroid/content/Intent;)V

    .line 140
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsActivity;->finish()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 142
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 143
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
