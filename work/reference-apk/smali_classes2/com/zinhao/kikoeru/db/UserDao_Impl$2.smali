.class Lcom/zinhao/kikoeru/db/UserDao_Impl$2;
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

    .line 68
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/UserDao_Impl$2;->this$0:Lcom/zinhao/kikoeru/db/UserDao_Impl;

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

    .line 76
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object p0

    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 77
    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    return-void

    .line 79
    :cond_0
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

    .line 68
    check-cast p2, Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/db/UserDao_Impl$2;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method

.method public createQuery()Ljava/lang/String;
    .locals 0

    .line 71
    const-string p0, "DELETE FROM `users` WHERE `id` = ?"

    return-object p0
.end method
