.class public interface abstract Lcom/zinhao/kikoeru/db/AudioLrcBindDao;
.super Ljava/lang/Object;
.source "AudioLrcBindDao.java"


# virtual methods
.method public abstract deleteLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audioLrcBind"
        }
    .end annotation
.end method

.method public abstract getLrcBind(JLjava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rjNumber",
            "audioPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLrcBind(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audioPath"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/AudioLrcBind;",
            ">;"
        }
    .end annotation
.end method

.method public abstract insertLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audioLrcBind"
        }
    .end annotation
.end method

.method public abstract updateLrcBind(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "audioLrcBind"
        }
    .end annotation
.end method
