.class public interface abstract Lcom/zinhao/kikoeru/db/LocalWorkHistoryDao;
.super Ljava/lang/Object;
.source "LocalWorkHistoryDao.java"


# virtual methods
.method public abstract delete(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "his"
        }
    .end annotation
.end method

.method public abstract getAllHis()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/LocalWorkHistory;",
            ">;"
        }
    .end annotation
.end method

.method public abstract insertOrReplace(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "his"
        }
    .end annotation
.end method

.method public abstract update(Lcom/zinhao/kikoeru/db/LocalWorkHistory;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "his"
        }
    .end annotation
.end method
