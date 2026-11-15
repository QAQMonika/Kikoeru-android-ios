.class public final Lcom/zinhao/kikoeru/WorkAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "WorkAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/WorkAdapter$Companion;,
        Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;,
        Lcom/zinhao/kikoeru/WorkAdapter$LoadingViewHolder;,
        Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;,
        Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u0000 +2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0005\'()*+B\u001f\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0006\u0010\u0014\u001a\u00020\u0015J\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0015J\u0014\u0010\u0019\u001a\u00020\u00172\u000c\u0010\u000c\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rJ\u0010\u0010\u001a\u001a\u00020\u00172\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011J\u0014\u0010\u001b\u001a\u00020\u00172\u000c\u0010\u000f\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rJ\u0010\u0010\u001c\u001a\u00020\u00172\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013J\u0014\u0010\u001d\u001a\u00020\u00172\u000c\u0010\u000e\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rJ\u0018\u0010\u001e\u001a\u00020\u00022\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u0007H\u0016J\u0018\u0010\"\u001a\u00020\u00172\u0006\u0010#\u001a\u00020\u00022\u0006\u0010$\u001a\u00020\u0007H\u0017J\u0010\u0010%\u001a\u00020\u00072\u0006\u0010$\u001a\u00020\u0007H\u0016J\u0008\u0010&\u001a\u00020\u0007H\u0016R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010\n\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006,"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorkAdapter;",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "datas",
        "",
        "Lorg/json/JSONObject;",
        "layoutType",
        "",
        "<init>",
        "(Ljava/util/List;I)V",
        "textGet",
        "Lcom/zinhao/kikoeru/TagsView$TextGet;",
        "tagClickListener",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "vaClickListener",
        "circlesClickListener",
        "itemClickListener",
        "Landroid/view/View$OnClickListener;",
        "itemLongClickListener",
        "Landroid/view/View$OnLongClickListener;",
        "isLoading",
        "",
        "setLoading",
        "",
        "loading",
        "setTagClickListener",
        "setItemClickListener",
        "setCirclesClickListener",
        "setItemLongClickListener",
        "setVaClickListener",
        "onCreateViewHolder",
        "parent",
        "Landroid/view/ViewGroup;",
        "viewType",
        "onBindViewHolder",
        "holder",
        "position",
        "getItemViewType",
        "getItemCount",
        "SimpleViewHolder",
        "GirdViewHolder",
        "SmallGirdViewHolder",
        "LoadingViewHolder",
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
.field public static final Companion:Lcom/zinhao/kikoeru/WorkAdapter$Companion;

.field public static final LAYOUT_BIG_GRID:I = 0x350

.field public static final LAYOUT_LIST:I = 0x34e

.field public static final LAYOUT_SMALL_GRID:I = 0x34f

.field public static final LAYOUT_STAGGERED:I = 0x351

.field private static final TAG:Ljava/lang/String; = "WorkAdapter"

.field private static final TYPE_ITEM:I = 0x0

.field private static final TYPE_LOADING:I = 0x1


# instance fields
.field private circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;"
        }
    .end annotation
.end field

.field private final datas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private isLoading:Z

.field private itemClickListener:Landroid/view/View$OnClickListener;

.field private itemLongClickListener:Landroid/view/View$OnLongClickListener;

.field private final layoutType:I

.field private tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;"
        }
    .end annotation
.end field

