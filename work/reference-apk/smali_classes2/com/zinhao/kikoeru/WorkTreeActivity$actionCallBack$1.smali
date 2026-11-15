.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
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
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "onCompleted",
        "",
        "e",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "asyncHttpResponse",
        "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
        "jsonObject",
        "Lorg/json/JSONObject;",
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
.method public static synthetic $r8$lambda$P3_tArUMV54uq8IOvYnC18fpkdM(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 334
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V
    .locals 1

    .line 345
    check-cast p0, Landroid/content/Context;

    check-cast p1, Ljava/lang/CharSequence;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 1

    invoke-static {p1, p2, p3}, Lcom/zinhao/kikoeru/CatalogState;->reviewError(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)Ljava/lang/Exception;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 337
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/CatalogState;->showError(Landroid/app/Activity;Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-nez p2, :cond_1

    goto :goto_0

    .line 341
    :cond_1
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-lt p1, p2, :cond_2

    const/16 p2, 0x12c

    if-ge p1, p2, :cond_2

    invoke-static {p3}, Lcom/zinhao/kikoeru/CatalogState;->reviewMessage(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    .line 344
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    new-instance p3, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1$$ExternalSyntheticLambda0;

    invoke-direct {p3, p2, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 334
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
