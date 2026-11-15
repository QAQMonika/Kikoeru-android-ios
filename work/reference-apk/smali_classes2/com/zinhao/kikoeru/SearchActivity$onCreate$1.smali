.class public final Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;
.super Ljava/lang/Object;
.source "SearchActivity.kt"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/SearchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSearchActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SearchActivity.kt\ncom/zinhao/kikoeru/SearchActivity$onCreate$1\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,182:1\n106#2:183\n78#2,22:184\n*S KotlinDebug\n*F\n+ 1 SearchActivity.kt\ncom/zinhao/kikoeru/SearchActivity$onCreate$1\n*L\n47#1:183\n47#1:184,22\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\"\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/zinhao/kikoeru/SearchActivity$onCreate$1",
        "Landroid/widget/TextView$OnEditorActionListener;",
        "onEditorAction",
        "",
        "v",
        "Landroid/widget/TextView;",
        "actionId",
        "",
        "event",
        "Landroid/view/KeyEvent;",
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

    iput-object p1, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 5

    const-string p3, "v"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p3, 0x3

    const/4 v0, 0x0

    if-ne p2, p3, :cond_7

    .line 46
    iget-object p2, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/SearchActivity;->access$getViewBinding$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;

    move-result-object p2

    if-nez p2, :cond_0

    const-string p2, "viewBinding"

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p2, 0x0

    :cond_0
    iget-object p2, p2, Lcom/zinhao/kikoeru/databinding/ActivitySearchBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 47
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 183
    check-cast p1, Ljava/lang/CharSequence;

    .line 185
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p2

    sub-int/2addr p2, p3

    move v1, v0

    move v2, v1

    :goto_0
    if-gt v1, p2, :cond_6

    if-nez v2, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, p2

    .line 190
    :goto_1
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    .line 47
    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    if-gtz v3, :cond_2

    move v3, p3

    goto :goto_2

    :cond_2
    move v3, v0

    :goto_2
    if-nez v2, :cond_4

    if-nez v3, :cond_3

    move v2, p3

    goto :goto_0

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    if-nez v3, :cond_5

    goto :goto_3

    :cond_5
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_6
    :goto_3
    add-int/2addr p2, p3

    .line 205
    invoke-interface {p1, v1, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    .line 183
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 47
    iget-object p0, p0, Lcom/zinhao/kikoeru/SearchActivity$onCreate$1;->this$0:Lcom/zinhao/kikoeru/SearchActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/SearchActivity;->access$getSearchWorkCallback$p(Lcom/zinhao/kikoeru/SearchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    move-result-object p0

    invoke-static {p1, p3, p0}, Lcom/zinhao/kikoeru/Api;->doGetWork(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return p3

    :cond_7
    return v0
.end method
