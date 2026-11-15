.class Lcom/zinhao/kikoeru/MissionAdapter$1;
.super Ljava/lang/Object;
.source "MissionAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MissionAdapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/MissionAdapter;

.field final synthetic val$holder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

.field final synthetic val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$item",
            "val$holder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 50
    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    iput-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    iput-object p3, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$holder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 53
    iget-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isDownloading()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 54
    iget-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->stop()V

    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result p1

    if-nez p1, :cond_1

    .line 56
    iget-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->start()V

    .line 58
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$1;->val$holder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/MissionAdapter;->notifyItemChanged(I)V

    return-void
.end method
