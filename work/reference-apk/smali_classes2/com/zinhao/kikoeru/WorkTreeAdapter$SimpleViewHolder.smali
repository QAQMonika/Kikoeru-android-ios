.class public Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WorkTreeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/WorkTreeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleViewHolder"
.end annotation


# instance fields
.field private ivCover:Landroid/widget/ImageView;

.field private pb1:Landroid/widget/ProgressBar;

.field private tvCount:Landroid/widget/TextView;

.field private tvTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "itemView"
        }
    .end annotation

    .line 246
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 247
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 248
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    .line 249
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCount:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->tvCount:Landroid/widget/TextView;

    .line 250
    sget v0, Lcom/zinhao/kikoeru/R$id;->pb1:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->pb1:Landroid/widget/ProgressBar;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;
    .locals 0

    .line 238
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->pb1:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;
    .locals 0

    .line 238
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->tvCount:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;
    .locals 0

    .line 238
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;
    .locals 0

    .line 238
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

    return-object p0
.end method
