.class public final Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;
.super Ljava/lang/Object;
.source "ItemOpenSourceProjectBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field private final rootView:Landroid/widget/TextView;

.field public final tvName:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rootView",
            "tvName"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->rootView:Landroid/widget/TextView;

    .line 24
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->tvName:Landroid/widget/TextView;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 54
    check-cast p0, Landroid/widget/TextView;

    .line 56
    new-instance v0, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;

    invoke-direct {v0, p0, p0}, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-object v0

    .line 51
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "rootView"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;
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

    .line 35
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;
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

    .line 41
    sget v0, Lcom/zinhao/kikoeru/R$layout;->item_open_source_project:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 43
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 45
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 15
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->getRoot()Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/TextView;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ItemOpenSourceProjectBinding;->rootView:Landroid/widget/TextView;

    return-object p0
.end method
