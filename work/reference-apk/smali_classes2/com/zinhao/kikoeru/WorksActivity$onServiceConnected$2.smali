.class public final Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;
.super Ljava/lang/Object;
.source "WorksActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$onServiceConnected$2",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    const-string v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 427
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrentTitle()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCurrentTitle(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "mp4"

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2, v3}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 428
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/VideoPlayerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 430
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 431
    sget v1, Lcom/zinhao/kikoeru/R$id;->imageView:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 433
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast v1, Landroid/app/Activity;

    const-string v2, "hero_bottom"

    .line 432
    invoke-static {v1, p1, v2}, Landroidx/core/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)Landroidx/core/app/ActivityOptionsCompat;

    move-result-object p1

    const-string v1, "makeSceneTransitionAnimation(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 435
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-virtual {p1}, Landroidx/core/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 438
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 439
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
