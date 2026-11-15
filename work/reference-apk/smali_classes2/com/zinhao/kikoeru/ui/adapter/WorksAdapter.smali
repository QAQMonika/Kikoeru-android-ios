.class public final Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;
.super Landroidx/recyclerview/widget/ListAdapter;
.source "WorksAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion;,
        Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/ListAdapter<",
        "Lcom/zinhao/kikoeru/model/Work;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0018\u0000 $2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0002#$B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0014\u0010\u0015\u001a\u00020\u00162\u000c\u0010\u0006\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007J\u0010\u0010\u0017\u001a\u00020\u00162\u0008\u0010\n\u001a\u0004\u0018\u00010\u000bJ\u0014\u0010\u0018\u001a\u00020\u00162\u000c\u0010\t\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007J\u0010\u0010\u0019\u001a\u00020\u00162\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rJ\u0014\u0010\u001a\u001a\u00020\u00162\u000c\u0010\u0008\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007J\u0018\u0010\u001b\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0016J\u0018\u0010 \u001a\u00020\u00162\u0006\u0010!\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020\u001fH\u0017R\u0014\u0010\u0006\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;",
        "Landroidx/recyclerview/widget/ListAdapter;",
        "Lcom/zinhao/kikoeru/model/Work;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "<init>",
        "()V",
        "tagClickListener",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "vaClickListener",
        "circlesClickListener",
        "itemClickListener",
        "Landroid/view/View$OnClickListener;",
        "itemLongClickListener",
        "Landroid/view/View$OnLongClickListener;",
        "tagGet",
        "Lcom/zinhao/kikoeru/TagsView$TextGet;",
        "Lcom/zinhao/kikoeru/model/Tag;",
        "circleGet",
        "Lcom/zinhao/kikoeru/model/Circle;",
        "vaGet",
        "Lcom/zinhao/kikoeru/model/Va;",
        "setTagClickListener",
        "",
        "setItemClickListener",
        "setCirclesClickListener",
        "setItemLongClickListener",
        "setVaClickListener",
        "onCreateViewHolder",
        "parent",
        "Landroid/view/ViewGroup;",
        "viewType",
        "",
        "onBindViewHolder",
        "holder",
        "position",
        "GirdViewHolder",
        "Companion",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion;

.field public static final LAYOUT_BIG_GRID:I = 0x350

.field public static final LAYOUT_LIST:I = 0x34e

.field public static final LAYOUT_SMALL_GRID:I = 0x34f

.field public static final LAYOUT_STAGGERED:I = 0x351

.field private static final TAG:Ljava/lang/String; = "WorkAdapter"

.field private static final TYPE_ITEM:I

.field private static final WorkDiffCallback:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;


# instance fields
.field private final circleGet:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Lcom/zinhao/kikoeru/model/Circle;",
            ">;"
        }
    .end annotation
.end field

.field private circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;"
        }
    .end annotation
.end field

.field private itemClickListener:Landroid/view/View$OnClickListener;

.field private itemLongClickListener:Landroid/view/View$OnLongClickListener;

.field private tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;"
        }
    .end annotation
.end field

.field private final tagGet:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Lcom/zinhao/kikoeru/model/Tag;",
            ">;"
        }
    .end annotation
.end field

.field private vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;"
        }
    .end annotation
.end field

.field private final vaGet:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Lcom/zinhao/kikoeru/model/Va;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$Pwl75N1iRabrtdLcx71g3fDuI2Y(Lcom/zinhao/kikoeru/model/Va;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->vaGet$lambda$0(Lcom/zinhao/kikoeru/model/Va;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$d7ZopYy3psxqfE7pIORWb-gqBV8(Lcom/zinhao/kikoeru/model/Tag;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->tagGet$lambda$0(Lcom/zinhao/kikoeru/model/Tag;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$gRIYaSGGVmfUiS-HNV8F612INvs(Lcom/zinhao/kikoeru/model/Circle;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->circleGet$lambda$0(Lcom/zinhao/kikoeru/model/Circle;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->Companion:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion;

    .line 143
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->WorkDiffCallback:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    sget-object v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->WorkDiffCallback:Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;

    check-cast v0, Landroidx/recyclerview/widget/DiffUtil$ItemCallback;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/ListAdapter;-><init>(Landroidx/recyclerview/widget/DiffUtil$ItemCallback;)V

    .line 34
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda0;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->tagGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 35
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda1;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->circleGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 36
    new-instance v0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$$ExternalSyntheticLambda2;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->vaGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    return-void
.end method

.method private static final circleGet$lambda$0(Lcom/zinhao/kikoeru/model/Circle;)Ljava/lang/String;
    .locals 0

    .line 35
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/model/Circle;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final tagGet$lambda$0(Lcom/zinhao/kikoeru/model/Tag;)Ljava/lang/String;
    .locals 0

    .line 34
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/model/Tag;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final vaGet$lambda$0(Lcom/zinhao/kikoeru/model/Va;)Ljava/lang/String;
    .locals 0

    .line 36
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/model/Va;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 5

    const-string v0, "format(...)"

    const-string v1, "holder"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/zinhao/kikoeru/model/Work;

    .line 66
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 67
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->itemLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 69
    instance-of v1, p1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    if-eqz v1, :cond_2

    .line 72
    :try_start_0
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getId()I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3}, Lcom/zinhao/kikoeru/Api;->fullCoverImageUrl(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 73
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getIvCover()Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 74
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvTitle()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getTitle()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getVas()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->vaGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v1, v2, v3}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 76
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 77
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getTags()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->tagGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v1, v2, v3}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 78
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getCircle()Lcom/zinhao/kikoeru/model/Circle;

    move-result-object v2

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->circleGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v1, v2, v3}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 79
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v1, v2}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 80
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v1

    iget-object p0, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v1, p0}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 81
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvRjNumber()Landroid/widget/TextView;

    move-result-object p0

    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v1, "RJ%d"

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getRelease()Ljava/lang/String;

    move-result-object p0

    .line 84
    move-object v1, p0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 85
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object p0

    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 87
    :cond_0
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 88
    move-object v1, p1

    check-cast v1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object v1

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    :goto_0
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvPrice()Landroid/widget/TextView;

    move-result-object p0

    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v1, "%d \u65e5\u5143"

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getPrice()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvSaleCount()Landroid/widget/TextView;

    move-result-object p0

    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v1, "\u552e\u51fa\uff1a%d"

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getDl_count()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getHost()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 95
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 96
    check-cast p1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getHost()Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 98
    :cond_1
    check-cast p1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 101
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 102
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    check-cast p0, Ljava/lang/Exception;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :cond_2
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    const-string p0, "parent"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_2:I

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 60
    new-instance p1, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$GirdViewHolder;-><init>(Landroid/view/View;)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p1
.end method

.method public final setCirclesClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;)V"
        }
    .end annotation

    .line 47
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method

.method public final setItemClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public final setItemLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->itemLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public final setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;)V"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method

.method public final setVaClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;)V"
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method
