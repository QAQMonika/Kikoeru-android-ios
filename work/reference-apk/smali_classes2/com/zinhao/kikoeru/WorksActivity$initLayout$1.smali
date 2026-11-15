.class public final Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "WorksActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/WorksActivity;->initLayout(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0003H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "com/zinhao/kikoeru/WorksActivity$initLayout$1",
        "Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;",
        "getSpanSize",
        "",
        "position",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $col:I

.field final synthetic this$0:Lcom/zinhao/kikoeru/WorksActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/WorksActivity;I)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    iput p2, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;->$col:I

    .line 613
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1

    .line 615
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;->this$0:Lcom/zinhao/kikoeru/WorksActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/WorksActivity;->access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "works"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 616
    iget p0, p0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;->$col:I

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method
