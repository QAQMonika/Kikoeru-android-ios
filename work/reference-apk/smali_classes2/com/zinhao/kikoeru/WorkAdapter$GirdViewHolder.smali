.class public final Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WorkAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/WorkAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GirdViewHolder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0010\u000e\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0019\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0019\u0010\u0013\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0012R!\u0010\u0015\u001a\u0012\u0012\u000e\u0012\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0017\u0018\u00010\u00160\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0012R\u0011\u0010\u0019\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\rR\u0011\u0010\u001b\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\rR\u0011\u0010\u001d\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\rR\u0011\u0010\u001f\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010\rR\u0011\u0010!\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010\r\u00a8\u0006#"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;",
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
        "Lorg/json/JSONArray;",
        "getTvArt",
        "()Lcom/zinhao/kikoeru/TagsView;",
        "tvTags",
        "getTvTags",
        "tvCircles",
        "",
        "",
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
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private final tvCircles:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private final tvTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const-string v0, "itemView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 217
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 230
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 231
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvTitle:Landroid/widget/TextView;

    .line 232
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvArt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    .line 233
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 234
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvRjNumber:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    .line 235
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvDate:Landroid/widget/TextView;

    .line 236
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvPrice:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvPrice:Landroid/widget/TextView;

    .line 237
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvSaleCount:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvSaleCount:Landroid/widget/TextView;

    .line 238
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvHost:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvHost:Landroid/widget/TextView;

    .line 239
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/TagsView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-void
.end method


# virtual methods
.method public final getIvCover()Landroid/widget/ImageView;
    .locals 0

    .line 218
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->ivCover:Landroid/widget/ImageView;

    return-object p0
.end method

.method public final getTvArt()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation

    .line 220
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvCircles()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 222
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvDate()Landroid/widget/TextView;
    .locals 0

    .line 224
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvDate:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvHost()Landroid/widget/TextView;
    .locals 0

    .line 227
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvHost:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvPrice()Landroid/widget/TextView;
    .locals 0

    .line 225
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvPrice:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvRjNumber()Landroid/widget/TextView;
    .locals 0

    .line 223
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvSaleCount()Landroid/widget/TextView;
    .locals 0

    .line 226
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvSaleCount:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvTags()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation

    .line 221
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvTitle()Landroid/widget/TextView;
    .locals 0

    .line 219
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->tvTitle:Landroid/widget/TextView;

    return-object p0
.end method
