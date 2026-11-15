.class public final Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;
.super Ljava/lang/Object;
.source "SearchActivity.kt"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/SearchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\u0007H\u0016J*\u0010\n\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0007H\u0016J\u0010\u0010\u000c\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\rH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "com/zinhao/kikoeru/SearchActivity$onCreate$2",
        "Landroid/text/TextWatcher;",
        "beforeTextChanged",
        "",
        "s",
        "",
        "start",
        "",
        "count",
        "after",
        "onTextChanged",
        "before",
        "afterTextChanged",
        "Landroid/text/Editable;",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/SearchActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/SearchActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2

    const-string v0, "s"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x6

    if-lt v0, v1, :cond_1

    .line 62
    iget-object v0, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "viewBinding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getSearchWorkCallback$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lcom/zinhao/kikoeru/Api;->doGetWork(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    :cond_1
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
