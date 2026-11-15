.class Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$3;
.super Landroidx/room/EntityDeletionOrUpdateAdapter;
.source "LocalWorkHistoryDao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeletionOrUpdateAdapter<",
        "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;Landroidx/room/RoomDatabase;)V
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

    .line 74
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$3;->this$0:Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl;

    invoke-direct {p0, p2}, Landroidx/room/EntityDeletionOrUpdateAdapter;-><init>(Landroidx/room/RoomDatabase;)V

    return-void
.end method


# virtual methods
.method public bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
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

    .line 82
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 83
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getId()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    :goto_0
    const/4 p0, 0x2

    .line 87
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    const/4 p0, 0x3

    .line 88
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getPosition()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 89
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getCoverUrl()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x4

    if-nez p0, :cond_1

    .line 90
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 92
    :cond_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getCoverUrl()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 94
    :goto_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getTitle()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x5

    if-nez p0, :cond_2

    .line 95
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 97
    :cond_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getTitle()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 99
    :goto_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x6

    if-nez p0, :cond_3

    .line 100
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    return-void

    .line 102
    :cond_3
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getId()Ljava/lang/Long;

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

    .line 74
    check-cast p2, Lcom/zinhao/kikoeru/db/LocalWorkHistory;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao_Impl$3;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V

    return-void
.end method

.method public createQuery()Ljava/lang/String;
    .locals 0

    .line 77
    const-string p0, "UPDATE OR ABORT `local_work_history` SET `id` = ?,`rjNumber` = ?,`position` = ?,`coverUrl` = ?,`title` = ? WHERE `id` = ?"

    return-object p0
.end method
