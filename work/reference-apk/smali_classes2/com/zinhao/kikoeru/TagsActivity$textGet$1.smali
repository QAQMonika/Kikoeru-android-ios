.class public final Lcom/zinhao/kikoeru/TagsActivity$textGet$1;
.super Ljava/lang/Object;
.source "TagsActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/TagsView$TextGet;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/TagsActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/zinhao/kikoeru/TagsView$TextGet<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0002H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/TagsActivity$textGet$1",
        "Lcom/zinhao/kikoeru/TagsView$TextGet;",
        "Lorg/json/JSONObject;",
        "onGetText",
        "",
        "jsonObject",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/TagsActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/TagsActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity$textGet$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onGetText(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 100
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity$textGet$1;->onGetText(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public onGetText(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .line 103
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const-string v2, "name"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x28

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz p1, :cond_1

    const-string v1, "count"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x29

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    .line 105
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity$textGet$1;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TagsActivity;->alertException(Ljava/lang/Exception;)V

    .line 108
    const-string p0, ""

    return-object p0
.end method
