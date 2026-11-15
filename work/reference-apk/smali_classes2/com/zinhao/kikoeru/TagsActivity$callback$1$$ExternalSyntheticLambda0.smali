.class public final synthetic Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/zinhao/kikoeru/TagsActivity;

.field public final synthetic f$1:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;->f$0:Lcom/zinhao/kikoeru/TagsActivity;

    iput-object p2, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;->f$0:Lcom/zinhao/kikoeru/TagsActivity;

    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsActivity$callback$1$$ExternalSyntheticLambda0;->f$1:Lorg/json/JSONArray;

    invoke-static {v0, p0}, Lcom/zinhao/kikoeru/TagsActivity$callback$1;->$r8$lambda$P3Lw9chtKKnjwpZko406MzREFYE(Lcom/zinhao/kikoeru/TagsActivity;Lorg/json/JSONArray;)V

    return-void
.end method
