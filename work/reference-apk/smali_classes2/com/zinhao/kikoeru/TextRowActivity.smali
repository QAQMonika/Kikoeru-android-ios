.class public final Lcom/zinhao/kikoeru/TextRowActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "TextRowActivity.kt"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/TextRowActivity$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 (2\u00020\u00012\u00020\u0002:\u0001(B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0012\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0014J\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J\u0010\u0010\u001c\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\u0010\u0010\u001f\u001a\u00020\u00152\u0006\u0010 \u001a\u00020!H\u0002J\u001c\u0010\"\u001a\u00020\u00152\u0008\u0010#\u001a\u0004\u0018\u00010$2\u0008\u0010%\u001a\u0004\u0018\u00010&H\u0016J\u0012\u0010\'\u001a\u00020\u00152\u0008\u0010#\u001a\u0004\u0018\u00010$H\u0016R\u0014\u0010\u0005\u001a\u0008\u0018\u00010\u0006R\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/TextRowActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Landroid/content/ServiceConnection;",
        "<init>",
        "()V",
        "ctrlBinder",
        "Lcom/zinhao/kikoeru/AudioService$CtrlBinder;",
        "Lcom/zinhao/kikoeru/AudioService;",
        "textCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;",
        "mRecyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "mText",
        "Lcom/zinhao/kikoeru/Text;",
        "adapter",
        "Lcom/zinhao/kikoeru/TextAdapter;",
        "fileItem",
        "Lorg/json/JSONObject;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "onCreateOptionsMenu",
        "",
        "menu",
        "Landroid/view/Menu;",
        "onOptionsItemSelected",
        "item",
        "Landroid/view/MenuItem;",
        "init",
        "s",
        "",
        "onServiceConnected",
        "name",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
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
.field public static final Companion:Lcom/zinhao/kikoeru/TextRowActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "TextRowActivity"


# instance fields
.field private adapter:Lcom/zinhao/kikoeru/TextAdapter;

.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private fileItem:Lorg/json/JSONObject;

.field private mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private mText:Lcom/zinhao/kikoeru/Text;

.field private final textCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/TextRowActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/TextRowActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/TextRowActivity;->Companion:Lcom/zinhao/kikoeru/TextRowActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 26
    new-instance v0, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;-><init>(Lcom/zinhao/kikoeru/TextRowActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->textCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    return-void
.end method

.method public static final synthetic access$init(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->init(Ljava/lang/String;)V

    return-void
.end method

.method private final init(Ljava/lang/String;)V
    .locals 1

    .line 98
    new-instance v0, Lcom/zinhao/kikoeru/Text;

    invoke-direct {v0, p1}, Lcom/zinhao/kikoeru/Text;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mText:Lcom/zinhao/kikoeru/Text;

    .line 99
    new-instance p1, Lcom/zinhao/kikoeru/TextAdapter;

    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mText:Lcom/zinhao/kikoeru/Text;

    invoke-direct {p1, v0}, Lcom/zinhao/kikoeru/TextAdapter;-><init>(Lcom/zinhao/kikoeru/Text;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->adapter:Lcom/zinhao/kikoeru/TextAdapter;

    .line 100
    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_0

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 101
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_1

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    :cond_1
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 47
    const-string v0, "file_exists"

    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TextRowActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;

    move-result-object p1

    const-string v1, "inflate(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;

    .line 49
    const-string v1, "viewBinding"

    const/4 v2, 0x0

    if-nez p1, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_0
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;->root:Landroid/widget/LinearLayout;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->setContentView(Landroid/view/View;)V

    .line 50
    iget-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;

    if-nez p1, :cond_1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_1
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityLrcShowBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    const-string v1, "appBarLayout"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, v2}, Lcom/zinhao/kikoeru/TextRowActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 51
    sget p1, Lcom/zinhao/kikoeru/R$id;->recyclerView:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    sget p1, Lcom/zinhao/kikoeru/R$id;->toolbar:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 53
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 54
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TextRowActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "jsonText"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 55
    new-instance v1, Landroid/content/Intent;

    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    const-class v4, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v3, p0

    check-cast v3, Landroid/content/ServiceConnection;

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v3, v4}, Lcom/zinhao/kikoeru/TextRowActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    if-nez p1, :cond_2

    .line 57
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TextRowActivity;->finish()V

    return-void

    .line 61
    :cond_2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;

    .line 62
    const-string p1, "title"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 63
    iget-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "fileItem"

    if-nez p1, :cond_3

    :try_start_1
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_8

    .line 64
    iget-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;

    if-nez p1, :cond_4

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_4
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 66
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;

    if-nez v0, :cond_5

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    move-object v2, v0

    :goto_0
    const-string v0, "local_file_path"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->textCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    invoke-virtual {v0, p1, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->readText(Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    return-void

    .line 69
    :cond_6
    iget-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;

    if-nez p1, :cond_7

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    move-object v2, p1

    :goto_1
    const-string p1, "hash"

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 70
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->textCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    invoke-static {p1, v0}, Lcom/zinhao/kikoeru/Api;->doGetMediaString(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 74
    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zinhao/kikoeru/TextRowActivity;->init(Ljava/lang/String;)V

    .line 75
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->alertException(Ljava/lang/Exception;)V

    :cond_8
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    const-string v0, "menu"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    const-string v0, "load as lrc"

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v0

    .line 81
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_text_fields_24:I

    invoke-interface {v0, v1}, Landroid/view/SubMenu;->setIcon(I)Landroid/view/SubMenu;

    .line 82
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 83
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4

    const-string v0, "item"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->mText:Lcom/zinhao/kikoeru/Text;

    if-eqz v0, :cond_1

    .line 88
    iget-object v1, p0, Lcom/zinhao/kikoeru/TextRowActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v1, :cond_1

    .line 89
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Text;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setLrc(Ljava/lang/String;)V

    .line 90
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-string v2, "load as lrc success"

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 91
    iget-object v0, p0, Lcom/zinhao/kikoeru/TextRowActivity;->fileItem:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    const-string v0, "fileItem"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    const-string v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->insertLrcBind(Ljava/lang/String;)V

    .line 94
    :cond_1
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 105
    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/TextRowActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
