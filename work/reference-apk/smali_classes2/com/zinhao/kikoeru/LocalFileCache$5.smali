.class Lcom/zinhao/kikoeru/LocalFileCache$5;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->readLocalWorkTree(Landroid/content/Context;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$id",
            "val$callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 362
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$id:I

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 367
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 373
    new-instance v1, Ljava/io/File;

    const-string v2, "json_work_tree"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 374
    new-instance v0, Ljava/io/File;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v3, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "%d.json"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 375
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 377
    :try_start_1
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->readTextSync(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 378
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 379
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 380
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    new-instance v3, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v4, 0xc8

    invoke-direct {v3, v4}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {v0, v2, v3, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 383
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 384
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-virtual {p0, v0, v2, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    .line 387
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$5;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v3, "%s \u4e0d\u5b58\u5728!"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v2, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception p0

    .line 369
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 370
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
