.class public Lcom/zinhao/kikoeru/Lrc$LrcRow;
.super Ljava/lang/Object;
.source "Lrc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/Lrc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LrcRow"
.end annotation


# static fields
.field public static final NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;


# instance fields
.field public content:Ljava/lang/String;

.field public nextRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

.field public strTime:Ljava/lang/String;

.field public time:J

.field public upRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 239
    new-instance v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    const-wide/16 v1, 0x0

    const-string v3, ""

    const-string v4, "\u65e0\u6b4c\u8bcd"

    invoke-direct {v0, v4, v1, v2, v3}, Lcom/zinhao/kikoeru/Lrc$LrcRow;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "strTime",
            "time",
            "content"
        }
    .end annotation

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    sget-object v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object v0, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->upRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 241
    iput-object v0, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->nextRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 247
    iput-object p1, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->strTime:Ljava/lang/String;

    .line 248
    iput-wide p2, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->time:J

    .line 249
    iput-object p4, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->content:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getNextRow()Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 0

    .line 259
    iget-object p0, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->nextRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    if-nez p0, :cond_0

    .line 260
    sget-object p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    :cond_0
    return-object p0
.end method

.method public getUpRow()Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 0

    .line 253
    iget-object p0, p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->upRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    if-nez p0, :cond_0

    .line 254
    sget-object p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    :cond_0
    return-object p0
.end method
