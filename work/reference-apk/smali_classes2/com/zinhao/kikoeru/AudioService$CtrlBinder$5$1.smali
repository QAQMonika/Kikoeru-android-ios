.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$1;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Lcom/zinhao/kikoeru/App$DatabaseResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$2"
        }
    .end annotation

    .line 671
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResult(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 674
    instance-of v0, p1, Lcom/zinhao/kikoeru/db/AudioLrcBind;

    if-eqz v0, :cond_0

    .line 675
    check-cast p1, Lcom/zinhao/kikoeru/db/AudioLrcBind;

    .line 676
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onCompleted: find bind:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/AudioLrcBind;->getAudioPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lrc_hash:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/AudioLrcBind;->getLrcPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioService"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/AudioLrcBind;->getLrcPath()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$5;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$1000(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetMediaString(Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)V

    :cond_0
    return-void
.end method
