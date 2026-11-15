.class public Lcom/zinhao/kikoeru/Text$TextRow;
.super Ljava/lang/Object;
.source "Text.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/Text;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextRow"
.end annotation


# static fields
.field public static final NONE:Lcom/zinhao/kikoeru/Text$TextRow;


# instance fields
.field public content:Ljava/lang/String;

.field public nextRow:Lcom/zinhao/kikoeru/Text$TextRow;

.field public upRow:Lcom/zinhao/kikoeru/Text$TextRow;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 39
    new-instance v0, Lcom/zinhao/kikoeru/Text$TextRow;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/Text$TextRow;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/Text$TextRow;->NONE:Lcom/zinhao/kikoeru/Text$TextRow;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "content"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    sget-object v0, Lcom/zinhao/kikoeru/Text$TextRow;->NONE:Lcom/zinhao/kikoeru/Text$TextRow;

    iput-object v0, p0, Lcom/zinhao/kikoeru/Text$TextRow;->upRow:Lcom/zinhao/kikoeru/Text$TextRow;

    .line 41
    iput-object v0, p0, Lcom/zinhao/kikoeru/Text$TextRow;->nextRow:Lcom/zinhao/kikoeru/Text$TextRow;

    .line 45
    iput-object p1, p0, Lcom/zinhao/kikoeru/Text$TextRow;->content:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getNextRow()Lcom/zinhao/kikoeru/Text$TextRow;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/Text$TextRow;->nextRow:Lcom/zinhao/kikoeru/Text$TextRow;

    if-nez p0, :cond_0

    .line 56
    sget-object p0, Lcom/zinhao/kikoeru/Text$TextRow;->NONE:Lcom/zinhao/kikoeru/Text$TextRow;

    :cond_0
    return-object p0
.end method

.method public getUpRow()Lcom/zinhao/kikoeru/Text$TextRow;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/Text$TextRow;->upRow:Lcom/zinhao/kikoeru/Text$TextRow;

    if-nez p0, :cond_0

    .line 50
    sget-object p0, Lcom/zinhao/kikoeru/Text$TextRow;->NONE:Lcom/zinhao/kikoeru/Text$TextRow;

    :cond_0
    return-object p0
.end method
