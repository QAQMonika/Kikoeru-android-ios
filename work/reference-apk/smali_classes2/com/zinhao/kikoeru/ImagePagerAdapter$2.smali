.class Lcom/zinhao/kikoeru/ImagePagerAdapter$2;
.super Ljava/lang/Object;
.source "ImagePagerAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/ImagePagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/ImagePagerAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$2;->this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 90
    iget-object p0, p0, Lcom/zinhao/kikoeru/ImagePagerAdapter$2;->this$0:Lcom/zinhao/kikoeru/ImagePagerAdapter;

    invoke-static {p0}, Lcom/zinhao/kikoeru/ImagePagerAdapter;->access$000(Lcom/zinhao/kikoeru/ImagePagerAdapter;)Lcom/zinhao/kikoeru/ImagePagerAdapter$HideLayoutCallBack;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/zinhao/kikoeru/ImagePagerAdapter$HideLayoutCallBack;->hideLayout(Landroid/view/View;)V

    return-void
.end method
