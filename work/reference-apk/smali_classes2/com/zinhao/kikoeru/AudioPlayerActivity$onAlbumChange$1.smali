.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;
.super Lcom/bumptech/glide/request/target/CustomViewTarget;
.source "AudioPlayerActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity;->onAlbumChange(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/CustomViewTarget<",
        "Landroid/widget/ImageView;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001J\u0012\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0016J$\u0010\u0008\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u00032\u0012\u0010\n\u001a\u000e\u0012\u0008\u0008\u0000\u0012\u0004\u0018\u00010\u0003\u0018\u00010\u000bH\u0016J\u0012\u0010\u000c\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0014\u00a8\u0006\r"
    }
    d2 = {
        "com/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1",
        "Lcom/bumptech/glide/request/target/CustomViewTarget;",
        "Landroid/widget/ImageView;",
        "Landroid/graphics/Bitmap;",
        "onLoadFailed",
        "",
        "drawable",
        "Landroid/graphics/drawable/Drawable;",
        "onResourceReady",
        "bitmap",
        "transition",
        "Lcom/bumptech/glide/request/transition/Transition;",
        "onResourceCleared",
        "app_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;Landroid/widget/ImageView;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 281
    check-cast p2, Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/bumptech/glide/request/target/CustomViewTarget;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    return-void
.end method

.method protected onResourceCleared(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    return-void
.end method

.method public onResourceReady(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/bumptech/glide/request/transition/Transition<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    const-string p2, "bitmap"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 286
    iget-object p2, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {p2}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getImageView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Landroid/widget/ImageView;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 287
    invoke-static {p1}, Landroidx/palette/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroidx/palette/graphics/Palette$Builder;

    move-result-object p1

    new-instance p2, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;

    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;-><init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V

    check-cast p2, Landroidx/palette/graphics/Palette$PaletteAsyncListener;

    invoke-virtual {p1, p2}, Landroidx/palette/graphics/Palette$Builder;->generate(Landroidx/palette/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;

    return-void
.end method

.method public bridge synthetic onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0

    .line 281
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;->onResourceReady(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V

    return-void
.end method
