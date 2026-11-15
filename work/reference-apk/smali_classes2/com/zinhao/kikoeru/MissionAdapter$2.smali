.class Lcom/zinhao/kikoeru/MissionAdapter$2;
.super Ljava/lang/Object;
.source "MissionAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MissionAdapter;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/MissionAdapter;

.field final synthetic val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MissionAdapter;Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$item",
            "val$v"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 77
    iput-object p1, p0, Lcom/zinhao/kikoeru/MissionAdapter$2;->this$0:Lcom/zinhao/kikoeru/MissionAdapter;

    iput-object p2, p0, Lcom/zinhao/kikoeru/MissionAdapter$2;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    iput-object p3, p0, Lcom/zinhao/kikoeru/MissionAdapter$2;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dialog",
            "which"
        }
    .end annotation

    .line 80
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object p2

    iget-object v0, p0, Lcom/zinhao/kikoeru/MissionAdapter$2;->val$item:Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->getWorkId()I

    move-result v0

    new-instance v1, Lcom/zinhao/kikoeru/MissionAdapter$2$1;

    invoke-direct {v1, p0, p1}, Lcom/zinhao/kikoeru/MissionAdapter$2$1;-><init>(Lcom/zinhao/kikoeru/MissionAdapter$2;Landroid/content/DialogInterface;)V

    invoke-virtual {p2, v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->readLocalWorkById(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void
.end method
