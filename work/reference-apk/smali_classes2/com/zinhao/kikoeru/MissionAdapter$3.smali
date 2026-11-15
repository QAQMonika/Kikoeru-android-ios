.class Lcom/zinhao/kikoeru/MissionAdapter$3;
.super Ljava/lang/Object;
.source "MissionAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MissionAdapter;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/MissionAdapter;

.field final synthetic val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$item"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 91
    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$3;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    iput-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$3;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dialog",
            "which"
        }
    .end annotation

    .line 94
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object p2

    iget-object v0, p0, Lcom/zinhao/kikoeru/MissionAdapter$3;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p2, v0}, Lcom/zinhao/kikoeru/DownloadUtils;->removeMission(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/zinhao/kikoeru/MissionAdapter$3;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-virtual {v0, p2}, Lcom/zinhao/kikoeru/MissionAdapter;->notifyItemRemoved(I)V

    .line 97
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$3;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/MissionAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, p2

    invoke-virtual {p0, p2, v0}, Lcom/zinhao/kikoeru/MissionAdapter;->notifyItemRangeChanged(II)V

    .line 99
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
