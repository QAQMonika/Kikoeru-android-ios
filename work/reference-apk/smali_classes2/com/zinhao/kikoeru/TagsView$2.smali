.class Lcom/zinhao/kikoeru/TagsView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "TagsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/TagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/TagsView;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/TagsView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 131
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onContextClick(Landroid/view/MotionEvent;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 134
    const-string v0, "TagsView"

    const-string v1, "onContextClick: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v0}, Lcom/zinhao/kikoeru/TagsView;->access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    .line 137
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 138
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 163
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v0}, Lcom/zinhao/kikoeru/TagsView;->access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    .line 165
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 166
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 175
    const-string v0, "TagsView"

    const-string v1, "onSingleTapConfirmed: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v0}, Lcom/zinhao/kikoeru/TagsView;->access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    .line 178
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 179
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 180
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {p1}, Lcom/zinhao/kikoeru/TagsView;->access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/TagsView;->getTagByIndex(I)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/zinhao/kikoeru/TagsView$TagClickListener;->onTagClick(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .line 147
    const-string v0, "TagsView"

    const-string v1, "onSingleTapUp: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v0}, Lcom/zinhao/kikoeru/TagsView;->access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    .line 150
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 151
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView$2;->this$0:Lcom/zinhao/kikoeru/TagsView;

    invoke-static {v2}, Lcom/zinhao/kikoeru/TagsView;->access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method
