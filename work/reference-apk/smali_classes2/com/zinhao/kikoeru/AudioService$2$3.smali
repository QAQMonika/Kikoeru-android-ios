.class Lcom/zinhao/kikoeru/AudioService$2$3;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$2;->onMediaMetadataChanged(Lcom/google/android/exoplayer2/MediaMetadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/AudioService$2;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 279
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$2$3;->this$1:Lcom/zinhao/kikoeru/AudioService$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/zinhao/kikoeru/MusicChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 282
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2$3;->this$1:Lcom/zinhao/kikoeru/AudioService$2;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$2;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService;->access$300(Lcom/zinhao/kikoeru/AudioService;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p0

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->access$600(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/zinhao/kikoeru/MusicChangeListener;->onAudioChange(Lorg/json/JSONObject;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "listener"
        }
    .end annotation

    .line 279
    check-cast p1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService$2$3;->accept(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    return-void
.end method
