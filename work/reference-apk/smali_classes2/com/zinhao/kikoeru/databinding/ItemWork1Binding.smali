.class public final Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;
.super Ljava/lang/Object;
.source "ItemWork1Binding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final ivCover:Landroid/widget/ImageView;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final tvCircles:Lcom/zinhao/kikoeru/TagsView;

.field public final tvComArt:Lcom/zinhao/kikoeru/TagsView;

.field public final tvTags:Lcom/zinhao/kikoeru/TagsView;

.field public final tvTitle:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rootView",
            "ivCover",
            "tvCircles",
            "tvComArt",
            "tvTags",
            "tvTitle"
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->rootView:Landroid/widget/LinearLayout;

    .line 43
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->ivCover:Landroid/widget/ImageView;

    .line 44
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    .line 45
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->tvComArt:Lcom/zinhao/kikoeru/TagsView;

    .line 46
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 47
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->tvTitle:Landroid/widget/TextView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 77
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    .line 78
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_0

    .line 83
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    .line 84
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v5, :cond_0

    .line 89
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvComArt:I

    .line 90
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v6, :cond_0

    .line 95
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    .line 96
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v7, :cond_0

    .line 101
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    .line 102
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_0

    .line 107
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v8}, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;-><init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V

    return-object v2

    .line 110
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 111
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;
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

    .line 58
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;
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

    .line 64
    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_work_1:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 66
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 20
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ItemWork1Binding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
