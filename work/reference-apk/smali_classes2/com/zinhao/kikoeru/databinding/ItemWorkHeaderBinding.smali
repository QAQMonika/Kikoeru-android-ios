.class public final Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;
.super Ljava/lang/Object;
.source "ItemWorkHeaderBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final ivCover:Landroidx/appcompat/widget/AppCompatImageView;

.field private final rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final tvArt:Lcom/zinhao/kikoeru/TagsView;

.field public final tvCircles:Lcom/zinhao/kikoeru/TagsView;

.field public final tvDate:Landroid/widget/TextView;

.field public final tvHost:Landroid/widget/TextView;

.field public final tvPrice:Landroid/widget/TextView;

.field public final tvSaleCount:Landroid/widget/TextView;

.field public final tvTags:Lcom/zinhao/kikoeru/TagsView;

.field public final tvTitle:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/appcompat/widget/AppCompatImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V
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
            0x0,
            0x0
        }
        names = {
            "rootView",
            "ivCover",
            "tvArt",
            "tvCircles",
            "tvDate",
            "tvHost",
            "tvPrice",
            "tvSaleCount",
            "tvTags",
            "tvTitle"
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 56
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->ivCover:Landroidx/appcompat/widget/AppCompatImageView;

    .line 57
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    .line 58
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    .line 59
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvDate:Landroid/widget/TextView;

    .line 60
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvHost:Landroid/widget/TextView;

    .line 61
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvPrice:Landroid/widget/TextView;

    .line 62
    iput-object p8, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvSaleCount:Landroid/widget/TextView;

    .line 63
    iput-object p9, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 64
    iput-object p10, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->tvTitle:Landroid/widget/TextView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 94
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    .line 95
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroidx/appcompat/widget/AppCompatImageView;

    if-eqz v4, :cond_0

    .line 100
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvArt:I

    .line 101
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v5, :cond_0

    .line 106
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    .line 107
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v6, :cond_0

    .line 112
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    .line 113
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_0

    .line 118
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvHost:I

    .line 119
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_0

    .line 124
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvPrice:I

    .line 125
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_0

    .line 130
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvSaleCount:I

    .line 131
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_0

    .line 136
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    .line 137
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v11, :cond_0

    .line 142
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    .line 143
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroid/widget/TextView;

    if-eqz v12, :cond_0

    .line 148
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v12}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/appcompat/widget/AppCompatImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V

    return-object v2

    .line 151
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 152
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;
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

    .line 75
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;
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

    .line 81
    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_work_header:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 83
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 85
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 20
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 70
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
