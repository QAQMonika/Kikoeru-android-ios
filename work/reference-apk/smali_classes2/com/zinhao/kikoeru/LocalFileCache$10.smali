.class Lcom/zinhao/kikoeru/LocalFileCache$10;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->readPrivateJSONObject(Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$file",
            "val$callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 499
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->val$file:Ljava/io/File;

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    const/4 v0, 0x0

    .line 503
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iget-object v2, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->val$file:Ljava/io/File;

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/LocalFileCache;->readTextSync(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 504
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 505
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v3, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v4, 0xc8

    invoke-direct {v3, v4}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {v1, v0, v3, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v1

    .line 507
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 508
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$10;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v2, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v3, 0x194

    invoke-direct {v2, v3}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p0, v1, v2, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
