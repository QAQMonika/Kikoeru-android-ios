.class public Lcom/zinhao/kikoeru/Text;
.super Ljava/lang/Object;
.source "Text.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/Text$TextRow;
    }
.end annotation


# static fields
.field public static final NONE:Lcom/zinhao/kikoeru/Text;

.field private static final TAG:Ljava/lang/String; = "Text"


# instance fields
.field private currentIndex:I

.field private text:Ljava/lang/String;

.field private textRows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/Text$TextRow;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 7
    new-instance v0, Lcom/zinhao/kikoeru/Text;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/Text;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/Text;->NONE:Lcom/zinhao/kikoeru/Text;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/zinhao/kikoeru/Text;->currentIndex:I

    .line 15
    iput-object p1, p0, Lcom/zinhao/kikoeru/Text;->text:Ljava/lang/String;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    .line 17
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    .line 18
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 19
    aget-object v1, p1, v0

    .line 20
    new-instance v2, Lcom/zinhao/kikoeru/Text$TextRow;

    invoke-direct {v2, v1}, Lcom/zinhao/kikoeru/Text$TextRow;-><init>(Ljava/lang/String;)V

    .line 21
    iget-object v1, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    move v0, p1

    .line 23
    :goto_1
    iget-object v1, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, p1

    if-ge v0, v1, :cond_1

    .line 24
    iget-object v1, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/Text$TextRow;

    .line 25
    iget-object v2, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    add-int/lit8 v3, v0, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Text$TextRow;

    iput-object v2, v1, Lcom/zinhao/kikoeru/Text$TextRow;->upRow:Lcom/zinhao/kikoeru/Text$TextRow;

    .line 26
    iget-object v2, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    add-int/lit8 v0, v0, 0x1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Text$TextRow;

    iput-object v2, v1, Lcom/zinhao/kikoeru/Text$TextRow;->nextRow:Lcom/zinhao/kikoeru/Text$TextRow;

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method public getLrcRows()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/Text$TextRow;",
            ">;"
        }
    .end annotation

    .line 35
    iget-object p0, p0, Lcom/zinhao/kikoeru/Text;->textRows:Ljava/util/List;

    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/zinhao/kikoeru/Text;->text:Ljava/lang/String;

    return-object p0
.end method
