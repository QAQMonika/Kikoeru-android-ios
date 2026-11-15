.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;
.super Ljava/lang/Object;
.source "UserSwitchActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2",
        "Landroid/view/View$OnClickListener;",
        "onClick",
        "",
        "v",
        "Landroid/view/View;",
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
.field final synthetic $position:I

.field final synthetic $user:Lcom/zinhao/kikoeru/db/User;

.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

.field final synthetic this$1:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;ILcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    iput p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$position:I

    iput-object p3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$1:Lcom/zinhao/kikoeru/UserSwitchActivity;

    iput-object p4, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$user:Lcom/zinhao/kikoeru/db/User;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 148
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    iget v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$position:I

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->notifyItemRemoved(I)V

    .line 149
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$1:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/UserSwitchActivity;->getApplication()Landroid/app/Application;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type com.zinhao.kikoeru.App"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lcom/zinhao/kikoeru/App;

    .line 150
    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/App;->deleteUser(Lcom/zinhao/kikoeru/db/User;)V

    .line 151
    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;

    iget v1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$position:I

    iget-object v2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$1:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {v2}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getUsers$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$position:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter;->notifyItemRangeChanged(II)V

    .line 152
    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->getCurrentUserId()J

    move-result-wide v1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-nez v0, :cond_3

    .line 153
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 154
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->getAllUsers()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/zinhao/kikoeru/db/User;

    .line 155
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/db/User;->getId()Ljava/lang/Long;

    move-result-object v0

    const-string v1, "getId(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/zinhao/kikoeru/App;->setCurrentUserId(J)V

    .line 156
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/db/User;->getToken()Ljava/lang/String;

    move-result-object p1

    const-string v0, "getToken(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string v0, "getHost(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, p0}, Lcom/zinhao/kikoeru/Api;->init(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 158
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$2;->this$1:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getBinding$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;

    move-result-object p0

    if-nez p0, :cond_2

    const-string p0, "binding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityUserSwitchBinding;->button5:Landroid/widget/Button;

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_3
    :goto_0
    return-void
.end method
