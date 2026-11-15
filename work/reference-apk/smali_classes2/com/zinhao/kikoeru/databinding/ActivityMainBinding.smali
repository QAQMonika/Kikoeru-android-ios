.class public final Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
.super Ljava/lang/Object;
.source "ActivityMainBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

.field public final bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

.field public final bt1:Landroid/widget/ImageButton;

.field public final bt2:Landroid/widget/ImageButton;

.field public final bt3:Landroid/widget/ImageButton;

.field public final linearLayout:Landroid/widget/LinearLayout;

.field public final recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private final rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final toolbar:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method private constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroidx/appcompat/widget/Toolbar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
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
            "bt1",
            "bt2",
            "bt3",
            "linearLayout",
            "recyclerView",
            "toolbar"
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 56
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    .line 57
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    .line 58
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt1:Landroid/widget/ImageButton;

    .line 59
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt2:Landroid/widget/ImageButton;

    .line 60
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt3:Landroid/widget/ImageButton;

    .line 61
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->linearLayout:Landroid/widget/LinearLayout;

    .line 62
    iput-object p8, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 63
    iput-object p9, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
    .locals 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 93
    sget v0, Lcom/zinhao/kikoeru/R$id;->appBarLayout:I

    .line 94
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v4, :cond_0

    .line 99
    sget v0, Lcom/zinhao/kikoeru/R$id;->bottomLayout:I

    .line 100
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 104
    invoke-static {v1}, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    move-result-object v5

    .line 106
    sget v0, Lcom/zinhao/kikoeru/R$id;->bt1:I

    .line 107
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/ImageButton;

    if-eqz v6, :cond_0

    .line 112
    sget v0, Lcom/zinhao/kikoeru/R$id;->bt2:I

    .line 113
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/ImageButton;

    if-eqz v7, :cond_0

    .line 118
    sget v0, Lcom/zinhao/kikoeru/R$id;->bt3:I

    .line 119
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/ImageButton;

    if-eqz v8, :cond_0

    .line 124
    sget v0, Lcom/zinhao/kikoeru/R$id;->linearLayout:I

    .line 125
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/LinearLayout;

    if-eqz v9, :cond_0

    .line 130
    sget v0, Lcom/zinhao/kikoeru/R$id;->recyclerView:I

    .line 131
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v10, :cond_0

    .line 136
    sget v0, Lcom/zinhao/kikoeru/R$id;->toolbar:I

    .line 137
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroidx/appcompat/widget/Toolbar;

    if-eqz v11, :cond_0

    .line 142
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v11}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/appbar/AppBarLayout;Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroidx/appcompat/widget/Toolbar;)V

    return-object v2

    .line 145
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 146
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
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

    .line 74
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
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

    .line 80
    sget v0, Lcom/zinhao/kikoeru/R$layout;->activity_main:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 82
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 84
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 22
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 69
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
