.class public Lcom/zinhao/kikoeru/DownloadUtils$Mission;
.super Ljava/lang/Object;
.source "DownloadUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/DownloadUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Mission"
.end annotation


# instance fields
.field private completed:Z

.field private currentCall:Lokhttp3/Call;

.field private downloaded:J

.field private downloading:Z

.field private eTag:Ljava/lang/String;

.field private hash:Ljava/lang/String;

.field private jsonObject:Lorg/json/JSONObject;

.field private mapFile:Ljava/io/File;

.field private missionException:Ljava/lang/Exception;

.field private stepCallback:Ljava/lang/Runnable;

.field private successCallback:Ljava/lang/Runnable;

.field private title:Ljava/lang/String;

.field private total:J

.field private type:Ljava/lang/String;

.field private update:Z

.field private workId:I


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .line 70
    const-string v0, "type"

    const-string v1, "title"

    const-string v2, "eTag"

    const-string v3, "workId"

    const-string v4, "local_file_path"

    const-string v5, "total"

    const-string v6, "downloaded"

    const-string v7, "hash"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v8, 0x0

    .line 51
    iput-boolean v8, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloading:Z

    .line 52
    iput-boolean v8, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->completed:Z

    .line 71
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    const-wide/16 v9, 0x0

    .line 72
    iput-wide v9, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    .line 73
    iput-wide v9, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    .line 74
    const-string v9, ""

    iput-object v9, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    .line 75
    iput-object v9, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->title:Ljava/lang/String;

    .line 76
    iput-boolean v8, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->update:Z

    .line 78
    :try_start_0
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 79
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    .line 81
    :cond_0
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 82
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    .line 84
    :cond_1
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 85
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 86
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    .line 87
    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 89
    :cond_2
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 90
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->workId:I

    .line 92
    :cond_3
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 93
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    .line 95
    :cond_4
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 96
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->title:Ljava/lang/String;

    .line 98
    :cond_5
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 99
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->type:Ljava/lang/String;

    .line 101
    :cond_6
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 102
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->hash:Ljava/lang/String;

    .line 104
    :cond_7
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/zinhao/kikoeru/DownloadUtils;->hashMissionMap:Landroidx/collection/SimpleArrayMap;

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p0}, Landroidx/collection/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object p1

    iget-object p1, p1, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 107
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 108
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->missionException:Ljava/lang/Exception;

    .line 109
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Lorg/json/JSONObject;
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getJsonObject()Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/Exception;)Ljava/lang/Exception;
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->missionException:Ljava/lang/Exception;

    return-object p1
.end method

.method static synthetic access$202(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/zinhao/kikoeru/DownloadUtils$Mission;J)J
    .locals 0

    .line 40
    iput-wide p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)J
    .locals 2

    .line 40
    iget-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    return-wide v0
.end method

.method static synthetic access$414(Lcom/zinhao/kikoeru/DownloadUtils$Mission;J)J
    .locals 2

    .line 40
    iget-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/io/File;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    return-object p0
.end method

