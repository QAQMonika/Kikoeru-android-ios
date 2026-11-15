.class Lcom/zinhao/kikoeru/LocalFileCache$2;
.super Ljava/lang/Object;
.source "LocalFileCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/LocalFileCache;->removeWork(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/LocalFileCache;

.field final synthetic val$libWorkDir:Ljava/io/File;

.field final synthetic val$workJsonFile:Ljava/io/File;

.field final synthetic val$workJsonTreeFile:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/LocalFileCache;Ljava/io/File;Ljava/io/File;Ljava/io/File;)V
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
            "val$workJsonTreeFile",
            "val$workJsonFile",
            "val$libWorkDir"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 148
    iput-object p1, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->this$0:Lcom/zinhao/kikoeru/LocalFileCache;

    iput-object p2, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$workJsonTreeFile:Ljava/io/File;

    iput-object p3, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$workJsonFile:Ljava/io/File;

    iput-object p4, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$libWorkDir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 152
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$workJsonTreeFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/file/Paths;->get(Ljava/net/URI;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/file/Files;->deleteIfExists(Ljava/nio/file/Path;)Z

    .line 153
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$workJsonFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/file/Paths;->get(Ljava/net/URI;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/file/Files;->deleteIfExists(Ljava/nio/file/Path;)Z

    .line 154
    iget-object v0, p0, Lcom/zinhao/kikoeru/LocalFileCache$2;->val$libWorkDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-static {v0}, Ljava/nio/file/Paths;->get(Ljava/net/URI;)Ljava/nio/file/Path;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/LocalFileCache$2$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/LocalFileCache$2$1;-><init>(Lcom/zinhao/kikoeru/LocalFileCache$2;)V

    invoke-static {v0, v1}, Ljava/nio/file/Files;->walkFileTree(Ljava/nio/file/Path;Ljava/nio/file/FileVisitor;)Ljava/nio/file/Path;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 186
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 187
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
