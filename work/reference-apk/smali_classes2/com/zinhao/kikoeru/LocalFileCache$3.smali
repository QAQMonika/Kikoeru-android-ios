.class Lcom/zinhao/kikoeru/LocalFileCache$3;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->readLocalDownloadWorks(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 229
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v0, 0x0

    .line 234
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 240
    new-instance v2, Ljava/io/File;

    const-string v3, "json_work"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 241
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    const-string v3, "\u672c\u5730\u7f13\u5b58\u4e3a\u7a7a"

    if-eqz v1, :cond_3

    .line 242
    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$3$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LocalFileCache$3$1;-><init>(Lcom/zinhao/kikoeru/LocalFileCache$3;)V

    invoke-virtual {v2, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_0

    .line 249
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 252
    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 253
    new-instance v2, Lcom/zinhao/kikoeru/LocalFileCache$3$2;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/LocalFileCache$3$2;-><init>(Lcom/zinhao/kikoeru/LocalFileCache$3;)V

    invoke-interface {v1, v2}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 260
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 261
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 262
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 264
    :try_start_1
    const-string v5, "currentPage"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 265
    const-string v5, "pageSize"

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 266
    const-string v5, "totalCount"

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v4, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 267
    const-string v5, "pagination"

    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v4, 0x0

    .line 268
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 270
    iget-object v5, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    invoke-virtual {v5, v7}, Lcom/zinhao/kikoeru/LocalFileCache;->readTextSync(Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 271
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 272
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 273
    const-string v5, "is_local_work"

    invoke-virtual {v7, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 274
    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 277
    :cond_2
    const-string v1, "works"

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 278
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v3, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v4, 0xc8

    invoke-direct {v3, v4}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {v1, v0, v3, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 280
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v2, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v3, 0x194

    invoke-direct {v2, v3}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p0, v1, v2, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_1
    return-void

    .line 283
    :cond_3
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception v1

    .line 236
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$3;->val$callback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-virtual {p0, v1, v0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 237
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
