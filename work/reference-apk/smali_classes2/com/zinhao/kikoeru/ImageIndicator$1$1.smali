.class Lcom/zinhao/kikoeru/ImageIndicator$1$1;
.super Ljava/lang/Object;
.source "ImageIndicator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImageIndicator$1;->bindData(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/ImageIndicator$1;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImageIndicator$1;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$position"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 50
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageIndicator$1$1;->this$1:Lcom/zinhao/kikoeru/ImageIndicator$1;

    iput p2, p0, Lcom/zinhao/kikoeru/ImageIndicator$1$1;->val$position:I

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
            "view"
        }
    .end annotation

    .line 53
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageIndicator$1$1;->this$1:Lcom/zinhao/kikoeru/ImageIndicator$1;

    iget-object p1, p1, Lcom/zinhao/kikoeru/ImageIndicator$1;->this$0:Lcom/zinhao/kikoeru/ImageIndicator;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageIndicator;->access$000(Lcom/zinhao/kikoeru/ImageIndicator;)Landroidx/viewpager/widget/ViewPager;

    move-result-object p1

    iget p0, p0, Lcom/zinhao/kikoeru/ImageIndicator$1$1;->val$position:I

    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    return-void
.end method
