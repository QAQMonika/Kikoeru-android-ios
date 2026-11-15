.class public interface abstract Lcom/zinhao/kikoeru/LrcRowChangeListener;
.super Ljava/lang/Object;
.source "LrcRowChangeListener.java"


# virtual methods
.method public abstract onLrcChange(Lcom/zinhao/kikoeru/Lrc;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lrc"
        }
    .end annotation
.end method

.method public abstract onSeekChange(Lcom/zinhao/kikoeru/Lrc$LrcRow;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "currentRow"
        }
    .end annotation
.end method
