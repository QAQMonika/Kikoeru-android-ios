.class Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "LrcAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/LrcAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TextRowHolder"
.end annotation


# instance fields
.field private ivToHere:Landroid/widget/ImageView;

.field private textView:Landroid/widget/TextView;


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

    .line 81
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 82
    sget v0, Lcom/zinhao/kikoeru/R$id;->textView3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->textView:Landroid/widget/TextView;

    .line 83
    sget v0, Lcom/zinhao/kikoeru/R$id;->toHere:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->ivToHere:Landroid/widget/ImageView;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/TextView;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->textView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;)Landroid/widget/ImageView;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/zinhao/kikoeru/LrcAdapter$TextRowHolder;->ivToHere:Landroid/widget/ImageView;

    return-object p0
.end method
