.class final Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "UserSwitchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "UserAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0082\u0004\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0018\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u001a\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u00022\u0008\u0008\u0001\u0010\r\u001a\u00020\tH\u0016J\u0008\u0010\u000e\u001a\u00020\tH\u0016\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "<init>",
        "(Lcom/zinhao/kikoeru/UserSwitchActivity;)V",
        "onCreateViewHolder",
        "parent",
        "Landroid/view/ViewGroup;",
        "viewType",
        "",
        "onBindViewHolder",
        "",
        "holder",
        "position",
        "getItemCount",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 124
    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 173
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getUsers$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getUsers$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/db/User;

    .line 133
    instance-of v1, p1, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;

    if-eqz v1, :cond_1

    .line 134
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$1;

    iget-object v3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {v2, v3, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$1;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V

    check-cast v2, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    sget-object v1, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 140
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->getTvName()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(\u5f53\u524d)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 142
    :cond_0
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->getTvName()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    :goto_0
    check-cast p1, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->getTvServer()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->getIbDelete()Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;

    iget-object v3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {v2, p0, p2, v3, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;ILcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V

    check-cast v2, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;->getIbRefresh()Landroid/widget/ImageButton;

    move-result-object p1

    new-instance p2, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;

    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {p2, p0, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;-><init>(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V

    check-cast p2, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    const-string p0, "parent"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    new-instance p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;

    .line 127
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_server_and_user:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const-string p2, "inflate(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserViewHolder;-><init>(Landroid/view/View;)V

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p0
.end method
