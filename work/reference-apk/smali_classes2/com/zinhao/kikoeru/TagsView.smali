.class public Lcom/zinhao/kikoeru/TagsView;
.super Landroid/view/View;
.source "TagsView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/TagsView$TagClickListener;,
        Lcom/zinhao/kikoeru/TagsView$TextGet;,
        Lcom/zinhao/kikoeru/TagsView$JsonTextGet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/view/View;"
    }
.end annotation


# static fields
.field public static final JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

.field public static final STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "TagsView"


# instance fields
.field private MIN_HEIGHT:I

.field private MIN_WIDTH:I

.field private gestureDetector:Landroid/view/GestureDetector;

.field private rectFH:F

.field private simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private tagBg:Landroid/graphics/drawable/Drawable;

.field private tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

.field private tags:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private tagsRectFs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field private textDistance:F

.field private textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

.field private textPadding:F

.field private final textPaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 86
    new-instance v0, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    const-string v1, "name"

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/TagsView;->JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    .line 87
    new-instance v0, Lcom/zinhao/kikoeru/TagsView$1;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/TagsView$1;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/TagsView;->STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;

    return-void
.end method

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

    .line 95
    invoke-direct {p0, p1, v0}, Lcom/zinhao/kikoeru/TagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 99
    invoke-direct {p0, p1, p2, v0}, Lcom/zinhao/kikoeru/TagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
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

    .line 103
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 28
    iput p3, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_WIDTH:I

    .line 29
    iput p3, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_HEIGHT:I

    const/high16 v0, 0x41a00000    # 20.0f

    .line 30
    iput v0, p0, Lcom/zinhao/kikoeru/TagsView;->textPadding:F

    const/4 v0, 0x0

    .line 31
    iput v0, p0, Lcom/zinhao/kikoeru/TagsView;->rectFH:F

    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x42f00000    # 120.0f

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_WIDTH:I

    .line 105
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_HEIGHT:I

    .line 106
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    .line 107
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 108
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/16 v1, 0xc

    .line 109
    invoke-virtual {p0, v1}, Lcom/zinhao/kikoeru/TagsView;->setTextSize(I)V

    const/4 v1, -0x1

    .line 110
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 111
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 112
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/zinhao/kikoeru/TagsView;->textDistance:F

    .line 113
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v1, v0

    iput v1, p0, Lcom/zinhao/kikoeru/TagsView;->rectFH:F

    const/16 v0, 0xa

    const/4 v1, 0x7

    .line 114
    invoke-virtual {p0, v0, v1, p3, v1}, Lcom/zinhao/kikoeru/TagsView;->setPadding(IIII)V

    .line 115
    sget-object v0, Lcom/zinhao/kikoeru/R$styleable;->TagsView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 116
    sget p2, Lcom/zinhao/kikoeru/R$styleable;->TagsView_tagBackground:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/zinhao/kikoeru/TagsView;->tagBg:Landroid/graphics/drawable/Drawable;

    .line 117
    sget p2, Lcom/zinhao/kikoeru/R$styleable;->TagsView_tags:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 118
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 119
    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 120
    array-length v0, p2

    if-eqz v0, :cond_0

    .line 121
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 122
    iput-object p2, p0, Lcom/zinhao/kikoeru/TagsView;->tags:Ljava/lang/Object;

    .line 123
    sget-object p2, Lcom/zinhao/kikoeru/TagsView;->STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;

    iput-object p2, p0, Lcom/zinhao/kikoeru/TagsView;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 126
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 127
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    .line 128
    :goto_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getTagsLen()I

    move-result p1

    if-ge p3, p1, :cond_1

    .line 129
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 131
    :cond_1
    new-instance p1, Lcom/zinhao/kikoeru/TagsView$2;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/TagsView$2;-><init>(Lcom/zinhao/kikoeru/TagsView;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 187
    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object p3, p0, Lcom/zinhao/kikoeru/TagsView;->simpleOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {p1, p2, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->gestureDetector:Landroid/view/GestureDetector;

    return-void
.end method

.method static synthetic access$000(Lcom/zinhao/kikoeru/TagsView;)Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/zinhao/kikoeru/TagsView;)Ljava/util/List;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    return-object p0
.end method

.method private makeTagsRectF(I)I
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "w"
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    .line 293
    :goto_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getTagsLen()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 294
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 297
    :cond_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getPaddingTop()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    move v3, v0

    move v5, v3

    move v4, v2

    .line 298
    :goto_1
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getTagsLen()I

    move-result v6

    if-ge v3, v6, :cond_2

    .line 300
    invoke-virtual {p0, v3}, Lcom/zinhao/kikoeru/TagsView;->getTagText(I)Ljava/lang/String;

    move-result-object v5

    .line 301
    iget-object v6, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    .line 302
    iget v6, p0, Lcom/zinhao/kikoeru/TagsView;->textPadding:F

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v7, v6

    add-float/2addr v5, v7

    .line 303
    iget v7, p0, Lcom/zinhao/kikoeru/TagsView;->rectFH:F

    add-float/2addr v7, v6

    add-float v6, v4, v5

    int-to-float v8, p1

    cmpl-float v6, v6, v8

    if-lez v6, :cond_1

    .line 306
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getPaddingBottom()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v7

    add-float/2addr v1, v4

    move v4, v2

    .line 309
    :cond_1
    iget-object v6, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/RectF;

    add-float v8, v4, v5

    add-float/2addr v7, v1

    invoke-virtual {v6, v4, v1, v8, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 310
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getPaddingRight()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getPaddingLeft()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v5, v7

    .line 311
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getPaddingBottom()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 313
    :cond_2
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getTagsLen()I

    move-result p0

    if-nez p0, :cond_3

    return v0

    :cond_3
    return v5
.end method


# virtual methods
.method public getTagByIndex(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 220
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->tags:Ljava/lang/Object;

    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 221
    check-cast p0, Ljava/util/List;

    .line 222
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 223
    :cond_0
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_1

    .line 225
    :try_start_0
    check-cast p0, Lorg/json/JSONArray;

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 227
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 228
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getTagText(I)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView;->tags:Ljava/lang/Object;

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_0

    .line 202
    check-cast v0, Ljava/util/List;

    .line 203
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 204
    :cond_0
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_1

    .line 206
    :try_start_0
    check-cast v0, Lorg/json/JSONArray;

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 208
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 209
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    .line 212
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    if-eqz p0, :cond_2

    .line 213
    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/TagsView$TextGet;->onGetText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 215
    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method public getTagsLen()I
    .locals 1

    .line 191
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->tags:Ljava/lang/Object;

    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 192
    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    .line 193
    :cond_0
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_1

    .line 194
    check-cast p0, Lorg/json/JSONArray;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "canvas"
        }
    .end annotation

    .line 325
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    .line 326
    :goto_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getTagsLen()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 327
    iget-object v1, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    .line 328
    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView;->tagBg:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    .line 329
    iget v3, v1, Landroid/graphics/RectF;->left:F

    float-to-int v3, v3

    iget v4, v1, Landroid/graphics/RectF;->top:F

    float-to-int v4, v4

    iget v5, v1, Landroid/graphics/RectF;->right:F

    float-to-int v5, v5

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    float-to-int v1, v1

    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 330
    iget-object v1, p0, Lcom/zinhao/kikoeru/TagsView;->tagBg:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 332
    :cond_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 333
    iget-object v1, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 334
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/TagsView;->getTagText(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    iget v4, p0, Lcom/zinhao/kikoeru/TagsView;->textDistance:F

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 45
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
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

    .line 320
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
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

    .line 270
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 271
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    .line 273
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 274
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v1, -0x80000000

    if-ne p1, v1, :cond_0

    if-ne p2, v1, :cond_0

    .line 281
    iget v0, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_WIDTH:I

    goto :goto_0

    :cond_0
    if-ne p1, v1, :cond_1

    .line 285
    iget v0, p0, Lcom/zinhao/kikoeru/TagsView;->MIN_WIDTH:I

    .line 289
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/zinhao/kikoeru/TagsView;->makeTagsRectF(I)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/zinhao/kikoeru/TagsView;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/TagsView;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public setTagBackgroundResource(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resid"
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tagBg:Landroid/graphics/drawable/Drawable;

    .line 50
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->invalidate()V

    return-void
.end method

.method public setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tagClickListener"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "*>;)V"
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tagClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method

.method public setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "tags",
            "textGet"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/zinhao/kikoeru/TagsView$TextGet<",
            "*>;)V"
        }
    .end annotation

    .line 243
    iput-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tags:Ljava/lang/Object;

    .line 244
    iput-object p2, p0, Lcom/zinhao/kikoeru/TagsView;->textGet:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 245
    iget-object p1, p0, Lcom/zinhao/kikoeru/TagsView;->tagsRectFs:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 246
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getWidth()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/zinhao/kikoeru/TagsView;->makeTagsRectF(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/TagsView;->setMeasuredDimension(II)V

    .line 247
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->isInLayout()Z

    move-result p1

    if-nez p1, :cond_0

    .line 248
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->requestLayout()V

    return-void

    .line 250
    :cond_0
    new-instance p1, Lcom/zinhao/kikoeru/TagsView$3;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/TagsView$3;-><init>(Lcom/zinhao/kikoeru/TagsView;)V

    const-wide/16 v0, 0x1f4

    invoke-virtual {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/TagsView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public setTextSize(I)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    .line 265
    iget-object v0, p0, Lcom/zinhao/kikoeru/TagsView;->textPaint:Landroid/graphics/Paint;

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/TagsView;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v1, 0x2

    invoke-static {v1, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    return-void
.end method
