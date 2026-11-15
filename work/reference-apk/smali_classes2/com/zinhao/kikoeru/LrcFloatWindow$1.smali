.class Lcom/zinhao/kikoeru/LrcFloatWindow$1;
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

    .line 36
    iput-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow$1;->this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
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

    .line 39
    iget-object p1, p0, Lcom/zinhao/kikoeru/LrcFloatWindow$1;->this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;

    new-instance p2, Landroid/content/Intent;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object p0, p0, Lcom/zinhao/kikoeru/LrcFloatWindow$1;->this$0:Lcom/zinhao/kikoeru/LrcFloatWindow;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->getPackageName()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "package:%s"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v0, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {p2, v0, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p2, p0}, Lcom/zinhao/kikoeru/LrcFloatWindow;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
