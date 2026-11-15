.class public final Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WorkAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/WorkAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SmallGirdViewHolder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\rR\u0011\u0010\u0010\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\r\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "itemView",
        "Landroid/view/View;",
        "<init>",
        "(Landroid/view/View;)V",
        "ivCover",
        "Landroid/widget/ImageView;",
        "getIvCover",
        "()Landroid/widget/ImageView;",
        "tvRjNumber",
        "Landroid/widget/TextView;",
        "getTvRjNumber",
        "()Landroid/widget/TextView;",
        "tvDate",
        "getTvDate",
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

.field private final tvDate:Landroid/widget/TextView;

.field private final tvHost:Landroid/widget/TextView;

.field private final tvRjNumber:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const-string v0, "itemView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 243
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 250
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->ivCover:Landroid/widget/ImageView;

    .line 251
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvRjNumber:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    .line 252
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvDate:Landroid/widget/TextView;

    .line 253
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvHost:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvHost:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final getIvCover()Landroid/widget/ImageView;
    .locals 0

    .line 244
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->ivCover:Landroid/widget/ImageView;

    return-object p0
.end method

.method public final getTvDate()Landroid/widget/TextView;
    .locals 0

    .line 246
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvDate:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvHost()Landroid/widget/TextView;
    .locals 0

    .line 247
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvHost:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvRjNumber()Landroid/widget/TextView;
    .locals 0

    .line 245
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->tvRjNumber:Landroid/widget/TextView;

    return-object p0
.end method
