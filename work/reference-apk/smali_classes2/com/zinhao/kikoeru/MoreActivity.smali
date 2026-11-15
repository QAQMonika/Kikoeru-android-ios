.class public Lcom/zinhao/kikoeru/MoreActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "MoreActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field private cbDebug:Landroid/widget/CheckBox;

.field private cbOnlyLrcWork:Landroid/widget/CheckBox;

.field private cbSaveExternal:Landroid/widget/CheckBox;

.field private itemDebug:Landroid/view/View;

.field private itemOnlyLoadLrc:Landroid/view/View;

.field private itemSaveExternal:Landroid/view/View;

.field private vAbout:Landroid/view/View;

.field private vLicense:Landroid/view/View;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/MoreActivity;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbOnlyLrcWork:Landroid/widget/CheckBox;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbSaveExternal:Landroid/widget/CheckBox;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbDebug:Landroid/widget/CheckBox;

    return-object p0
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "compoundButton",
            "b"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbOnlyLrcWork:Landroid/widget/CheckBox;

    if-ne p1, v0, :cond_1

    if-eqz p2, :cond_0

    const-wide/16 v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    .line 99
    :goto_0
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v3, "only_display_lrc"

    invoke-virtual {v2, v3, v0, v1}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    long-to-int v0, v0

    .line 100
    invoke-static {v0}, Lcom/zinhao/kikoeru/Api;->setSubtitle(I)V

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbDebug:Landroid/widget/CheckBox;

    if-ne p1, v0, :cond_2

    .line 104
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/zinhao/kikoeru/App;->setAppDebug(Z)V

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbSaveExternal:Landroid/widget/CheckBox;

    if-ne v0, p1, :cond_4

    if-eqz p2, :cond_3

    .line 109
    new-instance p1, Lcom/zinhao/kikoeru/MoreActivity$7;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/MoreActivity$7;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->requestReadWriteExternalPermission(Ljava/lang/Runnable;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 134
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->setSaveExternal(Z)V

    return-void

    .line 137
    :cond_3
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/App;->setSaveExternal(Z)V

    :cond_4
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 33
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/MoreActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    .line 35
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->setContentView(Landroid/view/View;)V

    .line 36
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 37
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$1;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p0, p1, v0}, Lcom/zinhao/kikoeru/MoreActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 43
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->relativeLayout:Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->itemOnlyLoadLrc:Landroid/view/View;

    .line 44
    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$2;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$2;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->checkBox:Landroid/widget/CheckBox;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbOnlyLrcWork:Landroid/widget/CheckBox;

    .line 51
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    const-string v0, "only_display_lrc"

    const-wide/16 v1, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v3

    .line 52
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbOnlyLrcWork:Landroid/widget/CheckBox;

    cmp-long v0, v3, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 53
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbOnlyLrcWork:Landroid/widget/CheckBox;

    invoke-virtual {p1, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 55
    sget p1, Lcom/zinhao/kikoeru/R$id;->saveExternal:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->itemSaveExternal:Landroid/view/View;

    .line 56
    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$3;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$3;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    sget p1, Lcom/zinhao/kikoeru/R$id;->checkBox3:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbSaveExternal:Landroid/widget/CheckBox;

    .line 63
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->isSaveExternal()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 64
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbSaveExternal:Landroid/widget/CheckBox;

    invoke-virtual {p1, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 66
    sget p1, Lcom/zinhao/kikoeru/R$id;->license:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->vLicense:Landroid/view/View;

    .line 67
    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$4;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$4;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    sget p1, Lcom/zinhao/kikoeru/R$id;->about:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->vAbout:Landroid/view/View;

    .line 75
    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$5;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$5;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    sget p1, Lcom/zinhao/kikoeru/R$id;->debug:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->itemDebug:Landroid/view/View;

    .line 83
    new-instance v0, Lcom/zinhao/kikoeru/MoreActivity$6;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/MoreActivity$6;-><init>(Lcom/zinhao/kikoeru/MoreActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    sget p1, Lcom/zinhao/kikoeru/R$id;->checkBox1:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/MoreActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbDebug:Landroid/widget/CheckBox;

    .line 90
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->isAppDebug()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 91
    iget-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity;->cbDebug:Landroid/widget/CheckBox;

    invoke-virtual {p1, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/PlaybackOptions;->install(Landroid/app/Activity;)V

    return-void
.end method
