.class Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "TextAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/TextAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TextRowHolder"
.end annotation


# instance fields
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

    .line 40
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 41
    sget v0, Lcom/zinhao/kikoeru/R$id;->textView3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;->textView:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;)Landroid/widget/TextView;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextAdapter$TextRowHolder;->textView:Landroid/widget/TextView;

    return-object p0
.end method
