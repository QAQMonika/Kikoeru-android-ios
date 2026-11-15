.class public final Lcom/zinhao/kikoeru/UserSwitchActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "UserSwitchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;,
        Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001:\u0002\u0014\u0015B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0014J\u000e\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u0008R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082.\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0018\u00010\nR\u00020\u0000X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/UserSwitchActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "<init>",
        "()V",
        "binding",
        "Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;",
        "users",
        "",
        "Lcom/zinhao/kikoeru/db/User;",
        "adapter",
        "Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "switchUser",
        "user",
        "refreshUser",
        "refreshTokenCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "UserAdapter",
        "UserViewHolder",
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
.field private adapter:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

.field private binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

.field private final refreshTokenCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private refreshUser:Lcom/zinhao/kikoeru/db/User;

.field private users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 66
    new-instance v0, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/UserSwitchActivity$refreshTokenCallback$1;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->refreshTokenCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-void
.end method

.method public static final synthetic access$getBinding$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    return-object p0
.end method

.method public static final synthetic access$getRefreshTokenCallback$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->refreshTokenCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-object p0
.end method

.method public static final synthetic access$getRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/db/User;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->refreshUser:Lcom/zinhao/kikoeru/db/User;

    return-object p0
.end method

.method public static final synthetic access$getUsers$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Ljava/util/List;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->users:Ljava/util/List;

    return-object p0
.end method

.method public static final synthetic access$setRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->refreshUser:Lcom/zinhao/kikoeru/db/User;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 31
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    .line 33
    const-string v0, "binding"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity;->setContentView(Landroid/view/View;)V

    .line 34
    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/BaseActivity;

    iget-object v2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    if-nez v2, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_1
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v3, "getRoot(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroid/view/View;

    const/4 v3, 0x2

    invoke-static {p1, v2, v1, v3, v1}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea$default(Lcom/zinhao/kikoeru/BaseActivity;Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;ILjava/lang/Object;)V

    .line 35
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->getApplication()Landroid/app/Application;

    move-result-object p1

    const-string v2, "null cannot be cast to non-null type com.zinhao.kikoeru.App"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/App;

    .line 36
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->users:Ljava/util/List;

    .line 37
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    if-nez p1, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->button5:Landroid/widget/Button;

    new-instance v2, Lcom/zinhao/kikoeru/UserSwitchActivity$onCreate$1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/UserSwitchActivity$onCreate$1;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V

    check-cast v2, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    new-instance p1, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->adapter:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    .line 44
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    if-nez p1, :cond_3

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_3
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->adapter:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity;->binding:Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    if-nez p1, :cond_4

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    move-object v1, p1

    :goto_0
    iget-object p1, v1, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    check-cast p0, Landroid/content/Context;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public final switchUser(Lcom/zinhao/kikoeru/db/User;)V
    .locals 3

    const-string v0, "user"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    sget v2, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 50
    const-string v1, "\u786e\u8ba4\u5207\u6362\uff1f"

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 51
    sget v1, Lcom/zinhao/kikoeru/R$string;->confirm:I

    new-instance v2, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;

    invoke-direct {v2, p1, p0}, Lcom/zinhao/kikoeru/UserSwitchActivity$switchUser$1;-><init>(Lcom/zinhao/kikoeru/db/User;Lcom/zinhao/kikoeru/UserSwitchActivity;)V

    check-cast v2, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 62
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method
