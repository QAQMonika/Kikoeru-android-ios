.class public final Lcom/zinhao/kikoeru/LoginAccountActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "LoginAccountActivity.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/LoginAccountActivity$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLoginAccountActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LoginAccountActivity.kt\ncom/zinhao/kikoeru/LoginAccountActivity\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,154:1\n106#2:155\n78#2,22:156\n106#2:178\n78#2,22:179\n106#2:201\n78#2,22:202\n*S KotlinDebug\n*F\n+ 1 LoginAccountActivity.kt\ncom/zinhao/kikoeru/LoginAccountActivity\n*L\n111#1:155\n111#1:156,22\n114#1:178\n114#1:179,22\n117#1:201\n117#1:202,22\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 !2\u00020\u0001:\u0001!B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0010\u001a\u00020\u00112\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0014J\u0008\u0010\u0014\u001a\u00020\u0011H\u0002J\u0008\u0010\u0015\u001a\u00020\u0011H\u0002J\u0008\u0010\u0016\u001a\u00020\u0011H\u0002J\u0008\u0010\u0017\u001a\u00020\u0011H\u0002J\u0008\u0010\u0018\u001a\u00020\u0011H\u0002J\u0008\u0010\u0019\u001a\u00020\u0011H\u0002J\u0010\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010\u001e\u001a\u00020\u001b2\u0006\u0010\u001f\u001a\u00020 H\u0016R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\""
    }
    d2 = {
        "Lcom/zinhao/kikoeru/LoginAccountActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "<init>",
        "()V",
        "tilUser",
        "Lcom/google/android/material/textfield/TextInputLayout;",
        "tilPassword",
        "tilServer",
        "btSignIn",
        "Landroid/widget/Button;",
        "btGuest",
        "btSignUp",
        "viewModel",
        "Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "setupListeners",
        "observeViewModel",
        "initEdit",
        "updateViewModelInputs",
        "navigateToMain",
        "initViews",
        "onCreateOptionsMenu",
        "",
        "menu",
        "Landroid/view/Menu;",
        "onOptionsItemSelected",
        "item",
        "Landroid/view/MenuItem;",
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
.field public static final Companion:Lcom/zinhao/kikoeru/LoginAccountActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "LoginAccountActivity"


# instance fields
.field private btGuest:Landroid/widget/Button;

.field private btSignIn:Landroid/widget/Button;

.field private btSignUp:Landroid/widget/Button;

.field private tilPassword:Lcom/google/android/material/textfield/TextInputLayout;

.field private tilServer:Lcom/google/android/material/textfield/TextInputLayout;

.field private tilUser:Lcom/google/android/material/textfield/TextInputLayout;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

.field private viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;


# direct methods
.method public static synthetic $r8$lambda$AVNpp-lhSbCkao5ZYotaN-z4ii0(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->setupListeners$lambda$0(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IrDoBzEe5b4jzdJ8j3MdCqBQn20(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->onCreate$lambda$0(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$YUnq9-NlluR2PT8sFYNhKnJSEWQ(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->setupListeners$lambda$1(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$pdPdnDAzRr6XAvF6-hz3bnyKHvU(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->observeViewModel$lambda$0(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$vAq2Wd3f8c68C4-KacV0jEB4A84(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/Boolean;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->observeViewModel$lambda$1(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/Boolean;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/LoginAccountActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/LoginAccountActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/LoginAccountActivity;->Companion:Lcom/zinhao/kikoeru/LoginAccountActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method

.method public static final synthetic access$getBtGuest$p(Lcom/zinhao/kikoeru/LoginAccountActivity;)Landroid/widget/Button;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btGuest:Landroid/widget/Button;

    return-object p0
.end method

.method public static final synthetic access$getBtSignIn$p(Lcom/zinhao/kikoeru/LoginAccountActivity;)Landroid/widget/Button;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btSignIn:Landroid/widget/Button;

    return-object p0
.end method

.method private final initEdit()V
    .locals 4

    .line 86
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilUser:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilPassword:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    .line 88
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilServer:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object p0

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    if-nez p0, :cond_0

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 95
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 96
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 97
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 99
    :cond_1
    const-string v2, "guest"

    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 100
    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 101
    const-string v0, "https://api.asmr.one"

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private final initViews()V
    .locals 3

    .line 127
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    const/4 v1, 0x0

    const-string v2, "viewBinding"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->textInputLayout:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilUser:Lcom/google/android/material/textfield/TextInputLayout;

    .line 128
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->textInputLayout2:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilPassword:Lcom/google/android/material/textfield/TextInputLayout;

    .line 129
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_2
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->textInputLayout3:Lcom/google/android/material/textfield/TextInputLayout;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilServer:Lcom/google/android/material/textfield/TextInputLayout;

    .line 130
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez v0, :cond_3

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_3
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->button2:Landroid/widget/Button;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btSignIn:Landroid/widget/Button;

    .line 131
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez v0, :cond_4

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_4
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->button4:Landroid/widget/Button;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btGuest:Landroid/widget/Button;

    .line 132
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez v0, :cond_5

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    move-object v1, v0

    :goto_0
    iget-object v0, v1, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->button3:Landroid/widget/Button;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btSignUp:Landroid/widget/Button;

    return-void
.end method

.method private final navigateToMain()V
    .locals 3

    .line 122
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->startActivity(Landroid/content/Intent;)V

    .line 123
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->finish()V

    return-void
.end method

.method private final observeViewModel()V
    .locals 3

    .line 58
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->getIsLoading()Landroidx/lifecycle/LiveData;

    move-result-object v0

    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/LifecycleOwner;

    new-instance v2, Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/LoginAccountActivity$observeViewModel$1;-><init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V

    check-cast v2, Landroidx/lifecycle/Observer;

    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 68
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->getErrorMessage()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v2, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V

    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 75
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->getLoginSuccess()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v2, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V

    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    return-void
.end method

.method private static final observeViewModel$lambda$0(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 69
    check-cast p1, Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 70
    :cond_0
    check-cast p0, Landroid/content/Context;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

.method private static final observeViewModel$lambda$1(Lcom/zinhao/kikoeru/LoginAccountActivity;Ljava/lang/Boolean;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 76
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->navigateToMain()V

    :cond_0
    return-void
.end method

.method private static final onCreate$lambda$0(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 4

    const-string v0, "v"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "insets"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    const-string v1, "getInsets(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v0, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p1
.end method

.method private final setupListeners()V
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btSignIn:Landroid/widget/Button;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda3;-><init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->btGuest:Landroid/widget/Button;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda4;-><init>(Lcom/zinhao/kikoeru/LoginAccountActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private static final setupListeners$lambda$0(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->updateViewModelInputs()V

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->login()V

    return-void
.end method

.method private static final setupListeners$lambda$1(Lcom/zinhao/kikoeru/LoginAccountActivity;Landroid/view/View;)V
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->loginAsGuest()V

    return-void
.end method

.method private final updateViewModelInputs()V
    .locals 11

    .line 106
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilUser:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    .line 107
    iget-object v1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilPassword:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v1

    .line 108
    iget-object v2, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->tilServer:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lcom/google/android/material/textfield/TextInputLayout;->getEditText()Landroid/widget/EditText;

    move-result-object v2

    const/16 v3, 0x20

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_6

    .line 111
    iget-object v6, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 155
    check-cast v0, Ljava/lang/CharSequence;

    .line 157
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v7

    sub-int/2addr v7, v5

    move v8, v4

    move v9, v8

    :goto_0
    if-gt v8, v7, :cond_5

    if-nez v9, :cond_0

    move v10, v8

    goto :goto_1

    :cond_0
    move v10, v7

    .line 162
    :goto_1
    invoke-interface {v0, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    .line 111
    invoke-static {v10, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v10

    if-gtz v10, :cond_1

    move v10, v5

    goto :goto_2

    :cond_1
    move v10, v4

    :goto_2
    if-nez v9, :cond_3

    if-nez v10, :cond_2

    move v9, v5

    goto :goto_0

    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_3
    if-nez v10, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v7, v7, -0x1

    goto :goto_0

    :cond_5
    :goto_3
    add-int/2addr v7, v5

    .line 177
    invoke-interface {v0, v8, v7}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    .line 155
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    invoke-virtual {v6, v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->setUsername(Ljava/lang/String;)V

    :cond_6
    if-eqz v1, :cond_d

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 178
    check-cast v1, Ljava/lang/CharSequence;

    .line 180
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v6, v5

    move v7, v4

    move v8, v7

    :goto_4
    if-gt v7, v6, :cond_c

    if-nez v8, :cond_7

    move v9, v7

    goto :goto_5

    :cond_7
    move v9, v6

    .line 185
    :goto_5
    invoke-interface {v1, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    .line 114
    invoke-static {v9, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v9

    if-gtz v9, :cond_8

    move v9, v5

    goto :goto_6

    :cond_8
    move v9, v4

    :goto_6
    if-nez v8, :cond_a

    if-nez v9, :cond_9

    move v8, v5

    goto :goto_4

    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_a
    if-nez v9, :cond_b

    goto :goto_7

    :cond_b
    add-int/lit8 v6, v6, -0x1

    goto :goto_4

    :cond_c
    :goto_7
    add-int/2addr v6, v5

    .line 200
    invoke-interface {v1, v7, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    .line 178
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->setPassword(Ljava/lang/String;)V

    :cond_d
    if-eqz v2, :cond_14

    .line 117
    iget-object p0, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 201
    check-cast v0, Ljava/lang/CharSequence;

    .line 203
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, v5

    move v2, v4

    move v6, v2

    :goto_8
    if-gt v2, v1, :cond_13

    if-nez v6, :cond_e

    move v7, v2

    goto :goto_9

    :cond_e
    move v7, v1

    .line 208
    :goto_9
    invoke-interface {v0, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    .line 117
    invoke-static {v7, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v7

    if-gtz v7, :cond_f

    move v7, v5

    goto :goto_a

    :cond_f
    move v7, v4

    :goto_a
    if-nez v6, :cond_11

    if-nez v7, :cond_10

    move v6, v5

    goto :goto_8

    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_11
    if-nez v7, :cond_12

    goto :goto_b

    :cond_12
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_13
    :goto_b
    add-int/2addr v1, v5

    .line 223
    invoke-interface {v0, v2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    .line 201
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;->setHost(Ljava/lang/String;)V

    :cond_14
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 30
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 31
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    const/4 v0, 0x0

    .line 32
    const-string v1, "viewBinding"

    if-nez p1, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LoginAccountActivity;->setContentView(Landroid/view/View;)V

    .line 33
    iget-object p1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;

    if-nez p1, :cond_1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v0, p1

    :goto_0
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/databinding/ActivityLoginAccountBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    new-instance v0, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/LoginAccountActivity$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 38
    new-instance p1, Landroidx/lifecycle/ViewModelProvider;

    move-object v0, p0

    check-cast v0, Landroidx/lifecycle/ViewModelStoreOwner;

    invoke-direct {p1, v0}, Landroidx/lifecycle/ViewModelProvider;-><init>(Landroidx/lifecycle/ViewModelStoreOwner;)V

    const-class v0, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    iput-object p1, p0, Lcom/zinhao/kikoeru/LoginAccountActivity;->viewModel:Lcom/zinhao/kikoeru/viewmodel/LoginViewModel;

    .line 39
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->initViews()V

    .line 40
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->observeViewModel()V

    .line 41
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->setupListeners()V

    .line 42
    invoke-direct {p0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->initEdit()V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    const-string v0, "menu"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    const-string v0, "about"

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-interface {p1, v1, v2, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 137
    const-string v0, "choose user"

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v2, 0x3

    invoke-interface {p1, v1, v2, v2, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 138
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    const-string v0, "item"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 143
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/AboutActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 144
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 145
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/LoginAccountActivity;->startActivity(Landroid/content/Intent;)V

    .line 148
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
