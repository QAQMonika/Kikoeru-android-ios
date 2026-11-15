.class public Lcom/zinhao/kikoeru/App;
.super Landroid/app/Application;
.source "App.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/App$DatabaseResultCallback;
    }
.end annotation


# static fields
.field public static final CONFIG_DEBUG:Ljava/lang/String; = "debug"

.field public static final CONFIG_FILE_NAME:Ljava/lang/String; = "app.config"

.field public static final CONFIG_LAYOUT_TYPE:Ljava/lang/String; = "layout_type"

.field public static final CONFIG_ONLY_DISPLAY_LRC:Ljava/lang/String; = "only_display_lrc"

.field public static final CONFIG_ORDER:Ljava/lang/String; = "order"

.field public static final CONFIG_SAVE_EXTERNAL:Ljava/lang/String; = "save_at_external_dir"

.field public static final CONFIG_SORT:Ljava/lang/String; = "sort"

.field public static final CONFIG_UPDATE_TIME:Ljava/lang/String; = "update_time"

.field public static final CONFIG_USER_DATABASE_ID:Ljava/lang/String; = "current_user_database_id"

.field public static final ID_PLAY_SERVICE:Ljava/lang/String; = "com.zinhao.kikoeru.play_control"

.field private static instance:Lcom/zinhao/kikoeru/App;


# instance fields
.field private final activities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final allUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation
.end field

.field private appDebug:Z

.field private audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

.field private final circlesIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private currentUserId:J

.field private historyDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

.field private final localWorkHistoryList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end field

.field private radius15Pic:Lcom/bumptech/glide/request/RequestOptions;

.field private radius5Pic:Lcom/bumptech/glide/request/RequestOptions;

.field private saveExternal:Z

.field private userDao:Lcom/zinhao/kikoeru/db/UserDao;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/App;->saveExternal:Z

    .line 48
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/App;->appDebug:Z

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->circlesIdMap:Ljava/util/HashMap;

    return-void
.end method

.method private static dp2px(FLandroid/util/DisplayMetrics;)F
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dp",
            "displayMetrics"
        }
    .end annotation

    const/4 v0, 0x1

    .line 174
    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    return p0
.end method

.method public static getInstance()Lcom/zinhao/kikoeru/App;
    .locals 1

    .line 44
    sget-object v0, Lcom/zinhao/kikoeru/App;->instance:Lcom/zinhao/kikoeru/App;

    return-object v0
.end method

