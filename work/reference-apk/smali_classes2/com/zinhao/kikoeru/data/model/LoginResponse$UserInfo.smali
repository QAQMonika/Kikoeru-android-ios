.class public Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;
.super Ljava/lang/Object;
.source "LoginResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/data/model/LoginResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserInfo"
.end annotation


# instance fields
.field private id:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getId()I
    .locals 0

    .line 93
    iget p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;->id:I

    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 85
    iget-object p0, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;->name:Ljava/lang/String;

    return-object p0
.end method

.method public setId(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    .line 97
    iput p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;->id:I

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

    .line 89
    iput-object p1, p0, Lcom/zinhao/kikoeru/data/model/LoginResponse$UserInfo;->name:Ljava/lang/String;

    return-void
.end method
