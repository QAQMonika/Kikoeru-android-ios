.class public final synthetic Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/zinhao/kikoeru/App;

.field public final synthetic f$1:Lcom/zinhao/kikoeru/db/User;


# direct methods
.method public synthetic constructor <init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/User;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;->f$0:Lcom/zinhao/kikoeru/App;

    iput-object p2, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;->f$1:Lcom/zinhao/kikoeru/db/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;->f$0:Lcom/zinhao/kikoeru/App;

    iget-object p0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda7;->f$1:Lcom/zinhao/kikoeru/db/User;

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->lambda$deleteUser$3$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/User;)V

    return-void
.end method
