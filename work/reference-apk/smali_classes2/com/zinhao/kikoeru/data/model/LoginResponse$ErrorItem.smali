.class public Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;
.super Ljava/lang/Object;
.source "LoginResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/data/model/LoginResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ErrorItem"
.end annotation


# instance fields
.field private msg:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "msg"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMsg()Ljava/lang/String;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->msg:Ljava/lang/String;

    return-object p0
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "msg"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$ErrorItem;->msg:Ljava/lang/String;

    return-void
.end method
