.class Lcom/zinhao/kikoeru/LicenseActivity$1$2;
.super Ljava/lang/Object;
.source "LicenseActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LicenseActivity$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/LicenseActivity$1;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LicenseActivity$1;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$position"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 49
    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->this$1:Lcom/zinhao/kikoeru/LicenseActivity$1;

    iput p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
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

    .line 52
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->this$1:Lcom/zinhao/kikoeru/LicenseActivity$1;

    iget-object p1, p1, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/LicenseActivity;->access$000(Lcom/zinhao/kikoeru/LicenseActivity;)Ljava/util/List;

    move-result-object p1

    iget p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->val$position:I

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->getLicenseUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 53
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 55
    :try_start_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->this$1:Lcom/zinhao/kikoeru/LicenseActivity$1;

    iget-object p1, p1, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/LicenseActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 57
    :catch_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$1$2;->this$1:Lcom/zinhao/kikoeru/LicenseActivity$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    const-string p1, "No Activity found to handle\uff01"

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method
