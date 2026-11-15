.class public Lcom/zinhao/kikoeru/MissionAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "MissionAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;",
        "Landroid/view/View$OnLongClickListener;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 68
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object p0

    iget-object p0, p0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 29
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v0

    iget-object v0, v0, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    .line 30
    instance-of v0, p1, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;

    if-eqz v0, :cond_3

    .line 31
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;

    .line 32
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$000(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$100(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getTypeCover()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 34
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$200(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;

    move-result-object v1

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 35
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$200(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getProgress()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 36
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getMissionException()Ljava/lang/Exception;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 37
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getMissionException()Ljava/lang/Exception;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 39
    :cond_0
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getFormatProgressText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    :goto_0
    iget-object v1, v0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 43
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isCompleted()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 44
    iget-object p1, v0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 45
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;

    move-result-object p0

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 46
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 48
    :cond_1
    iget-object v1, v0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 49
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 50
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/zinhao/kikoeru/MissionAdapter$1;

    invoke-direct {v2, p0, p2, p1}, Lcom/zinhao/kikoeru/MissionAdapter$1;-><init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    :goto_1
    invoke-static {v0}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;

    move-result-object p0

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isDownloading()Z

    move-result p1

    if-eqz p1, :cond_2

    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_pause_black_24:I

    goto :goto_2

    :cond_2
    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_play_arrow_black_24:I

    :goto_2
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    :cond_3
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    .line 24
    new-instance p2, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/zinhao/kikoeru/R$layout;->item_mission_progress:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;-><init>(Lcom/zinhao/kikoeru/MissionAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 73
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    .line 74
    new-instance v1, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 75
    const-string v2, "\u64cd\u4f5c"

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 76
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getFormatProgressText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 77
    new-instance v2, Lcom/zinhao/kikoeru/MissionAdapter$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/zinhao/kikoeru/MissionAdapter$2;-><init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroid/view/View;)V

    const-string p1, "\u6253\u5f00\u4f5c\u54c1\u9875"

    invoke-virtual {v1, p1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 91
    new-instance p1, Lcom/zinhao/kikoeru/MissionAdapter$3;

    invoke-direct {p1, p0, v0}, Lcom/zinhao/kikoeru/MissionAdapter$3;-><init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    const-string p0, "\u79fb\u9664"

    invoke-virtual {v1, p0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 102
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    const/4 p0, 0x1

    return p0
.end method
