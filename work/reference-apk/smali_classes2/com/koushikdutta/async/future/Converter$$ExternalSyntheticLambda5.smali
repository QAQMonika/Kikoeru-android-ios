.class public final synthetic Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/ThenFutureCallback;


# instance fields
.field public final synthetic f$0:Lcom/koushikdutta/async/future/Converter;

.field public final synthetic f$1:Ljava/lang/Class;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/koushikdutta/async/future/Converter;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$0:Lcom/koushikdutta/async/future/Converter;

    iput-object p2, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$1:Ljava/lang/Class;

    iput-object p3, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/koushikdutta/async/future/Future;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$0:Lcom/koushikdutta/async/future/Converter;

    iget-object v1, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$1:Ljava/lang/Class;

    iget-object p0, p0, Lcom/koushikdutta/async/future/Converter$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    invoke-virtual {v0, v1, p0, p1}, Lcom/koushikdutta/async/future/Converter;->lambda$to$1$com-koushikdutta-async-future-Converter(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method
