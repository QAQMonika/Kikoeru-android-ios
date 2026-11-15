.class Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;
.super Ljava/lang/Object;
.source "PublicSuffixTrie.java"

# interfaces
.implements Ljava/lang/CharSequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunksCharSequence"
.end annotation


# instance fields
.field private final chunkMask:I

.field private final chunkShift:I

.field private final chunks:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private final length:I


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableList;I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "chunks",
            "chunkShift"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/CharSequence;",
            ">;I)V"
        }
    .end annotation

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunks:Lcom/google/common/collect/ImmutableList;

    .line 235
    iput p2, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunkShift:I

    const/4 v0, 0x1

    shl-int p2, v0, p2

    sub-int/2addr p2, v0

    .line 236
    iput p2, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunkMask:I

    .line 238
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p1

    const/4 p2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 239
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/2addr p2, v0

    goto :goto_0

    .line 241
    :cond_0
    iput p2, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->length:I

    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 251
    iget-object v0, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunks:Lcom/google/common/collect/ImmutableList;

    iget v1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunkShift:I

    shr-int v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iget p0, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunkMask:I

    and-int/2addr p0, p1

    invoke-interface {v0, p0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    return p0
.end method

.method public length()I
    .locals 0

    .line 246
    iget p0, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->length:I

    return p0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "start",
            "end"
        }
    .end annotation

    .line 256
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->length:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 262
    iget-object p0, p0, Lcom/google/thirdparty/publicsuffix/PublicSuffixTrie$ChunksCharSequence;->chunks:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    .line 263
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
