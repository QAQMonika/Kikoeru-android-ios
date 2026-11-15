.class final Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "UserSwitchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UserViewHolder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\n\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\tR\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000f\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "itemView",
        "Landroid/view/View;",
        "<init>",
        "(Landroid/view/View;)V",
        "tvName",
        "Landroid/widget/TextView;",
        "getTvName",
        "()Landroid/widget/TextView;",
        "tvServer",
        "getTvServer",
        "ibDelete",
        "Landroid/widget/ImageButton;",
        "getIbDelete",
        "()Landroid/widget/ImageButton;",
        "ibRefresh",
        "getIbRefresh",
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
.field private final ibDelete:Landroid/widget/ImageButton;

.field private final ibRefresh:Landroid/widget/ImageButton;

.field private final tvName:Landroid/widget/TextView;

.field private final tvServer:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const-string v0, "itemView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 184
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvName:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->tvName:Landroid/widget/TextView;

    .line 185
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvServer:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->tvServer:Landroid/widget/TextView;

    .line 186
    sget v0, Lcom/zinhao/kikoeru/R$id;->imageButton3:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->ibDelete:Landroid/widget/ImageButton;

    .line 187
    sget v0, Lcom/zinhao/kikoeru/R$id;->imageButton4:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->ibRefresh:Landroid/widget/ImageButton;

    return-void
.end method


# virtual methods
.method public final getIbDelete()Landroid/widget/ImageButton;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->ibDelete:Landroid/widget/ImageButton;

    return-object p0
.end method

.method public final getIbRefresh()Landroid/widget/ImageButton;
    .locals 0

    .line 181
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->ibRefresh:Landroid/widget/ImageButton;

    return-object p0
.end method

.method public final getTvName()Landroid/widget/TextView;
    .locals 0

    .line 178
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->tvName:Landroid/widget/TextView;

    return-object p0
.end method

.method public final getTvServer()Landroid/widget/TextView;
    .locals 0

    .line 179
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->tvServer:Landroid/widget/TextView;

    return-object p0
.end method
