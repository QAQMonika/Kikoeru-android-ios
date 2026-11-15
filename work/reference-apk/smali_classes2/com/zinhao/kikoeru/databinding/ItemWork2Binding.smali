.class public final Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;
.super Ljava/lang/Object;
.source "ItemWork2Binding.java"

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

.field public final tvRjNumber:Landroid/widget/TextView;

.field public final tvSaleCount:Landroid/widget/TextView;

.field public final tvTags:Lcom/zinhao/kikoeru/TagsView;

.field public final tvTitle:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/appcompat/widget/AppCompatImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V
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
            "tvRjNumber",
            "tvSaleCount",
            "tvTags",
            "tvTitle"
        }
    .end annotation

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 59
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->ivCover:Landroidx/appcompat/widget/AppCompatImageView;

    .line 60
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvArt:Lcom/zinhao/kikoeru/TagsView;

    .line 61
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvCircles:Lcom/zinhao/kikoeru/TagsView;

    .line 62
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvDate:Landroid/widget/TextView;

    .line 63
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvHost:Landroid/widget/TextView;

    .line 64
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvPrice:Landroid/widget/TextView;

    .line 65
    iput-object p8, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvRjNumber:Landroid/widget/TextView;

    .line 66
    iput-object p9, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvSaleCount:Landroid/widget/TextView;

    .line 67
    iput-object p10, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvTags:Lcom/zinhao/kikoeru/TagsView;

    .line 68
    iput-object p11, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->tvTitle:Landroid/widget/TextView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 98
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    .line 99
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroidx/appcompat/widget/AppCompatImageView;

    if-eqz v4, :cond_0

    .line 104
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvArt:I

    .line 105
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v5, :cond_0

    .line 110
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvCircles:I

    .line 111
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v6, :cond_0

    .line 116
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    .line 117
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_0

    .line 122
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvHost:I

    .line 123
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_0

    .line 128
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvPrice:I

    .line 129
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/TextView;

    if-eqz v9, :cond_0

    .line 134
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvRjNumber:I

    .line 135
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_0

    .line 140
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvSaleCount:I

    .line 141
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_0

    .line 146
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTags:I

    .line 147
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lcom/zinhao/kikoeru/TagsView;

    if-eqz v12, :cond_0

    .line 152
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    .line 153
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Landroid/widget/TextView;

    if-eqz v13, :cond_0

    .line 158
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v13}, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/appcompat/widget/AppCompatImageView;Lcom/zinhao/kikoeru/TagsView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TagsView;Landroid/widget/TextView;)V

    return-object v2

    .line 161
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 162
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;
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

    .line 79
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;
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

    .line 85
    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_work_2:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 87
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 89
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 20
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 74
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ItemWork2Binding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
