.class public final enum Lcom/zinhao/kikoeru/data/model/Result$Status;
.super Ljava/lang/Enum;
.source "Result.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/data/model/Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/zinhao/kikoeru/data/model/Result$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/zinhao/kikoeru/data/model/Result$Status;

.field public static final enum ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

.field public static final enum LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

.field public static final enum SUCCESS:Lcom/zinhao/kikoeru/data/model/Result$Status;


# direct methods
.method private static synthetic $values()[Lcom/zinhao/kikoeru/data/model/Result$Status;
    .locals 3

    .line 12
    sget-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

    sget-object v1, Lcom/zinhao/kikoeru/data/model/Result$Status;->SUCCESS:Lcom/zinhao/kikoeru/data/model/Result$Status;

    sget-object v2, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    filled-new-array {v0, v1, v2}, [Lcom/zinhao/kikoeru/data/model/Result$Status;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result$Status;

    const-string v1, "LOADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/data/model/Result$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->LOADING:Lcom/zinhao/kikoeru/data/model/Result$Status;

    .line 14
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result$Status;

    const-string v1, "SUCCESS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/data/model/Result$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->SUCCESS:Lcom/zinhao/kikoeru/data/model/Result$Status;

    .line 15
    new-instance v0, Lcom/zinhao/kikoeru/data/model/Result$Status;

    const-string v1, "ERROR"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/data/model/Result$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->ERROR:Lcom/zinhao/kikoeru/data/model/Result$Status;

    .line 12
    invoke-static {}, Lcom/zinhao/kikoeru/data/model/Result$Status;->$values()[Lcom/zinhao/kikoeru/data/model/Result$Status;

    move-result-object v0

    sput-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->$VALUES:[Lcom/zinhao/kikoeru/data/model/Result$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/zinhao/kikoeru/data/model/Result$Status;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 12
    const-class v0, Lcom/zinhao/kikoeru/data/model/Result$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/zinhao/kikoeru/data/model/Result$Status;

    return-object p0
.end method

.method public static values()[Lcom/zinhao/kikoeru/data/model/Result$Status;
    .locals 1

    .line 12
    sget-object v0, Lcom/zinhao/kikoeru/data/model/Result$Status;->$VALUES:[Lcom/zinhao/kikoeru/data/model/Result$Status;

    invoke-virtual {v0}, [Lcom/zinhao/kikoeru/data/model/Result$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/zinhao/kikoeru/data/model/Result$Status;

    return-object v0
.end method
