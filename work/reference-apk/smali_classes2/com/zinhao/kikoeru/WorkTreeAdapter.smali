.class public Lcom/zinhao/kikoeru/WorkTreeAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "WorkTreeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;,
        Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;,
        Lcom/zinhao/kikoeru/WorkTreeAdapter$ParentDirViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final TYPE_FILE:I = 0x128

.field private static final TYPE_HEADER:I = 0x127

.field private static final TYPE_PARENT_DIR:I = 0x129


# instance fields
.field private cachedColor:I

.field private data:Lorg/json/JSONArray;

.field private itemClickListener:Landroid/view/View$OnClickListener;

.field private longClickListener:Landroid/view/View$OnLongClickListener;

.field private parentData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private parentDirClickListener:Landroid/view/View$OnClickListener;

.field private pathChangeListener:Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

.field private pathList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final rjNumber:I

.field private unCacheColor:I


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "rjNumber"
        }
    .end annotation

    .line 64
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const v0, -0x16120a

    .line 40
    iput v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->unCacheColor:I

    const v0, -0x722639

    .line 41
    iput v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->cachedColor:I

    .line 65
    iput p2, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->rjNumber:I

    .line 66
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    .line 67
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    .line 68
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentData:Ljava/util/List;

    .line 69
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->mapFileExistValue()V

    return-void
.end method

.method static synthetic access$400(Lcom/zinhao/kikoeru/WorkTreeAdapter;Ljava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->changeDir(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$502(Lcom/zinhao/kikoeru/WorkTreeAdapter;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    return-object p1
.end method

.method static synthetic access$600(Lcom/zinhao/kikoeru/WorkTreeAdapter;)Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathChangeListener:Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    return-object p0
.end method

.method private changeDir(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "title"
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentData:Ljava/util/List;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public getData()Lorg/json/JSONArray;
    .locals 0

    .line 61
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 235
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

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

    if-nez p1, :cond_0

    const/16 p0, 0x129

    return p0

    :cond_0
    const/16 p0, 0x128

    return p0
.end method

.method public getRelativePath()Ljava/lang/String;
    .locals 3

    .line 222
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    .line 224
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 225
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_0

    .line 227
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 230
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$onBindViewHolder$0$com-zinhao-kikoeru-WorkTreeAdapter(I)V
    .locals 0

    .line 129
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method synthetic lambda$onBindViewHolder$1$com-zinhao-kikoeru-WorkTreeAdapter(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 128
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorkTreeAdapter;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public mapFileExistValue()V
    .locals 5

    const/4 v0, 0x0

    .line 107
    :goto_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 110
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 111
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v2

    iget v3, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->rjNumber:I

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getRelativePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Lcom/zinhao/kikoeru/LocalFileCache;->mapLocalItemFile(Lorg/json/JSONObject;ILjava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 113
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 6
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

    .line 121
    const-string v0, "folder"

    instance-of v1, p1, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    if-eqz v1, :cond_8

    .line 123
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 124
    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 125
    invoke-static {v1}, Lcom/zinhao/kikoeru/DownloadUtils;->mapMission(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    move-result-object v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    const-string v4, "type"

    if-eqz v3, :cond_0

    .line 127
    :try_start_1
    new-instance v5, Lcom/zinhao/kikoeru/WorkTreeAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0, p1, p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorkTreeAdapter;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    invoke-virtual {v3, v5}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setStepCallback(Ljava/lang/Runnable;)V

    .line 132
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getProgress()I

    move-result p2

    .line 133
    move-object v3, p1

    check-cast v3, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$000(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 134
    move-object v3, p1

    check-cast v3, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$000(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;

    move-result-object v3

    invoke-virtual {v3, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 135
    move-object v3, p1

    check-cast v3, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v3}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$100(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v5, "%"

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 137
    :cond_0
    move-object p2, p1

    check-cast p2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$000(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ProgressBar;

    move-result-object p2

    const/16 v3, 0x8

    invoke-virtual {p2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 138
    move-object p2, p1

    check-cast p2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$100(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    :goto_0
    move-object p2, p1

    check-cast p2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$200(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    const-string p2, "file_exists"

    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 143
    move-object p2, p1

    check-cast p2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$200(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object p2

    iget v3, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->cachedColor:I

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 145
    :cond_1
    move-object p2, p1

    check-cast p2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {p2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$200(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object p2

    iget v3, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->unCacheColor:I

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 148
    :goto_1
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 149
    const-string p2, "children"

    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 150
    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$100(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    const-string v3, "%d \u9879"

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {v3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_folder_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto/16 :goto_2

    .line 152
    :cond_2
    const-string p2, "audio"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 153
    const-string p2, ".mp4"

    invoke-virtual {v2, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 154
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_video_library_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto/16 :goto_2

    .line 156
    :cond_3
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_audiotrack_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_2

    .line 158
    :cond_4
    const-string p2, "image"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 159
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_image_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_2

    .line 160
    :cond_5
    const-string p2, "text"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 161
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_text_snippet_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_2

    .line 163
    :cond_6
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object p2

    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_insert_drive_file_24:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    move-object v2, p1

    check-cast v2, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-static {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;->access$300(Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 166
    :goto_2
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 167
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    invoke-direct {v0, p0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeAdapter;Lorg/json/JSONObject;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void

    .line 192
    :cond_7
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 193
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->longClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 197
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 198
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    goto :goto_3

    .line 200
    :cond_8
    instance-of p2, p1, Lcom/zinhao/kikoeru/WorkTreeAdapter$ParentDirViewHolder;

    if-eqz p2, :cond_9

    .line 201
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentDirClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_9
    :goto_3
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 6
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

    .line 83
    iget v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->unCacheColor:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->cachedColor:I

    if-ne v0, v2, :cond_1

    .line 84
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 85
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 86
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x1010040

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    const v3, 0x1010098

    const v4, 0x1010433

    .line 87
    filled-new-array {v3, v4}, [I

    move-result-object v3

    .line 88
    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v2

    const v3, -0x777778

    .line 89
    invoke-virtual {v2, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    iput v3, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->unCacheColor:I

    .line 90
    sget v3, Lcom/zinhao/kikoeru/R$color;->green:I

    invoke-static {v0, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->cachedColor:I

    .line 91
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1
    const/16 p0, 0x128

    if-ne p2, p0, :cond_2

    .line 95
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_tree_1:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 96
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;-><init>(Landroid/view/View;)V

    return-object p1

    :cond_2
    const/16 p0, 0x129

    if-ne p2, p0, :cond_3

    .line 98
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_tree_2:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 99
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeAdapter$ParentDirViewHolder;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter$ParentDirViewHolder;-><init>(Landroid/view/View;)V

    return-object p1

    .line 101
    :cond_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    sget p2, Lcom/zinhao/kikoeru/R$layout;->item_work_tree_1:I

    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 103
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter$SimpleViewHolder;-><init>(Landroid/view/View;)V

    return-object p1
.end method

.method public parentDir()Z
    .locals 3

    .line 211
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentData:Ljava/util/List;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->data:Lorg/json/JSONArray;

    .line 215
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 216
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathChangeListener:Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getRelativePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;->onPathChange(Ljava/lang/String;)V

    .line 217
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->notifyDataSetChanged()V

    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    return v1
.end method

.method public setItemClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "itemClickListener"
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->itemClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setItemLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "longClickListener"
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->longClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public setParentDirClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parentDirClickListener"
        }
    .end annotation

    .line 57
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentDirClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public setPathChangeListener(Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pathChangeListener"
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter;->pathChangeListener:Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    return-void
.end method
