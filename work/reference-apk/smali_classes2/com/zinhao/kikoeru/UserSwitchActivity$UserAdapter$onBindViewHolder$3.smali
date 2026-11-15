.class public final Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;
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
        "com/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3",
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
.field final synthetic $user:Lcom/zinhao/kikoeru/db/User;

.field final synthetic this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->$user:Lcom/zinhao/kikoeru/db/User;

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 165
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-static {p1, v0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$setRefreshUser$p(Lcom/zinhao/kikoeru/UserSwitchActivity;Lcom/zinhao/kikoeru/db/User;)V

    .line 166
    iget-object p1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/db/User;->getName()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getPassword()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->$user:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lcom/zinhao/kikoeru/UserSwitchActivity$UserAdapter$onBindViewHolder$3;->this$0:Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/UserSwitchActivity;->access$getRefreshTokenCallback$p(Lcom/zinhao/kikoeru/UserSwitchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    move-result-object p0

    invoke-static {p1, v0, v1, p0}, Lcom/zinhao/kikoeru/Api;->doGetToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method
