.class public final synthetic Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/zinhao/kikoeru/App;

.field public final synthetic f$1:J

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Lcom/zinhao/kikoeru/App$DatabaseResultCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/zinhao/kikoeru/App;JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$0:Lcom/zinhao/kikoeru/App;

    iput-wide p2, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$1:J

    iput-object p4, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-object p5, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$3:Lcom/zinhao/kikoeru/App$DatabaseResultCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$0:Lcom/zinhao/kikoeru/App;

    iget-wide v1, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$1:J

    iget-object v3, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-object p0, p0, Lcom/zinhao/kikoeru/App$$ExternalSyntheticLambda0;->f$3:Lcom/zinhao/kikoeru/App$DatabaseResultCallback;

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/zinhao/kikoeru/App;->lambda$getLrcBind$7$com-zinhao-kikoeru-App(JLjava/lang/String;Lcom/zinhao/kikoeru/App$DatabaseResultCallback;)V

    return-void
.end method
