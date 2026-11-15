.class public final Lcom/zinhao/kikoeru/WorkTreeActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "WorkTreeActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/zinhao/kikoeru/MusicChangeListener;
.implements Landroid/content/ServiceConnection;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/zinhao/kikoeru/TagsView$TagClickListener;
.implements Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/WorkTreeActivity$Companion;,
        Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        "Landroid/content/ServiceConnection;",
        "Landroid/view/View$OnLongClickListener;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
        "Lorg/json/JSONObject;",
        ">;",
        "Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00e4\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010!\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0018\u0000 f2\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u00052\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00062\u00020\u0008:\u0002efB\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0012\u0010%\u001a\u00020&2\u0008\u0010\'\u001a\u0004\u0018\u00010(H\u0015J\u0008\u0010)\u001a\u00020&H\u0002J\u0008\u0010*\u001a\u00020&H\u0002J\u0008\u0010+\u001a\u00020&H\u0002J\u0010\u0010,\u001a\u00020&2\u0006\u0010-\u001a\u00020.H\u0014J\u0008\u0010/\u001a\u00020&H\u0002J\u0010\u00100\u001a\u0002012\u0006\u00102\u001a\u000203H\u0016J\u0010\u00104\u001a\u0002012\u0006\u00105\u001a\u000206H\u0016J\u0010\u00109\u001a\u00020&2\u0006\u0010:\u001a\u00020\u0016H\u0016J\u0010\u0010;\u001a\u00020&2\u0006\u00105\u001a\u00020\u0007H\u0002J\u0010\u0010<\u001a\u00020&2\u0006\u00105\u001a\u00020\u0007H\u0002J\u0010\u0010=\u001a\u00020&2\u0006\u00105\u001a\u00020\u0007H\u0002J\u0010\u0010>\u001a\u00020&2\u0006\u00105\u001a\u00020\u0007H\u0002J\"\u0010?\u001a\u00020&2\u000c\u0010@\u001a\u0008\u0012\u0004\u0012\u00020\u00070A2\u000c\u0010B\u001a\u0008\u0012\u0004\u0012\u00020\u00070AJ\u0010\u0010C\u001a\u00020&2\u0006\u0010D\u001a\u00020EH\u0016J\u0010\u0010F\u001a\u00020&2\u0006\u0010G\u001a\u00020\u0007H\u0016J\u0010\u0010H\u001a\u00020&2\u0006\u0010I\u001a\u00020JH\u0016J\u0008\u0010N\u001a\u00020&H\u0002J\u0008\u0010O\u001a\u00020&H\u0014J\u001c\u0010P\u001a\u00020&2\u0008\u0010Q\u001a\u0004\u0018\u00010R2\u0008\u0010S\u001a\u0004\u0018\u00010TH\u0016J\u0012\u0010U\u001a\u00020&2\u0008\u0010Q\u001a\u0004\u0018\u00010RH\u0016J\u0010\u0010V\u001a\u0002012\u0006\u0010:\u001a\u00020\u0016H\u0016J\u0008\u0010W\u001a\u00020&H\u0002J\u0012\u0010X\u001a\u00020&2\u0008\u0010Y\u001a\u0004\u0018\u00010\u0007H\u0016J\u0008\u0010b\u001a\u00020&H\u0002J\u0010\u0010c\u001a\u00020&2\u0006\u0010d\u001a\u00020aH\u0016R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0018\u00010\u0010R\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0007X\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u001aX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001dX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u001dX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020 X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\"X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020$X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u00107\u001a\u000208X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010K\u001a\u000201X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010L\u001a\u0004\u0018\u00010MX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010Z\u001a\u0004\u0018\u00010[X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\\\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010AX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010]\u001a\u00020JX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010^\u001a\u000208X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010_\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010`\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010a0\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006g"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorkTreeActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        "Landroid/content/ServiceConnection;",
        "Landroid/view/View$OnLongClickListener;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "Lorg/json/JSONObject;",
        "Lcom/zinhao/kikoeru/WorkTreeAdapter$RelativePathChangeListener;",
        "<init>",
        "()V",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "workTreeAdapter",
        "Lcom/zinhao/kikoeru/WorkTreeAdapter;",
        "ctrlBinder",
        "Lcom/zinhao/kikoeru/AudioService$CtrlBinder;",
        "Lcom/zinhao/kikoeru/AudioService;",
        "work",
        "jsonWorkTrees",
        "Lorg/json/JSONArray;",
        "bottomLayout",
        "Landroid/view/View;",
        "ivCover",
        "Landroid/widget/ImageView;",
        "tvTitle",
        "Landroid/widget/TextView;",
        "tvWorkTitle",
        "ibStatus",
        "Landroid/widget/ImageButton;",
        "ibFloatLrc",
        "headerViewCompat",
        "Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;",
        "docTreeCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "setupView",
        "saveLocalHis",
        "initHeader",
        "onNewIntent",
        "intent",
        "Landroid/content/Intent;",
        "loadTree",
        "onCreateOptionsMenu",
        "",
        "menu",
        "Landroid/view/Menu;",
        "onOptionsItemSelected",
        "item",
        "Landroid/view/MenuItem;",
        "actionCallBack",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "onClick",
        "v",
        "openImage",
        "openText",
        "openOther",
        "openAudioOrVideo",
        "findLrcInfo",
        "musicArray",
        "",
        "lrcArray",
        "onAlbumChange",
        "rjNumber",
        "",
        "onAudioChange",
        "audio",
        "onStatusChange",
        "status",
        "",
        "shouldShowAnim",
        "inAnim",
        "Landroid/view/animation/Animation;",
        "showBottomLayout",
        "onDestroy",
        "onServiceConnected",
        "name",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
        "onLongClick",
        "saveWorkWithTree",
        "onTagClick",
        "jsonObject",
        "workAdapter",
        "Lcom/zinhao/kikoeru/WorkAdapter;",
        "works",
        "page",
        "apisCallback",
        "vaClickListener",
        "circlesClickListener",
        "",
        "initLayout",
        "onPathChange",
        "path",
        "HeaderViewCompat",
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
.field public static final Companion:Lcom/zinhao/kikoeru/WorkTreeActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "WorkActivity"


