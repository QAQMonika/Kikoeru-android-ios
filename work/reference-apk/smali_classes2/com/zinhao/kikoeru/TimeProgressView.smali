.class public Lcom/zinhao/kikoeru/TimeProgressView;
.super Landroid/view/View;
.source "TimeProgressView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final MIN_HEIGHT:I = 0x32

.field private static final MIN_WIDTH:I = 0x190

.field public static final Millis_SECOND:I = 0xea60

.field private static final SECOND:I = 0x3c


# instance fields
.field allProgressWidth:F

.field private final alreadyPassRect:Landroid/graphics/RectF;

.field barBottomY:F

.field barEndX:F

.field barStartX:F

.field barTopY:F

.field private buffer:I

.field private final bufferRect:Landroid/graphics/RectF;

.field private isTouch:Z

.field private listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private max:I

.field private maxTimeStr:Ljava/lang/String;

.field private min:I

.field private progress:I

.field private final progressPointRect:Landroid/graphics/RectF;

.field private final remainRect:Landroid/graphics/RectF;

.field private final seekBarPaint:Landroid/graphics/Paint;

.field private textDistance:F

.field private final textPaint:Landroid/graphics/Paint;

.field private textY:F

.field private thumbHeight:F

.field private thumbWidth:F

.field public type:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0}, Lcom/zinhao/kikoeru/TimeProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    const/4 v0, 0x0

    .line 52
    invoke-direct {p0, p1, p2, v0}, Lcom/zinhao/kikoeru/TimeProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr"
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p2, 0x64

    .line 29
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    const/4 p2, 0x0

    .line 31
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 32
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->buffer:I

    .line 39
    const-string p2, "00:00"

    iput-object p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->maxTimeStr:Ljava/lang/String;

    const p2, 0xea60

    .line 42
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->type:I

    .line 57
    new-instance p2, Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-direct {p2, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textPaint:Landroid/graphics/Paint;

    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x2

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 p1, -0x1000000

    .line 59
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 60
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->alreadyPassRect:Landroid/graphics/RectF;

    .line 61
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progressPointRect:Landroid/graphics/RectF;

    .line 62
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->remainRect:Landroid/graphics/RectF;

    .line 63
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->bufferRect:Landroid/graphics/RectF;

    .line 64
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    const/4 p3, -0x1

    .line 65
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    sget-object p3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 67
    invoke-virtual {p2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object p1

    .line 68
    iget p2, p1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    iget p3, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr p2, p3

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    sub-float/2addr p2, p1

    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textDistance:F

    .line 69
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p2, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    .line 70
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/high16 p2, 0x41a00000    # 20.0f

    invoke-static {p2, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbHeight:F

    .line 71
    invoke-virtual {p0, p0}, Lcom/zinhao/kikoeru/TimeProgressView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private static dp2px(FLandroid/util/DisplayMetrics;)F
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dp",
            "displayMetrics"
        }
    .end annotation

    const/4 v0, 0x1

    .line 271
    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    return p0
.end method

.method private makeCurrentTimeStr()Ljava/lang/String;
    .locals 2

    .line 126
    iget v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    iget p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->type:I

    div-int v1, v0, p0

    .line 127
    rem-int/2addr v0, p0

    div-int/lit8 p0, p0, 0x3c

    div-int/2addr v0, p0

    .line 128
    sget-object p0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v1, v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%02d:%02d"

    invoke-static {p0, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private makeMaxTimeStr()Ljava/lang/String;
    .locals 2

    .line 133
    iget v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    iget p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->type:I

    div-int v1, v0, p0

    .line 134
    rem-int/2addr v0, p0

    div-int/lit8 p0, p0, 0x3c

    div-int/2addr v0, p0

    .line 135
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "%02d:%02d"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getMax()I
    .locals 0

    .line 103
    iget p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    return p0
.end method

.method public getMin()I
    .locals 0

    .line 118
    iget p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->min:I

    return p0
.end method

.method public getType()I
    .locals 0

    .line 82
    iget p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->type:I

    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canvas"
        }
    .end annotation

    .line 185
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 187
    iget v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    int-to-float v0, v0

    iget v1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 188
    iget v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->buffer:I

    int-to-float v2, v2

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 190
    iget v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->allProgressWidth:F

    mul-float/2addr v0, v2

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    add-float/2addr v0, v3

    iget v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v4, v5

    sub-float/2addr v0, v6

    mul-float/2addr v2, v1

    add-float/2addr v2, v3

    div-float/2addr v4, v5

    sub-float/2addr v2, v4

    .line 192
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v5

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbHeight:F

    div-float v4, v3, v5

    sub-float/2addr v1, v4

    add-float/2addr v3, v1

    .line 195
    iget-object v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->alreadyPassRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    iget v7, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barTopY:F

    iget v8, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    div-float/2addr v8, v5

    add-float/2addr v8, v0

    iget v9, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barBottomY:F

    invoke-virtual {v4, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 197
    iget-object v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->remainRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    div-float/2addr v6, v5

    add-float/2addr v6, v0

    iget v7, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barTopY:F

    iget v8, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    iget v9, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barBottomY:F

    invoke-virtual {v4, v6, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 199
    iget-object v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progressPointRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    add-float/2addr v6, v0

    invoke-virtual {v4, v0, v1, v6, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 201
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->bufferRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barTopY:F

    iget v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    div-float/2addr v4, v5

    add-float/2addr v2, v4

    iget v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barBottomY:F

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 203
    invoke-direct {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->makeCurrentTimeStr()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textY:F

    iget-object v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 204
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->maxTimeStr:Ljava/lang/String;

    iget v1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    iget v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    div-float/2addr v2, v5

    add-float/2addr v1, v2

    iget v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textY:F

    iget-object v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 206
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 207
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->bufferRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    div-float/2addr v2, v3

    iget-object v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->bufferRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float/2addr v4, v3

    iget-object v5, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 209
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 210
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->alreadyPassRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float/2addr v4, v3

    iget-object v5, p0, Lcom/zinhao/kikoeru/TimeProgressView;->alreadyPassRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float/2addr v5, v3

    iget-object v6, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 212
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 213
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->remainRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v1, v3

    iget-object v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->remainRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float/2addr v4, v3

    iget-object v5, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v4, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 215
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 216
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progressPointRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v1, v3

    iget-object v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progressPointRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v3

    iget-object p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "changed",
            "left",
            "top",
            "right",
            "bottom"
        }
    .end annotation

    .line 174
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 140
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 141
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    .line 143
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 144
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v2, 0x42480000    # 50.0f

    const/high16 v3, 0x43c80000    # 400.0f

    const/high16 v4, -0x80000000

    if-ne p1, v4, :cond_0

    if-ne p2, v4, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int v0, p1

    .line 152
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    :goto_0
    float-to-int v1, p1

    goto :goto_1

    :cond_0
    if-ne p1, v4, :cond_1

    .line 155
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int v0, p1

    goto :goto_1

    :cond_1
    if-ne p2, v4, :cond_2

    .line 157
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/zinhao/kikoeru/TimeProgressView;->dp2px(FLandroid/util/DisplayMetrics;)F

    move-result p1

    goto :goto_0

    :cond_2
    :goto_1
    int-to-float p1, v1

    const/high16 p2, 0x40000000    # 2.0f

    div-float v2, p1, p2

    .line 160
    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textDistance:F

    add-float/2addr v3, v2

    iput v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textY:F

    .line 161
    iget-object v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textPaint:Landroid/graphics/Paint;

    const-string v4, "00:00"

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    iget v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    div-float/2addr v4, p2

    add-float/2addr v3, v4

    iput v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    int-to-float v4, v0

    sub-float/2addr v4, v3

    .line 162
    iput v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    const/high16 v5, 0x40a00000    # 5.0f

    div-float/2addr p1, v5

    mul-float/2addr p2, p1

    .line 163
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barTopY:F

    const/high16 p2, 0x40400000    # 3.0f

    mul-float/2addr p1, p2

    .line 164
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barBottomY:F

    sub-float/2addr v4, v3

    .line 165
    iput v4, p0, Lcom/zinhao/kikoeru/TimeProgressView;->allProgressWidth:F

    .line 166
    iput v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbHeight:F

    div-float/2addr v2, p2

    .line 167
    iput v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->thumbWidth:F

    .line 169
    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/TimeProgressView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "v",
            "event"
        }
    .end annotation

    .line 227
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    .line 228
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_6

    if-eq p1, v2, :cond_4

    const/4 v3, 0x2

    if-eq p1, v3, :cond_0

    goto/16 :goto_1

    .line 243
    :cond_0
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    cmpg-float v3, p2, p1

    if-ltz v3, :cond_3

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    cmpl-float v3, p2, v3

    if-lez v3, :cond_1

    goto :goto_0

    :cond_1
    sub-float/2addr p2, p1

    .line 247
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->allProgressWidth:F

    div-float/2addr p2, p1

    .line 248
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    int-to-float p1, p1

    mul-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 249
    iget-object p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    if-eqz p2, :cond_2

    .line 250
    invoke-interface {p2, v1, p1, v0}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 251
    :cond_2
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    goto :goto_1

    :cond_3
    :goto_0
    return v2

    .line 254
    :cond_4
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->isTouch:Z

    .line 255
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    iget v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 256
    iget p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    sub-float/2addr p1, p2

    .line 257
    iget p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->allProgressWidth:F

    div-float/2addr p1, p2

    .line 258
    iget p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    int-to-float p2, p2

    mul-float/2addr p2, p1

    float-to-int p1, p2

    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 259
    iget-object p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    if-eqz p2, :cond_5

    .line 260
    invoke-interface {p2, v1, p1, v2}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 261
    :cond_5
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    .line 262
    iget-object p0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-interface {p0, v1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStopTrackingTouch(Landroid/widget/SeekBar;)V

    goto :goto_1

    .line 232
    :cond_6
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barStartX:F

    cmpg-float v3, p2, p1

    if-ltz v3, :cond_8

    iget v3, p0, Lcom/zinhao/kikoeru/TimeProgressView;->barEndX:F

    cmpl-float v3, p2, v3

    if-lez v3, :cond_7

    goto :goto_2

    .line 235
    :cond_7
    iput-boolean v2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->isTouch:Z

    sub-float/2addr p2, p1

    .line 237
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->allProgressWidth:F

    div-float/2addr p2, p1

    .line 238
    iget p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    int-to-float p1, p1

    mul-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 239
    iget-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-interface {p1, v1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Landroid/widget/SeekBar;)V

    .line 240
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    :goto_1
    return v2

    :cond_8
    :goto_2
    return v0
.end method

.method public setBuffer(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 112
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->buffer:I

    .line 113
    iget-boolean p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->isTouch:Z

    if-nez p1, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setColor(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "color"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 77
    iget-object v0, p0, Lcom/zinhao/kikoeru/TimeProgressView;->seekBarPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    return-void
.end method

.method public setMax(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "max"
        }
    .end annotation

    .line 107
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->max:I

    .line 108
    invoke-direct {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->makeMaxTimeStr()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->maxTimeStr:Ljava/lang/String;

    return-void
.end method

.method public setMin(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "min"
        }
    .end annotation

    .line 122
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->min:I

    return-void
.end method

.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 222
    iput-object p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->listener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method public setProgress(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "progress"
        }
    .end annotation

    .line 90
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 91
    iget-boolean p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->isTouch:Z

    if-nez p1, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setProgress(II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "progress",
            "buffer"
        }
    .end annotation

    .line 96
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->progress:I

    .line 97
    iput p2, p0, Lcom/zinhao/kikoeru/TimeProgressView;->buffer:I

    .line 98
    iget-boolean p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->isTouch:Z

    if-nez p1, :cond_0

    .line 99
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TimeProgressView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setType(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "type"
        }
    .end annotation

    .line 86
    iput p1, p0, Lcom/zinhao/kikoeru/TimeProgressView;->type:I

    return-void
.end method
