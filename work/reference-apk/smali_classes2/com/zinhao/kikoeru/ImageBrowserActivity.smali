.class public Lcom/zinhao/kikoeru/ImageBrowserActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "ImageBrowserActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageBrowserActivity"


# instance fields
.field private adapter:Lcom/zinhao/kikoeru/ImagePagerAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/ImagePagerAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private imageIndicator:Lcom/zinhao/kikoeru/ImageIndicator;

.field private imageList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private inAnim:Landroid/view/animation/Animation;

.field private outAnim:Landroid/view/animation/Animation;

.field private shouldShowAnim:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->shouldShowAnim:Z

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Z
    .locals 0

    .line 18
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->shouldShowAnim:Z

    return p0
.end method

.method static synthetic access$002(Lcom/zinhao/kikoeru/ImageBrowserActivity;Z)Z
    .locals 0

    .line 18
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->shouldShowAnim:Z

    return p1
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Lcom/zinhao/kikoeru/ImageIndicator;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageIndicator:Lcom/zinhao/kikoeru/ImageIndicator;

    return-object p0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->outAnim:Landroid/view/animation/Animation;

    return-object p0
.end method

.method static synthetic access$300(Lcom/zinhao/kikoeru/ImageBrowserActivity;)Landroid/view/animation/Animation;
    .locals 0

    .line 18
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->inAnim:Landroid/view/animation/Animation;

    return-object p0
.end method

.method public static start(Landroid/content/Context;Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "list",
            "position"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 29
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/zinhao/kikoeru/ImageBrowserActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 30
    const-string v1, "images"

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 31
    const-string p1, "position"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 32
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
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

    .line 37
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1e

    if-lt p1, v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 41
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/view/WindowInsetsController;->hide(I)V

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x1002

    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 48
    :cond_1
    :goto_0
    sget p1, Lcom/zinhao/kikoeru/R$layout;->activity_image_browser:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->setContentView(I)V

    .line 49
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "images"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageList:Ljava/util/List;

    .line 50
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "position"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 51
    iget-object v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageList:Ljava/util/List;

    if-nez v0, :cond_2

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageList:Ljava/util/List;

    .line 53
    :cond_2
    sget v0, Lcom/zinhao/kikoeru/R$id;->image_pager:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 54
    sget v1, Lcom/zinhao/kikoeru/R$id;->imageIndicator:I

    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/ImageIndicator;

    iput-object v1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageIndicator:Lcom/zinhao/kikoeru/ImageIndicator;

    .line 55
    new-instance v1, Lcom/zinhao/kikoeru/ImagePagerAdapter;

    iget-object v2, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageList:Ljava/util/List;

    invoke-direct {v1, v2}, Lcom/zinhao/kikoeru/ImagePagerAdapter;-><init>(Ljava/util/List;)V

    iput-object v1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->adapter:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    .line 56
    new-instance v2, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/ImageBrowserActivity$1;-><init>(Lcom/zinhao/kikoeru/ImageBrowserActivity;)V

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/ImagePagerAdapter;->setListener(Lcom/zinhao/kikoeru/ImagePagerAdapter$HideLayoutCallBack;)V

    .line 82
    iget-object v1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->adapter:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 83
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 84
    iget-object v1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageIndicator:Lcom/zinhao/kikoeru/ImageIndicator;

    iget-object v2, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageList:Ljava/util/List;

    invoke-virtual {v1, v2, p1}, Lcom/zinhao/kikoeru/ImageIndicator;->bindPreViewImage(Ljava/util/List;I)V

    .line 85
    iget-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->imageIndicator:Lcom/zinhao/kikoeru/ImageIndicator;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/ImageIndicator;->bindViewPager(Landroidx/viewpager/widget/ViewPager;)Lcom/zinhao/kikoeru/ImageIndicator;

    .line 86
    sget p1, Lcom/zinhao/kikoeru/R$anim;->move_bottom_out:I

    invoke-static {p0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->outAnim:Landroid/view/animation/Animation;

    const-wide/16 v0, 0x64

    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 88
    sget p1, Lcom/zinhao/kikoeru/R$anim;->move_bottom_in:I

    invoke-static {p0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageBrowserActivity;->inAnim:Landroid/view/animation/Animation;

    .line 89
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    return-void
.end method
