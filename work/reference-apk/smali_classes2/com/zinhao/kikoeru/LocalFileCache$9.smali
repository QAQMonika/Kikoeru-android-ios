.class Lcom/zinhao/kikoeru/LocalFileCache$9;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->savePrivateJSONObject(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$jsonObject:Lorg/json/JSONObject;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$context",
            "val$name",
            "val$jsonObject"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 481
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$name:Ljava/lang/String;

    iput-object p4, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$jsonObject:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 484
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 486
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$9;->val$jsonObject:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Lcom/zinhao/kikoeru/LocalFileCache;->writeTextSync(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 488
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    return-void
.end method
