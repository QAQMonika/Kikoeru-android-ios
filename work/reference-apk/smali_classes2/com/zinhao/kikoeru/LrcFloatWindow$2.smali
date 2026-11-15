.class Lcom/zinhao/kikoeru/LrcFloatWindow$2;
.super Ljava/lang/Object;
.source "LrcFloatWindow.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LrcFloatWindow;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LrcFloatWindow;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow$2;->this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dialog",
            "which"
        }
    .end annotation

    .line 33
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 34
    iget-object p0, p0, Lcom/zinhao/kikoeru/LrcFloatWindow$2;->this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->finish()V

    return-void
.end method
