.class public Lcom/zinhao/kikoeru/AppMessage;
.super Ljava/lang/Exception;
.source "AppMessage.java"


# instance fields
.field public NONE:Ljava/lang/Runnable;

.field action:Ljava/lang/Runnable;

.field actionName:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "title",
            "message",
            "action",
            "actionName"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 21
    new-instance p2, Lcom/zinhao/kikoeru/AppMessage$1;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/AppMessage$1;-><init>(Lcom/zinhao/kikoeru/AppMessage;)V

    iput-object p2, p0, Lcom/zinhao/kikoeru/AppMessage;->NONE:Ljava/lang/Runnable;

    .line 10
    iput-object p1, p0, Lcom/zinhao/kikoeru/AppMessage;->title:Ljava/lang/String;

    .line 11
    iput-object p3, p0, Lcom/zinhao/kikoeru/AppMessage;->action:Ljava/lang/Runnable;

    .line 12
    iput-object p4, p0, Lcom/zinhao/kikoeru/AppMessage;->actionName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/Runnable;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/zinhao/kikoeru/AppMessage;->action:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    .line 29
    iget-object p0, p0, Lcom/zinhao/kikoeru/AppMessage;->NONE:Ljava/lang/Runnable;

    return-object p0

    :cond_0
    return-object v0
.end method

.method public getActionName()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/zinhao/kikoeru/AppMessage;->title:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 36
    const-string p0, "no name"

    return-object p0

    .line 37
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/AppMessage;->actionName:Ljava/lang/String;

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/zinhao/kikoeru/AppMessage;->title:Ljava/lang/String;

    if-nez p0, :cond_0

    .line 17
    const-string p0, ""

    :cond_0
    return-object p0
.end method
