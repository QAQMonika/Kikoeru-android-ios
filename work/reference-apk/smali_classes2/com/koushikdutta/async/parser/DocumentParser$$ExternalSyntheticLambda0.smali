.class public final synthetic Lcom/koushikdutta/async/parser/DocumentParser$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/koushikdutta/async/future/ThenCallback;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 0
    check-cast p1, Lcom/koushikdutta/async/ByteBufferList;

    invoke-static {p1}, Lcom/koushikdutta/async/parser/DocumentParser;->lambda$parse$0(Lcom/koushikdutta/async/ByteBufferList;)Lorg/w3c/dom/Document;

    move-result-object p0

    return-object p0
.end method
