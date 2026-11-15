.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity;->onCreate(Landroid/os/Bundle;)V
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
        "com/zinhao/kikoeru/AudioPlayerActivity$onCreate$5",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 104
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 105
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    .line 106
    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    if-nez p1, :cond_1

    goto/16 :goto_1

    .line 108
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, v0, :cond_2

    .line 109
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setReapAll()V

    .line 110
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    move-object v0, p1

    check-cast v0, Landroid/content/Context;

    sget v2, Lcom/zinhao/kikoeru/R$string;->all_repeat:I

    invoke-virtual {p1, v2}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 111
    :cond_2
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 112
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setReapOff()V

    .line 113
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    move-object v0, p1

    check-cast v0, Landroid/content/Context;

    sget v2, Lcom/zinhao/kikoeru/R$string;->repeat_off:I

    invoke-virtual {p1, v2}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 114
    :cond_3
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getReapMode()I

    move-result p1

    if-nez p1, :cond_4

    .line 115
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getCtrlBinder$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->setReapOne()V

    .line 116
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    move-object v0, p1

    check-cast v0, Landroid/content/Context;

    sget v2, Lcom/zinhao/kikoeru/R$string;->repeat_one:I

    invoke-virtual {p1, v2}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 118
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onCreate$5;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$updateLoopIcon(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    :cond_5
    :goto_1
    return-void
.end method
