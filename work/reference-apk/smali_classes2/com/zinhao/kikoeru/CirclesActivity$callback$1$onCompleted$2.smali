.class public final Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;
.super Ljava/lang/Object;
.source "CirclesActivity.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/CirclesActivity$callback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
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
        "com/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2",
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

.field final synthetic this$0:Lcom/zinhao/kikoeru/CirclesActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/CirclesActivity;Lorg/json/JSONArray;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/CirclesActivity;->access$getCirclesView$p(Lcom/zinhao/kikoeru/CirclesActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "circlesView"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;->$jsonArray:Lorg/json/JSONArray;

    iget-object p0, p0, Lcom/zinhao/kikoeru/CirclesActivity$callback$1$onCompleted$2;->this$0:Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/CirclesActivity;->access$getTextGet$p(Lcom/zinhao/kikoeru/CirclesActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    return-void
.end method
