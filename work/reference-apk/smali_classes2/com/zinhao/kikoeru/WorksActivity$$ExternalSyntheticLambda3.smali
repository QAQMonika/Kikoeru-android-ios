.class public final synthetic Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONArray;

.field public final synthetic f$1:Lcom/zinhao/kikoeru/WorksActivity;

.field public final synthetic f$2:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$0:Lorg/json/JSONArray;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$1:Lcom/zinhao/kikoeru/WorksActivity;

    iput-object p3, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$0:Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$1:Lcom/zinhao/kikoeru/WorksActivity;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;->f$2:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Lcom/zinhao/kikoeru/WorksActivity;->$r8$lambda$-SqC4SuStdhG_boj5U7SDJwa07k(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V

    return-void
.end method
