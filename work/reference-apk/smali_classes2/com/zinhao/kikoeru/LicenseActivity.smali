.class public Lcom/zinhao/kikoeru/LicenseActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "LicenseActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;
    }
.end annotation


# instance fields
.field private alertDialog:Landroidx/appcompat/app/AlertDialog;

.field private listView:Landroid/widget/ListView;

.field private projectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/LicenseActivity;)Ljava/util/List;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/LicenseActivity;)Landroidx/appcompat/app/AlertDialog;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    return-object p0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 24
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    sget p1, Lcom/zinhao/kikoeru/R$layout;->activity_license:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LicenseActivity;->setContentView(I)V

    .line 26
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/LicenseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/zinhao/kikoeru/LicenseActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 27
    sget p1, Lcom/zinhao/kikoeru/R$id;->listview:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LicenseActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->listView:Landroid/widget/ListView;

    .line 29
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    .line 30
    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    sget v1, Lcom/zinhao/kikoeru/R$string;->project_glide_license:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Glide"

    invoke-direct {v0, v2, v1}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    sget v1, Lcom/zinhao/kikoeru/R$string;->project_exo_player_license:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ExoPlayer"

    invoke-direct {v0, v2, v1}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    sget v1, Lcom/zinhao/kikoeru/R$string;->project_android_async_license:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "AndroidAsync"

    invoke-direct {v0, v2, v1}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    const-string v1, "OkHttp"

    const-string v2, "https://github.com/square/okhttp/blob/master/LICENSE.txt"

    invoke-direct {v0, v1, v2}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;

    sget v1, Lcom/zinhao/kikoeru/R$string;->project_subsampling_scale_image_view_license:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/LicenseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SubsamplingScaleImageView"

    invoke-direct {v0, v2, v1}, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->listView:Landroid/widget/ListView;

    new-instance v0, Landroid/widget/ArrayAdapter;

    sget v1, Lcom/zinhao/kikoeru/R$layout;->item_open_source_project:I

    iget-object v2, p0, Lcom/zinhao/kikoeru/LicenseActivity;->projectList:Ljava/util/List;

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 37
    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    sget v0, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {p1, p0, v0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->alertDialog:Landroidx/appcompat/app/AlertDialog;

    .line 38
    iget-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity;->listView:Landroid/widget/ListView;

    new-instance v0, Lcom/zinhao/kikoeru/LicenseActivity$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/LicenseActivity$1;-><init>(Lcom/zinhao/kikoeru/LicenseActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method
