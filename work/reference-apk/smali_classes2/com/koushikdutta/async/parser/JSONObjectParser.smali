.class public Lcom/koushikdutta/async/parser/JSONObjectParser;
.super Ljava/lang/Object;
.source "JSONObjectParser.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# direct methods
.method public static synthetic $r8$lambda$MSxt9j2JbIhN-ojCQGQT210K57E(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

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

    .line 33
    const-string p0, "application/json"

    return-object p0
.end method

.method public getType()Ljava/lang/reflect/Type;
    .locals 0

    .line 28
    const-class p0, Lorg/json/JSONObject;

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
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .line 18
    new-instance p0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/parser/StringParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    new-instance p1, Lcom/koushikdutta/async/parser/JSONObjectParser$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Lcom/koushikdutta/async/parser/JSONObjectParser$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {p0, p1}, Lcom/koushikdutta/async/future/Future;->thenConvert(Lcom/koushikdutta/async/future/ThenCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 15
    check-cast p2, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/async/parser/JSONObjectParser;->write(Lcom/koushikdutta/async/DataSink;Lorg/json/JSONObject;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Lorg/json/JSONObject;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .locals 0

    .line 23
    new-instance p0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {p0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/async/parser/StringParser;->write(Lcom/koushikdutta/async/DataSink;Ljava/lang/String;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
