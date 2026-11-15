.class public Lcom/zinhao/kikoeru/DownLoadMissionActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "DownLoadMissionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private isStop:Z

.field private missionAdapter:Lcom/zinhao/kikoeru/MissionAdapter;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->isStop:Z

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/DownLoadMissionActivity;)Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    return-object p0
.end method

.method private update()V
    .locals 3

    .line 71
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, p0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 21
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    .line 23
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->setContentView(Landroid/view/View;)V

    .line 24
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 25
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    new-instance v0, Lcom/zinhao/kikoeru/DownLoadMissionActivity$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/DownLoadMissionActivity$1;-><init>(Lcom/zinhao/kikoeru/DownLoadMissionActivity;)V

    invoke-virtual {p0, p1, v0}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 31
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;

    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityDownLoadMissionBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    new-instance p1, Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-direct {p1}, Lcom/zinhao/kikoeru/MissionAdapter;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->missionAdapter:Lcom/zinhao/kikoeru/MissionAdapter;

    .line 33
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 34
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->missionAdapter:Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    iget-object p1, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 36
    new-instance p1, Landroidx/recyclerview/widget/DividerItemDecoration;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    .line 37
    iget-object p0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "menu"
        }
    .end annotation

    const/4 v0, 0x0

    .line 55
    const-string v1, "\u6e05\u9664\u5df2\u4e0b\u8f7d\u9879\u76ee"

    invoke-interface {p1, v0, v0, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 56
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_delete_forever_white_24:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const/4 v1, 0x2

    .line 57
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 58
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 63
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-nez v0, :cond_0

    .line 64
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/DownloadUtils;->removeCompleteMission()I

    .line 65
    iget-object v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->missionAdapter:Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/MissionAdapter;->notifyDataSetChanged()V

    .line 67
    :cond_0
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method protected onStart()V
    .locals 1

    .line 42
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onStart()V

    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->isStop:Z

    .line 44
    invoke-direct {p0}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->update()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 49
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onStop()V

    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->isStop:Z

    return-void
.end method

.method public run()V
    .locals 4

    .line 76
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->isStop:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    move v1, v0

    .line 79
    :goto_0
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 80
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v2

    iget-object v2, v2, Lcom/zinhao/kikoeru/DownloadUtils;->missionList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    .line 81
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->isUpdate()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 82
    iget-object v3, p0, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->missionAdapter:Lcom/zinhao/kikoeru/MissionAdapter;

    invoke-virtual {v3, v1}, Lcom/zinhao/kikoeru/MissionAdapter;->notifyItemChanged(I)V

    .line 83
    invoke-virtual {v2, v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setUpdate(Z)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 86
    :cond_2
    invoke-direct {p0}, Lcom/zinhao/kikoeru/DownLoadMissionActivity;->update()V

    return-void
.end method
