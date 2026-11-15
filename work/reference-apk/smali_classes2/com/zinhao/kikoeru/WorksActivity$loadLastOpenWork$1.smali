.class public final Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;
.source "WorksActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->loadLastOpenWork()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J&\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;",
        "onCompleted",
        "",
        "e",
        "Ljava/lang/Exception;",
        "asyncHttpResponse",
        "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
        "lastOpenWorksArray",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method public static synthetic $r8$lambda$LD4bg7WC_DpHkNadP6GZCtoj-e0(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$yECKDQyL2KJ8LMd3reLyHwbZVHw(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->onCompleted$lambda$1$0(Lcom/zinhao/kikoeru/WorksActivity;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 311
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 1

    .line 328
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getLastOpenTitle$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "lastOpenTitle"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static final onCompleted$lambda$1$0(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    .line 330
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$scrollToLastOpenPosition(Lcom/zinhao/kikoeru/WorksActivity;)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 318
    sget-object p2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1, p2}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 319
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-virtual {p2, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    .line 320
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getType$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :cond_0
    if-eqz p2, :cond_1

    .line 323
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_2

    :cond_1
    if-nez p3, :cond_2

    goto :goto_0

    .line 328
    :cond_2
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    new-instance p2, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1$$ExternalSyntheticLambda0;

    invoke-direct {p2, p1}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz p3, :cond_3

    .line 329
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 330
    new-instance p1, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-static {p0, p3, p1}, Lcom/zinhao/kikoeru/WorksActivity;->access$updateListWith(Lcom/zinhao/kikoeru/WorksActivity;Lorg/json/JSONArray;Ljava/lang/Runnable;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 311
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V

    return-void
.end method
