.class public final Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;
.super Ljava/lang/Object;
.source "AudioPlayerActivity.kt"

# interfaces
.implements Landroidx/palette/graphics/Palette$PaletteAsyncListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1;->onResourceReady(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAudioPlayerActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AudioPlayerActivity.kt\ncom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1\n+ 2 ColorDrawable.kt\nandroidx/core/graphics/drawable/ColorDrawableKt\n*L\n1#1,374:1\n27#2:375\n*S KotlinDebug\n*F\n+ 1 AudioPlayerActivity.kt\ncom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1\n*L\n300#1:375\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1",
        "Landroidx/palette/graphics/Palette$PaletteAsyncListener;",
        "onGenerated",
        "",
        "palette",
        "Landroidx/palette/graphics/Palette;",
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
.method constructor <init>(Lcom/zinhao/kikoeru/AudioPlayerActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGenerated(Landroidx/palette/graphics/Palette;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 292
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    check-cast v0, Landroid/content/Context;

    .line 293
    sget v1, Lcom/zinhao/kikoeru/R$color;->main_color:I

    .line 291
    invoke-static {v0, v1}, Landroidx/core/app/ActivityCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    .line 290
    invoke-virtual {p1, v0}, Landroidx/palette/graphics/Palette;->getDarkMutedColor(I)I

    move-result p1

    .line 296
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->access$getRootView$p(Lcom/zinhao/kikoeru/AudioPlayerActivity;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "rootView"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 297
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 298
    iget-object v0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 299
    iget-object p0, p0, Lcom/zinhao/kikoeru/AudioPlayerActivity$onAlbumChange$1$onResourceReady$1;->this$0:Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioPlayerActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 375
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 300
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void
.end method
