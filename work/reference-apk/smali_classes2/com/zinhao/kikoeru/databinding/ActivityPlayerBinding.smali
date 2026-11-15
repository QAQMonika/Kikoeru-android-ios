.class public final Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;
.super Ljava/lang/Object;
.source "ActivityPlayerBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final ib1:Landroid/widget/ImageButton;

.field public final ib2:Landroid/widget/ImageButton;

.field public final ib3:Landroid/widget/ImageButton;

.field public final ibLoop:Landroid/widget/ImageButton;

.field public final imageButton2:Landroid/widget/ImageButton;

.field public final ivCover:Landroid/widget/ImageView;

.field public final linearLayout3:Landroid/widget/LinearLayout;

.field public final mainRecycler:Landroidx/recyclerview/widget/RecyclerView;

.field public final root:Landroid/widget/LinearLayout;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final textView13:Landroid/widget/TextView;

.field public final timeView:Lcom/zinhao/kikoeru/TimeProgressView;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageView;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TimeProgressView;)V
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
            0x0,
            0x0
        }
        names = {
            "rootView",
            "ib1",
            "ib2",
            "ib3",
            "ibLoop",
            "imageButton2",
            "ivCover",
            "linearLayout3",
            "mainRecycler",
            "root",
            "textView13",
            "timeView"
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->rootView:Landroid/widget/LinearLayout;

    .line 66
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->ib1:Landroid/widget/ImageButton;

    .line 67
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->ib2:Landroid/widget/ImageButton;

    .line 68
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->ib3:Landroid/widget/ImageButton;

    .line 69
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->ibLoop:Landroid/widget/ImageButton;

    .line 70
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->imageButton2:Landroid/widget/ImageButton;

    .line 71
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->ivCover:Landroid/widget/ImageView;

    .line 72
    iput-object p8, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->linearLayout3:Landroid/widget/LinearLayout;

    .line 73
    iput-object p9, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->mainRecycler:Landroidx/recyclerview/widget/RecyclerView;

    .line 74
    iput-object p10, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->root:Landroid/widget/LinearLayout;

    .line 75
    iput-object p11, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->textView13:Landroid/widget/TextView;

    .line 76
    iput-object p12, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->timeView:Lcom/zinhao/kikoeru/TimeProgressView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;
    .locals 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 106
    sget v0, Lcom/zinhao/kikoeru/R$id;->ib1:I

    .line 107
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/ImageButton;

    if-eqz v4, :cond_0

    .line 112
    sget v0, Lcom/zinhao/kikoeru/R$id;->ib2:I

    .line 113
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageButton;

    if-eqz v5, :cond_0

    .line 118
    sget v0, Lcom/zinhao/kikoeru/R$id;->ib3:I

    .line 119
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/ImageButton;

    if-eqz v6, :cond_0

    .line 124
    sget v0, Lcom/zinhao/kikoeru/R$id;->ibLoop:I

    .line 125
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/ImageButton;

    if-eqz v7, :cond_0

    .line 130
    sget v0, Lcom/zinhao/kikoeru/R$id;->imageButton2:I

    .line 131
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/ImageButton;

    if-eqz v8, :cond_0

    .line 136
    sget v0, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    .line 137
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_0

    .line 142
    sget v0, Lcom/zinhao/kikoeru/R$id;->linearLayout3:I

    .line 143
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_0

    .line 148
    sget v0, Lcom/zinhao/kikoeru/R$id;->mainRecycler:I

    .line 149
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v11, :cond_0

    .line 154
    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    .line 156
    sget v0, Lcom/zinhao/kikoeru/R$id;->textView13:I

    .line 157
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Landroid/widget/TextView;

    if-eqz v13, :cond_0

    .line 162
    sget v0, Lcom/zinhao/kikoeru/R$id;->time_view:I

    .line 163
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/zinhao/kikoeru/TimeProgressView;

    if-eqz v14, :cond_0

    .line 168
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;

    move-object v12, v3

    invoke-direct/range {v2 .. v14}, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;-><init>(Landroid/widget/LinearLayout;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageButton;Landroid/widget/ImageView;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/zinhao/kikoeru/TimeProgressView;)V

    return-object v2

    .line 171
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 172
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;
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

    .line 87
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;
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

    .line 93
    sget v0, Lcom/zinhao/kikoeru/R$layout;->activity_player:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 95
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 97
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 22
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 82
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityPlayerBinding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
