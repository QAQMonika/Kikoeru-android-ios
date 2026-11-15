.class public abstract Lcom/zinhao/kikoeru/db/AppDatabase;
.super Landroidx/room/RoomDatabase;
.source "AppDatabase.java"


# static fields
.field public static final MIGRATION_1_2:Landroidx/room/migration/Migration;

.field public static final MIGRATION_2_3:Landroidx/room/migration/Migration;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 15
    new-instance v0, Lcom/zinhao/kikoeru/db/AppDatabase$1;

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/db/AppDatabase$1;-><init>(II)V

    sput-object v0, Lcom/zinhao/kikoeru/db/AppDatabase;->MIGRATION_1_2:Landroidx/room/migration/Migration;

    .line 34
    new-instance v0, Lcom/zinhao/kikoeru/db/AppDatabase$2;

    const/4 v1, 0x3

    invoke-direct {v0, v2, v1}, Lcom/zinhao/kikoeru/db/AppDatabase$2;-><init>(II)V

    sput-object v0, Lcom/zinhao/kikoeru/db/AppDatabase;->MIGRATION_2_3:Landroidx/room/migration/Migration;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroidx/room/RoomDatabase;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract audioLrcBindDao()Lcom/zinhao/kikoeru/db/AudioLrcBindDao;
.end method

.method public abstract historyDao()Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;
.end method

.method public abstract userDao()Lcom/zinhao/kikoeru/db/UserDao;
.end method
