.class Lcom/zinhao/kikoeru/db/UserDao_Impl$1;
.super Landroidx/room/EntityInsertionAdapter;
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
        "Landroidx/room/EntityInsertionAdapter<",
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

    .line 32
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl$1;->this$0:Lcom/zinhao/kikoeru/db/UserDao_Impl;

    invoke-direct {p0, p2}, Landroidx/room/EntityInsertionAdapter;-><init>(Landroidx/room/RoomDatabase;)V

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

    .line 40
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 41
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 45
    :goto_0
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    if-nez p0, :cond_1

    .line 46
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 50
    :goto_1
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x3

    if-nez p0, :cond_2

    .line 51
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 53
    :cond_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 55
    :goto_2
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x4

    if-nez p0, :cond_3

    .line 56
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 58
    :cond_3
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 60
    :goto_3
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x5

    if-nez p0, :cond_4

    .line 61
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 63
    :cond_4
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v0, p0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    :goto_4
    const/4 p0, 0x6

    .line 65
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getLastUpdateTime()J

    move-result-wide v0

    invoke-interface {p1, p0, v0, v1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

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

    .line 32
    check-cast p2, Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/db/UserDao_Impl$1;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method public createQuery()Ljava/lang/String;
    .locals 0

    .line 35
    const-string p0, "INSERT OR REPLACE INTO `users` (`id`,`name`,`password`,`host`,`token`,`lastUpdateTime`) VALUES (?,?,?,?,?,?)"

    return-object p0
.end method
