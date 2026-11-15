.class public final Lcom/google/android/exoplayer2/text/Cue$Builder;
.super Ljava/lang/Object;
.source "Cue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/text/Cue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private bitmapHeight:F

.field private line:F

.field private lineAnchor:I

.field private lineType:I

.field private multiRowAlignment:Landroid/text/Layout$Alignment;

.field private position:F

.field private positionAnchor:I

.field private shearDegrees:F

.field private size:F

.field private text:Ljava/lang/CharSequence;

.field private textAlignment:Landroid/text/Layout$Alignment;

.field private textSize:F

.field private textSizeType:I

.field private verticalType:I

.field private windowColor:I

.field private windowColorSet:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 570
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 571
    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->text:Ljava/lang/CharSequence;

    .line 572
    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmap:Landroid/graphics/Bitmap;

    .line 573
    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textAlignment:Landroid/text/Layout$Alignment;

    .line 574
    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->multiRowAlignment:Landroid/text/Layout$Alignment;

    const v0, -0x800001

    .line 575
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->line:F

    const/high16 v1, -0x80000000

    .line 576
    iput v1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineType:I

    .line 577
    iput v1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineAnchor:I

    .line 578
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->position:F

    .line 579
    iput v1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->positionAnchor:I

    .line 580
    iput v1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSizeType:I

    .line 581
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSize:F

    .line 582
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->size:F

    .line 583
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmapHeight:F

    const/4 v0, 0x0

    .line 584
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    const/high16 v0, -0x1000000

    .line 585
    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColor:I

    .line 586
    iput v1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->verticalType:I

    return-void
.end method

