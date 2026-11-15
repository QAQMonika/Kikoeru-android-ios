.class Lcom/zinhao/kikoeru/LocalFileCache$8;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->savePlayList(Landroid/content/Context;Ljava/util/List;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$jsonArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Lorg/json/JSONArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$jsonArray"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 447
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$8;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$8;->val$jsonArray:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .line 447
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/LocalFileCache$8;->accept(Lorg/json/JSONObject;)V

    return-void
.end method

.method public accept(Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jsonObject"
        }
    .end annotation

    .line 450
    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$8;->val$jsonArray:Lorg/json/JSONArray;

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    return-void
.end method
