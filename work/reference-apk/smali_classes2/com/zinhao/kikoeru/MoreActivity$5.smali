.class Lcom/zinhao/kikoeru/MoreActivity$5;
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

    .line 75
    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity$5;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 78
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity$5;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$5;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    const-class v1, Lcom/zinhao/kikoeru/AboutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/MoreActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
