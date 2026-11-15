.class public final Lcom/zinhao/kikoeru/VasActivity$onCreate$3;
.super Ljava/lang/Object;
.source "VasActivity.kt"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/VasActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nVasActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 VasActivity.kt\ncom/zinhao/kikoeru/VasActivity$onCreate$3\n+ 2 Strings.kt\nkotlin/text/StringsKt__StringsKt\n*L\n1#1,160:1\n106#2:161\n78#2,22:162\n*S KotlinDebug\n*F\n+ 1 VasActivity.kt\ncom/zinhao/kikoeru/VasActivity$onCreate$3\n*L\n56#1:161\n56#1:162,22\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J*\u0010\u0006\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\tH\u0016J*\u0010\u000c\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "com/zinhao/kikoeru/VasActivity$onCreate$3",
        "Landroid/text/TextWatcher;",
        "afterTextChanged",
        "",
        "s",
        "Landroid/text/Editable;",
        "beforeTextChanged",
        "",
        "start",
        "",
        "count",
        "after",
        "onTextChanged",
        "before",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/VasActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/VasActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/VasActivity$onCreate$3;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 9

    const-string v0, "s"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/zinhao/kikoeru/VasActivity$onCreate$3;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/VasActivity;->access$getVasView$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "vasView"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/VasActivity$onCreate$3;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 161
    check-cast p1, Ljava/lang/CharSequence;

    .line 163
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_0
    if-gt v5, v2, :cond_6

    if-nez v6, :cond_1

    move v7, v5

    goto :goto_1

    :cond_1
    move v7, v2

    .line 168
    :goto_1
    invoke-interface {p1, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    const/16 v8, 0x20

    .line 56
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v7

    if-gtz v7, :cond_2

    move v7, v3

    goto :goto_2

    :cond_2
    move v7, v4

    :goto_2
    if-nez v6, :cond_4

    if-nez v7, :cond_3

    move v6, v3

    goto :goto_0

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    if-nez v7, :cond_5

    goto :goto_3

    :cond_5
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_6
    :goto_3
    add-int/2addr v2, v3

    .line 183
    invoke-interface {p1, v5, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    .line 161
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-static {v1, p1}, Lcom/zinhao/kikoeru/VasActivity;->access$filterTag(Lcom/zinhao/kikoeru/VasActivity;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/VasActivity$onCreate$3;->this$0:Lcom/zinhao/kikoeru/VasActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/VasActivity;->access$getTextGet$p(Lcom/zinhao/kikoeru/VasActivity;)Lcom/zinhao/kikoeru/TagsView$TextGet;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

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
