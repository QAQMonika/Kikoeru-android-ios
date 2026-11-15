.class Lcom/zinhao/kikoeru/ImageBrowserActivity$1$2;
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

    .line 73
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$2;->this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 76
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$2;->this$1:Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$002(Lcom/zinhao/kikoeru/ImageBrowserActivity;Z)Z

    return-void
.end method
