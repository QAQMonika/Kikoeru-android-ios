.class public final Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;
.super Ljava/lang/Object;
.source "AudioLrcBindDao_Impl.java"

# interfaces
.implements Lcom/zinhao/kikoeru/db/AudioLrcBindDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deletionAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertionAdapterOfAudioLrcBind:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
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
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 32
    new-instance v0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$1;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$1;-><init>(Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__insertionAdapterOfAudioLrcBind:Landroidx/room/EntityInsertionAdapter;

    .line 58
    new-instance v0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$2;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$2;-><init>(Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__deletionAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;

    .line 73
    new-instance v0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$3;

    invoke-direct {v0, p0, p1}, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl$3;-><init>(Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__updateAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;

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

    .line 247
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public deleteLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "audioLrcBind"
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 121
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 123
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__deletionAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 124
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 127
    throw p1
.end method

.method public getLrcBind(JLjava/lang/String;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "rjNumber",
            "audioPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation

    .line 145
    const-string v0, "SELECT * FROM audio_lrc_bind WHERE rjNumber = ? and audioPath = ?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v0

    const/4 v2, 0x1

    .line 147
    invoke-virtual {v0, v2, p1, p2}, Landroidx/room/RoomSQLiteQuery;->bindLong(IJ)V

    if-nez p3, :cond_0

    .line 150
    invoke-virtual {v0, v1}, Landroidx/room/RoomSQLiteQuery;->bindNull(I)V

    goto :goto_0

    .line 152
    :cond_0
    invoke-virtual {v0, v1, p3}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 154
    :goto_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 155
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 p1, 0x0

    const/4 p2, 0x0

    invoke-static {p0, v0, p1, p2}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    .line 157
    :try_start_0
    const-string p1, "id"

    invoke-static {p0, p1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    .line 158
    const-string p3, "rjNumber"

    invoke-static {p0, p3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p3

    .line 159
    const-string v1, "audioPath"

    invoke-static {p0, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    .line 160
    const-string v2, "lrcPath"

    invoke-static {p0, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2

    .line 161
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 162
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 165
    invoke-interface {p0, p3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 167
    invoke-interface {p0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, p2

    goto :goto_2

    .line 170
    :cond_1
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 173
    :goto_2
    invoke-interface {p0, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v7, p2

    goto :goto_3

    .line 176
    :cond_2
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 178
    :goto_3
    new-instance v8, Lcom/zinhao/kikoeru/db/AudioLrcBind;

    invoke-direct {v8, v4, v5, v6, v7}, Lcom/zinhao/kikoeru/db/AudioLrcBind;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    .line 180
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, p2

    goto :goto_4

    .line 183
    :cond_3
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 185
    :goto_4
    invoke-virtual {v8, v4}, Lcom/zinhao/kikoeru/db/AudioLrcBind;->setId(Ljava/lang/Long;)V

    .line 186
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 190
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 191
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    return-object v3

    :catchall_0
    move-exception p1

    .line 190
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 191
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 192
    throw p1
.end method

.method public getLrcBind(Ljava/lang/String;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "audioPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation

    .line 198
    const-string v0, "SELECT * FROM audio_lrc_bind WHERE audioPath = ?"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v0

    if-nez p1, :cond_0

    .line 201
    invoke-virtual {v0, v1}, Landroidx/room/RoomSQLiteQuery;->bindNull(I)V

    goto :goto_0

    .line 203
    :cond_0
    invoke-virtual {v0, v1, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 205
    :goto_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 206
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 p1, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, v1}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object p0

    .line 208
    :try_start_0
    const-string p1, "id"

    invoke-static {p0, p1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    .line 209
    const-string v2, "rjNumber"

    invoke-static {p0, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2

    .line 210
    const-string v3, "audioPath"

    invoke-static {p0, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 211
    const-string v4, "lrcPath"

    invoke-static {p0, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 212
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 213
    :goto_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 216
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 218
    invoke-interface {p0, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_1

    move-object v8, v1

    goto :goto_2

    .line 221
    :cond_1
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 224
    :goto_2
    invoke-interface {p0, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_2

    move-object v9, v1

    goto :goto_3

    .line 227
    :cond_2
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 229
    :goto_3
    new-instance v10, Lcom/zinhao/kikoeru/db/AudioLrcBind;

    invoke-direct {v10, v6, v7, v8, v9}, Lcom/zinhao/kikoeru/db/AudioLrcBind;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    .line 231
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v6, v1

    goto :goto_4

    .line 234
    :cond_3
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 236
    :goto_4
    invoke-virtual {v10, v6}, Lcom/zinhao/kikoeru/db/AudioLrcBind;->setId(Ljava/lang/Long;)V

    .line 237
    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 241
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 242
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    return-object v5

    :catchall_0
    move-exception p1

    .line 241
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 242
    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 243
    throw p1
.end method

.method public insertLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "audioLrcBind"
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 109
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__insertionAdapterOfAudioLrcBind:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insert(Ljava/lang/Object;)V

    .line 112
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 115
    throw p1
.end method

.method public updateLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "audioLrcBind"
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 133
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 135
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__updateAdapterOfAudioLrcBind:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 136
    iget-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBindDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {p0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 139
    throw p1
.end method
