.class Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;
.super Ljava/lang/Object;
.source "AudioService.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setCurrentAlbumId(J)V
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
.field final synthetic this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field final synthetic val$currentAlbumId:J


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService$CtrlBinder;J)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$currentAlbumId"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 775
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;->this$1:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-wide p2, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;->val$currentAlbumId:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/zinhao/kikoeru/MusicChangeListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 778
    iget-wide v0, p0, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;->val$currentAlbumId:J

    invoke-interface {p1, v0, v1}, Lcom/zinhao/kikoeru/MusicChangeListener;->onAlbumChange(J)V

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

    .line 775
    check-cast p1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder$7;->accept(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    return-void
.end method
