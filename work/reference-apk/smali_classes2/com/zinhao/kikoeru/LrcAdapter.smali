.class public Lcom/zinhao/kikoeru/LrcAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "LrcAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final ALPHA_COUNT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "LrcAdapter"


# instance fields
.field private mLrc:Lcom/zinhao/kikoeru/Lrc;

.field private oldIndex:I

.field private onToHereClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/Lrc;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mText"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, -0x1

    .line 15
    iput v0, p0, Lcom/zinhao/kikoeru/LrcAdapter;->oldIndex:I

    .line 20
    iput-object p1, p0, Lcom/zinhao/kikoeru/LrcAdapter;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    return-void
.end method

.method private notifyRange(I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    add-int/lit8 p1, p1, -0x3

    const/4 v0, 0x0

    .line 41
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 42
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, p1

    const/4 v1, 0x5

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 44
    invoke-virtual {p0, p1, v0}, Lcom/zinhao/kikoeru/LrcAdapter;->notifyItemRangeChanged(II)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/zinhao/kikoeru/LrcAdapter;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/Lrc;->getLrcRows()Ljava/util/List;

    move-result-object p0

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

    .line 49
    iget-object v0, p0, Lcom/zinhao/kikoeru/LrcAdapter;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Lrc;->getLrcRows()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 50
    instance-of v1, p1, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;

    if-eqz v1, :cond_1

    .line 51
    check-cast p1, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;

    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/zinhao/kikoeru/LrcAdapter;->onToHereClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->access$000(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->access$100(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->access$000(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->content:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    iget v1, p0, Lcom/zinhao/kikoeru/LrcAdapter;->oldIndex:I

    if-ne v1, p2, :cond_0

    const/4 v2, 0x1

    goto :style_row

    :cond_0
    const/4 v2, 0x0

    :style_row
    invoke-static {p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->access$000(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/TextView;

    move-result-object v0

    invoke-static {p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->access$100(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/zinhao/kikoeru/LrcVisuals;->bind(Landroid/widget/TextView;Landroid/widget/ImageView;Z)V

    :cond_1
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2
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

    .line 26
    new-instance p0, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_lrc_row:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;-><init>(Landroid/view/View;)V

    return-object p0
.end method

.method public setOnToHereClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "onToHereClickListener"
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/zinhao/kikoeru/LrcAdapter;->onToHereClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public update()V
    .locals 3

    .line 32
    iget-object v0, p0, Lcom/zinhao/kikoeru/LrcAdapter;->mLrc:Lcom/zinhao/kikoeru/Lrc;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/Lrc;->getCurrentIndex()I

    move-result v0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcAdapter;->getItemCount()I

    move-result v2

    invoke-static {v0, v2}, Lcom/zinhao/kikoeru/LrcSelection;->index(II)I

    move-result v0

    iget v1, p0, Lcom/zinhao/kikoeru/LrcAdapter;->oldIndex:I

    iput v0, p0, Lcom/zinhao/kikoeru/LrcAdapter;->oldIndex:I

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/LrcSelection;->refresh(Landroidx/recyclerview/widget/RecyclerView$Adapter;II)V

    return-void
.end method
