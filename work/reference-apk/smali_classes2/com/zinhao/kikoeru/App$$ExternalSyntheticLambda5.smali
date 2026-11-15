.class public final synthetic Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/zinhao/kikoeru/App;

.field public final synthetic f$1:Lcom/zinhao/kikoeru/db/User;

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/zinhao/kikoeru/App;Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$0:Lcom/zinhao/kikoeru/App;

    iput-object p2, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$1:Lcom/zinhao/kikoeru/db/User;

    iput-object p3, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$0:Lcom/zinhao/kikoeru/App;

    iget-object v1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$1:Lcom/zinhao/kikoeru/db/User;

    iget-object p0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda5;->f$2:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/App;->lambda$insertUser$2$com-zinhao-kikoeru-App(Lcom/zinhao/kikoeru/db/User;Ljava/lang/Runnable;)V

    return-void
.end method
