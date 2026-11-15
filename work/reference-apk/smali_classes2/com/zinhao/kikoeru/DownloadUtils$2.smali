.class Lcom/zinhao/kikoeru/DownloadUtils$2;
.super Ljava/lang/Object;
.source "DownloadUtils.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/DownloadUtils;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lcom/zinhao/kikoeru/DownloadUtils$Mission;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/DownloadUtils;

.field final synthetic val$jsonArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/DownloadUtils;Lorg/json/JSONArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$jsonArray"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 409
    iput-object p1, p0, Lcom/zinhao/kikoeru/DownloadUtils$2;->this$0:Lcom/zinhao/kikoeru/DownloadUtils;

    iput-object p2, p0, Lcom/zinhao/kikoeru/DownloadUtils$2;->val$jsonArray:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "downLoadMission"
        }
    .end annotation

    .line 412
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->stop()V

    .line 413
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 414
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils$2;->val$jsonArray:Lorg/json/JSONArray;

    invoke-static {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->access$1000(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "downLoadMission"
        }
    .end annotation

    .line 409
    check-cast p1, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/DownloadUtils$2;->accept(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    return-void
.end method
