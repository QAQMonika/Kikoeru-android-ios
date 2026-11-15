.class Lcom/zinhao/kikoeru/WorkTreeAdapter$1;
.super Ljava/lang/Object;
.source "WorkTreeAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorkTreeAdapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

.field final synthetic val$item:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorkTreeAdapter;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$item"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 167
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->this$0:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1;->val$item:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 171
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter$1$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeAdapter$1;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
