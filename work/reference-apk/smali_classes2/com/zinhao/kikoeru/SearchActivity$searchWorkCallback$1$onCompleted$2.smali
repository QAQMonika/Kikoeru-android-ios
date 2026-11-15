.class public final Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;
.super Ljava/lang/Object;
.source "SearchActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0017\u00a8\u0006\u0004"
    }
    d2 = {
        "com/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2",
        "Ljava/lang/Runnable;",
        "run",
        "",
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
.field final synthetic $jsonArray:Lorg/json/JSONArray;

.field final synthetic $totalCount:I

.field final synthetic this$0:Lcom/zinhao/kikoeru/SearchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/SearchActivity;ILorg/json/JSONArray;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    iput p2, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->$totalCount:I

    iput-object p3, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 142
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/SearchActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 143
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    iget-object v1, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    sget v2, Lcom/zinhao/kikoeru/R$string;->app_name:I

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/SearchActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->$totalCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s(%d)"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "format(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/SearchActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 146
    :try_start_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {v2}, Lcom/zinhao/kikoeru/SearchActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/SearchActivity;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "getJSONObject(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 148
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 149
    iget-object v3, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    check-cast v2, Ljava/lang/Exception;

    invoke-virtual {v3, v2}, Lcom/zinhao/kikoeru/SearchActivity;->alertException(Ljava/lang/Exception;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity$searchWorkCallback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyDataSetChanged()V

    return-void
.end method
