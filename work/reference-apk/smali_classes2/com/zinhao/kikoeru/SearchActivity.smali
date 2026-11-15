.class public final Lcom/zinhao/kikoeru/SearchActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "SearchActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/TagsView$TagClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/SearchActivity$Companion;
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
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 \u001f2\u00020\u00012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002:\u0001\u001fB\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u0012\u001a\u00020\u00132\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0014J\u0010\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u0017\u001a\u00020\u0018H\u0002J\u0008\u0010\u0019\u001a\u00020\u0013H\u0014J\u0012\u0010\u001d\u001a\u00020\u00132\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0003H\u0016R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082.\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lcom/zinhao/kikoeru/SearchActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "Lorg/json/JSONObject;",
        "<init>",
        "()V",
        "etInput",
        "Landroid/widget/EditText;",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "works",
        "",
        "workAdapter",
        "Lcom/zinhao/kikoeru/WorkAdapter;",
        "imm",
        "Landroid/view/inputmethod/InputMethodManager;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "initLayout",
        "layoutType",
        "",
        "onResume",
        "vaClickListener",
        "searchWorkCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
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
.field public static final Companion:Lcom/zinhao/kikoeru/SearchActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "SearchActivity"


# instance fields
.field private etInput:Landroid/widget/EditText;

.field private imm:Landroid/view/inputmethod/InputMethodManager;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private final searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private final vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

.field private workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

.field private final works:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$mkw6Ww46OPCfOoNpXpWGmUTOf1c(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity;->onCreate$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tZLSU66z7xMWOxEB5V9DDCZMhek(Lcom/zinhao/kikoeru/SearchActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->initLayout$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$zCO6in61ZOnq7s0ZpmcadLXKo3o(Lcom/zinhao/kikoeru/SearchActivity;Lorg/json/JSONObject;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->vaClickListener$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;Lorg/json/JSONObject;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/SearchActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/SearchActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/SearchActivity;->Companion:Lcom/zinhao/kikoeru/SearchActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->works:Ljava/util/List;

    .line 107
    new-instance v0, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda2;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    .line 125
    new-instance v0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-void
.end method

.method public static final synthetic access$getSearchWorkCallback$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-object p0
.end method

.method public static final synthetic access$getViewBinding$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    return-object p0
.end method

.method public static final synthetic access$getWorkAdapter$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/WorkAdapter;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    return-object p0
.end method

.method public static final synthetic access$getWorks$p(Lcom/zinhao/kikoeru/SearchActivity;)Ljava/util/List;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->works:Ljava/util/List;

    return-object p0
.end method

.method private final initLayout(I)V
    .locals 3

    packed-switch p1, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    .line 84
    :pswitch_0
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    goto :goto_0

    .line 82
    :pswitch_1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    goto :goto_0

    .line 80
    :pswitch_2
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 86
    :goto_0
    new-instance v1, Lcom/zinhao/kikoeru/WorkAdapter;

    iget-object v2, p0, Lcom/zinhao/kikoeru/SearchActivity;->works:Ljava/util/List;

    invoke-direct {v1, v2, p1}, Lcom/zinhao/kikoeru/WorkAdapter;-><init>(Ljava/util/List;I)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/SearchActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    .line 87
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v1, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 88
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/SearchActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/WorkAdapter;->setVaClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 89
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/WorkAdapter;->setItemClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 96
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x34e
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static final initLayout$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;Landroid/view/View;)V
    .locals 3

    .line 90
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/json/JSONObject;

    .line 91
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-class v2, Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 92
    const-string p1, "work_json_str"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 93
    check-cast p0, Landroid/content/Context;

    const/4 p1, 0x0

    invoke-static {p0, v1, p1}, Landroidx/core/app/ActivityCompat;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void
.end method

.method private static final onCreate$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    if-nez v0, :cond_0

    const-string v0, "viewBinding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->editTextNumber:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    .line 70
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->searchWorkCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, p0}, Lcom/zinhao/kikoeru/Api;->doGetWork(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    :cond_1
    return-void
.end method

.method private static final vaClickListener$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;Lorg/json/JSONObject;)V
    .locals 6

    const-string v0, "onTagClick: "

    .line 109
    const-string v1, "id"

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v2

    .line 110
    :goto_0
    const-string v4, "SearchActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    const-string v0, "name"

    if-eqz p1, :cond_1

    :try_start_1
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 112
    :cond_1
    move-object p1, v2

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 113
    new-instance p1, Landroid/content/Intent;

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    const-class v5, Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {p1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 114
    const-string v4, "resultType"

    const-string v5, "va"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 116
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 117
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 119
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 120
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 36
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/SearchActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    .line 38
    const-string v0, "viewBinding"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->setContentView(Landroid/view/View;)V

    .line 39
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/SearchActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const-string v2, "getDecorView(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v1}, Lcom/zinhao/kikoeru/SearchActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 40
    const-string p1, "input_method"

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v2, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->imm:Landroid/view/inputmethod/InputMethodManager;

    .line 41
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    if-nez p1, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_1
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    if-nez p1, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->editTextNumber:Lcom/google/android/material/textfield/TextInputEditText;

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    .line 43
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v2, Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    check-cast v2, Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 53
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v2, Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    check-cast v2, Landroid/text/TextWatcher;

    invoke-virtual {p1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 67
    iget-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    if-nez p1, :cond_3

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v1, p1

    :goto_0
    iget-object p1, v1, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    new-instance v0, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/SearchActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    const/16 p1, 0x350

    .line 74
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->initLayout(I)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 100
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onResume()V

    .line 101
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 102
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 103
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 104
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity;->imm:Landroid/view/inputmethod/InputMethodManager;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity;->etInput:Landroid/widget/EditText;

    check-cast p0, Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    return-void
.end method

.method public bridge synthetic onTagClick(Ljava/lang/Object;)V
    .locals 0

    .line 28
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->onTagClick(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onTagClick(Lorg/json/JSONObject;)V
    .locals 6

    .line 165
    const-string v0, "id"

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_0
    move-object v2, v1

    .line 166
    :goto_0
    const-string v3, "name"

    if-eqz p1, :cond_1

    :try_start_1
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 167
    :cond_1
    move-object p1, v1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 168
    new-instance p1, Landroid/content/Intent;

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    const-class v5, Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {p1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 169
    const-string v4, "resultType"

    const-string v5, "tag"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    check-cast v2, Ljava/io/Serializable;

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 171
    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 174
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 175
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
