.class public final Lcom/zinhao/kikoeru/CirclesActivity$callback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;
.source "CirclesActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/CirclesActivity;-><init>()V
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
        "com/zinhao/kikoeru/CirclesActivity$callback$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/CirclesActivity;


# direct methods
.method public static synthetic $r8$lambda$FMOJPfyFomr5MS---wIxeHgnmRI(Lcom/zinhao/kikoeru/CirclesActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/CirclesActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/CirclesActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    .line 94
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/CirclesActivity;)V
    .locals 1

    .line 96
    invoke-static {p0}, Lcom/zinhao/kikoeru/CirclesActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/CirclesActivity;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "viewBinding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
    .locals 2

    const-string v0, "jsonArray"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    new-instance v1, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/CirclesActivity;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/CirclesActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_0

    .line 98
    iget-object p0, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/CirclesActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    .line 101
    :cond_0
    const-string p1, "CirclesActivity"

    if-eqz p2, :cond_2

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p2

    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    goto :goto_0

    .line 105
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "onCompleted: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object p1, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/CirclesActivity;->access$setAllCircles$p(Lcom/zinhao/kikoeru/CirclesActivity;Lorg/json/JSONArray;)V

    .line 107
    iget-object p1, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    new-instance p2, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;

    iget-object p0, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-direct {p2, p0, p3}, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;-><init>(Lcom/zinhao/kikoeru/CirclesActivity;Lorg/json/JSONArray;)V

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/CirclesActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 102
    :cond_2
    :goto_0
    const-string p0, "onCompleted: err"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 94
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V

    return-void
.end method
