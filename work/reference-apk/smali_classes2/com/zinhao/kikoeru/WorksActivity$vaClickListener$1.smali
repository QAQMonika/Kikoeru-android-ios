.class public final Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/TagsView$TagClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u0012\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0002H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$vaClickListener$1",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "Lorg/json/JSONObject;",
        "onTagClick",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 751
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onTagClick(Ljava/lang/Object;)V
    .locals 0

    .line 751
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;->onTagClick(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onTagClick(Lorg/json/JSONObject;)V
    .locals 3

    if-eqz p1, :cond_2

    .line 753
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 755
    :try_start_0
    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 756
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getVaId$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x1f3

    if-eqz v1, :cond_0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getType$p(Lcom/zinhao/kikoeru/WorksActivity;)I

    move-result v1

    if-eq v1, v2, :cond_1

    .line 757
    :cond_0
    const-string v1, "name"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->access$setVaName$p(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V

    .line 758
    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->access$clearWork(Lcom/zinhao/kikoeru/WorksActivity;)V

    .line 759
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$setVaId$p(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V

    .line 761
    :cond_1
    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 763
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 764
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    :cond_2
    :goto_0
    return-void
.end method
