.class public Lcom/zinhao/kikoeru/Lrc;
.super Ljava/lang/Object;
.source "Lrc.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/Lrc$LrcRow;
    }
.end annotation


# static fields
.field public static final NONE:Lcom/zinhao/kikoeru/Lrc;

.field private static final TAG:Ljava/lang/String; = "Lrc"


# instance fields
.field private current:Lcom/zinhao/kikoeru/Lrc$LrcRow;

.field private currentIndex:I

.field private lrcRows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/Lrc$LrcRow;",
            ">;"
        }
    .end annotation
.end field

.field private text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 11
    new-instance v0, Lcom/zinhao/kikoeru/Lrc;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/Lrc;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/zinhao/kikoeru/Lrc;->NONE:Lcom/zinhao/kikoeru/Lrc;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lcom/zinhao/kikoeru/Lrc;->currentIndex:I

    .line 20
    iput-object p1, p0, Lcom/zinhao/kikoeru/Lrc;->text:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    .line 22
    const-string v0, "WEBVTT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/Lrc;->initVtt(Ljava/lang/String;)V

    return-void

    .line 25
    :cond_0
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/Lrc;->initLrc(Ljava/lang/String;)V

    return-void
.end method

.method private initLrc(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    .line 130
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    .line 131
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 133
    aget-object v1, p1, v0

    const/16 v2, 0x5b

    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/16 v3, 0x5d

    .line 135
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    if-eq v3, v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    .line 137
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 139
    :try_start_0
    invoke-static {v2}, Lcom/zinhao/kikoeru/Lrc;->transToLong(Ljava/lang/String;)J

    move-result-wide v4

    add-int/lit8 v3, v3, 0x1

    .line 140
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 141
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 142
    new-instance v3, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    invoke-direct {v3, v2, v4, v5, v1}, Lcom/zinhao/kikoeru/Lrc$LrcRow;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 143
    iget-object v1, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 146
    :catch_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Lrc: err lrc row:"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Lrc"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    move v0, p1

    .line 150
    :goto_2
    iget-object v1, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, p1

    if-ge v0, v1, :cond_2

    .line 151
    iget-object v1, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 152
    iget-object v2, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    add-int/lit8 v3, v0, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object v2, v1, Lcom/zinhao/kikoeru/Lrc$LrcRow;->upRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    .line 153
    iget-object v2, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    add-int/lit8 v0, v0, 0x1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object v2, v1, Lcom/zinhao/kikoeru/Lrc$LrcRow;->nextRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    goto :goto_2

    :cond_2
    return-void
.end method

.method private initVtt(Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "text"
        }
    .end annotation

    if-eqz p1, :cond_9

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 35
    :cond_0
    const-string v0, "\\r?\\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 39
    const-string v0, "^(([0-9]{2}:)?[0-9]{2}:[0-9]{2}\\.[0-9]{3})\\s-->.*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    .line 42
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_6

    .line 43
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 46
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "WEBVTT"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_3

    .line 52
    :cond_1
    invoke-virtual {v0, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 53
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_5

    const/4 v4, 0x1

    .line 55
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 57
    invoke-direct {p0, v3}, Lcom/zinhao/kikoeru/Lrc;->parseTimeToMs(Ljava/lang/String;)J

    move-result-wide v4

    .line 59
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 63
    array-length v7, p1

    if-ge v2, v7, :cond_4

    aget-object v7, p1, v2

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 64
    aget-object v7, p1, v2

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_2

    .line 67
    :cond_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_3

    .line 68
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    :cond_3
    aget-object v7, p1, v2

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 74
    :cond_4
    :goto_2
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 77
    new-instance v7, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    invoke-direct {v7, v3, v4, v5, v6}, Lcom/zinhao/kikoeru/Lrc$LrcRow;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 80
    iget-object v3, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 88
    :cond_6
    iget-object p1, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_4
    if-ge v1, p1, :cond_9

    .line 90
    iget-object v0, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    if-lez v1, :cond_7

    .line 92
    iget-object v2, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object v2, v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->upRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    :cond_7
    add-int/lit8 v2, p1, -0x1

    if-ge v1, v2, :cond_8

    .line 95
    iget-object v2, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    add-int/lit8 v3, v1, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object v2, v0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->nextRow:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_9
    :goto_5
    return-void
.end method

.method private parseTimeToMs(Ljava/lang/String;)J
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "timeStr"
        }
    .end annotation

    .line 106
    :try_start_0
    const-string p0, "\\."

    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    .line 107
    aget-object v0, p0, p1

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 109
    aget-object p0, p0, v1

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 111
    array-length p0, v0

    const/4 v4, 0x3

    const-wide/16 v5, 0x3e8

    const-wide/16 v7, 0x3c

    const/4 v9, 0x2

    if-ne p0, v4, :cond_0

    .line 113
    aget-object p0, v0, p1

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0

    .line 114
    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 115
    aget-object v0, v0, v9

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v12, 0xe10

    mul-long/2addr p0, v12

    mul-long/2addr v10, v7

    add-long/2addr p0, v10

    :goto_0
    add-long/2addr p0, v0

    mul-long/2addr p0, v5

    add-long/2addr p0, v2

    return-wide p0

    .line 117
    :cond_0
    array-length p0, v0

    if-ne p0, v9, :cond_1

    .line 119
    aget-object p0, v0, p1

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0

    .line 120
    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    mul-long/2addr p0, v7

    goto :goto_0

    :catch_0
    move-exception p0

    .line 124
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method private static transToLong(Ljava/lang/String;)J
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "timeStr"
        }
    .end annotation

    .line 181
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 182
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    .line 184
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 189
    array-length v0, p0

    const/4 v1, 0x3

    const-string v2, "\\."

    const-string v3, "."

    const/4 v4, 0x0

    const/4 v5, 0x2

    const-string v6, "0"

    const/4 v7, 0x1

    if-ne v0, v1, :cond_2

    .line 190
    aget-object v0, p0, v4

    .line 191
    aget-object v1, p0, v7

    .line 192
    aget-object v8, p0, v5

    invoke-virtual {v8, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 193
    aget-object p0, p0, v5

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 194
    aget-object v6, p0, v4

    .line 195
    aget-object p0, p0, v7

    move-object v9, v1

    move-object v1, p0

    move-object p0, v6

    move-object v6, v0

    move-object v0, v9

    goto :goto_0

    .line 197
    :cond_1
    aget-object p0, p0, v5

    move-object v9, v6

    move-object v6, v0

    move-object v0, v1

    move-object v1, v9

    goto :goto_0

    .line 199
    :cond_2
    array-length v0, p0

    if-ne v0, v5, :cond_4

    .line 200
    aget-object v0, p0, v4

    .line 201
    aget-object v1, p0, v7

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 202
    aget-object p0, p0, v7

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 203
    aget-object v1, p0, v4

    .line 204
    aget-object p0, p0, v7

    move-object v9, v1

    move-object v1, p0

    move-object p0, v9

    goto :goto_0

    .line 206
    :cond_3
    aget-object p0, p0, v7

    move-object v1, v6

    goto :goto_0

    :cond_4
    move-object p0, v6

    move-object v0, p0

    move-object v1, v0

    .line 209
    :goto_0
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/32 v4, 0x36ee80

    mul-long/2addr v2, v4

    .line 210
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/32 v6, 0xea60

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    .line 211
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    .line 212
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    add-long/2addr v2, v0

    return-wide v2
.end method


# virtual methods
.method public getCurrent()Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 0

    .line 162
    iget-object p0, p0, Lcom/zinhao/kikoeru/Lrc;->current:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    if-nez p0, :cond_0

    .line 163
    sget-object p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    :cond_0
    return-object p0
.end method

.method public getCurrentIndex()I
    .locals 0

    .line 169
    iget p0, p0, Lcom/zinhao/kikoeru/Lrc;->currentIndex:I

    return p0
.end method

.method public getLrcRows()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/Lrc$LrcRow;",
            ">;"
        }
    .end annotation

    .line 173
    iget-object p0, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 158
    iget-object p0, p0, Lcom/zinhao/kikoeru/Lrc;->text:Ljava/lang/String;

    return-object p0
.end method

.method public update(J)Lcom/zinhao/kikoeru/Lrc$LrcRow;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "seek"
        }
    .end annotation

    .line 216
    iget-object v0, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-gt v2, v0, :cond_2

    sub-int v3, v0, v2

    .line 223
    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v2

    .line 224
    iget-object v4, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iget-wide v4, v4, Lcom/zinhao/kikoeru/Lrc$LrcRow;->time:J

    cmp-long v4, v4, p1

    if-gtz v4, :cond_1

    add-int/lit8 v2, v3, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v3, v3, -0x1

    move v0, v3

    goto :goto_0

    .line 232
    :cond_2
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 233
    iput p1, p0, Lcom/zinhao/kikoeru/Lrc;->currentIndex:I

    .line 234
    iget-object p2, p0, Lcom/zinhao/kikoeru/Lrc;->lrcRows:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/zinhao/kikoeru/Lrc$LrcRow;

    iput-object p1, p0, Lcom/zinhao/kikoeru/Lrc;->current:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    return-object p1

    .line 217
    :cond_3
    :goto_1
    sget-object p0, Lcom/zinhao/kikoeru/Lrc$LrcRow;->NONE:Lcom/zinhao/kikoeru/Lrc$LrcRow;

    return-object p0
.end method
