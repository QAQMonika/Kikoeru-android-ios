.class public final Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;
.super Ljava/lang/Object;
.source "TagsActivity.kt"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/TagsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTagsActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TagsActivity.kt\ncom/zinhao/kikoeru/TagsActivity$onCreate$2\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,151:1\n106#2:152\n78#2,22:153\n*S KotlinDebug\n*F\n+ 1 TagsActivity.kt\ncom/zinhao/kikoeru/TagsActivity$onCreate$2\n*L\n48#1:152\n48#1:153,22\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\"\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/zinhao/kikoeru/TagsActivity$onCreate$2",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/TagsActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/TagsActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 7

    const-string p3, "v"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p3, 0x3

    const/4 v0, 0x0

    if-ne p2, p3, :cond_7

    .line 48
    iget-object p2, p0, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/TagsActivity;->access$getTagsView$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object p2

    if-nez p2, :cond_0

    const-string p2, "tagsView"

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p2, 0x0

    :cond_0
    iget-object p3, p0, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 152
    check-cast p1, Ljava/lang/CharSequence;

    .line 154
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    move v3, v0

    move v4, v3

    :goto_0
    if-gt v3, v1, :cond_6

    if-nez v4, :cond_1

    move v5, v3

    goto :goto_1

    :cond_1
    move v5, v1

    .line 159
    :goto_1
    invoke-interface {p1, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    const/16 v6, 0x20

    .line 48
    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v5

    if-gtz v5, :cond_2

    move v5, v2

    goto :goto_2

    :cond_2
    move v5, v0

    :goto_2
    if-nez v4, :cond_4

    if-nez v5, :cond_3

    move v4, v2

    goto :goto_0

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    if-nez v5, :cond_5

    goto :goto_3

    :cond_5
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_6
    :goto_3
    add-int/2addr v1, v2

    .line 174
    invoke-interface {p1, v3, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    .line 152
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 48
    invoke-static {p3, p1}, Lcom/zinhao/kikoeru/TagsActivity;->access$filterTag(Lcom/zinhao/kikoeru/TagsActivity;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/TagsActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/TagsActivity;->access$getTextGet$p(Lcom/zinhao/kikoeru/TagsActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;

    move-result-object p0

    invoke-virtual {p2, p1, p0}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    return v2

    :cond_7
    return v0
.end method
