.class Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;
.super Ljava/lang/Object;
.source "ImageBrowserActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->hideLayout(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImageBrowserActivity$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 62
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;->this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;->this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/ImageIndicator;->setVisibility(I)V

    .line 66
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;->this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$002(Lcom/zinhao/kikoeru/ImageBrowserActivity;Z)Z

    return-void
.end method
