.class public Lcom/zinhao/kikoeru/TagsView$JsonTextGet;
.super Ljava/lang/Object;
.source "TagsView.java"

# interfaces
.implements Lcom/zinhao/kikoeru/TagsView$TextGet;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/TagsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JsonTextGet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/zinhao/kikoeru/TagsView$TextGet<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private key:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->key:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->key:Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic onGetText(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "t"
        }
    .end annotation

    .line 58
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->onGetText(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onGetText(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .line 68
    :try_start_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->key:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 70
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 71
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    .line 73
    const-string p0, ""

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/zinhao/kikoeru/TagsView$JsonTextGet;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 77
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->key:Ljava/lang/String;

    return-object p0
.end method
