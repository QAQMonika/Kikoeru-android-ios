.class public final Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "SearchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/SearchActivity;-><init>()V
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
        "com/zinhao/kikoeru/SearchActivity$searchWorkCallback$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/SearchActivity;


# direct methods
.method public static synthetic $r8$lambda$7vB-VCir2By6Rmq8Oxu23bjH8c0(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    .line 125
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 1

    .line 127
    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, "viewBinding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "jsonObject"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    new-instance v1, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/SearchActivity;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/SearchActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_0

    .line 129
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 130
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-eqz p2, :cond_2

    .line 133
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_1

    goto :goto_0

    .line 137
    :cond_1
    :try_start_0
    const-string p1, "works"

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 138
    const-string p2, "pagination"

    invoke-virtual {p3, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "totalCount"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    .line 139
    iget-object p3, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    new-instance v0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;

    iget-object v1, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-direct {v0, v1, p2, p1}, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;-><init>(Lcom/zinhao/kikoeru/SearchActivity;ILorg/json/JSONArray;)V

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p3, v0}, Lcom/zinhao/kikoeru/SearchActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 157
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 158
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/SearchActivity;->alertException(Ljava/lang/Exception;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 125
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
