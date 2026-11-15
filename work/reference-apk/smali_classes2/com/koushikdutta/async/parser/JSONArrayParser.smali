.class public Lcom/koushikdutta/async/parser/JSONArrayParser;
.super Ljava/lang/Object;
.source "JSONArrayParser.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser<",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# direct methods
.method public static synthetic $r8$lambda$808mF0vYgNYhTrGtYa2CXFUi4a8(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMime()Ljava/lang/String;
    .locals 0

    .line 34
    const-string p0, "application/json"

    return-object p0
.end method

.method public getType()Ljava/lang/reflect/Type;
    .locals 0

    .line 29
    const-class p0, Lorg/json/JSONArray;

    return-object p0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/DataEmitter;",
            ")",
            "Lcom/koushikdutta/async/future/Future<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation

    .line 18
    new-instance p0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/parser/StringParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    new-instance p1, Lcom/koushikdutta/async/parser/JSONArrayParser$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Lcom/koushikdutta/async/parser/JSONArrayParser$$ExternalSyntheticLambda0;-><init>()V

    .line 19
    invoke-interface {p0, p1}, Lcom/koushikdutta/async/future/Future;->thenConvert(Lcom/koushikdutta/async/future/ThenCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 15
    check-cast p2, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/async/parser/JSONArrayParser;->write(Lcom/koushikdutta/async/DataSink;Lorg/json/JSONArray;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Lorg/json/JSONArray;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 24
    new-instance p0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/async/parser/StringParser;->write(Lcom/koushikdutta/async/DataSink;Ljava/lang/String;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
