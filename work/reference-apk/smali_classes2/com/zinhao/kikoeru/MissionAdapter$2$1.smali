.class Lcom/zinhao/kikoeru/MissionAdapter$2$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
.source "MissionAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MissionAdapter$2;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/MissionAdapter$2;

.field final synthetic val$dialog:Landroid/content/DialogInterface;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MissionAdapter$2;Landroid/content/DialogInterface;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$dialog"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->this$1:Lcom/zinhao/kikoeru/MissionAdapter$2;

    iput-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->val$dialog:Landroid/content/DialogInterface;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "asyncHttpResponse",
            "jsonObject"
        }
    .end annotation

    .line 83
    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->this$1:Lcom/zinhao/kikoeru/MissionAdapter$2;

    iget-object p2, p2, Lcom/zinhao/kikoeru/MissionAdapter$2;->val$v:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-class v0, Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    const-string p2, "work_json_str"

    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    iget-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->this$1:Lcom/zinhao/kikoeru/MissionAdapter$2;

    iget-object p2, p2, Lcom/zinhao/kikoeru/MissionAdapter$2;->val$v:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const/4 p3, 0x0

    invoke-static {p2, p1, p3}, Landroidx/core/app/ActivityCompat;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 86
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->val$dialog:Landroid/content/DialogInterface;

    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "e",
            "asyncHttpResponse",
            "jsonObject"
        }
    .end annotation

    .line 80
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/MissionAdapter$2$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V

    return-void
.end method
