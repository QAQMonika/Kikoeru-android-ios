.class public final Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;
.super Ljava/lang/Object;
.source "ActivityWorkBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

.field public final bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

.field public final headerInfo:Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

.field public final recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public final toolbar:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;Landroidx/recyclerview/widget/RecyclerView;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroidx/appcompat/widget/Toolbar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rootView",
            "appBarLayout",
            "bottomLayout",
            "headerInfo",
            "recyclerView",
            "swipe",
            "toolbar"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->rootView:Landroid/widget/LinearLayout;

    .line 48
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    .line 49
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    .line 50
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->headerInfo:Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    .line 51
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 53
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 83
    sget v0, Lcom/zinhao/kikoeru/R$id;->appBarLayout:I

    .line 84
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v4, :cond_0

    .line 89
    sget v0, Lcom/zinhao/kikoeru/R$id;->bottomLayout:I

    .line 90
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 94
    invoke-static {v1}, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    move-result-object v5

    .line 96
    sget v0, Lcom/zinhao/kikoeru/R$id;->header_info:I

    .line 97
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 101
    invoke-static {v1}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    move-result-object v6

    .line 103
    sget v0, Lcom/zinhao/kikoeru/R$id;->recyclerView:I

    .line 104
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v7, :cond_0

    .line 109
    sget v0, Lcom/zinhao/kikoeru/R$id;->swipe:I

    .line 110
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    if-eqz v8, :cond_0

    .line 115
    sget v0, Lcom/zinhao/kikoeru/R$id;->toolbar:I

    .line 116
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroidx/appcompat/widget/Toolbar;

    if-eqz v9, :cond_0

    .line 121
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v9}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;Landroidx/recyclerview/widget/RecyclerView;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroidx/appcompat/widget/Toolbar;)V

    return-object v2

    .line 124
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 125
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inflater"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 64
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inflater",
            "parent",
            "attachToParent"
        }
    .end annotation

    .line 70
    sget v0, Lcom/zinhao/kikoeru/R$layout;->activity_work:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 72
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 74
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 21
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 59
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
