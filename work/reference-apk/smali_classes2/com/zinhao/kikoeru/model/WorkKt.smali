.class public final Lcom/zinhao/kikoeru/model/WorkKt;
.super Ljava/lang/Object;
.source "Work.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0004\u001a\u00020\u0005*\u00020\u0006\"\u0011\u0010\u0000\u001a\u00020\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0007"
    }
    d2 = {
        "gson",
        "Lcom/google/gson/Gson;",
        "getGson",
        "()Lcom/google/gson/Gson;",
        "toWork",
        "Lcom/zinhao/kikoeru/model/Work;",
        "Lorg/json/JSONObject;",
        "app_release"
    }
    k = 0x2
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final gson:Lcom/google/gson/Gson;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lcom/zinhao/kikoeru/model/WorkKt;->gson:Lcom/google/gson/Gson;

    return-void
.end method

.method public static final getGson()Lcom/google/gson/Gson;
    .locals 1

    .line 27
    sget-object v0, Lcom/zinhao/kikoeru/model/WorkKt;->gson:Lcom/google/gson/Gson;

    return-object v0
.end method

.method public static final toWork(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/model/Work;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    sget-object v0, Lcom/zinhao/kikoeru/model/WorkKt;->gson:Lcom/google/gson/Gson;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    const-class v1, Lcom/zinhao/kikoeru/model/Work;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "fromJson(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p0, Lcom/zinhao/kikoeru/model/Work;

    return-object p0
.end method
