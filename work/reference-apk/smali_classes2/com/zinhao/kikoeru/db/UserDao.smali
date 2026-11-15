.class public interface abstract Lcom/zinhao/kikoeru/db/UserDao;
.super Ljava/lang/Object;
.source "UserDao.java"


# virtual methods
.method public abstract delete(Lcom/zinhao/kikoeru/db/User;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation
.end method

.method public abstract getAllUser()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/db/User;",
            ">;"
        }
    .end annotation
.end method

.method public abstract insert(Lcom/zinhao/kikoeru/db/User;)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation
.end method

.method public abstract update(Lcom/zinhao/kikoeru/db/User;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "user"
        }
    .end annotation
.end method
