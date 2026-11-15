.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;
.super Ljava/lang/Object;
.source "WorkTreeActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
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
        "com/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1",
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

.field final synthetic this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;


# direct methods
.method constructor <init>(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->$jsonArray:Lorg/json/JSONArray;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 784
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 787
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 789
    :try_start_0
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_0

    .line 790
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/List;

    invoke-static {v3, v4}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$setWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/util/List;)V

    .line 792
    :cond_0
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "getJSONObject(...)"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 794
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 795
    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    check-cast v3, Ljava/lang/Exception;

    invoke-virtual {v4, v3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 798
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$initLayout(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    .line 799
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 800
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 801
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1$onCompleted$1;->$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    .line 799
    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemRangeInserted(II)V

    :cond_2
    return-void
.end method
