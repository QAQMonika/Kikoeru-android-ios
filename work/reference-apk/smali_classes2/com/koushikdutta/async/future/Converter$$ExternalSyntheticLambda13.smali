.class public final synthetic Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/TypeConverter;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final convert(Ljava/lang/Object;Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
    .locals 0

    .line 0
    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-static {p1, p2}, Lcom/koushikdutta/async/future/Converter;->lambda$static$7(Ljava/nio/ByteBuffer;Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method