.method static synthetic access$600(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->stepCallback:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$702(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Z)Z
    .locals 0

    .line 40
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->update:Z

    return p1
.end method

.method static synthetic access$800(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Z
    .locals 0

    .line 40
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->completed:Z

    return p0
.end method

.method static synthetic access$802(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Z)Z
    .locals 0

    .line 40
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->completed:Z

    return p1
.end method

.method static synthetic access$900(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Ljava/lang/Runnable;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->successCallback:Ljava/lang/Runnable;

    return-object p0
.end method

.method private getDownLoadUrl()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 180
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    const-string v0, "mediaDownloadUrl"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 181
    const-string v0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "%s?token=%s"

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    filled-new-array {p0, v2}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 184
    :cond_0
    sget-object v0, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getJsonObject()Lorg/json/JSONObject;
    .locals 4

    .line 323
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "downloaded"

    iget-wide v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 324
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "total"

    iget-wide v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 325
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    const-string v1, "eTag"

    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 327
    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->missionException:Ljava/lang/Exception;

    .line 328
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 330
    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->jsonObject:Lorg/json/JSONObject;

    return-object p0
.end method


# virtual methods
.method public equals(Lorg/json/JSONObject;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .line 114
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->hash:Ljava/lang/String;

    const-string v0, "hash"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public getFormatProgressText()Ljava/lang/String;
    .locals 4

    .line 122
    iget-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 123
    const-string p0, "-- / --"

    return-object p0

    .line 126
    :cond_0
    iget-wide v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    long-to-float v2, v2

    const/high16 v3, 0x49800000    # 1048576.0f

    div-float/2addr v2, v3

    long-to-float v0, v0

    div-float/2addr v0, v3

    .line 128
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 129
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "\u5df2\u5b8c\u6210(\u5171%.2fMB)"

    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 131
    :cond_1
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%.2fMB / %.2fMB"

    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getHash()Ljava/lang/String;
    .locals 0

    .line 118
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->hash:Ljava/lang/String;

    return-object p0
.end method

.method public getMapFile()Ljava/io/File;
    .locals 0

    .line 139
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    return-object p0
.end method

.method public getMissionException()Ljava/lang/Exception;
    .locals 0

    .line 59
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->missionException:Ljava/lang/Exception;

    return-object p0
.end method

.method public getProgress()I
    .locals 4

    .line 147
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p0, 0x64

    return p0

    .line 151
    :cond_0
    iget-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    cmp-long p0, v0, v2

    if-ltz p0, :cond_1

    long-to-float p0, v2

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float/2addr p0, v2

    long-to-float v0, v0

    div-float/2addr p0, v0

    .line 152
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 135
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->title:Ljava/lang/String;

    return-object p0
.end method

.method public getTypeCover()I
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->type:Ljava/lang/String;

    const-string v1, "image"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_image_24:I

    return p0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->type:Ljava/lang/String;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 161
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->title:Ljava/lang/String;

    const-string v0, ".mp4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 162
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_video_library_24:I

    return p0

    .line 164
    :cond_1
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_audiotrack_24:I

    return p0

    .line 165
    :cond_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->type:Ljava/lang/String;

    const-string v0, "text"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 166
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_text_snippet_24:I

    return p0

    .line 168
    :cond_3
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_text_snippet_24:I

    return p0
.end method

.method public getWorkId()I
    .locals 0

    .line 143
    iget p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->workId:I

    return p0
.end method

.method public isCompleted()Z
    .locals 9

    .line 308
    iget-wide v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->total:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_1

    .line 309
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v5, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    cmp-long p0, v0, v5

    if-nez p0, :cond_0

    return v3

    :cond_0
    return v4

    :cond_1
    const-wide/16 v5, 0x0

    cmp-long v2, v0, v5

    if-eqz v2, :cond_3

    .line 313
    iget-wide v7, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    cmp-long v2, v7, v5

    if-eqz v2, :cond_3

    cmp-long v0, v0, v7

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    move v3, v4

    .line 314
    :goto_0
    iput-boolean v3, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->completed:Z

    .line 316
    :cond_3
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->completed:Z

    return p0
.end method

.method public isDownloading()Z
    .locals 0

    .line 300
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloading:Z

    return p0
.end method

.method public isUpdate()Z
    .locals 0

    .line 172
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->update:Z

    return p0
.end method

.method public setDownloading(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "downloading"
        }
    .end annotation

    .line 304
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloading:Z

    return-void
.end method

.method public setStepCallback(Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stepCallback"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->stepCallback:Ljava/lang/Runnable;

    return-void
.end method

.method public setSuccessCallback(Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "successCallback"
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->successCallback:Ljava/lang/Runnable;

    return-void
.end method

.method public setUpdate(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "update"
        }
    .end annotation

    .line 176
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->update:Z

    return-void
.end method

.method public start()V
    .locals 6

    const-string v0, "start: download:"

    .line 190
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_0

    .line 193
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isDownloading()Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_0

    .line 198
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getDownLoadUrl()Ljava/lang/String;

    move-result-object v1

    .line 199
    const-string v2, "DownloadUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    .line 201
    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string v1, "authorization"

    sget-object v2, Lcom/zinhao/kikoeru/Api;->authorization:Ljava/lang/String;

    .line 202
    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 205
    iget-wide v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->mapFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 206
    const-string v1, "Range"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "bytes=%d-"

    iget-wide v4, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->downloaded:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 207
    iget-object v1, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 208
    const-string v1, "If-Range"

    iget-object v2, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->eTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 212
    :cond_2
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 213
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->access$000()Lokhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->currentCall:Lokhttp3/Call;

    .line 214
    new-instance v1, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission$1;-><init>(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    invoke-interface {v0, v1}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    const/4 v0, 0x1

    .line 284
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 286
    iput-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->missionException:Ljava/lang/Exception;

    .line 287
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 288
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->currentCall:Lokhttp3/Call;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lokhttp3/Call;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->currentCall:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    :cond_0
    const/4 v0, 0x0

    .line 296
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setDownloading(Z)V

    return-void
.end method
