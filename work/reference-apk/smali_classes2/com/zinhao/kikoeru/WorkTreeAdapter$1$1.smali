.class Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;
.super Ljava/lang/Object;
.source "WorkTreeAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeAdapter$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 171
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 175
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v1, v1, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->val$item:Lorg/json/JSONObject;

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->access$400(Lcom/zinhao/kikoeru/WorkTreeAdapter;Ljava/lang/String;)V

    .line 176
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v1, v1, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->val$item:Lorg/json/JSONObject;

    const-string v2, "children"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->access$502(Lcom/zinhao/kikoeru/WorkTreeAdapter;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 177
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->access$600(Lcom/zinhao/kikoeru/WorkTreeAdapter;)Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 178
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->access$600(Lcom/zinhao/kikoeru/WorkTreeAdapter;)Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v1, v1, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getRelativePath()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;->onPathChange(Ljava/lang/String;)V

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object v0, v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->mapFileExistValue()V

    .line 181
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;->this$1:Lcom/zinhao/kikoeru/WorkTreeAdapter$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 183
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 184
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
