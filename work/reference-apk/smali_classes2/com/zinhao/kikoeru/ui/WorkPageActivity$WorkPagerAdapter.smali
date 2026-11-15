.class public final Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "WorkPageActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/ui/WorkPageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WorkPagerAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0007H\u0016\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "activity",
        "Landroidx/fragment/app/FragmentActivity;",
        "<init>",
        "(Landroidx/fragment/app/FragmentActivity;)V",
        "getItemCount",
        "",
        "createFragment",
        "Landroidx/fragment/app/Fragment;",
        "position",
        "Companion",
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


# static fields
.field public static final Companion:Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter$Companion;

.field public static final TOTAL_PAGE_COUNT:I = 0x6


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter;->Companion:Lcom/zinhao/kikoeru/ui/WorkPageActivity$WorkPagerAdapter$Companion;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;)V
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-direct {p0, p1}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    return-void
.end method


# virtual methods
.method public createFragment(I)Landroidx/fragment/app/Fragment;
    .locals 2

    if-eqz p1, :cond_5

    const/4 p0, 0x1

    if-eq p1, p0, :cond_4

    const/4 p0, 0x2

    if-eq p1, p0, :cond_3

    const/4 p0, 0x3

    if-eq p1, p0, :cond_2

    const/4 p0, 0x4

    if-eq p1, p0, :cond_1

    const/4 p0, 0x5

    if-ne p1, p0, :cond_0

    .line 48
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/PostponedFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/PostponedFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    .line 49
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid position "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 47
    :cond_1
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/ReplayFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    .line 46
    :cond_2
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/MarkedFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/MarkedFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    .line 45
    :cond_3
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/ListenedFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/ListenedFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    .line 44
    :cond_4
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/ListeningFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/ListeningFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    .line 43
    :cond_5
    new-instance p0, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/ui/fragment/WorkFragment;-><init>()V

    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    const/4 p0, 0x6

    return p0
.end method
