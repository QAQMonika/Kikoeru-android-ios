.class Lcom/zinhao/kikoeru/MoreActivity$1;
.super Ljava/lang/Object;
.source "MoreActivity.java"

# interfaces
.implements Lcom/zinhao/kikoeru/BaseActivity$InsetReady;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MoreActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/MoreActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MoreActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity$1;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInsetReady(Landroidx/core/graphics/Insets;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "insets"
        }
    .end annotation

    .line 40
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$1;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/MoreActivity;->access$000(Lcom/zinhao/kikoeru/MoreActivity;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    move-result-object p0

    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->content:Landroid/widget/LinearLayout;

    iget v0, p1, Landroidx/core/graphics/Insets;->left:I

    iget v1, p1, Landroidx/core/graphics/Insets;->right:I

    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-void
.end method