# instance fields
.field private final actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private final apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

.field private bottomLayout:Landroid/view/View;

.field private final circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private final docTreeCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

.field private headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

.field private ibFloatLrc:Landroid/widget/ImageButton;

.field private ibStatus:Landroid/widget/ImageButton;

.field private inAnim:Landroid/view/animation/Animation;

.field private ivCover:Landroid/widget/ImageView;

.field private jsonWorkTrees:Lorg/json/JSONArray;

.field private page:I

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private shouldShowAnim:Z

.field private tvTitle:Landroid/widget/TextView;

.field private tvWorkTitle:Landroid/widget/TextView;

.field private final vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

.field private work:Lorg/json/JSONObject;

.field private workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

.field private workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

.field private works:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$2XZIKew3XMhlkRoh_sV3VWfspfU(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onServiceConnected$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$9E7QTR-5BE7mAJdxtDfB6iugUEw(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$9iJvidOG_RbhRhVcbWBwVHz7PBw(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$4$2(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$DsuCu2GiaXDJ-bwIUwMmmBq7eTs(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/io/File;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$3(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/io/File;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$F7ABG_x4mBuh_QhYo4PNPY3ifLU(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onServiceConnected$lambda$2(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$GctiXtSPCEeoPgdNcs77wCLJX8w(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->circlesClickListener$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$IcVi3jEjHcURyv0HC_rVxEe5J_0(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onCreate$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$LM2XRusp9ajMDYa6MovGPc7P7ck(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$0(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$Nn84wbp3d4Ex7O7_FeJ29ILVCGw(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$4$0$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$SQFrJoa29hc_b50YleR42SrM3mc(Landroid/view/View;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->initLayout$lambda$0$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$S_8zQdr0MBzozqsSyniFqc6TdtY(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$2(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$UlVBnVDJ0iOzpvdH1yyi-X-Ac8s(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->vaClickListener$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic $r8$lambda$bUdI54zVxlyCsUkteoSPVztRhgE(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$4(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$er23uMQYp6yV3TVpSLIMN3-VvNc(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$4$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tKlc6kgATXLzFVoCAS1v3ZTdH4E(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$5(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$uQZyHcQgQQf5ISUj3zIW2CHRekE(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onServiceConnected$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$zaeMhWdIrcZbz6rqh9Rcx-nEfaU(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onLongClick$lambda$4$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/WorkTreeActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/WorkTreeActivity;->Companion:Lcom/zinhao/kikoeru/WorkTreeActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 55
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    .line 110
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$docTreeCallback$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->docTreeCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    .line 334
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$actionCallBack$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const/4 v0, 0x1

    .line 522
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->shouldShowAnim:Z

    .line 764
    iput v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->page:I

    .line 766
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$apisCallback$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    .line 812
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda11;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    .line 825
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda12;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    return-void
.end method

.method public static final synthetic access$getJsonWorkTrees$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lorg/json/JSONArray;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->jsonWorkTrees:Lorg/json/JSONArray;

    return-object p0
.end method

.method public static final synthetic access$getPage$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)I
    .locals 0

    .line 55
    iget p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->page:I

    return p0
.end method

.method public static final synthetic access$getRecyclerView$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static final synthetic access$getViewBinding$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    return-object p0
.end method

.method public static final synthetic access$getWork$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lorg/json/JSONObject;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    return-object p0
.end method

.method public static final synthetic access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkAdapter;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    return-object p0
.end method

.method public static final synthetic access$getWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Lcom/zinhao/kikoeru/WorkTreeAdapter;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    return-object p0
.end method

.method public static final synthetic access$getWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;)Ljava/util/List;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->works:Ljava/util/List;

    return-object p0
.end method

.method public static final synthetic access$initLayout(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->initLayout()V

    return-void
.end method

.method public static final synthetic access$setJsonWorkTrees$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONArray;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->jsonWorkTrees:Lorg/json/JSONArray;

    return-void
.end method

.method public static final synthetic access$setPage$p(Lcom/zinhao/kikoeru/WorkTreeActivity;I)V
    .locals 0

    .line 55
    iput p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->page:I

    return-void
.end method

.method public static final synthetic access$setShouldShowAnim$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Z)V
    .locals 0

    .line 55
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->shouldShowAnim:Z

    return-void
.end method

.method public static final synthetic access$setWorkTreeAdapter$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/WorkTreeAdapter;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    return-void
.end method

.method public static final synthetic access$setWorks$p(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/util/List;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->works:Ljava/util/List;

    return-void
.end method

.method private static final circlesClickListener$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/lang/String;)V
    .locals 4

    .line 829
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/zinhao/kikoeru/App;->mapCirclesId(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 831
    const/4 v2, 0x1

    iput v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->page:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/List;

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->works:Ljava/util/List;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v3, :kikoflu_circle_clear_done

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    :kikoflu_circle_clear_done
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v2, v0, v1, v3}, Lcom/zinhao/kikoeru/Api;->doGetWorkByCircles(IJLcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    .line 833
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 834
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "onTagClick: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WorkActivity"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private final initHeader()V
    .locals 11

    .line 235
    const-string v0, "host"

    const-string v1, "format(...)"

    const-string v2, "name"

    .line 236
    :try_start_0
    move-object v3, p0

    check-cast v3, Landroidx/fragment/app/FragmentActivity;

    invoke-static {v3}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v3

    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v5

    invoke-virtual {v5}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v5

    invoke-virtual {v5}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/api/cover/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, "work"

    const/4 v7, 0x0

    if-nez v5, :cond_0

    :try_start_1
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v5, v7

    :cond_0
    const-string v8, "id"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "?token="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 236
    invoke-virtual {v3, v4}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v3

    .line 239
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v4

    invoke-virtual {v4}, Lcom/zinhao/kikoeru/App;->getRadius15Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v3

    .line 240
    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v5, "headerViewCompat"

    if-nez v4, :cond_1

    :try_start_2
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v7

    :cond_1
    invoke-virtual {v4}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getIvCover()Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 241
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_2

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_2
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvTitle()Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v4, :cond_3

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v7

    :cond_3
    const-string v8, "title"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_4

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_4
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvArt()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v3

    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v4, :cond_5

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v7

    :cond_5
    invoke-static {v4}, Lcom/zinhao/kikoeru/App;->getVasList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v4

    sget-object v8, Lcom/zinhao/kikoeru/TagsView;->JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    invoke-virtual {v8, v2}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->setKey(Ljava/lang/String;)Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    move-result-object v8

    check-cast v8, Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v3, v4, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 243
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_6

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_6
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvTags()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v3

    iget-object v4, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v4, :cond_7

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v7

    :cond_7
    invoke-static {v4}, Lcom/zinhao/kikoeru/App;->getTagsList(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object v4

    sget-object v8, Lcom/zinhao/kikoeru/TagsView;->JSON_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    invoke-virtual {v8, v2}, Lcom/zinhao/kikoeru/TagsView$JsonTextGet;->setKey(Ljava/lang/String;)Lcom/zinhao/kikoeru/TagsView$JsonTextGet;

    move-result-object v8

    check-cast v8, Lcom/zinhao/kikoeru/TagsView$TextGet;

    invoke-virtual {v3, v4, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 244
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_8

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_8
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvCircles()Lcom/zinhao/kikoeru/TagsView;

    move-result-object v3

    const/4 v4, 0x1

    .line 245
    new-array v8, v4, [Ljava/lang/String;

    iget-object v9, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v9, :cond_9

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v9, v7

    :cond_9
    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v9, 0x0

    aput-object v2, v8, v9

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 246
    sget-object v8, Lcom/zinhao/kikoeru/TagsView;->STRING_TEXT_GET:Lcom/zinhao/kikoeru/TagsView$TextGet;

    .line 244
    invoke-virtual {v3, v2, v8}, Lcom/zinhao/kikoeru/TagsView;->setTags(Ljava/lang/Object;Lcom/zinhao/kikoeru/TagsView$TextGet;)V

    .line 248
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v2, :cond_a

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v7

    :cond_a
    const-string v3, "release"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 249
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-nez v3, :cond_c

    .line 250
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v2, :cond_b

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v7

    :cond_b
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvDate()Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 252
    :cond_c
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_d

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_d
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvDate()Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 253
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v3, :cond_e

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_e
    invoke-virtual {v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvDate()Landroid/widget/TextView;

    move-result-object v3

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v2, :cond_f

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v7

    :cond_f
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvPrice()Landroid/widget/TextView;

    move-result-object v2

    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v3, "%d \u65e5\u5143"

    iget-object v8, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v8, :cond_10

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v8, v7

    :cond_10
    const-string v10, "price"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    invoke-static {v3, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v2, :cond_11

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v7

    :cond_11
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvSaleCount()Landroid/widget/TextView;

    move-result-object v2

    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    const-string v3, "\u552e\u51fa\uff1a%d"

    iget-object v8, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v8, :cond_12

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v8, v7

    :cond_12
    const-string v10, "dl_count"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v1, :cond_13

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v7

    :cond_13
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 258
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v1, :cond_14

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v7

    :cond_14
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvHost()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 259
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez v1, :cond_15

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v7

    :cond_15
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvHost()Landroid/widget/TextView;

    move-result-object v1

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez p0, :cond_16

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_16
    move-object v7, p0

    :goto_1
    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 261
    :cond_17
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez p0, :cond_18

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_2

    :cond_18
    move-object v7, p0

    :goto_2
    invoke-virtual {v7}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->getTvHost()Landroid/widget/TextView;

    move-result-object p0

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 264
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    .line 265
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    check-cast p0, Ljava/lang/Exception;

    invoke-virtual {v0, p0}, Lcom/zinhao/kikoeru/App;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private final initLayout()V
    .locals 4

    .line 839
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit16 v0, v0, 0x18b

    const/4 v1, 0x3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v0, 0x2

    .line 840
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 841
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->works:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 842
    new-instance v2, Lcom/zinhao/kikoeru/WorkAdapter;

    const/16 v3, 0x34f

    invoke-direct {v2, v0, v3}, Lcom/zinhao/kikoeru/WorkAdapter;-><init>(Ljava/util/List;I)V

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    .line 843
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda10;

    invoke-direct {v0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {v2, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setItemClickListener(Landroid/view/View$OnClickListener;)V

    .line 849
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    const-string v3, "recyclerView"

    if-nez v0, :cond_0

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_0
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 850
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_1

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v2, v0

    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    :cond_2
    return-void
.end method

.method private static final initLayout$lambda$0$0(Landroid/view/View;)V
    .locals 4

    .line 844
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/json/JSONObject;

    .line 845
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/zinhao/kikoeru/WorkTreeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 846
    const-string v2, "work_json_str"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 847
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v1, v0}, Landroidx/core/app/ActivityCompat;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void
.end method

.method private final loadTree()V
    .locals 6

    .line 285
    const-string v0, "is_local_work"

    const-string v1, "WorkActivity"

    const-string v2, "init: work tree init"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "viewBinding"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v2

    :cond_0
    iget-object v1, v1, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :kikoflu_skip_clear_adapter

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    :kikoflu_skip_clear_adapter

    .line 288
    :try_start_0
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "work"

    if-nez v1, :cond_1

    :try_start_1
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v2

    :cond_1
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v4, "id"

    if-eqz v1, :cond_4

    .line 289
    :try_start_2
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v1, :cond_2

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v2

    :cond_2
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 291
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    iget-object v5, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v5, :cond_3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v2, v5

    :goto_0
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->docTreeCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-virtual {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/LocalFileCache;->readLocalWorkTree(Landroid/content/Context;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    return-void

    .line 295
    :cond_4
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_5

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    move-object v2, v0

    :goto_1
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->docTreeCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-static {v0, v1}, Lcom/zinhao/kikoeru/Api;->doGetDocTree(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 297
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 298
    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_6

    const-string v0, "viewBinding"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_6
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->swipe:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method

.method private static final onCreate$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 4

    const-string v0, "$this$addCallback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const-string v0, "recyclerView"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 164
    new-instance p1, Landroidx/recyclerview/widget/DividerItemDecoration;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    const/4 v3, 0x1

    invoke-direct {p1, v2, v3}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    .line 165
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v3, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v1

    :cond_1
    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 166
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p1, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v3, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 167
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p1, :cond_3

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_3
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 168
    iput-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    goto :goto_0

    .line 170
    :cond_4
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    if-nez p1, :cond_5

    .line 171
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->finishAfterTransition()V

    goto :goto_0

    .line 173
    :cond_5
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->parentDir()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 174
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->finishAfterTransition()V

    .line 179
    :cond_6
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final onLongClick$lambda$0(Lcom/zinhao/kikoeru/DownloadUtils$Mission;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 601
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->stop()V

    return-void
.end method

.method private static final onLongClick$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 605
    new-instance p2, Landroid/content/Intent;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/DownLoadMissionActivity;

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V

    .line 606
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method private static final onLongClick$lambda$2(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 0

    if-eqz p0, :cond_6

    .line 613
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p3

    const p4, 0x36452d

    if-eq p3, p4, :cond_4

    const p4, 0x58d9bd6

    if-eq p3, p4, :cond_2

    const p4, 0x5faa95b

    if-eq p3, p4, :cond_0

    goto :goto_0

    :cond_0
    const-string p3, "image"

    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    .line 618
    :cond_1
    invoke-direct {p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openImage(Lorg/json/JSONObject;)V

    return-void

    .line 613
    :cond_2
    const-string p3, "audio"

    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    .line 614
    :cond_3
    invoke-direct {p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openAudioOrVideo(Lorg/json/JSONObject;)V

    return-void

    .line 613
    :cond_4
    const-string p3, "text"

    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto :goto_0

    .line 616
    :cond_5
    invoke-direct {p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openText(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 621
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_6
    :goto_0
    return-void
.end method

.method private static final onLongClick$lambda$3(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/io/File;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 627
    new-instance p3, Landroid/content/Intent;

    const-string p4, "android.intent.action.VIEW"

    invoke-direct {p3, p4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 629
    move-object p4, p0

    check-cast p4, Landroid/content/Context;

    .line 630
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".fileProvider"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 628
    invoke-static {p4, v0, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    const/4 p4, 0x1

    .line 633
    invoke-virtual {p3, p4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v0, 0x2

    .line 634
    invoke-virtual {p3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 635
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2, p4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    const-string p4, "%s/*"

    invoke-static {p4, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string p4, "format(...)"

    invoke-static {p2, p4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 637
    :try_start_0
    invoke-virtual {p0, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 639
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private static final onLongClick$lambda$4(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;Landroid/content/DialogInterface;I)V
    .locals 3

    .line 649
    iget-object p3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    const/4 v0, 0x0

    const-string v1, "work"

    if-nez p3, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p3, v0

    :cond_0
    const-string v2, "is_local_work"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 651
    iget-object p3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez p3, :cond_1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p3, v0

    :cond_1
    const-string v2, "host"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_2

    return-void

    .line 655
    :cond_2
    :try_start_0
    iget-object p3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez p3, :cond_3

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v0, p3

    :goto_0
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 656
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v0

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_4

    .line 658
    check-cast p0, Landroid/content/Context;

    .line 659
    const-string p1, "switch host user then start download!"

    check-cast p1, Ljava/lang/CharSequence;

    const/4 p2, 0x0

    .line 657
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 661
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 665
    new-instance p1, Ljava/lang/RuntimeException;

    check-cast p0, Ljava/lang/Throwable;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 669
    :cond_4
    new-instance p3, Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    invoke-direct {p3, p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;-><init>(Lorg/json/JSONObject;)V

    .line 670
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p3, p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->setSuccessCallback(Ljava/lang/Runnable;)V

    .line 677
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->isSaveExternal()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 678
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0, p3}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda8;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->requestReadWriteExternalPermission(Ljava/lang/Runnable;)Z

    move-result p1

    goto :goto_1

    :cond_5
    const/4 p1, 0x1

    :goto_1
    if-eqz p1, :cond_6

    .line 695
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->saveWorkWithTree()V

    .line 696
    invoke-virtual {p3}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->start()V

    .line 697
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda9;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda9;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 701
    :cond_6
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method private static final onLongClick$lambda$4$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 1

    .line 671
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda7;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final onLongClick$lambda$4$0$0(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 1

    .line 672
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 673
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->mapFileExistValue()V

    :cond_0
    return-void
.end method

.method private static final onLongClick$lambda$4$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V
    .locals 2

    .line 679
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 680
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 684
    :cond_0
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    :goto_0
    return-void

    .line 688
    :cond_1
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->saveWorkWithTree()V

    .line 689
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/DownloadUtils$Mission;->start()V

    return-void
.end method

.method private static final onLongClick$lambda$4$2(Lcom/zinhao/kikoeru/WorkTreeActivity;)V
    .locals 0

    .line 698
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method private static final onLongClick$lambda$5(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/content/DialogInterface;I)V
    .locals 3

    .line 707
    new-instance p2, Landroid/content/Intent;

    const-string p3, "android.intent.action.VIEW"

    invoke-direct {p2, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 709
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 p3, 0x0

    const-string v0, "http"

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {p0, v0, v1, v2, p3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p3

    const-string v0, "format(...)"

    if-nez p3, :cond_0

    .line 710
    sget-object p3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 712
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p3

    invoke-virtual {p3}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object p3

    invoke-virtual {p3}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object p3

    .line 714
    sget-object v1, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    filled-new-array {p3, p0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p3, 0x3

    .line 710
    invoke-static {p0, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string p3, "%s%s?token=%s"

    invoke-static {p3, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 717
    :cond_0
    sget-object p3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    sget-object p3, Lcom/zinhao/kikoeru/Api;->token:Ljava/lang/String;

    filled-new-array {p0, p3}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string p3, "%s?token=%s"

    invoke-static {p3, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 719
    :goto_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 721
    :try_start_0
    invoke-virtual {p1, p2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 723
    check-cast p0, Ljava/lang/Exception;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private static final onServiceConnected$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 1

    .line 549
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 550
    :cond_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 551
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->pause()V

    return-void

    .line 553
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat;->getTransportControls()Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$TransportControls;->play()V

    return-void
.end method

.method private static final onServiceConnected$lambda$1(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 0

    .line 557
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->isLrcWindowShow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 558
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->hideLrcFloatWindow()V

    return-void

    .line 560
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->showLrcFloatWindow()V

    return-void
.end method

.method private static final onServiceConnected$lambda$2(Lcom/zinhao/kikoeru/WorkTreeActivity;Landroid/view/View;)V
    .locals 5

    .line 565
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrentTitle()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCurrentTitle(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "mp4"

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2, v3}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 566
    new-instance p1, Landroid/content/Intent;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/VideoPlayerActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 568
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 569
    sget v1, Lcom/zinhao/kikoeru/R$id;->imageView:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 571
    move-object v1, p0

    check-cast v1, Landroid/app/Activity;

    const-string v2, "hero_bottom"

    .line 570
    invoke-static {v1, p1, v2}, Landroidx/core/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)Landroidx/core/app/ActivityOptionsCompat;

    move-result-object p1

    const-string v1, "makeSceneTransitionAnimation(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 573
    invoke-virtual {p1}, Landroidx/core/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 576
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 577
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private final openAudioOrVideo(Lorg/json/JSONObject;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 424
    const-string v2, "hash"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 425
    const-string v4, "title"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 426
    const-string v5, "mediaStreamUrl"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 427
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/List;

    .line 428
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    check-cast v8, Ljava/util/List;

    .line 430
    iget-object v9, v1, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    if-eqz v9, :cond_2

    .line 431
    invoke-virtual {v9}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getData()Lorg/json/JSONArray;

    move-result-object v11

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_0
    if-ge v12, v11, :cond_3

    .line 432
    invoke-virtual {v9}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getData()Lorg/json/JSONArray;

    move-result-object v14

    invoke-virtual {v14, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 433
    const-string v15, "type"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 434
    const-string v10, "audio"

    invoke-static {v10, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 435
    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 437
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v13, v10, -0x1

    .line 440
    :cond_0
    const-string v10, "text"

    invoke-static {v10, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 441
    invoke-static {v14}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v8, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :cond_2
    const/4 v13, 0x0

    .line 446
    :cond_3
    const-string v2, "lrc_info"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 448
    :try_start_0
    invoke-virtual {v1, v7, v8}, Lcom/zinhao/kikoeru/WorkTreeActivity;->findLrcInfo(Ljava/util/List;Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 450
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v2}, Lorg/json/JSONException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 451
    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    .line 454
    :cond_4
    :goto_1
    iget-object v0, v1, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    if-eqz v0, :cond_7

    .line 455
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrent()Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getCurrent()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 456
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "toLowerCase(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, ".mp4"

    const/4 v5, 0x0

    invoke-static {v0, v4, v5, v2, v3}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 457
    new-instance v0, Landroid/content/Intent;

    move-object v2, v1

    check-cast v2, Landroid/content/Context;

    const-class v3, Lcom/zinhao/kikoeru/VideoPlayerActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 459
    :cond_5
    new-instance v0, Landroid/content/Intent;

    move-object v2, v1

    check-cast v2, Landroid/content/Context;

    const-class v3, Lcom/zinhao/kikoeru/AudioPlayerActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 462
    :cond_6
    invoke-virtual {v0, v7, v13}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->play(Ljava/util/List;I)V

    :cond_7
    :goto_2
    return-void
.end method

.method private final openImage(Lorg/json/JSONObject;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 376
    const-string v0, "hash"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    check-cast v1, Ljava/util/List;

    .line 378
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workTreeAdapter:Lcom/zinhao/kikoeru/WorkTreeAdapter;

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    .line 379
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getData()Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v5, v3

    :goto_0
    if-ge v3, v4, :cond_2

    .line 380
    invoke-virtual {v2}, Lcom/zinhao/kikoeru/WorkTreeAdapter;->getData()Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 381
    const-string v7, "type"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "image"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 384
    :try_start_0
    const-string v7, "local_file_path"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 385
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    const/4 v9, 0x1

    if-nez v8, :cond_0

    .line 386
    const-string v7, "mediaStreamUrl"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 387
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v7, v9}, Lcom/zinhao/kikoeru/Api;->formatGetUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v7

    .line 389
    :cond_0
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 391
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    sub-int/2addr v5, v9

    goto :goto_1

    :catch_0
    move-exception v6

    .line 394
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    .line 395
    check-cast v6, Ljava/lang/Exception;

    invoke-virtual {p0, v6}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    move v3, v5

    .line 400
    :cond_3
    check-cast p0, Landroid/content/Context;

    invoke-static {p0, v1, v3}, Lcom/zinhao/kikoeru/ImageBrowserActivity;->start(Landroid/content/Context;Ljava/util/List;I)V

    return-void
.end method

.method private final openOther(Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 409
    const-string v0, "mediaStreamUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 410
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 411
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x0

    const-string v2, "http"

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {p1, v2, v3, v4, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 412
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v1

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v1

    invoke-virtual {v1}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string v1, "%s%s"

    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "format(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 414
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 416
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 418
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method private final openText(Lorg/json/JSONObject;)V
    .locals 1

    .line 404
    sget-object v0, Lcom/zinhao/kikoeru/TextRowActivity;->Companion:Lcom/zinhao/kikoeru/TextRowActivity$Companion;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity$Companion;->start(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private final saveLocalHis()V
    .locals 11

    .line 218
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type com.zinhao.kikoeru.App"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lcom/zinhao/kikoeru/App;

    .line 220
    :try_start_0
    new-instance v1, Lcom/zinhao/kikoeru/db/LocalWorkHistory;

    .line 221
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x0

    const-string v4, "work"

    if-nez v2, :cond_0

    :try_start_1
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v3

    :cond_0
    const-string v5, "id"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v5, v2

    move-wide v9, v5

    move-object v6, v3

    move-wide v2, v9

    move-object v7, v4

    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object v8, v6

    const-string v6, ""

    .line 223
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez p0, :cond_1

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p0, v8

    :cond_1
    const-string v7, "title"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 220
    invoke-direct/range {v1 .. v7}, Lcom/zinhao/kikoeru/db/LocalWorkHistory;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    .line 225
    new-instance p0, Lcom/zinhao/kikoeru/WorkTreeActivity$saveLocalHis$1;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$saveLocalHis$1;-><init>()V

    check-cast p0, Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/App;->insertLocalHis(Lcom/zinhao/kikoeru/db/LocalWorkHistory;Ljava/lang/Runnable;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 230
    new-instance v0, Ljava/lang/RuntimeException;

    check-cast p0, Ljava/lang/Throwable;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private final saveWorkWithTree()V
    .locals 5

    .line 736
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->jsonWorkTrees:Lorg/json/JSONArray;

    if-eqz v0, :cond_2

    .line 738
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    const-string v2, "work"

    if-nez v0, :cond_0

    :try_start_1
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const-string v3, "host"

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v4

    invoke-virtual {v4}, Lcom/zinhao/kikoeru/App;->currentUser()Lcom/zinhao/kikoeru/db/User;

    move-result-object v4

    invoke-virtual {v4}, Lcom/zinhao/kikoeru/db/User;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 739
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v3, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v3

    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->jsonWorkTrees:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/LocalFileCache;->saveWork(Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 741
    invoke-virtual {p0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_2
    return-void
.end method

.method private final setupView()V
    .locals 4

    .line 207
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    sget v1, Lcom/zinhao/kikoeru/R$anim;->move_bottom_in:I

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->inAnim:Landroid/view/animation/Animation;

    .line 208
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    const/4 v1, 0x0

    const-string v2, "viewBinding"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const-string v3, "recyclerView"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 209
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v0

    const-string v3, "getRoot(...)"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    .line 210
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_2
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->imageView:Landroid/widget/ImageView;

    const-string v3, "imageView"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ivCover:Landroid/widget/ImageView;

    .line 211
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_3

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_3
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->textView:Landroid/widget/TextView;

    const-string v3, "textView"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->tvTitle:Landroid/widget/TextView;

    .line 212
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_4

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_4
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->textView2:Landroid/widget/TextView;

    const-string v3, "textView2"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->tvWorkTitle:Landroid/widget/TextView;

    .line 213
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_5

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_5
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->button:Landroid/widget/ImageButton;

    const-string v3, "button"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibStatus:Landroid/widget/ImageButton;

    .line 214
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez v0, :cond_6

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    move-object v1, v0

    :goto_0
    iget-object v0, v1, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->imageButton:Landroid/widget/ImageButton;

    const-string v1, "imageButton"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibFloatLrc:Landroid/widget/ImageButton;

    return-void
.end method

.method private final showBottomLayout()V
    .locals 5

    .line 525
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->shouldShowAnim:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    .line 526
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->shouldShowAnim:Z

    .line 527
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    const/4 v2, 0x0

    const-string v3, "bottomLayout"

    if-nez v1, :cond_0

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v2

    :cond_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 528
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    if-nez v0, :cond_1

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_1
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->inAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 529
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    if-nez v0, :cond_2

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v2, v0

    :goto_0
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$showBottomLayout$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v0, Ljava/lang/Runnable;

    .line 533
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->inAnim:Landroid/view/animation/Animation;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v3

    .line 529
    invoke-virtual {v2, v0, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    return-void
.end method

.method private static final vaClickListener$lambda$0(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "onTagClick: "

    .line 814
    :try_start_0
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 815
    const-string v2, "WorkActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    const-string v0, "name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 817
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setTitle(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->page:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->works:Ljava/util/List;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v2, :kikoflu_va_clear_done

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    :kikoflu_va_clear_done
    .line 818
    const/4 p1, 0x1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, v1, v0}, Lcom/zinhao/kikoeru/Api;->doGetWorkByVa(ILjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 820
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 821
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method


# virtual methods
.method public final findLrcInfo(Ljava/util/List;Ljava/util/List;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "musicArray"

    move-object/from16 v1, p1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "lrcArray"

    move-object/from16 v2, p2

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 470
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 471
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 472
    const-string v5, "title"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 473
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 474
    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v7, v6

    check-cast v7, Ljava/lang/CharSequence;

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v5, Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_3

    goto :goto_0

    :cond_3
    const/4 v13, 0x0

    const/4 v14, 0x2

    const/4 v15, 0x0

    .line 477
    invoke-static {v5, v7, v13, v14, v15}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v8

    const-string v9, "lrc_info"

    if-eqz v8, :cond_4

    .line 479
    invoke-virtual {v1, v9, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 483
    :cond_4
    const-string v8, "."

    move-object v10, v8

    check-cast v10, Ljava/lang/CharSequence;

    invoke-static {v7, v10, v13, v14, v15}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    check-cast v8, Ljava/lang/CharSequence;

    invoke-static {v5, v8, v13, v14, v15}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v11, 0x6

    const/4 v12, 0x0

    .line 484
    const-string v8, "."

    move-object v10, v9

    const/4 v9, 0x0

    move-object/from16 v16, v10

    const/4 v10, 0x0

    move-object/from16 v17, v16

    invoke-static/range {v7 .. v12}, Lkotlin/text/StringsKt;->lastIndexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v7

    .line 485
    invoke-virtual {v6, v13, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, "substring(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 486
    check-cast v6, Ljava/lang/CharSequence;

    invoke-static {v5, v6, v13, v14, v15}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object/from16 v10, v17

    .line 487
    invoke-virtual {v1, v10, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method public onAlbumChange(J)V
    .locals 1

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ivCover:Landroid/widget/ImageView;

    invoke-static {p0, v0, p1, p2}, Lcom/zinhao/kikoeru/PlayerArtwork;->bindLocal(Landroid/content/Context;Landroid/widget/ImageView;J)Z

    move-result v0

    if-eqz v0, :native_remote_tree_mini_art

    return-void

    :native_remote_tree_mini_art

    .line 497
    move-object v0, p0

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/Api;->minCoverImageUrl(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    .line 498
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p2

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/App;->getRadius5Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ivCover:Landroid/widget/ImageView;

    if-nez p0, :cond_0

    const-string p0, "ivCover"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public onAudioChange(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "audio"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 503
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->tvTitle:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "tvTitle"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const-string v2, "title"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 504
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->tvWorkTitle:Landroid/widget/TextView;

    if-nez v0, :cond_1

    const-string v0, "tvWorkTitle"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    const-string v0, "workTitle"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 506
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 507
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    const-string v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 356
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type org.json.JSONObject"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lorg/json/JSONObject;

    .line 358
    :try_start_0
    const-string v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 359
    const-string v1, "image"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 360
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openImage(Lorg/json/JSONObject;)V

    return-void

    .line 361
    :cond_0
    const-string v1, "audio"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 362
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openAudioOrVideo(Lorg/json/JSONObject;)V

    return-void

    .line 363
    :cond_1
    const-string v1, "text"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 364
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openText(Lorg/json/JSONObject;)V

    return-void

    .line 366
    :cond_2
    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->openOther(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 369
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 370
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 150
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/BottomDockStyle;->apply(Landroid/app/Activity;)V

    .line 151
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    .line 152
    const-string v0, "viewBinding"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setContentView(Landroid/view/View;)V

    .line 153
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez p1, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_1
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    const-string v2, "appBarLayout"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/view/View;

    new-instance v2, Lcom/zinhao/kikoeru/WorkTreeActivity$onCreate$1;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$onCreate$1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    check-cast v2, Lcom/zinhao/kikoeru/BaseActivity$InsetReady;

    invoke-virtual {p0, p1, v2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 160
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez p1, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 161
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object p1

    const-string v2, "<get-onBackPressedDispatcher>(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v2, p0

    check-cast v2, Landroidx/lifecycle/LifecycleOwner;

    new-instance v3, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda6;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    const/4 v4, 0x1

    invoke-static {p1, v2, v4, v3}, Landroidx/activity/OnBackPressedDispatcherKt;->addCallback(Landroidx/activity/OnBackPressedDispatcher;Landroidx/lifecycle/LifecycleOwner;ZLkotlin/jvm/functions/Function1;)Landroidx/activity/OnBackPressedCallback;

    .line 180
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v2, "work_json_str"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 181
    move-object v2, p1

    check-cast v2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_4

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    .line 183
    :cond_3
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 185
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 186
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    .line 187
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->finish()V

    return-void

    .line 192
    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setupView()V

    .line 194
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;

    if-nez p1, :cond_5

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_5
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityWorkBinding;->headerInfo:Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/databinding/ItemWorkHeaderBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    const-string v0, "getRoot(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/view/View;

    .line 195
    new-instance v0, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    invoke-direct {v0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    .line 196
    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 197
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    const-string v0, "headerViewCompat"

    if-nez p1, :cond_6

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_6
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {p1, v2}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->setVaClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 198
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->headerViewCompat:Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;

    if-nez p1, :cond_7

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    move-object v1, p1

    :goto_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v1, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$HeaderViewCompat;->setCirclesClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 199
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->initHeader()V

    .line 201
    new-instance p1, Landroid/content/Intent;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    invoke-virtual {p0, p1, v0, v4}, Lcom/zinhao/kikoeru/WorkTreeActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 202
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->loadTree()V

    .line 203
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->saveLocalHis()V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 5

    const-string v0, "menu"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 303
    sget v1, Lcom/zinhao/kikoeru/R$string;->mark_action:I

    invoke-interface {p1, v0, v0, v0, v1}, Landroid/view/Menu;->addSubMenu(IIII)Landroid/view/SubMenu;

    move-result-object v0

    .line 304
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_work_24:I

    invoke-interface {v0, v1}, Landroid/view/SubMenu;->setIcon(I)Landroid/view/SubMenu;

    .line 305
    sget v1, Lcom/zinhao/kikoeru/R$string;->marked:I

    const/4 v2, 0x1

    invoke-interface {v0, v2, v2, v2, v1}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 306
    sget v1, Lcom/zinhao/kikoeru/R$string;->listening:I

    const/4 v3, 0x2

    invoke-interface {v0, v2, v3, v3, v1}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/4 v1, 0x3

    .line 307
    sget v4, Lcom/zinhao/kikoeru/R$string;->listened:I

    invoke-interface {v0, v2, v1, v1, v4}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/4 v1, 0x4

    .line 308
    sget v4, Lcom/zinhao/kikoeru/R$string;->replay:I

    invoke-interface {v0, v2, v1, v1, v4}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/4 v1, 0x5

    .line 309
    sget v4, Lcom/zinhao/kikoeru/R$string;->postponed:I

    invoke-interface {v0, v2, v1, v1, v4}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 310
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 311
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method protected onDestroy()V
    .locals 2

    .line 538
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V

    .line 539
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->removeMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    .line 540
    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    const-string v0, "local_file_path"

    const-string v1, "v"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 586
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v1, p1, Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    check-cast p1, Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 588
    :cond_1
    :try_start_0
    const-string v2, "type"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 589
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    return v1

    .line 592
    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 593
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    sget v4, Lcom/zinhao/kikoeru/R$style;->RoundedAlertDialog:I

    invoke-direct {v0, v3, v4}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 594
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 595
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 596
    invoke-static {p1}, Lcom/zinhao/kikoeru/DownloadUtils;->mapMission(Lorg/json/JSONObject;)Lcom/zinhao/kikoeru/DownloadUtils$Mission;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 598
    sget p1, Lcom/zinhao/kikoeru/R$string;->downloading:I

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 600
    sget p1, Lcom/zinhao/kikoeru/R$string;->cancel_download:I

    .line 599
    new-instance v1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda16;

    invoke-direct {v1, v3}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda16;-><init>(Lcom/zinhao/kikoeru/DownloadUtils$Mission;)V

    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 603
    sget p1, Lcom/zinhao/kikoeru/R$string;->check_mission:I

    .line 602
    new-instance v1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto :goto_1

    .line 610
    :cond_3
    sget v3, Lcom/zinhao/kikoeru/R$string;->open:I

    .line 609
    new-instance v4, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda2;

    invoke-direct {v4, v2, p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v3, v4}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 625
    const-string p1, "open with"

    check-cast p1, Ljava/lang/CharSequence;

    .line 624
    new-instance v3, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0, v1, v2}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda3;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    goto :goto_1

    .line 644
    :cond_4
    sget v2, Lcom/zinhao/kikoeru/R$string;->not_download:I

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/WorkTreeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 645
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 647
    sget v1, Lcom/zinhao/kikoeru/R$string;->download:I

    .line 646
    new-instance v2, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda4;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 703
    const-string v1, "mediaStreamUrl"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 705
    const-string v1, "open in browser"

    check-cast v1, Ljava/lang/CharSequence;

    .line 704
    new-instance v2, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 727
    :goto_1
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->show()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 729
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 730
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    :goto_2
    const/4 p0, 0x1

    return p0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    const-string v0, "intent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 270
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 271
    const-string v0, "work_json_str"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 272
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onNewIntent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WorkActivity"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_1

    .line 273
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 275
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->initHeader()V

    .line 276
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->loadTree()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 278
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 279
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    const-string v0, "item"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 316
    :try_start_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "work"

    const-string v4, "id"

    if-ne v0, v1, :cond_1

    .line 317
    :try_start_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "marked"

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/Api;->doPutReview(JLjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    goto/16 :goto_5

    .line 318
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 319
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_2

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    move-object v2, v0

    :goto_1
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "listening"

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/Api;->doPutReview(JLjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    goto :goto_5

    .line 320
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_5

    .line 321
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_4

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    move-object v2, v0

    :goto_2
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "listened"

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/Api;->doPutReview(JLjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    goto :goto_5

    .line 322
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_7

    .line 323
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_6

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_3

    :cond_6
    move-object v2, v0

    :goto_3
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "replay"

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/Api;->doPutReview(JLjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    goto :goto_5

    .line 324
    :cond_7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_9

    .line 325
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->work:Lorg/json/JSONObject;

    if-nez v0, :cond_8

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_4

    :cond_8
    move-object v2, v0

    :goto_4
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    const-string v2, "postponed"

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->actionCallBack:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/Api;->doPutReview(JLjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 328
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 329
    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    .line 331
    :cond_9
    :goto_5
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public onPathChange(Ljava/lang/String;)V
    .locals 2

    const-string v0, "path"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 857
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xf

    if-le v0, v1, :cond_0

    .line 858
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "..."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0xc

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "substring(...)"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 860
    :cond_0
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 544
    const-string p1, "null cannot be cast to non-null type com.zinhao.kikoeru.AudioService.CtrlBinder"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    .line 545
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result p1

    const/4 p2, 0x3

    const-string v0, "bottomLayout"

    const/4 v1, 0x0

    if-ne p1, p2, :cond_1

    .line 546
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_0
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 548
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibStatus:Landroid/widget/ImageButton;

    if-nez p1, :cond_2

    const-string p1, "ibStatus"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    new-instance p2, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda13;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda13;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 556
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibFloatLrc:Landroid/widget/ImageButton;

    if-nez p1, :cond_3

    const-string p1, "ibFloatLrc"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_3
    new-instance p2, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda14;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda14;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 563
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    if-nez p1, :cond_4

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    move-object v1, p1

    :goto_0
    new-instance p1, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda15;

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorkTreeActivity$$ExternalSyntheticLambda15;-><init>(Lcom/zinhao/kikoeru/WorkTreeActivity;)V

    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 580
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p0, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->addMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method

.method public onStatusChange(I)V
    .locals 3

    .line 512
    const-string v0, "ibStatus"

    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 513
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibStatus:Landroid/widget/ImageButton;

    if-nez p0, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object v1, p0

    :goto_0
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_play_arrow_24:I

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void

    .line 515
    :cond_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->bottomLayout:Landroid/view/View;

    if-nez p1, :cond_2

    const-string p1, "bottomLayout"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v2, 0x8

    if-ne p1, v2, :cond_3

    .line 516
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorkTreeActivity;->showBottomLayout()V

    .line 518
    :cond_3
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorkTreeActivity;->ibStatus:Landroid/widget/ImageButton;

    if-nez p0, :cond_4

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v1, p0

    :goto_1
    sget p0, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_pause_24:I

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void
.end method

.method public bridge synthetic onTagClick(Ljava/lang/Object;)V
    .locals 0

    .line 55
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->onTagClick(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onTagClick(Lorg/json/JSONObject;)V
    .locals 6

    .line 748
    const-string v0, "id"

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_0
    move-object v2, v1

    .line 749
    :goto_0
    const-string v3, "name"

    if-eqz p1, :cond_1

    :try_start_1
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 750
    :cond_1
    move-object p1, v1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 751
    new-instance p1, Landroid/content/Intent;

    move-object v4, p0

    check-cast v4, Landroid/content/Context;

    const-class v5, Lcom/zinhao/kikoeru/WorksActivity;

    invoke-direct {p1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 752
    const-string v4, "resultType"

    const-string v5, "tag"

    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 753
    check-cast v2, Ljava/io/Serializable;

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 754
    invoke-virtual {p1, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 755
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 757
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 758
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorkTreeActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method
