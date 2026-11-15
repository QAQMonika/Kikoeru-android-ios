.class public abstract Lcom/zinhao/kikoeru/SuperRecyclerAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SuperRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;",
        ">;"
    }
.end annotation


# instance fields
.field data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->data:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public abstract bindData(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "holder",
            "position"
        }
    .end annotation
.end method

.method public getData()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 20
    iget-object p0, p0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->data:Ljava/util/List;

    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->data:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public getItemViewType(I)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 39
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result p0

    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 16
    check-cast p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->onBindViewHolder(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 44
    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->bindData(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;

    move-result-object p0

    return-object p0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    .line 34
    new-instance v0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->setLayout(I)I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {v1, p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public setData(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->data:Ljava/util/List;

    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 24
    iput-object p1, p0, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;->data:Ljava/util/List;

    return-void
.end method

.method public abstract setLayout(I)I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "viewType"
        }
    .end annotation
.end method