.method public static getTagsList(Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 194
    const-string v0, "tags"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method

.method public static getVasList(Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 198
    const-string v0, "vas"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public alertException(Ljava/lang/Exception;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 184
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-nez p0, :cond_1

    goto :goto_0

    .line 188
    :cond_1
    instance-of v0, p0, Lcom/zinhao/kikoeru/BaseActivity;

    if-eqz v0, :cond_2

    .line 189
    check-cast p0, Lcom/zinhao/kikoeru/BaseActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->alertException(Ljava/lang/Exception;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public currentUser()Lcom/zinhao/kikoeru/db/User;
    .locals 5

    .line 300
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/db/User;

    .line 301
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 304
    :cond_1
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v2

    iget-wide v3, p0, Lcom/zinhao/kikoeru/App;->currentUserId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public deleteUser(Lcom/zinhao/kikoeru/db/User;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation

    .line 279
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 280
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;-><init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/User;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getAllUsers()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation

    .line 292
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/App;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    .line 296
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    return-object p0
.end method

.method public getCirclesIdMap()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 116
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->circlesIdMap:Ljava/util/HashMap;

    return-object p0
.end method

.method public getCurrentUserId()J
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/zinhao/kikoeru/App;->currentUserId:J

    return-wide v0
.end method

.method public getLocalWorkHistoryList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation

    .line 266
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    return-object p0
.end method

.method public getLrcBind(JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "rjNumber",
            "audioPath",
            "callback"
        }
    .end annotation

    .line 318
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;

    move-object v2, p0

    move-wide v3, p1

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/App;JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getPosition()[F
    .locals 4

    .line 235
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 236
    const-string v0, "WINDOW_X"

    const/high16 v2, 0x43110000    # 145.0f

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    .line 237
    const-string v2, "WINDOW_Y"

    const/high16 v3, 0x43200000    # 160.0f

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p0

    const/4 v2, 0x2

    new-array v2, v2, [F

    aput v0, v2, v1

    const/4 v0, 0x1

    aput p0, v2, v0

    return-object v2
.end method

.method public getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;
    .locals 0

    .line 120
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->radius15Pic:Lcom/bumptech/glide/request/RequestOptions;

    return-object p0
.end method

.method public getRadius5Pic()Lcom/bumptech/glide/request/RequestOptions;
    .locals 0

    .line 124
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->radius5Pic:Lcom/bumptech/glide/request/RequestOptions;

    return-object p0
.end method

.method public getValue(Ljava/lang/String;J)J
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "def"
        }
    .end annotation

    .line 221
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 222
    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "def"
        }
    .end annotation

    .line 216
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 217
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public initCirclesIdMap(Lorg/json/JSONArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "circlesList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 109
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 110
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 111
    iget-object v2, p0, Lcom/zinhao/kikoeru/App;->circlesIdMap:Ljava/util/HashMap;

    const-string v3, "name"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public insertLocalHis(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Ljava/lang/Runnable;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "history",
            "callback"
        }
    .end annotation

    .line 242
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda6;-><init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/LocalWorkHistory;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public insertLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcBind"
        }
    .end annotation

    .line 312
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;-><init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/AudioLrcBind;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public insertUser(Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "user",
            "callback"
        }
    .end annotation

    .line 270
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1, p2}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;-><init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isAppDebug()Z
    .locals 0

    .line 70
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/App;->appDebug:Z

    return p0
.end method

.method public isSaveExternal()Z
    .locals 0

    .line 74
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/App;->saveExternal:Z

    return p0
.end method

.method synthetic lambda$deleteUser$3$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    .line 281
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->userDao:Lcom/zinhao/kikoeru/db/UserDao;

    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/db/UserDao;->delete(Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method synthetic lambda$getAllUsers$5$com-zinhao-kikoeru-App()V
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 294
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->userDao:Lcom/zinhao/kikoeru/db/UserDao;

    invoke-interface {p0}, Lcom/zinhao/kikoeru/db/UserDao;->getAllUser()Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method synthetic lambda$getLrcBind$7$com-zinhao-kikoeru-App(JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V
    .locals 0

    .line 319
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    invoke-interface {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao;->getLrcBind(JLjava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 320
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 321
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p4, p0}, Lcom/zinhao/kikoeru/App$DatabaseResultCallback;->onResult(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$insertLocalHis$0$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Ljava/lang/Runnable;)V
    .locals 6

    .line 243
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->historyDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    invoke-interface {v0, p1}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;->insertOrReplace(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V

    .line 245
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 246
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v2

    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    goto :goto_0

    .line 251
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    invoke-interface {p0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 253
    :goto_0
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$insertLrcBind$6$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 0

    .line 313
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao;->insertLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V

    return-void
.end method

.method synthetic lambda$insertUser$2$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V
    .locals 2

    .line 271
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->userDao:Lcom/zinhao/kikoeru/db/UserDao;

    invoke-interface {v0, p1}, Lcom/zinhao/kikoeru/db/UserDao;->insert(Lcom/zinhao/kikoeru/db/User;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/zinhao/kikoeru/App;->currentUserId:J

    .line 272
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/db/User;->setId(Ljava/lang/Long;)V

    .line 273
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->allUsers:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method synthetic lambda$loadLocalHis$1$com-zinhao-kikoeru-App()V
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 260
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    iget-object v1, p0, Lcom/zinhao/kikoeru/App;->historyDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    invoke-interface {v1}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;->getAllHis()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getLocalWorkHistoryList:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->localWorkHistoryList:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "App"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method synthetic lambda$updateUser$4$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    .line 287
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->userDao:Lcom/zinhao/kikoeru/db/UserDao;

    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/db/UserDao;->update(Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method public loadLocalHis()V
    .locals 2

    .line 258
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda4;-><init>(Lcom/zinhao/kikoeru/App;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method

.method public mapCirclesId(Ljava/lang/String;)J
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "circlesName"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/zinhao/kikoeru/App;->circlesIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1

    .line 92
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->circlesIdMap:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    if-nez p0, :cond_0

    return-wide v1

    .line 96
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0

    :cond_1
    return-wide v1
.end method

.method public noActiveActivity()Z
    .locals 0

    .line 178
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "savedInstanceState"
        }
    .end annotation

    .line 332
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    .line 362
    iget-object p0, p0, Lcom/zinhao/kikoeru/App;->activities:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    invoke-static {p1}, Lcom/zinhao/kikoeru/ThemePalettes;->apply(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "outState"
        }
    .end annotation

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    return-void
.end method

.method public onCreate()V
    .locals 9

    .line 129
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 130
    sput-object p0, Lcom/zinhao/kikoeru/App;->instance:Lcom/zinhao/kikoeru/App;

    .line 131
    invoke-virtual {p0, p0}, Lcom/zinhao/kikoeru/App;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 132
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/zinhao/kikoeru/db/AppDatabase;

    const-string v2, "app.db"

    invoke-static {v0, v1, v2}, Landroidx/room/Room;->databaseBuilder(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Landroidx/room/migration/Migration;

    sget-object v3, Lcom/zinhao/kikoeru/db/AppDatabase;->MIGRATION_1_2:Landroidx/room/migration/Migration;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 133
    invoke-virtual {v0, v2}, Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v0

    new-array v2, v1, [Landroidx/room/migration/Migration;

    sget-object v3, Lcom/zinhao/kikoeru/db/AppDatabase;->MIGRATION_2_3:Landroidx/room/migration/Migration;

    aput-object v3, v2, v4

    .line 134
    invoke-virtual {v0, v2}, Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Landroidx/room/RoomDatabase$Builder;->build()Landroidx/room/RoomDatabase;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/db/AppDatabase;

    .line 136
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/AppDatabase;->userDao()Lcom/zinhao/kikoeru/db/UserDao;

    move-result-object v2

    iput-object v2, p0, Lcom/zinhao/kikoeru/App;->userDao:Lcom/zinhao/kikoeru/db/UserDao;

    .line 137
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/AppDatabase;->historyDao()Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    move-result-object v2

    iput-object v2, p0, Lcom/zinhao/kikoeru/App;->historyDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    .line 138
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/AppDatabase;->audioLrcBindDao()Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    .line 140
    const-string v0, "current_user_database_id"

    const-wide/16 v2, -0x1

    invoke-virtual {p0, v0, v2, v3}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/zinhao/kikoeru/App;->currentUserId:J

    .line 141
    const-string v0, "debug"

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x1

    cmp-long v0, v5, v7

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v4

    :goto_0
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/App;->appDebug:Z

    .line 142
    const-string v0, "save_at_external_dir"

    invoke-virtual {p0, v0, v2, v3}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long v0, v2, v7

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    iput-boolean v1, p0, Lcom/zinhao/kikoeru/App;->saveExternal:Z

    .line 144
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    .line 145
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->loadLocalHis()V

    .line 146
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 148
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    :cond_2
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_no_cover:I

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/RoundedCorners;

    .line 154
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/high16 v3, 0x41700000    # 15.0f

    invoke-static {v3, v2}, Lcom/zinhao/kikoeru/App;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v1, v2}, Lcom/bumptech/glide/load/resource/bitmap/RoundedCorners;-><init>(I)V

    .line 153
    invoke-static {v1}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->radius15Pic:Lcom/bumptech/glide/request/RequestOptions;

    .line 156
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_no_cover:I

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/RoundedCorners;

    .line 157
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/App;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3, v2}, Lcom/zinhao/kikoeru/App;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v1, v2}, Lcom/bumptech/glide/load/resource/bitmap/RoundedCorners;-><init>(I)V

    .line 156
    invoke-static {v1}, Lcom/bumptech/glide/request/RequestOptions;->bitmapTransform(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/App;->radius5Pic:Lcom/bumptech/glide/request/RequestOptions;

    .line 160
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/DownloadUtils;->init(Landroid/content/Context;)V

    .line 161
    new-instance v0, Landroid/app/NotificationChannel;

    sget v1, Lcom/zinhao/kikoeru/R$string;->channel_description:I

    .line 164
    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/App;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    const-string v3, "com.zinhao.kikoeru.play_control"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 166
    sget v1, Lcom/zinhao/kikoeru/R$string;->channel_description:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/App;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setDescription(Ljava/lang/String;)V

    .line 167
    invoke-virtual {v0, v4}, Landroid/app/NotificationChannel;->enableLights(Z)V

    .line 168
    invoke-virtual {v0, v4}, Landroid/app/NotificationChannel;->enableVibration(Z)V

    .line 169
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/App;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    .line 170
    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    return-void
.end method

.method public savePosition(FF)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x",
            "y"
        }
    .end annotation

    .line 226
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 227
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 228
    const-string v0, "WINDOW_X"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 229
    const-string p1, "WINDOW_Y"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 230
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setAppDebug(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "appDebug"
        }
    .end annotation

    .line 65
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/App;->appDebug:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 66
    :goto_0
    const-string p1, "debug"

    invoke-virtual {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    return-void
.end method

.method public setCurrentUserId(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "currentUserId"
        }
    .end annotation

    .line 87
    iput-wide p1, p0, Lcom/zinhao/kikoeru/App;->currentUserId:J

    return-void
.end method

.method public setSaveExternal(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "saveExternal"
        }
    .end annotation

    .line 78
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/App;->saveExternal:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 79
    :goto_0
    const-string p1, "save_at_external_dir"

    invoke-virtual {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    return-void
.end method

.method public setValue(Ljava/lang/String;J)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 209
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 210
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 211
    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 212
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 202
    const-string v0, "app.config"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/App;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 203
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 204
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 205
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public updateUser(Lcom/zinhao/kikoeru/db/User;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation

    .line 286
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda3;-><init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/User;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->doSomething(Ljava/lang/Runnable;)V

    return-void
.end method
