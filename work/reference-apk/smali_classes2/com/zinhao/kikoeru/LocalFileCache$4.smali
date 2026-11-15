.class Lcom/zinhao/kikoeru/LocalFileCache$4;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->readLocalWorkById(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
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

    .line 329
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->val$id:I

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 334
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 340
    new-instance v1, Ljava/io/File;

    const-string v2, "json_work"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 341
    new-instance v0, Ljava/io/File;

    iget v2, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->val$id:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%d.json"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 342
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 345
    :try_start_1
    iget-object v2, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v2, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->readTextSync(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 346
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 347
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 348
    const-string v0, "is_local_work"

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 349
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v3, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v4, 0xc8

    invoke-direct {v3, v4}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {v0, v1, v3, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 352
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 353
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$4;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v2, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v3, 0x194

    invoke-direct {v2, v3}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p0, v0, v2, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void

    :catch_1
    move-exception p0

    .line 336
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 337
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
