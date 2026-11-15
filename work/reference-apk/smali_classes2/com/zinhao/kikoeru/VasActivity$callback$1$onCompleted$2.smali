.class public final Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;
.super Ljava/lang/Object;
.source "VasActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/VasActivity$callback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2",
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

.field final synthetic this$0:Lcom/zinhao/kikoeru/VasActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/VasActivity;Lorg/json/JSONArray;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 113
    iget-object v0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "vasView"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v3, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    iget-object v4, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v4}, Lcom/zinhao/kikoeru/VasActivity;->access$getTextGet$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/TagsView;->isInLayout()Z

    move-result v0

    if-nez v0, :cond_3

    .line 115
    iget-object p0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object p0

    if-nez p0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, p0

    :goto_0
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/TagsView;->requestLayout()V

    return-void

    .line 117
    :cond_3
    iget-object v0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    if-nez v0, :cond_4

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v1, v0

    :goto_1
    new-instance v0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/VasActivity$callback$1$onCompleted$2$run$1;-><init>(Lcom/zinhao/kikoeru/VasActivity;)V

    check-cast v0, Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v0, v2, v3}, Lcom/zinhao/kikoeru/TagsView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
