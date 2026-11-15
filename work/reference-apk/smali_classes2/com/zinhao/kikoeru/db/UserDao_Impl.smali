.class public final Lcom/zinhao/kikoeru/db/UserDao_Impl;
.super Ljava/lang/Object;
.source "UserDao_Impl.java"

# interfaces
.implements Lcom/zinhao/kikoeru/db/UserDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deletionAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertionAdapterOfUser:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/User;",
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
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 32
    new-instance v0, Lcom/zinhao/kikoeru/db/UserDao_Impl$1;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/UserDao_Impl$1;-><init>(Lcom/zinhao/kikoeru/db/UserDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__insertionAdapterOfUser:Landroidx/room/EntityInsertionAdapter;

    .line 68
    new-instance v0, Lcom/zinhao/kikoeru/db/UserDao_Impl$2;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/UserDao_Impl$2;-><init>(Lcom/zinhao/kikoeru/db/UserDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__deletionAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;

    .line 83
    new-instance v0, Lcom/zinhao/kikoeru/db/UserDao_Impl$3;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/UserDao_Impl$3;-><init>(Lcom/zinhao/kikoeru/db/UserDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__updateAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;

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

    .line 228
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/zinhao/kikoeru/db/User;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "user"
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 142
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 144
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__deletionAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 145
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 148
    throw p1
.end method

.method public getAllUser()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation

    .line 166
    const-string v0, "SELECT * FROM users"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v0

    .line 167
    iget-object v2, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 168
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    .line 170
    :try_start_0
    const-string v1, "id"

    invoke-static {p0, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    .line 171
    const-string v3, "name"

    invoke-static {p0, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 172
    const-string v4, "password"

    invoke-static {p0, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 173
    const-string v5, "host"

    invoke-static {p0, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 174
    const-string v6, "token"

    invoke-static {p0, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 175
    const-string v7, "lastUpdateTime"

    invoke-static {p0, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 176
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 177
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 179
    new-instance v9, Lcom/zinhao/kikoeru/db/User;

    invoke-direct {v9}, Lcom/zinhao/kikoeru/db/User;-><init>()V

    .line 181
    invoke-interface {p0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_0

    move-object v10, v2

    goto :goto_1

    .line 184
    :cond_0
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 186
    :goto_1
    invoke-virtual {v9, v10}, Lcom/zinhao/kikoeru/db/User;->setId(Ljava/lang/Long;)V

    .line 188
    invoke-interface {p0, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_1

    move-object v10, v2

    goto :goto_2

    .line 191
    :cond_1
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 193
    :goto_2
    invoke-virtual {v9, v10}, Lcom/zinhao/kikoeru/db/User;->setName(Ljava/lang/String;)V

    .line 195
    invoke-interface {p0, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_2

    move-object v10, v2

    goto :goto_3

    .line 198
    :cond_2
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 200
    :goto_3
    invoke-virtual {v9, v10}, Lcom/zinhao/kikoeru/db/User;->setPassword(Ljava/lang/String;)V

    .line 202
    invoke-interface {p0, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_3

    move-object v10, v2

    goto :goto_4

    .line 205
    :cond_3
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 207
    :goto_4
    invoke-virtual {v9, v10}, Lcom/zinhao/kikoeru/db/User;->setHost(Ljava/lang/String;)V

    .line 209
    invoke-interface {p0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_4

    move-object v10, v2

    goto :goto_5

    .line 212
    :cond_4
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 214
    :goto_5
    invoke-virtual {v9, v10}, Lcom/zinhao/kikoeru/db/User;->setToken(Ljava/lang/String;)V

    .line 216
    invoke-interface {p0, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 217
    invoke-virtual {v9, v10, v11}, Lcom/zinhao/kikoeru/db/User;->setLastUpdateTime(J)V

    .line 218
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 222
    :cond_5
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 223
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    return-object v8

    :catchall_0
    move-exception v1

    .line 222
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 223
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 224
    throw v1
.end method

.method public insert(Lcom/zinhao/kikoeru/db/User;)J
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "user"
        }
    .end annotation

    .line 128
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 129
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 131
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__insertionAdapterOfUser:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insertAndReturnId(Ljava/lang/Object;)J

    move-result-wide v0

    .line 132
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-wide v0

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 136
    throw p1
.end method

.method public update(Lcom/zinhao/kikoeru/db/User;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "user"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 154
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 156
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__updateAdapterOfUser:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 157
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 160
    throw p1
.end method
