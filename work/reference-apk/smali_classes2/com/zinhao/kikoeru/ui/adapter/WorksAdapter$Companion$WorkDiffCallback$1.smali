.class public final Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;
.super Landroidx/recyclerview/widget/DiffUtil$ItemCallback;
.source "WorksAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/DiffUtil$ItemCallback<",
        "Lcom/zinhao/kikoeru/model/Work;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016J\u0018\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0002H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "com/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1",
        "Landroidx/recyclerview/widget/DiffUtil$ItemCallback;",
        "Lcom/zinhao/kikoeru/model/Work;",
        "areItemsTheSame",
        "",
        "oldItem",
        "newItem",
        "areContentsTheSame",
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


# direct methods
.method constructor <init>()V
    .locals 0

    .line 143
    invoke-direct {p0}, Landroidx/recyclerview/widget/DiffUtil$ItemCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public areContentsTheSame(Lcom/zinhao/kikoeru/model/Work;Lcom/zinhao/kikoeru/model/Work;)Z
    .locals 0

    const-string p0, "oldItem"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "newItem"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 143
    check-cast p1, Lcom/zinhao/kikoeru/model/Work;

    check-cast p2, Lcom/zinhao/kikoeru/model/Work;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;->areContentsTheSame(Lcom/zinhao/kikoeru/model/Work;Lcom/zinhao/kikoeru/model/Work;)Z

    move-result p0

    return p0
.end method

.method public areItemsTheSame(Lcom/zinhao/kikoeru/model/Work;Lcom/zinhao/kikoeru/model/Work;)Z
    .locals 0

    const-string p0, "oldItem"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "newItem"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 148
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/model/Work;->getId()I

    move-result p0

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/model/Work;->getId()I

    move-result p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 143
    check-cast p1, Lcom/zinhao/kikoeru/model/Work;

    check-cast p2, Lcom/zinhao/kikoeru/model/Work;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/ui/adapter/WorksAdapter$Companion$WorkDiffCallback$1;->areItemsTheSame(Lcom/zinhao/kikoeru/model/Work;Lcom/zinhao/kikoeru/model/Work;)Z

    move-result p0

    return p0
.end method
