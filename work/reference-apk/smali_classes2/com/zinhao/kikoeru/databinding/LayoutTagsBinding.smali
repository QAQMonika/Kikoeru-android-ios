.class public final Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;
.super Ljava/lang/Object;
.source "LayoutTagsBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final editText:Lcom/google/android/material/textfield/TextInputEditText;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public final tagsView:Lcom/zinhao/kikoeru/TagsView;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Lcom/google/android/material/textfield/TextInputEditText;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Lcom/zinhao/kikoeru/TagsView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rootView",
            "editText",
            "swipe",
            "tagsView"
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->rootView:Landroid/widget/LinearLayout;

    .line 36
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->editText:Lcom/google/android/material/textfield/TextInputEditText;

    .line 37
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 38
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->tagsView:Lcom/zinhao/kikoeru/TagsView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 68
    sget v0, Lcom/zinhao/kikoeru/R$id;->editText:I

    .line 69
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputEditText;

    if-eqz v1, :cond_0

    .line 74
    sget v0, Lcom/zinhao/kikoeru/R$id;->swipe:I

    .line 75
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    if-eqz v2, :cond_0

    .line 80
    sget v0, Lcom/zinhao/kikoeru/R$id;->tagsView:I

    .line 81
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v3, :cond_0

    .line 86
    new-instance v0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;-><init>(Landroid/widget/LinearLayout;Lcom/google/android/material/textfield/TextInputEditText;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Lcom/zinhao/kikoeru/TagsView;)V

    return-object v0

    .line 88
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 89
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;
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

    .line 49
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;
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

    .line 55
    sget v0, Lcom/zinhao/kikoeru/R$layout;->layout_tags:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 57
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 59
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 20
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 44
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/LayoutTagsBinding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
