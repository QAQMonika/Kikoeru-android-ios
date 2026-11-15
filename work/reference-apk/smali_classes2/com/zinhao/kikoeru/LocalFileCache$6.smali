.class Lcom/zinhao/kikoeru/LocalFileCache$6;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->writeText(Ljava/io/File;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$save:Ljava/io/File;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$save",
            "val$text"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 394
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->val$save:Ljava/io/File;

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 398
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iget-object v1, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->val$save:Ljava/io/File;

    iget-object p0, p0, Lcom/zinhao/kikoeru/LocalFileCache$6;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/LocalFileCache;->writeTextSync(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 400
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    return-void
.end method