.method private constructor <init>(Lcom/google/android/exoplayer2/text/Cue;)V
    .locals 1

    .line 589
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 590
    iget-object v0, p1, Lcom/google/android/exoplayer2/text/Cue;->text:Ljava/lang/CharSequence;

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->text:Ljava/lang/CharSequence;

    .line 591
    iget-object v0, p1, Lcom/google/android/exoplayer2/text/Cue;->bitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmap:Landroid/graphics/Bitmap;

    .line 592
    iget-object v0, p1, Lcom/google/android/exoplayer2/text/Cue;->textAlignment:Landroid/text/Layout$Alignment;

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textAlignment:Landroid/text/Layout$Alignment;

    .line 593
    iget-object v0, p1, Lcom/google/android/exoplayer2/text/Cue;->multiRowAlignment:Landroid/text/Layout$Alignment;

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->multiRowAlignment:Landroid/text/Layout$Alignment;

    .line 594
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->line:F

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->line:F

    .line 595
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->lineType:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineType:I

    .line 596
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->lineAnchor:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineAnchor:I

    .line 597
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->position:F

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->position:F

    .line 598
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->positionAnchor:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->positionAnchor:I

    .line 599
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->textSizeType:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSizeType:I

    .line 600
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->textSize:F

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSize:F

    .line 601
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->size:F

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->size:F

    .line 602
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->bitmapHeight:F

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmapHeight:F

    .line 603
    iget-boolean v0, p1, Lcom/google/android/exoplayer2/text/Cue;->windowColorSet:Z

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    .line 604
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->windowColor:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColor:I

    .line 605
    iget v0, p1, Lcom/google/android/exoplayer2/text/Cue;->verticalType:I

    iput v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->verticalType:I

    .line 606
    iget p1, p1, Lcom/google/android/exoplayer2/text/Cue;->shearDegrees:F

    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->shearDegrees:F

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer2/text/Cue;Lcom/google/android/exoplayer2/text/Cue$1;)V
    .locals 0

    .line 551
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/text/Cue$Builder;-><init>(Lcom/google/android/exoplayer2/text/Cue;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/exoplayer2/text/Cue;
    .locals 20

    move-object/from16 v0, p0

    .line 931
    new-instance v1, Lcom/google/android/exoplayer2/text/Cue;

    move-object v2, v1

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->text:Ljava/lang/CharSequence;

    move-object v3, v2

    iget-object v2, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textAlignment:Landroid/text/Layout$Alignment;

    move-object v4, v3

    iget-object v3, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->multiRowAlignment:Landroid/text/Layout$Alignment;

    move-object v5, v4

    iget-object v4, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmap:Landroid/graphics/Bitmap;

    move-object v6, v5

    iget v5, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->line:F

    move-object v7, v6

    iget v6, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineType:I

    move-object v8, v7

    iget v7, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineAnchor:I

    move-object v9, v8

    iget v8, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->position:F

    move-object v10, v9

    iget v9, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->positionAnchor:I

    move-object v11, v10

    iget v10, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSizeType:I

    move-object v12, v11

    iget v11, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSize:F

    move-object v13, v12

    iget v12, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->size:F

    move-object v14, v13

    iget v13, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmapHeight:F

    move-object v15, v14

    iget-boolean v14, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    move-object/from16 v16, v15

    iget v15, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColor:I

    move-object/from16 v17, v1

    iget v1, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->verticalType:I

    iget v0, v0, Lcom/google/android/exoplayer2/text/Cue$Builder;->shearDegrees:F

    const/16 v18, 0x0

    move-object/from16 v19, v17

    move/from16 v17, v0

    move-object/from16 v0, v16

    move/from16 v16, v1

    move-object/from16 v1, v19

    invoke-direct/range {v0 .. v18}, Lcom/google/android/exoplayer2/text/Cue;-><init>(Ljava/lang/CharSequence;Landroid/text/Layout$Alignment;Landroid/text/Layout$Alignment;Landroid/graphics/Bitmap;FIIFIIFFFZIIFLcom/google/android/exoplayer2/text/Cue$1;)V

    return-object v0
.end method

.method public clearWindowColor()Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 1

    const/4 v0, 0x0

    .line 878
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    return-object p0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 650
    iget-object p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public getBitmapHeight()F
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 859
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmapHeight:F

    return p0
.end method

.method public getLine()F
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 709
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->line:F

    return p0
.end method

.method public getLineAnchor()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 741
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineAnchor:I

    return p0
.end method

.method public getLineType()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 720
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineType:I

    return p0
.end method

.method public getPosition()F
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 763
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->position:F

    return p0
.end method

.method public getPositionAnchor()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 784
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->positionAnchor:I

    return p0
.end method

.method public getSize()F
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 839
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->size:F

    return p0
.end method

.method public getText()Ljava/lang/CharSequence;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 629
    iget-object p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->text:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public getTextAlignment()Landroid/text/Layout$Alignment;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 673
    iget-object p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textAlignment:Landroid/text/Layout$Alignment;

    return-object p0
.end method

.method public getTextSize()F
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 817
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSize:F

    return p0
.end method

.method public getTextSizeType()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 807
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSizeType:I

    return p0
.end method

.method public getVerticalType()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 926
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->verticalType:I

    return p0
.end method

.method public getWindowColor()I
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 899
    iget p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColor:I

    return p0
.end method

.method public isWindowColorSet()Z
    .locals 0

    .line 888
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    return p0
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 638
    iput-object p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public setBitmapHeight(F)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 848
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->bitmapHeight:F

    return-object p0
.end method

.method public setLine(FI)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 696
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->line:F

    .line 697
    iput p2, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineType:I

    return-object p0
.end method

.method public setLineAnchor(I)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 729
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->lineAnchor:I

    return-object p0
.end method

.method public setMultiRowAlignment(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 684
    iput-object p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->multiRowAlignment:Landroid/text/Layout$Alignment;

    return-object p0
.end method

.method public setPosition(F)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 751
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->position:F

    return-object p0
.end method

.method public setPositionAnchor(I)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 772
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->positionAnchor:I

    return-object p0
.end method

.method public setShearDegrees(F)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 914
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->shearDegrees:F

    return-object p0
.end method

.method public setSize(F)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 827
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->size:F

    return-object p0
.end method

.method public setText(Ljava/lang/CharSequence;)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 617
    iput-object p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->text:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTextAlignment(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 661
    iput-object p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textAlignment:Landroid/text/Layout$Alignment;

    return-object p0
.end method

.method public setTextSize(FI)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 794
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSize:F

    .line 795
    iput p2, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->textSizeType:I

    return-object p0
.end method

.method public setVerticalType(I)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 908
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->verticalType:I

    return-object p0
.end method

.method public setWindowColor(I)Lcom/google/android/exoplayer2/text/Cue$Builder;
    .locals 0

    .line 871
    iput p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColor:I

    const/4 p1, 0x1

    .line 872
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/text/Cue$Builder;->windowColorSet:Z

    return-object p0
.end method
