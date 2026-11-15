.class Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "MissionAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/MissionAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SimpleViewHolder"
.end annotation


# instance fields
.field private ibPause:Landroid/widget/ImageButton;

.field private ivCover:Landroid/widget/ImageView;

.field private pbProgress:Landroid/widget/ProgressBar;

.field final synthetic this$0:Lcom/zinhao/kikoeru/MissionAdapter;

.field private tvProgress:Landroid/widget/TextView;

.field private tvTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/MissionAdapter;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "itemView"
        }
    .end annotation

    .line 113
    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    .line 114
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 115
    sget p1, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    .line 116
    sget p1, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 117
    sget p1, Lcom/zinhao/kikoeru/R$id;->progress:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->pbProgress:Landroid/widget/ProgressBar;

    .line 118
    sget p1, Lcom/zinhao/kikoeru/R$id;->imageView3:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->ibPause:Landroid/widget/ImageButton;

    .line 119
    sget p1, Lcom/zinhao/kikoeru/R$id;->textView9:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->tvProgress:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/TextView;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageView;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->pbProgress:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/TextView;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->tvProgress:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;)Landroid/widget/ImageButton;
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/zinhao/kikoeru/MissionAdapter$SimpleViewHolder;->ibPause:Landroid/widget/ImageButton;

    return-object p0
.end method
