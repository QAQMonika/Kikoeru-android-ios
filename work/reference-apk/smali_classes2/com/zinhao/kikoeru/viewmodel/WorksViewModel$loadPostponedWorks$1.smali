.class public final Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "WorksViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->loadPostponedWorks()V
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
        "com/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    .line 195
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 202
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, p0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    return-void

    :cond_0
    if-eqz p2, :cond_1

    .line 205
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_2

    :cond_1
    if-eqz p3, :cond_3

    .line 206
    const-string p1, "works"

    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 207
    iget-object p1, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    invoke-static {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->access$getTAG$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "onCompleted: load local cache!"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    :cond_2
    :try_start_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    invoke-static {p1}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->access$getGson$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Lcom/google/gson/Gson;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-class p3, Lcom/zinhao/kikoeru/model/WorksGetPage;

    invoke-virtual {p1, p2, p3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "fromJson(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/model/WorksGetPage;

    .line 214
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;->this$0:Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;

    invoke-static {p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->access$get_postponedWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;

    move-result-object p0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/model/WorksGetPage;->getWorks()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 216
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, p1}, Lorg/json/JSONException;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_3
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 195
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
