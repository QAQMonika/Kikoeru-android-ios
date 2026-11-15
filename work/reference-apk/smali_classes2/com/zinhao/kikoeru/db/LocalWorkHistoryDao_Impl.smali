.class public final Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;
.super Ljava/lang/Object;
.source "LocalWorkHistoryDao_Impl.java"

# interfaces
.implements Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deletionAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertionAdapterOfLocalWorkHistory:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "__db"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 32
    new-instance v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$1;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$1;-><init>(Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__insertionAdapterOfLocalWorkHistory:Landroidx/room/EntityInsertionAdapter;

    .line 59
    new-instance v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$2;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$2;-><init>(Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__deletionAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;

    .line 74
    new-instance v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$3;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$3;-><init>(Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__updateAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;

    return-void
.end method

.method public static getRequiredConverters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 193
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "his"
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 123
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 125
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__deletionAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 126
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 129
    throw p1
.end method

.method public getAllHis()Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 147
    const-string v1, "SELECT * FROM local_work_history ORDER BY position"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 148
    iget-object v3, v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 149
    iget-object v0, v0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v2

    .line 151
    :try_start_0
    const-string v0, "id"

    invoke-static {v2, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 152
    const-string v4, "rjNumber"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 153
    const-string v5, "position"

    invoke-static {v2, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 154
    const-string v6, "coverUrl"

    invoke-static {v2, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 155
    const-string v7, "title"

    invoke-static {v2, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 156
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 157
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 160
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 162
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 164
    invoke-interface {v2, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_0

    move-object v15, v3

    goto :goto_1

    .line 167
    :cond_0
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object v15, v9

    .line 170
    :goto_1
    invoke-interface {v2, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_1

    move-object/from16 v16, v3

    goto :goto_2

    .line 173
    :cond_1
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v16, v9

    .line 175
    :goto_2
    new-instance v10, Lcom/zinhao/kikoeru/db/LocalWorkHistory;

    invoke-direct/range {v10 .. v16}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    .line 177
    invoke-interface {v2, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_2

    move-object v9, v3

    goto :goto_3

    .line 180
    :cond_2
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    .line 182
    :goto_3
    invoke-virtual {v10, v9}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->setId(Ljava/lang/Long;)V

    .line 183
    invoke-interface {v8, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 187
    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 188
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    return-object v8

    :catchall_0
    move-exception v0

    .line 187
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 188
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 189
    throw v0
.end method

.method public insertOrReplace(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "his"
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 111
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 113
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__insertionAdapterOfLocalWorkHistory:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insert(Ljava/lang/Object;)V

    .line 114
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 117
    throw p1
.end method

.method public update(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "his"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 135
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 137
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__updateAdapterOfLocalWorkHistory:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 138
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 141
    throw p1
.end method
