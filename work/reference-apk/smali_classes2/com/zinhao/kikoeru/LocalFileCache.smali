.class public Lcom/zinhao/kikoeru/LocalFileCache;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/io/Closeable;


# static fields
.field private static final CONFIG_PLAY_LIST:Ljava/lang/String; = "playList.json"

.field private static final CONFIG_USERS:Ljava/lang/String; = "users.json"

.field private static final LAST_OPEN_WORKS_FILE:Ljava/lang/String; = "last_open_works.json"

.field private static final SAVE_WORKS_INFO_DIR:Ljava/lang/String; = "json_work"

.field private static final SAVE_WORKS_TREE_DIR:Ljava/lang/String; = "json_work_tree"

.field private static final TAG:Ljava/lang/String; = "LocalFileCache"

.field private static instance:Lcom/zinhao/kikoeru/LocalFileCache;


# instance fields
.field private final mission:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private running:Z

.field private workThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->running:Z

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    .line 39
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->workThread:Ljava/lang/Thread;

    .line 40
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/zinhao/kikoeru/LocalFileCache;
    .locals 2

    const-class v0, Lcom/zinhao/kikoeru/LocalFileCache;

    monitor-enter v0

    .line 31
    :try_start_0
    sget-object v1, Lcom/zinhao/kikoeru/LocalFileCache;->instance:Lcom/zinhao/kikoeru/LocalFileCache;

    if-nez v1, :cond_0

    .line 32
    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-direct {v1}, Lcom/zinhao/kikoeru/LocalFileCache;-><init>()V

    sput-object v1, Lcom/zinhao/kikoeru/LocalFileCache;->instance:Lcom/zinhao/kikoeru/LocalFileCache;

    .line 34
    :cond_0
    sget-object v1, Lcom/zinhao/kikoeru/LocalFileCache;->instance:Lcom/zinhao/kikoeru/LocalFileCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private readPrivateJSONObject(Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "name",
            "callback"
        }
    .end annotation

    .line 498
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 499
    iget-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance p2, Lcom/zinhao/kikoeru/LocalFileCache$10;

    invoke-direct {p2, p0, v0, p3}, Lcom/zinhao/kikoeru/LocalFileCache$10;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private savePrivateJSONObject(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "jsonObject",
            "name"
        }
    .end annotation

    if-nez p2, :cond_0

    return-void

    .line 481
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$9;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/zinhao/kikoeru/LocalFileCache$9;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 539
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->running:Z

    return-void
.end method

.method public doSomething(Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "runnable"
        }
    .end annotation

    .line 514
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getExternalAppRootDir()Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 45
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->isSaveExternal()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 46
    new-instance p0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    const-string v1, "KikoeruLib"

    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 47
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 48
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 51
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "create dir failed\uff1a"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-object p0

    .line 55
    :cond_2
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getExternalCacheDir()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public getExternalWorkDir(I)Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    const/4 v0, 0x0

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    new-instance v1, Ljava/io/File;

    const-string v2, "libs_work"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 70
    new-instance p0, Ljava/io/File;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    .line 72
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result p1

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    return-object p0

    :catch_0
    move-exception p0

    .line 66
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    return-object v0
.end method

