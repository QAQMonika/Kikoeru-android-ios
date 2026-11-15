.class public final synthetic Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/zinhao/kikoeru/App;

.field public final synthetic f$1:Lcom/zinhao/kikoeru/db/AudioLrcBind;


# direct methods
.method public synthetic constructor <init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/AudioLrcBind;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;->f$0:Lcom/zinhao/kikoeru/App;

    iput-object p2, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;->f$1:Lcom/zinhao/kikoeru/db/AudioLrcBind;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;->f$0:Lcom/zinhao/kikoeru/App;

    iget-object p0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda2;->f$1:Lcom/zinhao/kikoeru/db/AudioLrcBind;

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->lambda$insertLrcBind$6$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/AudioLrcBind;)V

    return-void
.end method
