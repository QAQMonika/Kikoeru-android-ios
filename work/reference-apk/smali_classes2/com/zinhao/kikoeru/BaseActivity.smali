.class public Lcom/zinhao/kikoeru/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "BaseActivity.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/BaseActivity$Companion;,
        Lcom/zinhao/kikoeru/BaseActivity$InsetReady;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u0000 \'2\u00020\u0001:\u0002&\'B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0014J\u001a\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n2\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u000cJ\"\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0014J-\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000f2\u000e\u0010\u0014\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00160\u00152\u0006\u0010\u0017\u001a\u00020\u0018H\u0016\u00a2\u0006\u0002\u0010\u0019J\u0012\u0010\u001c\u001a\u00020\u001d2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001bH\u0004J\u0012\u0010\u001f\u001a\u00020\u00052\n\u0010 \u001a\u00060!j\u0002`\"J\u0010\u0010#\u001a\u00020\u00052\u0006\u0010 \u001a\u00020$H\u0004J\u0008\u0010%\u001a\u00020\u0005H\u0016R\u0010\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006("
    }
    d2 = {
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "<init>",
        "()V",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "setSafeArea",
        "topView",
        "Landroid/view/View;",
        "insetReady",
        "Lcom/zinhao/kikoeru/BaseActivity$InsetReady;",
        "onActivityResult",
        "requestCode",
        "",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "onRequestPermissionsResult",
        "permissions",
        "",
        "",
        "grantResults",
        "",
        "(I[Ljava/lang/String;[I)V",
        "activityResultCallBack",
        "Ljava/lang/Runnable;",
        "requestReadWriteExternalPermission",
        "",
        "callback",
        "alertException",
        "e",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "alertMessage",
        "Lcom/zinhao/kikoeru/AppMessage;",
        "finish",
        "InsetReady",
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
.field public static final Companion:Lcom/zinhao/kikoeru/BaseActivity$Companion;

.field private static final REQUEST_WRITE_READ_CODE:I = 0x17


# instance fields
.field private activityResultCallBack:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$yf4q6V357QdUsaOFzH1aRdgLeeQ(Lcom/zinhao/kikoeru/BaseActivity$InsetReady;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea$lambda$0(Lcom/zinhao/kikoeru/BaseActivity$InsetReady;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/BaseActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/BaseActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/BaseActivity;->Companion:Lcom/zinhao/kikoeru/BaseActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method public static final synthetic access$setActivityResultCallBack$p(Lcom/zinhao/kikoeru/BaseActivity;Ljava/lang/Runnable;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic setSafeArea$default(Lcom/zinhao/kikoeru/BaseActivity;Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;ILjava/lang/Object;)V
    .locals 0

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 42
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/BaseActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: setSafeArea"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final setSafeArea$lambda$0(Lcom/zinhao/kikoeru/BaseActivity$InsetReady;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 5

    const-string v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "insets"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-virtual {p2, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    const-string v1, "getInsets(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v2

    invoke-virtual {p2, v2}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v2

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v3, v2, Landroidx/core/graphics/Insets;->left:I

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 50
    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v2, v2, Landroidx/core/graphics/Insets;->right:I

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 51
    iget v3, v0, Landroidx/core/graphics/Insets;->top:I

    .line 52
    iget v0, v0, Landroidx/core/graphics/Insets;->bottom:I

    const/4 v4, 0x0

    .line 54
    invoke-virtual {p1, v1, v3, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    if-eqz p0, :cond_0

    .line 55
    invoke-static {v1, v3, v2, v0}, Landroidx/core/graphics/Insets;->of(IIII)Landroidx/core/graphics/Insets;

    move-result-object p1

    const-string v0, "of(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity$InsetReady;->onInsetReady(Landroidx/core/graphics/Insets;)V

    :cond_0
    return-object p2
.end method


# virtual methods
.method public final alertException(Ljava/lang/Exception;)V
    .locals 1

    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 134
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->isAppDebug()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/BaseActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    new-instance v0, Lcom/zinhao/kikoeru/BaseActivity$alertException$1;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/BaseActivity$alertException$1;-><init>(Lcom/zinhao/kikoeru/BaseActivity;Ljava/lang/Exception;)V

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/BaseActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected final alertMessage(Lcom/zinhao/kikoeru/AppMessage;)V
    .locals 1

    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->isAppDebug()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/BaseActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    new-instance v0, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/BaseActivity$alertMessage$1;-><init>(Lcom/zinhao/kikoeru/BaseActivity;Lcom/zinhao/kikoeru/AppMessage;)V

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/BaseActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public finish()V
    .locals 0

    .line 177
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 62
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p2, 0x17

    if-ne p1, p2, :cond_0

    .line 64
    iget-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    .line 65
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    .line 66
    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 27
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x21

    if-lt p1, v0, :cond_0

    .line 29
    move-object p1, p0

    check-cast p1, Landroidx/activity/ComponentActivity;

    .line 30
    sget-object v0, Landroidx/activity/SystemBarStyle;->Companion:Landroidx/activity/SystemBarStyle$Companion;

    .line 31
    check-cast p0, Landroid/content/Context;

    sget v1, Lcom/zinhao/kikoeru/R$color;->main_color:I

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 32
    sget v2, Lcom/zinhao/kikoeru/R$color;->white:I

    invoke-static {p0, v2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 30
    invoke-static/range {v0 .. v5}, Landroidx/activity/SystemBarStyle$Companion;->auto$default(Landroidx/activity/SystemBarStyle$Companion;IILkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/activity/SystemBarStyle;

    move-result-object p0

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 29
    invoke-static {p1, p0, v1, v0, v1}, Landroidx/activity/EdgeToEdge;->enable$default(Landroidx/activity/ComponentActivity;Landroidx/activity/SystemBarStyle;Landroidx/activity/SystemBarStyle;ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "grantResults"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    const/16 p2, 0x17

    if-ne p1, p2, :cond_0

    .line 74
    iget-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    .line 75
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    .line 76
    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    :cond_0
    return-void
.end method

.method protected final requestReadWriteExternalPermission(Ljava/lang/Runnable;)Z
    .locals 5

    .line 90
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_1

    .line 91
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    sget v3, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {v0, v1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 93
    sget v1, Lcom/zinhao/kikoeru/R$string;->tip:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 94
    sget v1, Lcom/zinhao/kikoeru/R$string;->external_storage_tip:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 95
    const-string v1, "\u53bb\u6388\u4e88"

    check-cast v1, Ljava/lang/CharSequence;

    new-instance v3, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;

    invoke-direct {v3, p0, p1}, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$1;-><init>(Lcom/zinhao/kikoeru/BaseActivity;Ljava/lang/Runnable;)V

    check-cast v3, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 103
    const-string p0, "\u53d6\u6d88"

    check-cast p0, Ljava/lang/CharSequence;

    new-instance v1, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$2;

    invoke-direct {v1}, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$2;-><init>()V

    check-cast v1, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 108
    new-instance p0, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$3;

    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity$requestReadWriteExternalPermission$3;-><init>(Ljava/lang/Runnable;)V

    check-cast p0, Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 113
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return v2

    :cond_0
    return v3

    .line 119
    :cond_1
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/BaseActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    const/4 v4, -0x1

    if-ne v1, v4, :cond_2

    .line 121
    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    .line 122
    new-array v3, v3, [Ljava/lang/String;

    aput-object v0, v3, v2

    const/16 v0, 0x17

    .line 120
    invoke-static {v1, v3, v0}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 125
    iput-object p1, p0, Lcom/zinhao/kikoeru/BaseActivity;->activityResultCallBack:Ljava/lang/Runnable;

    return v2

    :cond_2
    return v3
.end method

.method public final setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V
    .locals 1

    const-string p0, "topView"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x21

    if-lt p0, v0, :cond_0

    .line 44
    new-instance p0, Lcom/zinhao/kikoeru/BaseActivity$$ExternalSyntheticLambda0;

    invoke-direct {p0, p2}, Lcom/zinhao/kikoeru/BaseActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    invoke-static {p1, p0}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    :cond_0
    return-void
.end method
