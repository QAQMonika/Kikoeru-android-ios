.class public final Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.implements Lcom/zinhao/kikoeru/CatalogState$Receiver;
.source "WorksActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J,\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$apisCallback$1",
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
.field private requestGeneration:I
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method public static synthetic $r8$lambda$Vu8U1yDMxtYiW01LXQMK7c8ULrI(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->onCompleted$lambda$1(Lcom/zinhao/kikoeru/WorksActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Wu0EX90QmSraAKKzdnIGf2ixeOE(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 1

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/WorksActivity;->getCatalogGeneration()I

    move-result v0

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->requestGeneration:I

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 1

    .line 787
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/WorkAdapter;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setLoading(Z)V

    :cond_0
    return-void
.end method

.method private static final onCompleted$lambda$1(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 2

    .line 809
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCurrentTitle(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public receive(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 3

    .line 787
    const-string v0, "pagination"

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    new-instance v2, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/WorksActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_0

    .line 789
    sget-object p2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, p2}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 790
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/CatalogState;->showError(Landroid/app/Activity;Ljava/lang/Exception;)V

    return-void

    .line 793
    :cond_0
    const-string p1, "works"

    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p2

    const/16 v1, 0xc8

    if-eq p2, v1, :cond_2

    :cond_1
    if-eqz p3, :cond_4

    .line 794
    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 795
    const-string p2, "WorksActivity"

    const-string v1, "onCompleted: load local cache!"

    invoke-static {p2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    :cond_2
    :try_start_0
    invoke-static {p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 802
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "totalCount"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {p2, v1}, Lcom/zinhao/kikoeru/WorksActivity;->access$setTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;I)V

    .line 803
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getPage$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v1

    invoke-static {p2, v1}, Lcom/zinhao/kikoeru/WorksActivity;->access$setCurrentPage$p(Lcom/zinhao/kikoeru/WorksActivity;I)V

    .line 804
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    const-string v0, "currentPage"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    invoke-static {p2, p3}, Lcom/zinhao/kikoeru/WorksActivity;->access$setPage$p(Lcom/zinhao/kikoeru/WorksActivity;I)V

    .line 806
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-eqz p2, :cond_3

    .line 807
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorksActivity;->access$getPage$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result p3

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v0

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    div-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-static {p2, p3}, Lcom/zinhao/kikoeru/WorksActivity;->access$setPage$p(Lcom/zinhao/kikoeru/WorksActivity;I)V

    .line 809
    :cond_3
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    new-instance p3, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1$$ExternalSyntheticLambda1;

    invoke-direct {p3, p2}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {p2, p3}, Lcom/zinhao/kikoeru/WorksActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 810
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 p3, 0x2

    const/4 v0, 0x0

    invoke-static {p2, p1, v0, p3, v0}, Lcom/zinhao/kikoeru/WorksActivity;->updateListWith$default(Lcom/zinhao/kikoeru/WorksActivity;Lorg/json/JSONArray;Ljava/lang/Runnable;ILjava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 812
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 813
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/CatalogState;->showError(Landroid/app/Activity;Ljava/lang/Exception;)V

    :cond_4
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 785
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method

.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/CatalogState;->deliver(Lcom/zinhao/kikoeru/CatalogState$Receiver;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method

.method public isCurrent()Z
    .locals 3

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorksActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :stale

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorksActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :stale

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorksActivity;->getCatalogGeneration()I

    move-result v1

    iget v2, p0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;->requestGeneration:I

    if-ne v1, v2, :stale

    const/4 v0, 0x1

    return v0

    :stale
    const/4 v0, 0x0

    return v0
.end method
