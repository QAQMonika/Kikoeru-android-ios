.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;

.field final synthetic val$jsonObject:Lorg/json/JSONObject;

.field final synthetic val$lastPlayList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;Lorg/json/JSONObject;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$2",
            "val$jsonObject",
            "val$lastPlayList"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 537
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->val$jsonObject:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->val$lastPlayList:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->this$2:Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iget-object v1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->val$lastPlayList:Ljava/util/List;

    iget-object v2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$1$1;->val$jsonObject:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2}, Lcom/zinhao/kikoeru/PlaybackPosition;->restore(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;Ljava/util/List;Lorg/json/JSONObject;)V

    return-void
.end method
