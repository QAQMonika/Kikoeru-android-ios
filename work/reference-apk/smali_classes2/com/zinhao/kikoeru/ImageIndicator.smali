.class public Lcom/zinhao/kikoeru/ImageIndicator;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "ImageIndicator.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# static fields
.field private static final HALE_DARK_COLOR:I


# instance fields
.field private imageSelectedColor:I

.field private selectedPosition:I

.field private stateStopSelect:Z

.field private viewPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-static {v0, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    sput v0, Lcom/zinhao/kikoeru/ImageIndicator;->HALE_DARK_COLOR:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 24
    invoke-direct {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/ImageIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    const/4 v0, -0x1

    .line 28
    invoke-direct {p0, p1, p2, v0}, Lcom/zinhao/kikoeru/ImageIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p2, -0xff0100

    .line 19
    iput p2, p0, Lcom/zinhao/kikoeru/ImageIndicator;->imageSelectedColor:I

    const/4 p2, -0x1

    .line 20
    iput p2, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    const/4 p2, 0x0

    .line 21
    iput-boolean p2, p0, Lcom/zinhao/kikoeru/ImageIndicator;->stateStopSelect:Z

    .line 33
    sget p2, Lcom/zinhao/kikoeru/R$color;->main_color:I

    invoke-static {p1, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->imageSelectedColor:I

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/ImageIndicator;)Landroidx/viewpager/widget/ViewPager;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->viewPager:Landroidx/viewpager/widget/ViewPager;

    return-object p0
.end method

.method static synthetic access$100()I
    .locals 1

    .line 16
    sget v0, Lcom/zinhao/kikoeru/ImageIndicator;->HALE_DARK_COLOR:I

    return v0
.end method

.method static synthetic access$200(Lcom/zinhao/kikoeru/ImageIndicator;)I
    .locals 0

    .line 16
    iget p0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->imageSelectedColor:I

    return p0
.end method


# virtual methods
.method public bindPreViewImage(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "list",
            "selectedPosition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 43
    iput p2, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    .line 44
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 46
    :cond_0
    new-instance v0, Lcom/zinhao/kikoeru/ImageIndicator$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/zinhao/kikoeru/ImageIndicator$1;-><init>(Lcom/zinhao/kikoeru/ImageIndicator;Ljava/util/List;I)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/ImageIndicator;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 67
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getContext()Landroid/content/Context;

    move-result-object p2

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/ImageIndicator;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public bindViewPager(Landroidx/viewpager/widget/ViewPager;)Lcom/zinhao/kikoeru/ImageIndicator;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "viewPager"
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->viewPager:Landroidx/viewpager/widget/ViewPager;

    .line 38
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    return-object p0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 97
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->stateStopSelect:Z

    if-eqz v0, :cond_2

    if-nez p1, :cond_2

    .line 98
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 100
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p1

    iget v0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 103
    :cond_1
    iget v0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->imageSelectedColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 p1, 0x0

    .line 104
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->stateStopSelect:Z

    :cond_2
    :goto_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "position",
            "positionOffset",
            "positionOffsetPixels"
        }
    .end annotation

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 77
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 79
    :cond_0
    iget v0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 80
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    iget v1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 82
    sget v1, Lcom/zinhao/kikoeru/ImageIndicator;->HALE_DARK_COLOR:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 85
    :cond_1
    iput p1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->selectedPosition:I

    .line 86
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    .line 87
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ImageIndicator;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 89
    iget p0, p0, Lcom/zinhao/kikoeru/ImageIndicator;->imageSelectedColor:I

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :cond_2
    const/4 p1, 0x1

    .line 91
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/ImageIndicator;->stateStopSelect:Z

    return-void
.end method