.method public getLrcText(Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)Z
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "audioFile",
            "callback"
        }
    .end annotation

    .line 99
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 100
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    .line 101
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 103
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".lrc"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 105
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 106
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ".vtt"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    new-instance v3, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 111
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_1

    return v2

    .line 115
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LocalFileCache$1;

    invoke-direct {v0, p0, v3, p2}, Lcom/zinhao/kikoeru/LocalFileCache$1;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method synthetic lambda$readLastOpenWorks$0$com-zinhao-kikoeru-LocalFileCache(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    .locals 4

    .line 0
    const/4 v0, 0x0

    .line 293
    :try_start_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 299
    new-instance v2, Ljava/io/File;

    const-string v3, "last_open_works.json"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 301
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/LocalFileCache;->readTextSync(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    .line 302
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 303
    new-instance p0, Lcom/zinhao/kikoeru/LocalResponse;

    const/16 v2, 0xc8

    invoke-direct {p0, v2}, Lcom/zinhao/kikoeru/LocalResponse;-><init>(I)V

    invoke-virtual {p1, v0, p0, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 305
    invoke-virtual {p1, p0, v0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception p0

    .line 295
    invoke-virtual {p1, p0, v0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 296
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method synthetic lambda$saveLastOpenWorks$1$com-zinhao-kikoeru-LocalFileCache(Lorg/json/JSONArray;)V
    .locals 3

    .line 314
    :try_start_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 319
    new-instance v1, Ljava/io/File;

    const-string v2, "last_open_works.json"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 321
    :try_start_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lcom/zinhao/kikoeru/LocalFileCache;->writeTextSync(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 323
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, p1}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    return-void

    :catch_1
    move-exception p0

    .line 316
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, p1}, Ljava/io/FileNotFoundException;->printStackTrace(Ljava/io/PrintStream;)V

    return-void
.end method

.method public mapLocalItemFile(Lorg/json/JSONObject;ILjava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "item",
            "id",
            "relativePath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 80
    const-string p0, "workId"

    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 81
    const-string p0, "file_exists"

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 82
    sget-object v1, Lcom/zinhao/kikoeru/LocalFileCache;->instance:Lcom/zinhao/kikoeru/LocalFileCache;

    invoke-virtual {v1, p2}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalWorkDir(I)Ljava/io/File;

    move-result-object p2

    if-nez p2, :cond_0

    .line 84
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u83b7\u53d6\u6620\u5c04\u6587\u4ef6\u5931\u8d25\uff0c\u521b\u5efa\u6587\u4ef6\u5939\u5931\u8d25\u3002"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return v0

    .line 87
    :cond_0
    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 88
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    const-string p2, "local_file_path"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    .line 91
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 93
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    return p0
.end method

.method public readLastOpenWorks(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation

    .line 290
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/LocalFileCache$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public readLastPlayList(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "callback"
        }
    .end annotation

    .line 464
    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/PlaybackPosition;->read(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public readLocalDownloadWorks(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$3;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/LocalFileCache$3;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public readLocalWorkById(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "id",
            "callback"
        }
    .end annotation

    .line 329
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/LocalFileCache$4;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public readLocalWorkTree(Landroid/content/Context;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "id",
            "callback"
        }
    .end annotation

    .line 362
    iget-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LocalFileCache$5;

    invoke-direct {v0, p0, p2, p3}, Lcom/zinhao/kikoeru/LocalFileCache$5;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public readText(Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0
        }
        names = {
            "save",
            "callback"
        }
    .end annotation

    .line 414
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/LocalFileCache$7;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public readTextSync(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "save"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 428
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 431
    new-instance p0, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    invoke-static {p1, v0}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object p1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 432
    new-instance p1, Ljava/io/BufferedReader;

    invoke-direct {p1, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 434
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 435
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 436
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 438
    :cond_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V

    .line 439
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 429
    :cond_1
    new-instance p0, Ljava/io/FileNotFoundException;

    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%s not exists!"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public readUsers(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "callback"
        }
    .end annotation

    .line 472
    const-string v0, "users.json"

    invoke-direct {p0, p1, v0, p2}, Lcom/zinhao/kikoeru/LocalFileCache;->readPrivateJSONObject(Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public removeWork(I)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    .line 134
    :try_start_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    new-instance v1, Ljava/io/File;

    const-string v2, "json_work"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 141
    new-instance v2, Ljava/io/File;

    const-string v3, "json_work_tree"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    new-instance v3, Ljava/io/File;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "%d.json"

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 144
    new-instance v1, Ljava/io/File;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 146
    new-instance v2, Ljava/io/File;

    const-string v4, "libs_work"

    invoke-direct {v2, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 147
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 148
    iget-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v2, Lcom/zinhao/kikoeru/LocalFileCache$2;

    invoke-direct {v2, p0, v1, v3, v0}, Lcom/zinhao/kikoeru/LocalFileCache$2;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Ljava/io/File;Ljava/io/File;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :catch_0
    move-exception p0

    .line 136
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 137
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method public run()V
    .locals 3

    const/4 v0, 0x1

    .line 520
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->running:Z

    .line 521
    :goto_0
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->running:Z

    if-eqz v0, :cond_1

    .line 522
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    monitor-enter v0

    .line 523
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 524
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 525
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 526
    const-string v1, "LocalFileCache"

    const-string v2, "run: mission success!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v0, 0x1

    .line 530
    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 532
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 528
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :cond_1
    return-void
.end method

.method public saveLastOpenWorks(Lorg/json/JSONArray;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonArray"
        }
    .end annotation

    .line 311
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/LocalFileCache$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Lorg/json/JSONArray;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public savePlayList(Landroid/content/Context;Ljava/util/List;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "playList",
            "index",
            "seek"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;IJ)V"
        }
    .end annotation

    .line 443
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 444
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    if-eqz p2, :cond_1

    .line 445
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 447
    :cond_0
    new-instance v2, Lcom/zinhao/kikoeru/LocalFileCache$8;

    invoke-direct {v2, p0, v1}, Lcom/zinhao/kikoeru/LocalFileCache$8;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Lorg/json/JSONArray;)V

    invoke-interface {p2, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 454
    :try_start_0
    const-string p2, "playlist"

    invoke-virtual {v0, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 455
    const-string p2, "index"

    invoke-virtual {v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 456
    const-string p2, "seek"

    invoke-virtual {v0, p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 457
    const-string p2, "playList.json"

    invoke-direct {p0, p1, v0, p2}, Lcom/zinhao/kikoeru/LocalFileCache;->savePrivateJSONObject(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 459
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public saveUsers(Landroid/content/Context;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "users"
        }
    .end annotation

    .line 468
    const-string v0, "users.json"

    invoke-direct {p0, p1, p2, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->savePrivateJSONObject(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method public saveWork(Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "work",
            "rootTree"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 196
    :try_start_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LocalFileCache;->getExternalAppRootDir()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 203
    new-instance v2, Ljava/io/File;

    const-string v3, "json_work"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    new-instance v3, Ljava/io/File;

    const-string v4, "json_work_tree"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 205
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    const-string v4, "getCacheDir: mkdir failed\uff01"

    const-string v5, "LocalFileCache"

    if-nez v0, :cond_0

    .line 206
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 211
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 212
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_1

    .line 213
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 217
    :cond_1
    new-instance v0, Ljava/io/File;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "%d.json"

    invoke-static {v4, v6, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 218
    new-instance v2, Ljava/io/File;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v4, v6, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 219
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 220
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/zinhao/kikoeru/LocalFileCache;->writeText(Ljava/io/File;Ljava/lang/String;)V

    .line 223
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_3

    .line 224
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lcom/zinhao/kikoeru/LocalFileCache;->writeText(Ljava/io/File;Ljava/lang/String;)V

    :cond_3
    return-void

    :catch_0
    move-exception p0

    .line 198
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 199
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method public writeText(Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "save",
            "text"
        }
    .end annotation

    .line 394
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache;->mission:Ljava/util/List;

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$6;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/LocalFileCache$6;-><init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public writeTextSync(Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "save",
            "text"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 407
    new-instance p0, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, p1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 408
    invoke-virtual {p0, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 409
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->flush()V

    .line 410
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->close()V

    return-void
.end method
