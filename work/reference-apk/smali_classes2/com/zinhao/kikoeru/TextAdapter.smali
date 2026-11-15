.class public Lcom/zinhao/kikoeru/TextAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "TextAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mText:Lcom/zinhao/kikoeru/Text;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/Text;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mText"
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/zinhao/kikoeru/TextAdapter;->mText:Lcom/zinhao/kikoeru/Text;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextAdapter;->mText:Lcom/zinhao/kikoeru/Text;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/Text;->getLrcRows()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
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

    .line 25
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextAdapter;->mText:Lcom/zinhao/kikoeru/Text;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/Text;->getLrcRows()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/zinhao/kikoeru/Text$TextRow;

    .line 26
    instance-of p2, p1, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;

    if-eqz p2, :cond_0

    .line 27
    check-cast p1, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;

    invoke-static {p1}, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;->access$000(Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;)Landroid/widget/TextView;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/Text$TextRow;->content:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
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

    .line 20
    new-instance p0, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_text_row:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;-><init>(Landroid/view/View;)V

    return-object p0
.end method
