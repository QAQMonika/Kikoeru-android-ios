.class Lcom/zinhao/kikoeru/ImagePagerAdapter$1;
.super Lcom/bumptech/glide/request/target/CustomViewTarget;
.source "ImagePagerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImagePagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/CustomViewTarget<",
        "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;

.field final synthetic val$imageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImagePagerAdapter;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "view",
            "val$imageView"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$1;->this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    iput-object p3, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$1;->val$imageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0, p2}, Lcom/bumptech/glide/request/target/CustomViewTarget;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "drawable"
        }
    .end annotation

    return-void
.end method

.method protected onResourceCleared(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "drawable"
        }
    .end annotation

    return-void
.end method

.method public onResourceReady(Ljava/io/File;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "transition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lcom/bumptech/glide/request/transition/Transition<",
            "-",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 68
    iget-object p2, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$1;->val$imageView:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri(Landroid/net/Uri;)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 69
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$1;->this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    iput-object p1, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter;->pic:Ljava/io/File;

    return-void
.end method

.method public bridge synthetic onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "file",
            "transition"
        }
    .end annotation

    .line 61
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/ImagePagerAdapter$1;->onResourceReady(Ljava/io/File;Lcom/bumptech/glide/request/transition/Transition;)V

    return-void
.end method
