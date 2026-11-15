.class public final Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;
.super Ljava/lang/Object;
.source "ActivityAboutBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final imageView2:Landroid/widget/ImageView;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final textView4:Landroid/widget/TextView;

.field public final textView5:Landroid/widget/TextView;

.field public final tvName:Landroid/widget/TextView;

.field public final tvVer:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
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
            "imageView2",
            "textView4",
            "textView5",
            "tvName",
            "tvVer"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->rootView:Landroid/widget/LinearLayout;

    .line 42
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->imageView2:Landroid/widget/ImageView;

    .line 43
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->textView4:Landroid/widget/TextView;

    .line 44
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->textView5:Landroid/widget/TextView;

    .line 45
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->tvName:Landroid/widget/TextView;

    .line 46
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->tvVer:Landroid/widget/TextView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    .line 76
    sget v0, Lcom/zinhao/kikoeru/R$id;->imageView2:I

    .line 77
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_0

    .line 82
    sget v0, Lcom/zinhao/kikoeru/R$id;->textView4:I

    .line 83
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_0

    .line 88
    sget v0, Lcom/zinhao/kikoeru/R$id;->textView5:I

    .line 89
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_0

    .line 94
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvName:I

    .line 95
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_0

    .line 100
    sget v0, Lcom/zinhao/kikoeru/R$id;->tvVer:I

    .line 101
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_0

    .line 106
    new-instance v2, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v8}, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;-><init>(Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-object v2

    .line 109
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 110
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;
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

    .line 57
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;
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

    .line 63
    sget v0, Lcom/zinhao/kikoeru/R$layout;->activity_about:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 65
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 67
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityAboutBinding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
