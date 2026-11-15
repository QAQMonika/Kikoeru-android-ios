.class public final Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "WorksViewModel.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010 \u001a\u00020!J\u0006\u0010\"\u001a\u00020!J\u0006\u0010#\u001a\u00020!J\u0006\u0010$\u001a\u00020!J\u0006\u0010%\u001a\u00020!J\u0006\u0010&\u001a\u00020!R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082D\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\n\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\r\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u000e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0011R\u001a\u0010\u0015\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0016\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0011R\u001a\u0010\u0018\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0019\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0011R\u001a\u0010\u001b\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u001c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\t0\u00080\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001d\u0010\u0011R\u000e\u0010\u001e\u001a\u00020\u001fX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;",
        "Landroidx/lifecycle/ViewModel;",
        "<init>",
        "()V",
        "TAG",
        "",
        "_allWorksList",
        "Landroidx/lifecycle/MutableLiveData;",
        "",
        "Lcom/zinhao/kikoeru/model/Work;",
        "worksList",
        "getWorksList",
        "()Landroidx/lifecycle/MutableLiveData;",
        "_listeningWorksList",
        "listeningWorksList",
        "Landroidx/lifecycle/LiveData;",
        "getListeningWorksList",
        "()Landroidx/lifecycle/LiveData;",
        "_listenedWorksList",
        "listenedWorksList",
        "getListenedWorksList",
        "_markedWorksList",
        "markedWorksList",
        "getMarkedWorksList",
        "_replayWorksList",
        "replayWorksList",
        "getReplayWorksList",
        "_postponedWorksList",
        "postponedWorksList",
        "getPostponedWorksList",
        "gson",
        "Lcom/google/gson/Gson;",
        "loadAllWorks",
        "",
        "loadListeningWorks",
        "loadListenedWorks",
        "loadMarkedWorks",
        "loadReplayWorks",
        "loadPostponedWorks",
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
.field private final TAG:Ljava/lang/String;

.field private final _allWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final _listenedWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final _listeningWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final _markedWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final _postponedWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final _replayWorksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final gson:Lcom/google/gson/Gson;

.field private final listenedWorksList:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final listeningWorksList:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final markedWorksList:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final postponedWorksList:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final replayWorksList:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field

.field private final worksList:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 17
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 18
    const-string v0, "WorksViewModel"

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->TAG:Ljava/lang/String;

    .line 19
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_allWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 20
    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->worksList:Landroidx/lifecycle/MutableLiveData;

    .line 22
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_listeningWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 23
    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->listeningWorksList:Landroidx/lifecycle/LiveData;

    .line 25
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_listenedWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 26
    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->listenedWorksList:Landroidx/lifecycle/LiveData;

    .line 28
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_markedWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 29
    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->markedWorksList:Landroidx/lifecycle/LiveData;

    .line 31
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_replayWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 32
    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->replayWorksList:Landroidx/lifecycle/LiveData;

    .line 34
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_postponedWorksList:Landroidx/lifecycle/MutableLiveData;

    .line 35
    check-cast v0, Landroidx/lifecycle/LiveData;

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->postponedWorksList:Landroidx/lifecycle/LiveData;

    .line 37
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->gson:Lcom/google/gson/Gson;

    return-void
.end method

.method public static final synthetic access$getGson$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Lcom/google/gson/Gson;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->gson:Lcom/google/gson/Gson;

    return-object p0
.end method

.method public static final synthetic access$getTAG$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Ljava/lang/String;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$get_allWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_allWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public static final synthetic access$get_listenedWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_listenedWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public static final synthetic access$get_listeningWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_listeningWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public static final synthetic access$get_markedWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_markedWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public static final synthetic access$get_postponedWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_postponedWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public static final synthetic access$get_replayWorksList$p(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)Landroidx/lifecycle/MutableLiveData;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->_replayWorksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method


# virtual methods
.method public final getListenedWorksList()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 26
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->listenedWorksList:Landroidx/lifecycle/LiveData;

    return-object p0
.end method

.method public final getListeningWorksList()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 23
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->listeningWorksList:Landroidx/lifecycle/LiveData;

    return-object p0
.end method

.method public final getMarkedWorksList()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 29
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->markedWorksList:Landroidx/lifecycle/LiveData;

    return-object p0
.end method

.method public final getPostponedWorksList()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 35
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->postponedWorksList:Landroidx/lifecycle/LiveData;

    return-object p0
.end method

.method public final getReplayWorksList()Landroidx/lifecycle/LiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 32
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->replayWorksList:Landroidx/lifecycle/LiveData;

    return-object p0
.end method

.method public final getWorksList()Landroidx/lifecycle/MutableLiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/model/Work;",
            ">;>;"
        }
    .end annotation

    .line 20
    iget-object p0, p0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;->worksList:Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public final loadAllWorks()V
    .locals 1

    .line 40
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadAllWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadAllWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const/4 p0, 0x1

    invoke-static {p0, v0}, Lcom/zinhao/kikoeru/Api;->doGetWorks(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public final loadListenedWorks()V
    .locals 2

    .line 102
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadListenedWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadListenedWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string p0, "listened"

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public final loadListeningWorks()V
    .locals 2

    .line 71
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadListeningWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadListeningWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string p0, "listening"

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public final loadMarkedWorks()V
    .locals 2

    .line 133
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadMarkedWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadMarkedWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string p0, "marked"

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public final loadPostponedWorks()V
    .locals 2

    .line 195
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadPostponedWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string p0, "postponed"

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method

.method public final loadReplayWorks()V
    .locals 2

    .line 164
    new-instance v0, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadReplayWorks$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/viewmodel/WorksViewModel$loadReplayWorks$1;-><init>(Lcom/zinhao/kikoeru/viewmodel/WorksViewModel;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string p0, "replay"

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method
