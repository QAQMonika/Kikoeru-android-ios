.class Lcom/zinhao/kikoeru/db/UserDao_Impl$3;
.super Landroidx/room/EntityDeletionOrUpdateAdapter;
.source "UserDao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/db/UserDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeletionOrUpdateAdapter<",
        "Lcom/zinhao/kikoeru/db/User;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/db/UserDao_Impl;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/db/UserDao_Impl;Landroidx/room/RoomDatabase;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "database"
        }
    .end annotation

    .line 83
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl$3;->this$0:Lcom/zinhao/kikoeru/db/UserDao_Impl;

    invoke-direct {p0, p2}, Landroidx/room/EntityDeletionOrUpdateAdapter;-><init>(Landroidx/room/RoomDatabase;)V

    return-void
.end method


# virtual methods
.method public bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/User;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stmt",
            "value"
        }
    .end annotation

    .line 91
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 92
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 96
    :goto_0
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    if-nez p0, :cond_1

    .line 97
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 101
    :goto_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x3

    if-nez p0, :cond_2

    .line 102
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 104
    :cond_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 106
    :goto_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x4

    if-nez p0, :cond_3

    .line 107
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 109
    :cond_3
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 111
    :goto_3
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x5

    if-nez p0, :cond_4

    .line 112
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 114
    :cond_4
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    :goto_4
    const/4 p0, 0x6

    .line 116
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getLastUpdateTime()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 117
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x7

    if-nez p0, :cond_5

    .line 118
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    return-void

    .line 120
    :cond_5
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    return-void
.end method

.method public bridge synthetic bind(Landroidx/sqlite/db/SupportSQLiteStatement;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "stmt",
            "value"
        }
    .end annotation

    .line 83
    check-cast p2, Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/db/UserDao_Impl$3;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method public createQuery()Ljava/lang/String;
    .locals 0

    .line 86
    const-string p0, "UPDATE OR ABORT `users` SET `id` = ?,`name` = ?,`password` = ?,`host` = ?,`token` = ?,`lastUpdateTime` = ? WHERE `id` = ?"

    return-object p0
.end method
