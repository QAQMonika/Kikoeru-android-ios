.class public final Lcom/zinhao/kikoeru/db/AppDatabase_Impl;
.super Lcom/zinhao/kikoeru/db/AppDatabase;
.source "AppDatabase_Impl.java"


# instance fields
.field private volatile _audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

.field private volatile _localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

.field private volatile _userDao:Lcom/zinhao/kikoeru/db/UserDao;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$602(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;Landroidx/sqlite/db/SupportSQLiteDatabase;)Landroidx/sqlite/db/SupportSQLiteDatabase;
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mDatabase:Landroidx/sqlite/db/SupportSQLiteDatabase;

    return-object p1
.end method

.method static synthetic access$700(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;Landroidx/sqlite/db/SupportSQLiteDatabase;)V
    .locals 0

    .line 32
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->internalInitInvalidationTracker(Landroidx/sqlite/db/SupportSQLiteDatabase;)V

    return-void
.end method

.method static synthetic access$800(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$900(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;)Ljava/util/List;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->mCallbacks:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public audioLrcBindDao()Lcom/zinhao/kikoeru/db/AudioLrcBindDao;
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    if-eqz v0, :cond_0

    .line 232
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    return-object p0

    .line 234
    :cond_0
    monitor-enter p0

    .line 235
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    if-nez v0, :cond_1

    .line 236
    new-instance v0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_audioLrcBindDao:Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 239
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public clearAllTables()V
    .locals 4

    .line 163
    const-string v0, "VACUUM"

    const-string v1, "PRAGMA wal_checkpoint(FULL)"

    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->assertNotMainThread()V

    .line 164
    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->getOpenHelper()Landroidx/sqlite/db/SupportSQLiteOpenHelper;

    move-result-object v2

    invoke-interface {v2}, Landroidx/sqlite/db/SupportSQLiteOpenHelper;->getWritableDatabase()Landroidx/sqlite/db/SupportSQLiteDatabase;

    move-result-object v2

    .line 166
    :try_start_0
    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->beginTransaction()V

    .line 167
    const-string v3, "DELETE FROM `users`"

    invoke-interface {v2, v3}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 168
    const-string v3, "DELETE FROM `local_work_history`"

    invoke-interface {v2, v3}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 169
    const-string v3, "DELETE FROM `audio_lrc_bind`"

    invoke-interface {v2, v3}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 170
    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->endTransaction()V

    .line 173
    invoke-interface {v2, v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->query(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 174
    invoke-interface {v2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p0

    if-nez p0, :cond_0

    .line 175
    invoke-interface {v2, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v3

    .line 172
    invoke-super {p0}, Lcom/zinhao/kikoeru/db/AppDatabase;->endTransaction()V

    .line 173
    invoke-interface {v2, v1}, Landroidx/sqlite/db/SupportSQLiteDatabase;->query(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 174
    invoke-interface {v2}, Landroidx/sqlite/db/SupportSQLiteDatabase;->inTransaction()Z

    move-result p0

    if-nez p0, :cond_1

    .line 175
    invoke-interface {v2, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 177
    :cond_1
    throw v3
.end method

.method protected createInvalidationTracker()Landroidx/room/InvalidationTracker;
    .locals 6

    .line 156
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 157
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 158
    new-instance v3, Landroidx/room/InvalidationTracker;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "users"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "local_work_history"

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "audio_lrc_bind"

    aput-object v5, v4, v1

    invoke-direct {v3, p0, v0, v2, v4}, Landroidx/room/InvalidationTracker;-><init>(Landroidx/room/RoomDatabase;Ljava/util/Map;Ljava/util/Map;[Ljava/lang/String;)V

    return-object v3
.end method

.method protected createOpenHelper(Landroidx/room/DatabaseConfiguration;)Landroidx/sqlite/db/SupportSQLiteOpenHelper;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "configuration"
        }
    .end annotation

    .line 41
    new-instance v0, Landroidx/room/RoomOpenHelper;

    new-instance v1, Lcom/zinhao/kikoeru/db/AppDatabase_Impl$1;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lcom/zinhao/kikoeru/db/AppDatabase_Impl$1;-><init>(Lcom/zinhao/kikoeru/db/AppDatabase_Impl;I)V

    const-string p0, "1108a675585ad89643fa1fbf69ee8212"

    const-string v2, "7297d5157fdae2a57f7d9acdb764a18c"

    invoke-direct {v0, p1, v1, p0, v2}, Landroidx/room/RoomOpenHelper;-><init>(Landroidx/room/DatabaseConfiguration;Landroidx/room/RoomOpenHelper$Delegate;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    iget-object p0, p1, Landroidx/room/DatabaseConfiguration;->context:Landroid/content/Context;

    invoke-static {p0}, Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;->builder(Landroid/content/Context;)Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;

    move-result-object p0

    iget-object v1, p1, Landroidx/room/DatabaseConfiguration;->name:Ljava/lang/String;

    .line 147
    invoke-virtual {p0, v1}, Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;->name(Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;

    move-result-object p0

    .line 148
    invoke-virtual {p0, v0}, Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;->callback(Landroidx/sqlite/db/SupportSQLiteOpenHelper$Callback;)Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;

    move-result-object p0

    .line 149
    invoke-virtual {p0}, Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration$Builder;->build()Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;

    move-result-object p0

    .line 150
    iget-object p1, p1, Landroidx/room/DatabaseConfiguration;->sqliteOpenHelperFactory:Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;

    invoke-interface {p1, p0}, Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;->create(Landroidx/sqlite/db/SupportSQLiteOpenHelper$Configuration;)Landroidx/sqlite/db/SupportSQLiteOpenHelper;

    move-result-object p0

    return-object p0
.end method

.method public getAutoMigrations(Ljava/util/Map;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "autoMigrationSpecsMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/room/migration/Migration;",
            ">;"
        }
    .end annotation

    const/4 p0, 0x0

    .line 198
    new-array p0, p0, [Landroidx/room/migration/Migration;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getRequiredAutoMigrationSpecs()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;>;"
        }
    .end annotation

    .line 191
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    return-object p0
.end method

.method protected getRequiredTypeConverters()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation

    .line 182
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 183
    const-class v0, Lcom/zinhao/kikoeru/db/UserDao;

    invoke-static {}, Lcom/zinhao/kikoeru/db/UserDao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-class v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    invoke-static {}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    const-class v0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao;

    invoke-static {}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public historyDao()Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    if-eqz v0, :cond_0

    .line 218
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    return-object p0

    .line 220
    :cond_0
    monitor-enter p0

    .line 221
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    if-nez v0, :cond_1

    .line 222
    new-instance v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    .line 224
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_localWorkHistoryDao:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 225
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public userDao()Lcom/zinhao/kikoeru/db/UserDao;
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_userDao:Lcom/zinhao/kikoeru/db/UserDao;

    if-eqz v0, :cond_0

    .line 204
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_userDao:Lcom/zinhao/kikoeru/db/UserDao;

    return-object p0

    .line 206
    :cond_0
    monitor-enter p0

    .line 207
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_userDao:Lcom/zinhao/kikoeru/db/UserDao;

    if-nez v0, :cond_1

    .line 208
    new-instance v0, Lcom/zinhao/kikoeru/db/UserDao_Impl;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/db/UserDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_userDao:Lcom/zinhao/kikoeru/db/UserDao;

    .line 210
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AppDatabase_Impl;->_userDao:Lcom/zinhao/kikoeru/db/UserDao;

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 211
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
