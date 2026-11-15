.class public Lcom/zinhao/kikoeru/db/LocalWorkHistory;
.super Ljava/lang/Object;
.source "LocalWorkHistory.java"


# instance fields
.field private coverUrl:Ljava/lang/String;

.field private id:Ljava/lang/Long;

.field private position:J

.field private rjNumber:J

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rjNumber",
            "position",
            "coverUrl",
            "title"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->rjNumber:J

    .line 20
    iput-wide p3, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->position:J

    .line 21
    iput-object p5, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->coverUrl:Ljava/lang/String;

    .line 22
    iput-object p6, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->title:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCoverUrl()Ljava/lang/String;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->coverUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getId()Ljava/lang/Long;
    .locals 0

    .line 50
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->id:Ljava/lang/Long;

    return-object p0
.end method

.method public getPosition()J
    .locals 2

    .line 26
    iget-wide v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->position:J

    return-wide v0
.end method

.method public getRjNumber()J
    .locals 2

    .line 62
    iget-wide v0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->rjNumber:J

    return-wide v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->title:Ljava/lang/String;

    return-object p0
.end method

.method public setCoverUrl(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "coverUrl"
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->coverUrl:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    .line 54
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->id:Ljava/lang/Long;

    return-void
.end method

.method public setPosition(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 30
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->position:J

    return-void
.end method

.method public setRjNumber(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rjNumber"
        }
    .end annotation

    .line 58
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->rjNumber:J

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "title"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->title:Ljava/lang/String;

    return-void
.end method
