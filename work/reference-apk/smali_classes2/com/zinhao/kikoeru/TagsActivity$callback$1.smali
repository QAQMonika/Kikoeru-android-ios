.class public final Lcom/zinhao/kikoeru/TagsActivity$callback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;
.source "TagsActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/TagsActivity;-><init>()V
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
        "com/zinhao/kikoeru/TagsActivity$callback$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/TagsActivity;


# direct methods
.method public static synthetic $r8$lambda$P3Lw9chtKKnjwpZko406MzREFYE(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/TagsActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    .line 112
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V
    .locals 1

    .line 125
    invoke-static {p0}, Lcom/zinhao/kikoeru/TagsActivity;->access$getTagsView$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "tagsView"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/TagsActivity;->access$getTextGet$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
    .locals 2

    const-string v0, "jsonArray"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/TagsActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "viewBinding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    if-eqz p1, :cond_1

    .line 116
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    .line 119
    :cond_1
    const-string p1, "TagsActivity"

    if-eqz p2, :cond_3

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p2

    const/16 v0, 0xc8

    if-eq p2, v0, :cond_2

    goto :goto_0

    .line 123
    :cond_2
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

    .line 124
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-static {p1, p3}, Lcom/zinhao/kikoeru/TagsActivity;->access$setAllTags$p(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V

    .line 125
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    new-instance p1, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0, p3}, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 120
    :cond_3
    :goto_0
    const-string p0, "onCompleted: err"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 112
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V

    return-void
.end method
