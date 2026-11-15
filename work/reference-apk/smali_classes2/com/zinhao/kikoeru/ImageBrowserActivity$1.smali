.class Lcom/zinhao/kikoeru/ImageBrowserActivity$1;
.super Ljava/lang/Object;
.source "ImageBrowserActivity.java"

# interfaces
.implements Lcom/zinhao/kikoeru/ImagePagerAdapter$HideLayoutCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImageBrowserActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImageBrowserActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 56
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hideLayout(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 59
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$000(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/ImageIndicator;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    .line 60
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1, v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$002(Lcom/zinhao/kikoeru/ImageBrowserActivity;Z)Z

    .line 61
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    iget-object v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$200(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/ImageIndicator;->startAnimation(Landroid/view/animation/Animation;)V

    .line 62
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    new-instance v0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$1;-><init>(Lcom/zinhao/kikoeru/ImageBrowserActivity$1;)V

    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    .line 68
    invoke-static {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$200(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v1

    .line 62
    invoke-virtual {p1, v0, v1, v2}, Lcom/zinhao/kikoeru/ImageIndicator;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 69
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$000(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/ImageIndicator;->getVisibility()I

    move-result p1

    const/16 v1, 0x8

    if-ne p1, v1, :cond_1

    .line 70
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1, v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$002(Lcom/zinhao/kikoeru/ImageBrowserActivity;Z)Z

    .line 71
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/ImageIndicator;->setVisibility(I)V

    .line 72
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    iget-object v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$300(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/ImageIndicator;->startAnimation(Landroid/view/animation/Animation;)V

    .line 73
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;

    move-result-object p1

    new-instance v0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$2;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity$1$2;-><init>(Lcom/zinhao/kikoeru/ImageBrowserActivity$1;)V

    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;->this$0:Lcom/zinhao/kikoeru/ImageBrowserActivity;

    .line 78
    invoke-static {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->access$300(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v1

    .line 73
    invoke-virtual {p1, v0, v1, v2}, Lcom/zinhao/kikoeru/ImageIndicator;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method
