.class public Lcom/zinhao/kikoeru/db/AudioLrcBind;
.super Ljava/lang/Object;
.source "AudioLrcBind.java"


# instance fields
.field private audioPath:Ljava/lang/String;

.field private id:Ljava/lang/Long;

.field private lrcPath:Ljava/lang/String;

.field private rjNumber:J


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "rjNumber",
            "audioPath",
            "lrcPath"
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->rjNumber:J

    .line 18
    iput-object p3, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->audioPath:Ljava/lang/String;

    .line 19
    iput-object p4, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->lrcPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAudioPath()Ljava/lang/String;
    .locals 0

    .line 39
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->audioPath:Ljava/lang/String;

    return-object p0
.end method

.method public getId()Ljava/lang/Long;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->id:Ljava/lang/Long;

    return-object p0
.end method

.method public getLrcPath()Ljava/lang/String;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->lrcPath:Ljava/lang/String;

    return-object p0
.end method

.method public getRjNumber()J
    .locals 2

    .line 31
    iget-wide v0, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->rjNumber:J

    return-wide v0
.end method

.method public setAudioPath(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audioPath"
        }
    .end annotation

    .line 43
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->audioPath:Ljava/lang/String;

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

    .line 27
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->id:Ljava/lang/Long;

    return-void
.end method

.method public setLrcPath(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrcPath"
        }
    .end annotation

    .line 51
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->lrcPath:Ljava/lang/String;

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

    .line 35
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/AudioLrcBind;->rjNumber:J

    return-void
.end method