.field private final textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Lorg/json/JSONObject;",
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


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/WorkAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/WorkAdapter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/WorkAdapter;->Companion:Lcom/zinhao/kikoeru/WorkAdapter$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;I)V"
        }
    .end annotation

    const-string v0, "datas"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    .line 24
    iput p2, p0, Lcom/zinhao/kikoeru/WorkAdapter;->layoutType:I

    .line 70
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$1;

    invoke-direct {p1}, Lcom/zinhao/kikoeru/WorkAdapter$1;-><init>()V

    check-cast p1, Lcom/zinhao/kikoeru/TagsView$TextGet;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/16 p2, 0x34f

    .line 22
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/zinhao/kikoeru/WorkAdapter;-><init>(Ljava/util/List;I)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-boolean p0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->isLoading:Z

    add-int/2addr v0, p0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 190
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isLoading()Z
    .locals 0

    .line 35
    iget-boolean p0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->isLoading:Z

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 13

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne p2, v0, :cond_0

    goto/16 :goto_3

    .line 106
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/json/JSONObject;

    .line 107
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 108
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->itemLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 110
    instance-of v0, p1, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    const-string v1, "title"

    const-string v2, "name"

    const-string v3, "format(...)"

    const/4 v4, 0x0

    const-string v5, "id"

    const/4 v6, 0x1

    if-eqz v0, :cond_1

    .line 112
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvTitle()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvComArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    invoke-static {p2}, Lcom/zinhao/kikoeru/App;->getVasList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v7

    sget-object v8, Lcom/zinhao/kikoeru/TagsView;->JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    invoke-virtual {v8, v2}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->setKey(Ljava/lang/String;)Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    move-result-object v8

    check-cast v8, Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v7, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 114
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvComArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object v7, p0, Lcom/zinhao/kikoeru/WorkAdapter;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, v7}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 115
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    invoke-static {p2}, Lcom/zinhao/kikoeru/App;->getTagsList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v7

    iget-object v8, p0, Lcom/zinhao/kikoeru/WorkAdapter;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v7, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 116
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    new-array v7, v6, [Ljava/lang/String;

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    sget-object v8, Lcom/zinhao/kikoeru/TagsView;->STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v7, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 117
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object v7, p0, Lcom/zinhao/kikoeru/WorkAdapter;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, v7}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 118
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object v7, p0, Lcom/zinhao/kikoeru/WorkAdapter;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, v7}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 119
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    .line 120
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v8

    invoke-virtual {v8}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v8

    invoke-virtual {v8}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 121
    const-string v8, "/api/cover/%d?type=sam&token=%s"

    .line 122
    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 123
    sget-object v10, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    const/4 v10, 0x2

    .line 120
    invoke-static {v9, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 119
    invoke-virtual {v0, v7}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 126
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v7

    invoke-virtual {v7}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    move-object v7, p1

    check-cast v7, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-virtual {v7}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;->getIvCover()Landroid/widget/ImageView;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 128
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 129
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v7

    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {v7, v0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    .line 132
    :cond_1
    :goto_0
    instance-of v0, p1, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    const/4 v7, 0x4

    const-string v8, "release"

    const-string v9, "RJ%d"

    const-string v10, "host"

    if-eqz v0, :cond_4

    .line 135
    :try_start_1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    int-to-long v11, v11

    invoke-static {v11, v12}, Lcom/zinhao/kikoeru/Api;->fullCoverImageUrl(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 136
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v11

    invoke-virtual {v11}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v11

    invoke-virtual {v0, v11}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    move-object v11, p1

    check-cast v11, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v11}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getIvCover()Landroid/widget/ImageView;

    move-result-object v11

    invoke-virtual {v0, v11}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 137
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvTitle()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    invoke-static {p2}, Lcom/zinhao/kikoeru/App;->getVasList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v1

    sget-object v11, Lcom/zinhao/kikoeru/TagsView;->JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    invoke-virtual {v11, v2}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->setKey(Ljava/lang/String;)Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    move-result-object v11

    check-cast v11, Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v1, v11}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 139
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 140
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    invoke-static {p2}, Lcom/zinhao/kikoeru/App;->getTagsList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v1

    iget-object v11, p0, Lcom/zinhao/kikoeru/WorkAdapter;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v1, v11}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 141
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    new-array v1, v6, [Ljava/lang/String;

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/zinhao/kikoeru/TagsView;->STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v0, v1, v2}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 142
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 143
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v0

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/TagsView;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 144
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvRjNumber()Landroid/widget/TextView;

    move-result-object p0

    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 147
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v0, p0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 148
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object p0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 150
    :cond_2
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 151
    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object v0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    :goto_1
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvPrice()Landroid/widget/TextView;

    move-result-object p0

    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v0, "%d \u65e5\u5143"

    const-string v1, "price"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvSaleCount()Landroid/widget/TextView;

    move-result-object p0

    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v0, "\u552e\u51fa\uff1a%d"

    const-string v1, "dl_count"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    invoke-virtual {p2, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 157
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 158
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 160
    :cond_3
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v7}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    .line 163
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 164
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    check-cast p0, Ljava/lang/Exception;

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    .line 168
    :cond_4
    :goto_2
    instance-of p0, p1, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    if-eqz p0, :cond_6

    .line 171
    :try_start_2
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p0

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/Api;->fullCoverImageUrl(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    .line 172
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->getRadius5Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p0

    move-object v0, p1

    check-cast v0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getIvCover()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 173
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getTvRjNumber()Landroid/widget/TextView;

    move-result-object p0

    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getTvDate()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    invoke-virtual {p2, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 176
    move-object p0, p1

    check-cast p0, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 177
    check-cast p1, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 179
    :cond_5
    check-cast p1, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p0, v7}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    :catch_2
    move-exception p0

    .line 182
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 183
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    check-cast p0, Ljava/lang/Exception;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :cond_6
    :goto_3
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    const-string v0, "parent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p2, v0, :cond_0

    .line 83
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_loading:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 84
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$LoadingViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkAdapter$LoadingViewHolder;-><init>(Landroid/view/View;)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p1

    .line 86
    :cond_0
    iget p0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->layoutType:I

    const/16 p2, 0x34e

    if-ne p0, p2, :cond_1

    .line 87
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_1:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 88
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkAdapter$SimpleViewHolder;-><init>(Landroid/view/View;)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p1

    :cond_1
    const/16 p2, 0x350

    if-ne p0, p2, :cond_2

    .line 90
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 91
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;-><init>(Landroid/view/View;)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p1

    :cond_2
    const/16 p2, 0x351

    if-ne p0, p2, :cond_3

    .line 93
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 94
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkAdapter$GirdViewHolder;-><init>(Landroid/view/View;)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object p1

    .line 96
    :cond_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_3:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 97
    new-instance p1, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkAdapter$SmallGirdViewHolder;-><init>(Landroid/view/View;)V

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

    .line 58
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method

.method public final setItemClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public final setItemLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->itemLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public final setLoading(Z)V
    .locals 1

    .line 39
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/WorkAdapter;->isLoading:Z

    if-eq v0, p1, :cond_1

    .line 40
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->isLoading:Z

    if-eqz p1, :cond_0

    .line 42
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemInserted(I)V

    return-void

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->datas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemRemoved(I)V

    :cond_1
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

    .line 50
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

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

    .line 66
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkAdapter;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method
