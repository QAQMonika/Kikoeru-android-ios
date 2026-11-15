.class Lcom/zinhao/kikoeru/MoreActivity$2;
.super Ljava/lang/Object;
.source "MoreActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 44
    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity$2;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 47
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$2;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/MoreActivity;->access$100(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CheckBox;->toggle()V

    return-void
.end method
