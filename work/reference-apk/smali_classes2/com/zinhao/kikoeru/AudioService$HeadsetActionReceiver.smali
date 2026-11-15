.class Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AudioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/AudioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeadsetActionReceiver"
.end annotation


# instance fields
.field final bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field final intentFilter:Landroid/content/IntentFilter;

.field isActionPause:Z

.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioService;


# direct methods
.method public constructor <init>(Lcom/zinhao/kikoeru/AudioService;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 139
    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 136
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    const/4 p1, 0x0

    .line 137
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    .line 140
    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->intentFilter:Landroid/content/IntentFilter;

    .line 141
    const-string p0, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {p1, p0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 142
    const-string p0, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p1, p0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 143
    const-string p0, "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p1, p0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "intent"
        }
    .end annotation

    if-nez p2, :cond_0

    goto/16 :goto_2

    .line 150
    :cond_0
    const-string p1, "state"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "AudioService"

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 151
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_1

    move p1, v2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 152
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "onReceive: isPlugIn:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_2

    .line 153
    iget-boolean p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    if-eqz p1, :cond_2

    .line 154
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    goto :goto_1

    .line 156
    :cond_2
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    .line 157
    iput-boolean v2, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    .line 160
    :cond_3
    :goto_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 161
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "onReceive: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const-string p2, "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 163
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    const-string p2, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p1, p2}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_4

    .line 164
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    .line 165
    iput-boolean v2, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    return-void

    .line 168
    :cond_4
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz p1, :cond_6

    invoke-virtual {p1, v2}, Landroid/bluetooth/BluetoothAdapter;->getProfileConnectionState(I)I

    move-result p1

    if-nez p1, :cond_6

    .line 169
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    .line 170
    iput-boolean v2, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    return-void

    .line 172
    :cond_5
    const-string p2, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 173
    iget-object p1, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->this$0:Lcom/zinhao/kikoeru/AudioService;

    invoke-static {p1}, Lcom/zinhao/kikoeru/AudioService;->access$100(Lcom/zinhao/kikoeru/AudioService;)Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    .line 174
    iput-boolean v2, p0, Lcom/zinhao/kikoeru/AudioService$HeadsetActionReceiver;->isActionPause:Z

    :cond_6
    :goto_2
    return-void
.end method
