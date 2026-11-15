.class public final Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;
.super Ljava/lang/Object;
.source "WorkTreeActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1",
        "Landroid/view/View$OnClickListener;",
        "onClick",
        "",
        "v",
        "Landroid/view/View;",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 127
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 128
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentDir()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 130
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1$onCompleted$2$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->finish()V

    :cond_0
    return-void
.end method
