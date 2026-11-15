.class public Lcom/zinhao/kikoeru/DownloadUtils;
.super Ljava/lang/Object;
.source "DownloadUtils.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/DownloadUtils$Mission;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DownloadUtils"

.field private static instance:Lcom/zinhao/kikoeru/DownloadUtils;

.field private static missionConfigFile:Ljava/io/File;

.field private static final okHttpClient:Lokhttp3/OkHttpClient;


# instance fields
.field public hashMissionMap:Landroidx/collection/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SimpleArrayMap<",
            "Ljava/lang/String;",
            "Lcom/zinhao/kikoeru/DownloadUtils$Mission;",
            ">;"
        }
    .end annotation
.end field

.field public missionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/DownloadUtils$Mission;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 31
    new-instance v0, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    const-wide/16 v1, 0x5

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 32
    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1e

    .line 33
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    invoke-virtual {v0, v2, v3, v1}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->okHttpClient:Lokhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    .line 38
    new-instance v0, Landroidx/collection/SimpleArrayMap;

    invoke-direct {v0}, Landroidx/collection/SimpleArrayMap;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->hashMissionMap:Landroidx/collection/SimpleArrayMap;

    return-void
.end method

.method static synthetic access$000()Lokhttp3/OkHttpClient;
    .locals 1

    .line 27
    sget-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->okHttpClient:Lokhttp3/OkHttpClient;

    return-object v0
.end method

.method public static getInstance()Lcom/zinhao/kikoeru/DownloadUtils;
    .locals 1

    .line 338
    sget-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->instance:Lcom/zinhao/kikoeru/DownloadUtils;

    if-nez v0, :cond_0

    .line 339
    new-instance v0, Lcom/zinhao/kikoeru/DownloadUtils;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/DownloadUtils;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->instance:Lcom/zinhao/kikoeru/DownloadUtils;

    .line 341
    :cond_0
    sget-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->instance:Lcom/zinhao/kikoeru/DownloadUtils;

    return-object v0
.end method

.method public static mapMission(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/DownloadUtils$Mission;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    const/4 v0, 0x0

    .line 394
    :goto_0
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v1

    iget-object v1, v1, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 395
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v1

    iget-object v1, v1, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    .line 396
    invoke-virtual {v1, p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->equals(Lorg/json/JSONObject;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 405
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    if-nez v0, :cond_0

    return-void

    .line 408
    :cond_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 409
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    new-instance v2, Lcom/zinhao/kikoeru/DownloadUtils$2;

    invoke-direct {v2, p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$2;-><init>(Lcom/zinhao/kikoeru/DownloadUtils;Lorg/json/JSONArray;)V

    invoke-interface {v1, v2}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 418
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object p0

    sget-object v1, Lcom/zinhao/kikoeru/DownloadUtils;->missionConfigFile:Ljava/io/File;

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->writeText(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 367
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "downloadMission.json"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->missionConfigFile:Ljava/io/File;

    .line 368
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 369
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->hashMissionMap:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Landroidx/collection/SimpleArrayMap;->clear()V

    .line 370
    sget-object p1, Lcom/zinhao/kikoeru/DownloadUtils;->missionConfigFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 371
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object p1

    sget-object v0, Lcom/zinhao/kikoeru/DownloadUtils;->missionConfigFile:Ljava/io/File;

    new-instance v1, Lcom/zinhao/kikoeru/DownloadUtils$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/DownloadUtils$1;-><init>(Lcom/zinhao/kikoeru/DownloadUtils;)V

    invoke-virtual {p1, v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->readText(Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    :cond_0
    return-void
.end method

.method public removeCompleteMission()I
    .locals 2

    .line 358
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 359
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {v1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$800(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 360
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public removeMission(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)I
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mission"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->hashMissionMap:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getHash()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/collection/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->hashMissionMap:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getHash()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/collection/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 v0, 0x0

    .line 348
    :goto_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 349
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-static {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$1000(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->equals(Lorg/json/JSONObject;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 350
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method
