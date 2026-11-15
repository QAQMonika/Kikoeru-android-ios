.class Lcom/zinhao/kikoeru/LicenseActivity$1;
.super Ljava/lang/Object;
.source "LicenseActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LicenseActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LicenseActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LicenseActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "view",
            "position",
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 41
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/LicenseActivity;->access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/LicenseActivity;->access$000(Lcom/zinhao/kikoeru/LicenseActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 42
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/LicenseActivity;->access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/LicenseActivity;->access$000(Lcom/zinhao/kikoeru/LicenseActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->getLicenseUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/appcompat/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 43
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/LicenseActivity;->access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    sget p4, Lcom/zinhao/kikoeru/R$string;->confirm:I

    invoke-virtual {p2, p4}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance p4, Lcom/zinhao/kikoeru/LicenseActivity$1$1;

    invoke-direct {p4, p0}, Lcom/zinhao/kikoeru/LicenseActivity$1$1;-><init>(Lcom/zinhao/kikoeru/LicenseActivity$1;)V

    const/4 p5, -0x3

    invoke-virtual {p1, p5, p2, p4}, Landroidx/appcompat/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 49
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/LicenseActivity;->access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    sget p4, Lcom/zinhao/kikoeru/R$string;->view:I

    invoke-virtual {p2, p4}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance p4, Lcom/zinhao/kikoeru/LicenseActivity$1$2;

    invoke-direct {p4, p0, p3}, Lcom/zinhao/kikoeru/LicenseActivity$1$2;-><init>(Lcom/zinhao/kikoeru/LicenseActivity$1;I)V

    const/4 p3, -0x1

    invoke-virtual {p1, p3, p2, p4}, Landroidx/appcompat/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 62
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$1;->this$0:Lcom/zinhao/kikoeru/LicenseActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/LicenseActivity;->access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/AlertDialog;->show()V

    return-void
.end method
