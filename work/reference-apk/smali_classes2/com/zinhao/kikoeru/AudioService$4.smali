.class Lcom/zinhao/kikoeru/AudioService$4;
.super Lcom/bumptech/glide/request/target/SimpleTarget;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioService;->updateNotificationState()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/SimpleTarget<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioService;

.field final synthetic val$notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioService;Landroidx/core/app/NotificationCompat$Builder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$notificationBuilder"
        }
    .end annotation

    .line 443
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$4;->this$0:Lcom/zinhao/kikoeru/AudioService;

    iput-object p2, p0, Lcom/zinhao/kikoeru/AudioService$4;->val$notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {p0}, Lcom/bumptech/glide/request/target/SimpleTarget;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "errorDrawable"
        }
    .end annotation

    .line 452
    invoke-super {p0, p1}, Lcom/bumptech/glide/request/target/SimpleTarget;->onLoadFailed(Landroid/graphics/drawable/Drawable;)V

    .line 453
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioService$4;->this$0:Lcom/zinhao/kikoeru/AudioService;

    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "load notification cover failed!"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/AudioService;->access$200(Lcom/zinhao/kikoeru/AudioService;Ljava/lang/Exception;)V

    .line 454
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$4;->this$0:Lcom/zinhao/kikoeru/AudioService;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$4;->val$notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    const/16 v0, 0xc

    invoke-virtual {p1, v0, p0}, Lcom/zinhao/kikoeru/AudioService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method public onResourceReady(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bitmap",
            "transition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/bumptech/glide/request/transition/Transition<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 446
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioService$4;->val$notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    .line 447
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$4;->this$0:Lcom/zinhao/kikoeru/AudioService;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioService$4;->val$notificationBuilder:Landroidx/core/app/NotificationCompat$Builder;

    invoke-virtual {p0}, Landroidx/core/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    const/16 p2, 0xc

    invoke-virtual {p1, p2, p0}, Lcom/zinhao/kikoeru/AudioService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method public bridge synthetic onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "bitmap",
            "transition"
        }
    .end annotation

    .line 443
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/AudioService$4;->onResourceReady(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V

    return-void
.end method
