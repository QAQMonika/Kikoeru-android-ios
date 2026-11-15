.class public final Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WorksAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GirdViewHolder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u001d\u0010\u000e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00110\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u001d\u0010\u0014\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0013R\u001d\u0010\u0017\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00180\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u0013R\u0011\u0010\u001a\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\rR\u0011\u0010\u001c\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\rR\u0011\u0010\u001e\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010\rR\u0011\u0010 \u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\rR\u0011\u0010\"\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\r\u00a8\u0006$"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "itemView",
        "Landroid/view/View;",
        "<init>",
        "(Landroid/view/View;)V",
        "ivCover",
        "Landroid/widget/ImageView;",
        "getIvCover",
        "()Landroid/widget/ImageView;",
        "tvTitle",
        "Landroid/widget/TextView;",
        "getTvTitle",
        "()Landroid/widget/TextView;",
        "tvArt",
        "Lcom/zinhao/kikoeru/TagsView;",
        "",
        "Lcom/zinhao/kikoeru/model/Va;",
        "getTvArt",
        "()Lcom/zinhao/kikoeru/TagsView;",
        "tvTags",
        "Lcom/zinhao/kikoeru/model/Tag;",
        "getTvTags",
        "tvCircles",
        "Lcom/zinhao/kikoeru/model/Circle;",
        "getTvCircles",
        "tvRjNumber",
        "getTvRjNumber",
        "tvDate",
        "getTvDate",
        "tvPrice",
        "getTvPrice",
        "tvSaleCount",
        "getTvSaleCount",
        "tvHost",
        "getTvHost",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final ivCover:Landroid/widget/ImageView;

.field private final tvArt:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Va;",
            ">;>;"
        }
    .end annotation
.end field

.field private final tvCircles:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Circle;",
            ">;>;"
        }
    .end annotation
.end field

.field private final tvDate:Landroid/widget/TextView;

.field private final tvHost:Landroid/widget/TextView;

.field private final tvPrice:Landroid/widget/TextView;

.field private final tvRjNumber:Landroid/widget/TextView;

.field private final tvSaleCount:Landroid/widget/TextView;

.field private final tvTags:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Tag;",
            ">;>;"
        }
    .end annotation
.end field

.field private final tvTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const-string v0, "itemView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 107
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 120
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 121
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvTitle:Landroid/widget/TextView;

    .line 122
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvArt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    .line 123
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 124
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvRjNumber:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    .line 125
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvDate:Landroid/widget/TextView;

    .line 126
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvPrice:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvPrice:Landroid/widget/TextView;

    .line 127
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvSaleCount:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvSaleCount:Landroid/widget/TextView;

    .line 128
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvHost:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvHost:Landroid/widget/TextView;

    .line 129
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/TagsView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-void
.end method


# virtual methods
.method public final getIvCover()Landroid/widget/ImageView;
    .locals 0

    .line 108
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->ivCover:Landroid/widget/ImageView;

    return-object p0
.end method

.method public final getTvArt()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Va;",
            ">;>;"
        }
    .end annotation

    .line 110
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvCircles()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Circle;",
            ">;>;"
        }
    .end annotation

    .line 112
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvDate()Landroid/widget/TextView;
    .locals 0

    .line 114
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvDate:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvHost()Landroid/widget/TextView;
    .locals 0

    .line 117
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvHost:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvPrice()Landroid/widget/TextView;
    .locals 0

    .line 115
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvPrice:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvRjNumber()Landroid/widget/TextView;
    .locals 0

    .line 113
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvSaleCount()Landroid/widget/TextView;
    .locals 0

    .line 116
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvSaleCount:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvTags()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Tag;",
            ">;>;"
        }
    .end annotation

    .line 111
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvTitle()Landroid/widget/TextView;
    .locals 0

    .line 109
    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->tvTitle:Landroid/widget/TextView;

    return-object p0
.end method
