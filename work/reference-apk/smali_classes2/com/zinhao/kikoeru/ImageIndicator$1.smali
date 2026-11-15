.class Lcom/zinhao/kikoeru/ImageIndicator$1;
.super Lcom/zinhao/kikoeru/SuperRecyclerAdapter;
.source "ImageIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImageIndicator;->bindPreViewImage(Ljava/util/List;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/zinhao/kikoeru/SuperRecyclerAdapter<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/ImageIndicator;

.field final synthetic val$selectedPosition:I


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImageIndicator;Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "data",
            "val$selectedPosition"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageIndicator$1;->this$0:Lcom/zinhao/kikoeru/ImageIndicator;

    iput p3, p0, Lcom/zinhao/kikoeru/ImageIndicator$1;->val$selectedPosition:I

    invoke-direct {p0, p2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;-><init>(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public bindData(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V
    .locals 2
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
    iget-object v0, p0, Lcom/zinhao/kikoeru/ImageIndicator$1;->data:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget v1, Lcom/zinhao/kikoeru/R$id;->preview:I

    invoke-virtual {p1, v0, v1}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->setImage(Ljava/lang/String;I)V

    .line 50
    iget-object v0, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/zinhao/kikoeru/ImageIndicator$1$1;

    invoke-direct {v1, p0, p2}, Lcom/zinhao/kikoeru/ImageIndicator$1$1;-><init>(Lcom/zinhao/kikoeru/ImageIndicator$1;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget v0, p0, Lcom/zinhao/kikoeru/ImageIndicator$1;->val$selectedPosition:I

    if-eq v0, p2, :cond_0

    .line 57
    iget-object p0, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    invoke-static {}, Lcom/zinhao/kikoeru/ImageIndicator;->access$100()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    .line 59
    :cond_0
    iget-object p1, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageIndicator$1;->this$0:Lcom/zinhao/kikoeru/ImageIndicator;

    invoke-static {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->access$200(Lcom/zinhao/kikoeru/ImageIndicator;)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public setLayout(I)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "viewType"
        }
    .end annotation

    .line 64
    sget p0, Lcom/zinhao/kikoeru/R$layout;->item_image_indicator:I

    return p0
.end method
