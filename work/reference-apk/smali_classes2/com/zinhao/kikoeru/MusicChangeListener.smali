.class public interface abstract Lcom/zinhao/kikoeru/MusicChangeListener;
.super Ljava/lang/Object;
.source "MusicChangeListener.java"


# virtual methods
.method public abstract onAlbumChange(J)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rjNumber"
        }
    .end annotation
.end method

.method public abstract onAudioChange(Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audio"
        }
    .end annotation
.end method

.method public abstract onStatusChange(I)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "status"
        }
    .end annotation
.end method
