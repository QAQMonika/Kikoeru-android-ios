.class public final Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WorkAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/WorkAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SimpleViewHolder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0019\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0019\u0010\u0013\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0012R!\u0010\u0015\u001a\u0012\u0012\u000e\u0012\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0017\u0018\u00010\u00160\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0012\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;",
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
        "tvComArt",
        "Lcom/zinhao/kikoeru/TagsView;",
        "Lorg/json/JSONArray;",
        "getTvComArt",
        "()Lcom/zinhao/kikoeru/TagsView;",
        "tvTags",
        "getTvTags",
        "tvCircles",
        "",
        "",
        "getTvCircles",
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

.field private final tvComArt:Lcom/zinhao/kikoeru/TagsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

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

    .line 200
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 209
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 210
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    .line 211
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvComArt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvComArt:Lcom/zinhao/kikoeru/TagsView;

    .line 212
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 213
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/TagsView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-void
.end method


# virtual methods
.method public final getIvCover()Landroid/widget/ImageView;
    .locals 0

    .line 201
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->ivCover:Landroid/widget/ImageView;

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

    .line 205
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvComArt()Lcom/zinhao/kikoeru/TagsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/zinhao/kikoeru/TagsView<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation

    .line 203
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvComArt:Lcom/zinhao/kikoeru/TagsView;

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

    .line 204
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    return-object p0
.end method

.method public final getTvTitle()Landroid/widget/TextView;
    .locals 0

    .line 202
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->tvTitle:Landroid/widget/TextView;

    return-object p0
.end method
