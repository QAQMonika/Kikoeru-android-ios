.class public Lcom/zinhao/kikoeru/db/User;
.super Ljava/lang/Object;
.source "User.java"


# instance fields
.field private host:Ljava/lang/String;

.field private id:Ljava/lang/Long;

.field private lastUpdateTime:J

.field private name:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private token:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "id",
            "name",
            "password",
            "host",
            "token",
            "lastUpdateTime"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->id:Ljava/lang/Long;

    .line 22
    iput-object p2, p0, Lcom/zinhao/kikoeru/db/User;->name:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lcom/zinhao/kikoeru/db/User;->password:Ljava/lang/String;

    .line 24
    iput-object p4, p0, Lcom/zinhao/kikoeru/db/User;->host:Ljava/lang/String;

    .line 25
    iput-object p5, p0, Lcom/zinhao/kikoeru/db/User;->token:Ljava/lang/String;

    .line 26
    iput-wide p6, p0, Lcom/zinhao/kikoeru/db/User;->lastUpdateTime:J

    return-void
.end method


# virtual methods
.method public getHost()Ljava/lang/String;
    .locals 0

    .line 57
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/User;->host:Ljava/lang/String;

    return-object p0
.end method

.method public getId()Ljava/lang/Long;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/User;->id:Ljava/lang/Long;

    return-object p0
.end method

.method public getLastUpdateTime()J
    .locals 2

    .line 73
    iget-wide v0, p0, Lcom/zinhao/kikoeru/db/User;->lastUpdateTime:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/User;->name:Ljava/lang/String;

    return-object p0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/User;->password:Ljava/lang/String;

    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    .line 65
    iget-object p0, p0, Lcom/zinhao/kikoeru/db/User;->token:Ljava/lang/String;

    return-object p0
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "host"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->host:Ljava/lang/String;

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

    .line 37
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->id:Ljava/lang/Long;

    return-void
.end method

.method public setLastUpdateTime(J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lastUpdateTime"
        }
    .end annotation

    .line 77
    iput-wide p1, p0, Lcom/zinhao/kikoeru/db/User;->lastUpdateTime:J

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 45
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->name:Ljava/lang/String;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "password"
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->password:Ljava/lang/String;

    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "token"
        }
    .end annotation

    .line 69
    iput-object p1, p0, Lcom/zinhao/kikoeru/db/User;->token:Ljava/lang/String;

    return-void
.end method
