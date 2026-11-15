.class public final synthetic Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/ThenFutureCallback;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/koushikdutta/async/future/Future;
    .locals 0

    .line 0
    check-cast p1, Lcom/koushikdutta/async/future/Converter$MimedData;

    invoke-static {p1}, Lcom/koushikdutta/async/future/Converter;->lambda$to$0(Lcom/koushikdutta/async/future/Converter$MimedData;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method
