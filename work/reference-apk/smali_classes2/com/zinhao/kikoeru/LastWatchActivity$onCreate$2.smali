.class public final Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;
.super Lcom/zinhao/kikoeru/SuperRecyclerAdapter;
.source "LastWatchActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LastWatchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/zinhao/kikoeru/SuperRecyclerAdapter<",
        "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J\u0010\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u0008H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/LastWatchActivity$onCreate$2",
        "Lcom/zinhao/kikoeru/SuperRecyclerAdapter;",
        "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
        "bindData",
        "",
        "holder",
        "Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;",
        "position",
        "",
        "setLayout",
        "viewType",
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


# instance fields
.field final synthetic $localWorkHistoryList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/zinhao/kikoeru/LastWatchActivity;


# direct methods
.method public static synthetic $r8$lambda$7IZ2phebI6gfzq3FNNcYZAQRbZk(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Lcom/zinhao/kikoeru/LastWatchActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->bindData$lambda$0(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Lcom/zinhao/kikoeru/LastWatchActivity;Landroid/view/View;)V

    return-void
.end method

.method constructor <init>(Ljava/util/List;Lcom/zinhao/kikoeru/LastWatchActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;",
            "Lcom/zinhao/kikoeru/LastWatchActivity;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->$localWorkHistoryList:Ljava/util/List;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/LastWatchActivity;

    .line 30
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter;-><init>(Ljava/util/List;)V

    return-void
.end method

.method private static final bindData$lambda$0(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Lcom/zinhao/kikoeru/LastWatchActivity;Landroid/view/View;)V
    .locals 2

    invoke-static {p1, p0}, Lcom/zinhao/kikoeru/LocalHistory;->open(Landroid/app/Activity;Lcom/zinhao/kikoeru/db/LocalWorkHistory;)Z

    move-result p2

    if-eqz p2, :online_click

    return-void

    :online_click

    .line 44
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    invoke-static {p1}, Lcom/zinhao/kikoeru/LastWatchActivity;->access$getSearchWorkCallback$p(Lcom/zinhao/kikoeru/LastWatchActivity;)Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    move-result-object p1

    invoke-static {p0, p2, p1}, Lcom/zinhao/kikoeru/Api;->doGetWork(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method


# virtual methods
.method public bindData(Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;I)V
    .locals 4

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->$localWorkHistoryList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/zinhao/kikoeru/db/LocalWorkHistory;

    iget-object v0, p0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/LastWatchActivity;

    iget-object v1, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    invoke-static {v0, v1, p2}, Lcom/zinhao/kikoeru/LocalHistory;->bind(Landroid/app/Activity;Landroid/view/View;Lcom/zinhao/kikoeru/db/LocalWorkHistory;)Z

    move-result v0

    if-eqz v0, :online_bind

    return-void

    :online_bind

    .line 34
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/Api;->fullCoverImageUrl(J)Ljava/lang/String;

    move-result-object v0

    .line 35
    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getTitle()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/zinhao/kikoeru/R$id;->tvTitle:I

    invoke-virtual {p1, v1, v2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->setText(Ljava/lang/String;I)V

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RJ"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getRjNumber()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/zinhao/kikoeru/R$id;->tvRJ:I

    invoke-virtual {p1, v1, v2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->setText(Ljava/lang/String;I)V

    .line 37
    const-string v1, "yyyy-MM-dd HH:mm:ss"

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;->getPosition()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/zinhao/kikoeru/R$id;->tvDate:I

    invoke-virtual {p1, v1, v2}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->setText(Ljava/lang/String;I)V

    .line 38
    sget v1, Lcom/zinhao/kikoeru/R$id;->ivCover:I

    invoke-virtual {p1, v1}, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->getView(I)Landroid/view/View;

    move-result-object v1

    .line 39
    instance-of v2, v1, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 40
    iget-object v2, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/bumptech/glide/Glide;->with(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 41
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 42
    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 44
    :cond_0
    iget-object p1, p1, Lcom/zinhao/kikoeru/SuperRecyclerAdapter$SuperVHolder;->itemView:Landroid/view/View;

    iget-object p0, p0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2;->this$0:Lcom/zinhao/kikoeru/LastWatchActivity;

    new-instance v0, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2, p0}, Lcom/zinhao/kikoeru/LastWatchActivity$onCreate$2$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Lcom/zinhao/kikoeru/LastWatchActivity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setLayout(I)I
    .locals 0

    .line 48
    sget p0, Lcom/zinhao/kikoeru/R$layout;->item_recent_work:I

    return p0
.end method
