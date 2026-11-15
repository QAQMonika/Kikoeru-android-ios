.class public final Lcom/zinhao/kikoeru/WorksActivity;
.super Lcom/zinhao/kikoeru/BaseActivity;
.source "WorksActivity.kt"

# interfaces
.implements Lcom/zinhao/kikoeru/MusicChangeListener;
.implements Landroid/content/ServiceConnection;
.implements Lcom/zinhao/kikoeru/TagsView$TagClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/WorksActivity$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        "Landroid/content/ServiceConnection;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00de\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 o2\u00020\u00012\u00020\u00022\u00020\u00032\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004:\u0001oB\u0007\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0012\u00107\u001a\u0002082\u0008\u00109\u001a\u0004\u0018\u00010:H\u0014J\u0008\u0010;\u001a\u000208H\u0002J\u0008\u0010<\u001a\u000208H\u0002J\u0008\u0010=\u001a\u000208H\u0002J\u0008\u0010>\u001a\u000208H\u0002J\u0008\u0010?\u001a\u000208H\u0002J\u0008\u0010@\u001a\u000208H\u0002J\u0006\u0010A\u001a\u000208J\u0010\u0010B\u001a\u0002082\u0008\u0008\u0002\u0010,\u001a\u00020\u0011J\u0010\u0010C\u001a\u0002082\u0006\u0010D\u001a\u00020*H\u0017J\u0010\u0010E\u001a\u0002082\u0006\u0010F\u001a\u00020\u0005H\u0016J\u0010\u0010G\u001a\u0002082\u0006\u0010H\u001a\u00020\u0011H\u0016J\u001c\u0010I\u001a\u0002082\u0008\u0010J\u001a\u0004\u0018\u00010K2\u0008\u0010L\u001a\u0004\u0018\u00010MH\u0016J\u0012\u0010N\u001a\u0002082\u0008\u0010J\u001a\u0004\u0018\u00010KH\u0016J\u0010\u0010O\u001a\u00020\u001a2\u0006\u0010P\u001a\u00020QH\u0016J\u0010\u0010R\u001a\u00020\u001a2\u0006\u0010S\u001a\u00020TH\u0016J\"\u0010U\u001a\u0002082\u0006\u0010V\u001a\u00020\u00112\u0006\u0010W\u001a\u00020\u00112\u0008\u0010X\u001a\u0004\u0018\u00010YH\u0014J\u0008\u0010Z\u001a\u000208H\u0002J\u0010\u0010[\u001a\u0002082\u0006\u0010\\\u001a\u00020\u0011H\u0002J\u0008\u0010]\u001a\u000208H\u0002J\u0008\u0010^\u001a\u000208H\u0014J\u0010\u0010_\u001a\u0002082\u0006\u0010`\u001a\u00020YH\u0014J\u0012\u0010a\u001a\u0002082\u0008\u0010b\u001a\u0004\u0018\u00010\u0005H\u0016J\u001c\u0010g\u001a\u0002082\u0006\u0010h\u001a\u00020i2\n\u0008\u0002\u0010j\u001a\u0004\u0018\u00010kH\u0002R\u000e\u0010\u0008\u001a\u00020\tX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00050\rX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u001eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001f\u001a\u0004\u0018\u00010\u001eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\"\u001a\u0004\u0018\u00010!X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010$\u001a\u0004\u0018\u00010%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\'\u001a\u0004\u0018\u00010%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010(\u001a\u0004\u0018\u00010%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010)\u001a\u00020*X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020%X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010-\u001a\u0008\u0018\u00010.R\u00020/X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00100\u001a\u0004\u0018\u000101X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00102\u001a\u0004\u0018\u000101X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00103\u001a\u0004\u0018\u000104X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00105\u001a\u000206X\u0082.\u00a2\u0006\u0002\n\u0000R\u0016\u0010c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010%0\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010e\u001a\u00020fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010l\u001a\u0004\u0018\u00010%8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008m\u0010n\u00a8\u0006p"
    }
    d2 = {
        "Lcom/zinhao/kikoeru/WorksActivity;",
        "Lcom/zinhao/kikoeru/BaseActivity;",
        "Lcom/zinhao/kikoeru/MusicChangeListener;",
        "Landroid/content/ServiceConnection;",
        "Lcom/zinhao/kikoeru/TagsView$TagClickListener;",
        "Lorg/json/JSONObject;",
        "<init>",
        "()V",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "workAdapter",
        "Lcom/zinhao/kikoeru/WorkAdapter;",
        "works",
        "",
        "scrollListener",
        "Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;",
        "page",
        "",
        "currentPage",
        "totalCount",
        "bottomLayout",
        "Landroid/view/View;",
        "outAnim",
        "Landroid/view/animation/Animation;",
        "inAnim",
        "shouldShowAnim",
        "",
        "ivCover",
        "Landroid/widget/ImageView;",
        "tvTitle",
        "Landroid/widget/TextView;",
        "tvWorkTitle",
        "ibStatus",
        "Landroid/widget/ImageButton;",
        "ibFloatLrcWindow",
        "tagId",
        "tagStr",
        "",
        "vaId",
        "vaName",
        "circlesName",
        "circlesId",
        "",
        "lastOpenTitle",
        "type",
        "ctrlBinder",
        "Lcom/zinhao/kikoeru/AudioService$CtrlBinder;",
        "Lcom/zinhao/kikoeru/AudioService;",
        "progressMenu",
        "Landroidx/appcompat/widget/ListPopupWindow;",
        "moreMenu",
        "itemDecoration",
        "Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;",
        "viewBinding",
        "Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "setupView",
        "setupData",
        "setupListener",
        "setupMoreMenu",
        "setupProgressMenu",
        "toggleBottom",
        "loadLastOpenWork",
        "loadFromNetWork",
        "onAlbumChange",
        "rjNumber",
        "onAudioChange",
        "audio",
        "onStatusChange",
        "status",
        "onServiceConnected",
        "name",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
        "onCreateOptionsMenu",
        "menu",
        "Landroid/view/Menu;",
        "onOptionsItemSelected",
        "item",
        "Landroid/view/MenuItem;",
        "onActivityResult",
        "requestCode",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "scrollToLastOpenPosition",
        "initLayout",
        "layoutType",
        "clearWork",
        "onDestroy",
        "onNewIntent",
        "intent",
        "onTagClick",
        "jsonObject",
        "vaClickListener",
        "circlesClickListener",
        "apisCallback",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
        "updateListWith",
        "jsonArray",
        "Lorg/json/JSONArray;",
        "afterUpdate",
        "Ljava/lang/Runnable;",
        "currentTitle",
        "getCurrentTitle",
        "()Ljava/lang/String;",
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
.field private static final CIRCLES_SELECT_RESULT:I = 0x10

.field private static final CONFIG_PAGE:Ljava/lang/String; = "last_page"

.field private static final CONFIG_PARAM_INT:Ljava/lang/String; = "last_param_int"

.field private static final CONFIG_PARAM_POSITION:Ljava/lang/String; = "last_open_work_position"

.field private static final CONFIG_PARAM_STR:Ljava/lang/String; = "last_param_str"

.field private static final CONFIG_PARAM_TITLE:Ljava/lang/String; = "last_param_title"

.field private static final CONFIG_TOTAL:Ljava/lang/String; = "total_count"

.field private static final CONFIG_TYPE:Ljava/lang/String; = "last_type"

.field public static final Companion:Lcom/zinhao/kikoeru/WorksActivity$Companion;

.field private static final TAG:Ljava/lang/String; = "WorksActivity"

.field private static final TAG_SELECT_RESULT:I = 0xe

.field private static final TYPE_ALL_WORK:I = 0x1eb

.field private static final TYPE_CIRCLES_WORK:I = 0x1f4

.field private static final TYPE_LOCAL_WORK:I = 0x1f2

.field private static final TYPE_SELF_LISTENED:I = 0x1ed

.field private static final TYPE_SELF_LISTENING:I = 0x1ec

.field private static final TYPE_SELF_MARKED:I = 0x1ee

.field private static final TYPE_SELF_POSTPONED:I = 0x1f0

.field private static final TYPE_SELF_REPLAY:I = 0x1ef

.field private static final TYPE_TAG_WORK:I = 0x1f1

.field private static final TYPE_VA_WORK:I = 0x1f3

.field private static final VA_SELECT_RESULT:I = 0xf


# instance fields
.field private volatile catalogGeneration:I

.field private catalogSubtitle:I

.field private catalogResumed:Z
.field private apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

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

.field private circlesId:J

.field private circlesName:Ljava/lang/String;

.field private ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

.field private currentPage:I

.field private ibFloatLrcWindow:Landroid/widget/ImageButton;

.field private ibStatus:Landroid/widget/ImageButton;

.field private inAnim:Landroid/view/animation/Animation;

.field private itemDecoration:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

.field private ivCover:Landroid/widget/ImageView;

.field private lastOpenTitle:Ljava/lang/String;

.field private moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

.field private outAnim:Landroid/view/animation/Animation;

.field private page:I

.field private progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

.field private recyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private scrollListener:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

.field private shouldShowAnim:Z

.field private tagId:I

.field private tagStr:Ljava/lang/String;

.field private totalCount:I

.field private tvTitle:Landroid/widget/TextView;

.field private tvWorkTitle:Landroid/widget/TextView;

.field private type:I

.field private final vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/zinhao/kikoeru/TagsView$TagClickListener<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field private vaId:Ljava/lang/String;

.field private vaName:Ljava/lang/String;

.field private viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

.field private workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

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
.method public static synthetic $r8$lambda$-SqC4SuStdhG_boj5U7SDJwa07k(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->updateListWith$lambda$0(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic $r8$lambda$GBYaJDdteg1Ja9GHhFTqeEssizw(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener$lambda$1(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$KIvyhQHvWL9XJl15jXzhYqZFs2c(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$S7spOOzrWgrsiBc5DzFhM6eBudk(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/zinhao/kikoeru/WorksActivity;->setupMoreMenu$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic $r8$lambda$WuQUbzvjXBpVEqEArEC8BCVAiwc(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lcom/zinhao/kikoeru/WorksActivity;->setupProgressMenu$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public static synthetic $r8$lambda$YuEsIndo1_Ig6hCz0CjIEDrtM00(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener$lambda$2(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$a-emGjmHFOl7OVypoNBfMJf4CSA(Lcom/zinhao/kikoeru/WorksActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener$lambda$3(Lcom/zinhao/kikoeru/WorksActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$jOfgwJeZsWEdScFvCbEWVOWOJcM(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->circlesClickListener$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$pf9vJtVvu22MOCEOQsiqP25nUmU(Landroidx/activity/OnBackPressedCallback;)V
    .locals 0

    invoke-static {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener$lambda$3$1(Landroidx/activity/OnBackPressedCallback;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/zinhao/kikoeru/WorksActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/zinhao/kikoeru/WorksActivity;->Companion:Lcom/zinhao/kikoeru/WorksActivity$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 49
    invoke-direct {p0}, Lcom/zinhao/kikoeru/BaseActivity;-><init>()V

    const/4 v0, 0x1

    .line 54
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    .line 55
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->currentPage:I

    .line 61
    iput-boolean v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    const/4 v0, -0x1

    .line 67
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    .line 69
    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    .line 70
    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    .line 71
    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesName:Ljava/lang/String;

    const-wide/16 v0, -0x1

    .line 72
    iput-wide v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesId:J

    const/16 v0, 0x1eb

    .line 76
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    .line 751
    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$vaClickListener$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v0, Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    .line 771
    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda2;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    .line 785
    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v0, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    return-void
.end method

.method public static final synthetic access$clearWork(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    return-void
.end method

.method public static final synthetic access$getBottomLayout$p(Lcom/zinhao/kikoeru/WorksActivity;)Landroid/view/View;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    return-object p0
.end method

.method public static final synthetic access$getCtrlBinder$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/AudioService$CtrlBinder;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    return-object p0
.end method

.method public static final synthetic access$getCurrentTitle(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getCurrentTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$getLastOpenTitle$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->lastOpenTitle:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getPage$p(Lcom/zinhao/kikoeru/WorksActivity;)I
    .locals 0

    .line 49
    iget p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    return p0
.end method

.method public static final synthetic access$getTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;)I
    .locals 0

    .line 49
    iget p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->totalCount:I

    return p0
.end method

.method public static final synthetic access$getType$p(Lcom/zinhao/kikoeru/WorksActivity;)I
    .locals 0

    .line 49
    iget p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    return p0
.end method

.method public static final synthetic access$getVaId$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/lang/String;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    return-object p0
.end method

.method public static final synthetic access$getViewBinding$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    return-object p0
.end method

.method public static final synthetic access$getWorkAdapter$p(Lcom/zinhao/kikoeru/WorksActivity;)Lcom/zinhao/kikoeru/WorkAdapter;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    return-object p0
.end method

.method public static final synthetic access$getWorks$p(Lcom/zinhao/kikoeru/WorksActivity;)Ljava/util/List;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    return-object p0
.end method

.method public static final synthetic access$scrollToLastOpenPosition(Lcom/zinhao/kikoeru/WorksActivity;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->scrollToLastOpenPosition()V

    return-void
.end method

.method public static final synthetic access$setCurrentPage$p(Lcom/zinhao/kikoeru/WorksActivity;I)V
    .locals 0

    .line 49
    iput p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->currentPage:I

    return-void
.end method

.method public static final synthetic access$setPage$p(Lcom/zinhao/kikoeru/WorksActivity;I)V
    .locals 0

    .line 49
    iput p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    return-void
.end method

.method public static final synthetic access$setShouldShowAnim$p(Lcom/zinhao/kikoeru/WorksActivity;Z)V
    .locals 0

    .line 49
    iput-boolean p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    return-void
.end method

.method public static final synthetic access$setTotalCount$p(Lcom/zinhao/kikoeru/WorksActivity;I)V
    .locals 0

    .line 49
    iput p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->totalCount:I

    return-void
.end method

.method public static final synthetic access$setVaId$p(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$setVaName$p(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$updateListWith(Lcom/zinhao/kikoeru/WorksActivity;Lorg/json/JSONArray;Ljava/lang/Runnable;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->updateListWith(Lorg/json/JSONArray;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final circlesClickListener$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/String;)V
    .locals 4

    .line 775
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/zinhao/kikoeru/App;->mapCirclesId(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 777
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 778
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesName:Ljava/lang/String;

    .line 779
    iput-wide v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesId:J

    const/16 v0, 0x1f4

    .line 780
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    .line 782
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "onTagClick: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "WorksActivity"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private final clearWork()V
    .locals 5

    const/4 v0, 0x1

    .line 683
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    .line 684
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 685
    const-string v2, "works"

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez v3, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v1

    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemRangeRemoved(II)V

    .line 687
    :cond_2
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez p0, :cond_3

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v1, p0

    :goto_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    return-void
.end method

.method private final getCurrentTitle()Ljava/lang/String;
    .locals 2

    .line 849
    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    const/16 v1, 0x1eb

    if-ne v0, v1, :cond_0

    .line 850
    sget v0, Lcom/zinhao/kikoeru/R$string;->app_name:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/16 v1, 0x1ec

    if-ne v0, v1, :cond_1

    .line 852
    sget v0, Lcom/zinhao/kikoeru/R$string;->listening:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/16 v1, 0x1ed

    if-ne v0, v1, :cond_2

    .line 854
    sget v0, Lcom/zinhao/kikoeru/R$string;->listened:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 v1, 0x1ee

    if-ne v0, v1, :cond_3

    .line 856
    sget v0, Lcom/zinhao/kikoeru/R$string;->marked:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    const/16 v1, 0x1ef

    if-ne v0, v1, :cond_4

    .line 858
    sget v0, Lcom/zinhao/kikoeru/R$string;->replay:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    const/16 v1, 0x1f0

    if-ne v0, v1, :cond_5

    .line 860
    sget v0, Lcom/zinhao/kikoeru/R$string;->postponed:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    const/16 v1, 0x1f1

    if-ne v0, v1, :cond_6

    .line 862
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    return-object p0

    :cond_6
    const/16 v1, 0x1f3

    if-ne v0, v1, :cond_7

    .line 864
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    return-object p0

    :cond_7
    const/16 v1, 0x1f4

    if-ne v0, v1, :cond_8

    .line 866
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesName:Ljava/lang/String;

    return-object p0

    :cond_8
    const/16 v1, 0x1f2

    if-ne v0, v1, :cond_a

    .line 868
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 870
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    .line 871
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/App;->isSaveExternal()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 872
    sget v0, Lcom/zinhao/kikoeru/R$string;->extra_path:I

    goto :goto_0

    :cond_9
    sget v0, Lcom/zinhao/kikoeru/R$string;->private_path:I

    :goto_0
    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v0, 0x1

    .line 868
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string v0, "%s"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "format(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    .line 875
    :cond_a
    const-string p0, "--"

    return-object p0
.end method

.method private final initLayout(I)V
    .locals 6

    .line 595
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const-string v1, "recyclerView"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    :cond_0
    iget-object v3, p0, Lcom/zinhao/kikoeru/WorksActivity;->itemDecoration:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    const/4 v0, 0x2

    const/4 v3, 0x1

    packed-switch p1, :pswitch_data_0

    move-object v4, v2

    goto :goto_0

    .line 607
    :pswitch_0
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit16 v4, v4, 0x18b

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v0, 0x2

    .line 608
    new-instance v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    invoke-direct {v4, v0, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    move v3, v0

    goto :goto_0

    .line 604
    :pswitch_1
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit16 v3, v3, 0x18b

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v3, 0x2

    .line 605
    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-direct {v4, v0, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 601
    :pswitch_2
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit16 v0, v0, 0x18b

    const/4 v3, 0x2

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v3, 0x2

    .line 602
    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-direct {v4, v0, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    goto :goto_0

    .line 598
    :pswitch_3
    new-instance v4, Landroidx/recyclerview/widget/LinearLayoutManager;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-direct {v4, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 612
    :goto_0
    instance-of v0, v4, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz v0, :cond_1

    .line 613
    move-object v0, v4

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    new-instance v5, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;

    invoke-direct {v5, p0, v3}, Lcom/zinhao/kikoeru/WorksActivity$initLayout$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;I)V

    check-cast v5, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanSizeLookup(Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 622
    :cond_1
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez v0, :cond_2

    const-string v0, "works"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v2

    .line 623
    :cond_2
    new-instance v3, Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-direct {v3, v0, p1}, Lcom/zinhao/kikoeru/WorkAdapter;-><init>(Ljava/util/List;I)V

    iput-object v3, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    .line 624
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object p1, p0

    check-cast p1, Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {v3, p1}, Lcom/zinhao/kikoeru/WorkAdapter;->setTagClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 625
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setVaClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 626
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesClickListener:Lcom/zinhao/kikoeru/TagsView$TagClickListener;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setCirclesClickListener(Lcom/zinhao/kikoeru/TagsView$TagClickListener;)V

    .line 627
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setItemClickListener(Landroid/view/View$OnClickListener;)V

    .line 639
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$initLayout$2$2;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v0, Landroid/view/View$OnLongClickListener;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/WorkAdapter;->setItemLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 677
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p1, :cond_3

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v2

    :cond_3
    check-cast v4, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 678
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p1, :cond_4

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v2, p1

    :goto_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x34e
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic loadFromNetWork$default(Lcom/zinhao/kikoeru/WorksActivity;IILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/16 p1, 0x1eb

    .line 340
    :cond_0
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void
.end method

.method private final scrollToLastOpenPosition()V
    .locals 4

    .line 584
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p0, :cond_0

    const-string p0, "recyclerView"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p0

    .line 585
    instance-of v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    if-eqz v0, :cond_2

    .line 586
    :cond_1
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    const-string v1, "last_open_work_position"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v0

    long-to-int v0, v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 588
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    :cond_2
    return-void
.end method

.method private final setupData()V
    .locals 1

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    # Saved browsing filters are not playback checkpoints. Fresh pages start at home.
    const/16 v0, 0x1eb

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->currentPage:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->totalCount:I

    sget v0, Lcom/zinhao/kikoeru/R$string;->app_name:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->lastOpenTitle:Ljava/lang/String;

    return-void
.end method

.method private final setupListener()V
    .locals 4

    .line 143
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    const/4 v1, 0x0

    const-string v2, "viewBinding"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt1:Landroid/widget/ImageButton;

    new-instance v3, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda5;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt2:Landroid/widget/ImageButton;

    new-instance v3, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda6;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    iget-object v0, v1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt3:Landroid/widget/ImageButton;

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda7;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibFloatLrcWindow:Landroid/widget/ImageButton;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$setupListener$4;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$setupListener$4;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v1, Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$setupListener$5;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->scrollListener:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 181
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    const-string v1, "<get-onBackPressedDispatcher>(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/LifecycleOwner;

    new-instance v2, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda8;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    const/4 p0, 0x1

    invoke-static {v0, v1, p0, v2}, Landroidx/activity/OnBackPressedDispatcherKt;->addCallback(Landroidx/activity/OnBackPressedDispatcher;Landroidx/lifecycle/LifecycleOwner;ZLkotlin/jvm/functions/Function1;)Landroidx/activity/OnBackPressedCallback;

    return-void
.end method

.method private static final setupListener$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    .line 144
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    const/16 p1, 0x1eb

    .line 145
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void
.end method

.method private static final setupListener$lambda$1(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    .line 147
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    :cond_0
    return-void
.end method

.method private static final setupListener$lambda$2(Lcom/zinhao/kikoeru/WorksActivity;Landroid/view/View;)V
    .locals 0

    .line 148
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->show()V

    :cond_0
    return-void
.end method

.method private static final setupListener$lambda$3(Lcom/zinhao/kikoeru/WorksActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 9

    const-string v0, "WorksActivity"

    const-string v1, "$this$addCallback"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->homeBack(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :shell_back_continue

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :shell_back_continue
    .line 182
    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-string v2, "\u518d\u6b21\u8fd4\u56de\u4ee5\u9000\u51fa"

    check-cast v2, Ljava/lang/CharSequence;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    const/4 v1, 0x0

    .line 184
    :try_start_0
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v4, "last_type"

    iget v5, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    int-to-long v5, v5

    invoke-virtual {v2, v4, v5, v6}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 185
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v4, "last_page"

    iget v5, p0, Lcom/zinhao/kikoeru/WorksActivity;->currentPage:I

    int-to-long v5, v5

    invoke-virtual {v2, v4, v5, v6}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 186
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v4, "last_param_title"

    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    iget v2, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    const/16 v4, 0x1f1

    if-ne v2, v4, :cond_0

    .line 188
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v4, "last_param_int"

    iget v5, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    int-to-long v5, v5

    invoke-virtual {v2, v4, v5, v6}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    goto :goto_0

    :cond_0
    const/16 v4, 0x1f3

    if-ne v2, v4, :cond_1

    .line 190
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v2

    const-string v4, "last_param_str"

    iget-object v5, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez v2, :cond_2

    const-string v2, "works"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    .line 193
    :cond_2
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 194
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    move v6, v3

    :goto_1
    if-ge v6, v5, :cond_3

    .line 195
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 197
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setupListener:save works info:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    iget-object v2, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v2, :cond_4

    const-string v2, "recyclerView"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_4
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v2

    goto :goto_2

    :cond_5
    move-object v2, v1

    .line 200
    :goto_2
    instance-of v5, v2, Landroidx/recyclerview/widget/GridLayoutManager;

    if-nez v5, :cond_9

    instance-of v5, v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v5, :cond_6

    goto :goto_3

    .line 202
    :cond_6
    instance-of v5, v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    if-eqz v5, :cond_8

    .line 203
    move-object v5, v2

    check-cast v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->getSpanCount()I

    move-result v5

    new-array v5, v5, [I

    .line 204
    check-cast v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->findFirstVisibleItemPositions([I)[I

    .line 205
    invoke-static {v5}, Lkotlin/collections/ArraysKt;->maxOrNull([I)Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_4

    :cond_7
    const/4 v2, -0x1

    goto :goto_4

    :cond_8
    move v2, v3

    goto :goto_4

    .line 201
    :cond_9
    :goto_3
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v2

    .line 207
    :goto_4
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v5

    const-string v6, "last_open_work_position"

    int-to-long v7, v2

    invoke-virtual {v5, v6, v7, v8}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 208
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v5

    const-string v6, "total_count"

    iget v7, p0, Lcom/zinhao/kikoeru/WorksActivity;->totalCount:I

    int-to-long v7, v7

    invoke-virtual {v5, v6, v7, v8}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 209
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setupListener: save position:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/zinhao/kikoeru/LocalFileCache;->saveLastOpenWorks(Lorg/json/JSONArray;)V

    .line 212
    invoke-static {}, Lcom/zinhao/kikoeru/DownloadUtils;->getInstance()Lcom/zinhao/kikoeru/DownloadUtils;

    move-result-object v2

    invoke-virtual {v2}, Lcom/zinhao/kikoeru/DownloadUtils;->close()V

    .line 213
    const-string v2, "setupListener: save player info:"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 215
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 217
    :goto_5
    invoke-virtual {p1, v3}, Landroidx/activity/OnBackPressedCallback;->setEnabled(Z)V

    .line 218
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez p0, :cond_a

    const-string p0, "viewBinding"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_6

    :cond_a
    move-object v1, p0

    :goto_6
    invoke-virtual {v1}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p0

    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p1}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda4;-><init>(Landroidx/activity/OnBackPressedCallback;)V

    const-wide/16 v1, 0x7d0

    invoke-virtual {p0, v0, v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 219
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final setupListener$lambda$3$1(Landroidx/activity/OnBackPressedCallback;)V
    .locals 1

    const/4 v0, 0x1

    .line 218
    invoke-virtual {p0, v0}, Landroidx/activity/OnBackPressedCallback;->setEnabled(Z)V

    return-void
.end method

.method private final setupMoreMenu()V
    .locals 7

    .line 224
    new-instance v0, Landroidx/appcompat/widget/ListPopupWindow;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    .line 226
    new-instance v2, Landroid/widget/ArrayAdapter;

    const/16 v3, 0x9

    .line 229
    new-array v3, v3, [Ljava/lang/String;

    sget v4, Lcom/zinhao/kikoeru/R$string;->va_voicer:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 230
    sget v4, Lcom/zinhao/kikoeru/R$string;->tag:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    sget v4, Lcom/zinhao/kikoeru/R$string;->circles:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x2

    aput-object v4, v3, v6

    .line 231
    sget v4, Lcom/zinhao/kikoeru/R$string;->local_works:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    aput-object v4, v3, v6

    .line 228
    const/4 v6, 0x4

    const-string v4, "\u9884\u9009\u914d\u8272"

    aput-object v4, v3, v6

    const/4 v6, 0x5

    const-string v4, "\u672c\u5730\u4f5c\u54c1"

    aput-object v4, v3, v6

    const/4 v6, 0x6

    const-string v4, "\u64ad\u653e\u5217\u8868"

    aput-object v4, v3, v6

    const/4 v6, 0x7

    const-string v4, "\u4e91\u7aef\u4f5c\u54c1"

    aput-object v4, v3, v6

    const/16 v6, 0x8

    const-string v4, "\u66f4\u591a\u8bbe\u7f6e"

    aput-object v4, v3, v6

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v4, 0x1090003

    .line 226
    invoke-direct {v2, v1, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    check-cast v2, Landroid/widget/ListAdapter;

    .line 225
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 235
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/ListPopupWindow;->setModal(Z)V

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v1, :cond_1

    const-string v1, "viewBinding"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_1
    iget-object v1, v1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt3:Landroid/widget/ImageButton;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 237
    :cond_2
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    if-eqz v0, :cond_3

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :cond_3
    return-void
.end method

.method private static final setupMoreMenu$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 238
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->moreMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    const/4 p1, 0x4

    if-ne p3, p1, :not_palette

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lcom/zinhao/kikoeru/ThemePaletteActivity;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    :not_palette

    const/4 p1, 0x5

    if-ne p3, p1, :not_local_library

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AppShell;->showHomeSource(Landroid/app/Activity;I)Z

    move-result p1

    if-nez p1, :local_library_done

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lcom/zinhao/kikoeru/LocalLibraryActivity;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    :local_library_done
    return-void

    :not_local_library

    const/4 p1, 0x6

    if-ne p3, p1, :not_playback_queue

    invoke-static {p0}, Lcom/zinhao/kikoeru/PlayerNavigation;->openQueue(Landroid/app/Activity;)V

    return-void

    :not_playback_queue

    const/4 p1, 0x7

    if-ne p3, p1, :not_cloud

    invoke-static {p0}, Lcom/zinhao/kikoeru/PlayerNavigation;->openCloud(Landroid/app/Activity;)V

    return-void

    :not_cloud

    const/16 p1, 0x8

    if-ne p3, p1, :not_settings

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->openSettings(Landroid/app/Activity;)V

    return-void

    :not_settings

    if-eqz p3, :cond_3

    const/4 p1, 0x1

    if-eq p3, p1, :cond_2

    const/4 p1, 0x2

    if-eq p3, p1, :cond_1

    const/4 p1, 0x3

    if-eq p3, p1, :cond_0

    return-void

    .line 248
    :cond_0
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    const/16 p1, 0x1f2

    .line 249
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    .line 243
    :cond_1
    new-instance p1, Landroid/content/Intent;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-class p3, Lcom/zinhao/kikoeru/CirclesActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 p2, 0x10

    .line 242
    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 241
    :cond_2
    new-instance p1, Landroid/content/Intent;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-class p3, Lcom/zinhao/kikoeru/TagsActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 p2, 0xe

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 240
    :cond_3
    new-instance p1, Landroid/content/Intent;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-class p3, Lcom/zinhao/kikoeru/VasActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 p2, 0xf

    invoke-virtual {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private final setupProgressMenu()V
    .locals 7

    .line 256
    new-instance v0, Landroidx/appcompat/widget/ListPopupWindow;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    .line 257
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 258
    new-instance v2, Landroid/widget/ArrayAdapter;

    const/4 v3, 0x5

    .line 261
    new-array v3, v3, [Ljava/lang/String;

    sget v4, Lcom/zinhao/kikoeru/R$string;->marked:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 262
    sget v4, Lcom/zinhao/kikoeru/R$string;->listening:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 263
    sget v4, Lcom/zinhao/kikoeru/R$string;->listened:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x2

    aput-object v4, v3, v6

    .line 264
    sget v4, Lcom/zinhao/kikoeru/R$string;->replay:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    aput-object v4, v3, v6

    .line 265
    sget v4, Lcom/zinhao/kikoeru/R$string;->postponed:I

    invoke-virtual {p0, v4}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x4

    aput-object v4, v3, v6

    .line 260
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const v4, 0x1090003

    .line 258
    invoke-direct {v2, v1, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    check-cast v2, Landroid/widget/ListAdapter;

    .line 257
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 269
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Landroidx/appcompat/widget/ListPopupWindow;->setModal(Z)V

    .line 270
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v1, :cond_0

    const-string v1, "viewBinding"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_0
    iget-object v1, v1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt2:Landroid/widget/ImageButton;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 271
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method private static final setupProgressMenu$lambda$0(Lcom/zinhao/kikoeru/WorksActivity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 272
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->progressMenu:Landroidx/appcompat/widget/ListPopupWindow;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    .line 273
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    if-eqz p3, :cond_4

    const/4 p1, 0x1

    if-eq p3, p1, :cond_3

    const/4 p1, 0x2

    if-eq p3, p1, :cond_2

    const/4 p1, 0x3

    if-eq p3, p1, :cond_1

    const/4 p1, 0x4

    if-eq p3, p1, :cond_0

    return-void

    :cond_0
    const/16 p1, 0x1f0

    .line 279
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :cond_1
    const/16 p1, 0x1ef

    .line 278
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :cond_2
    const/16 p1, 0x1ed

    .line 277
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :cond_3
    const/16 p1, 0x1ec

    .line 276
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :cond_4
    const/16 p1, 0x1ee

    .line 275
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void
.end method

.method private final setupView()V
    .locals 4

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    const/4 v1, 0x0

    const-string v2, "viewBinding"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    const-string v3, "appBarLayout"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/view/View;

    new-instance v3, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;

    invoke-direct {v3, p0}, Lcom/zinhao/kikoeru/WorksActivity$setupView$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v3, Lcom/zinhao/kikoeru/BaseActivity$InsetReady;

    invoke-virtual {p0, v0, v3}, Lcom/zinhao/kikoeru/WorksActivity;->setSafeArea(Landroid/view/View;Lcom/zinhao/kikoeru/BaseActivity$InsetReady;)V

    .line 120
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    iget-object v0, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    const-string v3, "recyclerView"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 121
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    iget-object v0, v1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bottomLayout:Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/databinding/LayoutCurrentPlayBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    .line 122
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v1, Lcom/zinhao/kikoeru/R$id;->imageView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ivCover:Landroid/widget/ImageView;

    .line 123
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v1, Lcom/zinhao/kikoeru/R$id;->textView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tvTitle:Landroid/widget/TextView;

    .line 124
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v1, Lcom/zinhao/kikoeru/R$id;->textView2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tvWorkTitle:Landroid/widget/TextView;

    .line 125
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v1, Lcom/zinhao/kikoeru/R$id;->button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibStatus:Landroid/widget/ImageButton;

    .line 126
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v1, Lcom/zinhao/kikoeru/R$id;->imageButton:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibFloatLrcWindow:Landroid/widget/ImageButton;

    .line 127
    new-instance v0, Landroidx/recyclerview/widget/DividerItemDecoration;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->itemDecoration:Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    .line 128
    sget v0, Lcom/zinhao/kikoeru/R$anim;->move_bottom_out:I

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->outAnim:Landroid/view/animation/Animation;

    .line 129
    sget v0, Lcom/zinhao/kikoeru/R$anim;->move_bottom_in:I

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->inAnim:Landroid/view/animation/Animation;

    return-void
.end method

.method private final toggleBottom()V
    .locals 4

    .line 285
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 286
    iput-boolean v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    .line 287
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->outAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 288
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$toggleBottom$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$toggleBottom$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v1, Ljava/lang/Runnable;

    .line 293
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->outAnim:Landroid/view/animation/Animation;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v2

    .line 288
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 294
    :cond_0
    iget-boolean v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_1

    .line 295
    iput-boolean v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->shouldShowAnim:Z

    .line 296
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 297
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->inAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 298
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$toggleBottom$2;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$toggleBottom$2;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v1, Ljava/lang/Runnable;

    .line 302
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->inAnim:Landroid/view/animation/Animation;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v2

    .line 298
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method private final updateListWith(Lorg/json/JSONArray;Ljava/lang/Runnable;)V
    .locals 1

    .line 819
    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p1, p0, p2}, Lcom/zinhao/kikoeru/WorksActivity$$ExternalSyntheticLambda3;-><init>(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic updateListWith$default(Lcom/zinhao/kikoeru/WorksActivity;Lorg/json/JSONArray;Ljava/lang/Runnable;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 818
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/zinhao/kikoeru/WorksActivity;->updateListWith(Lorg/json/JSONArray;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final updateListWith$lambda$0(Lorg/json/JSONArray;Lcom/zinhao/kikoeru/WorksActivity;Ljava/lang/Runnable;)V
    .locals 6

    .line 820
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 821
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    .line 823
    :try_start_0
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 825
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v4, v5}, Lorg/json/JSONException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 826
    check-cast v4, Ljava/lang/Exception;

    invoke-virtual {p1, v4}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 829
    :cond_0
    iget-object v1, p1, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    const-string v3, "works"

    const/4 v4, 0x0

    if-nez v1, :cond_4

    .line 830
    iget-object p0, p1, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez p0, :cond_1

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p0, v4

    :cond_1
    check-cast v0, Ljava/util/Collection;

    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 831
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p0

    const-string v0, "layout_type"

    const-wide/16 v1, 0x351

    invoke-virtual {p0, v0, v1, v2}, Lcom/zinhao/kikoeru/App;->getValue(Ljava/lang/String;J)J

    move-result-wide v0

    long-to-int p0, v0

    invoke-direct {p1, p0}, Lcom/zinhao/kikoeru/WorksActivity;->initLayout(I)V

    .line 832
    iget-object p0, p1, Lcom/zinhao/kikoeru/WorksActivity;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-nez p0, :cond_2

    const-string p0, "recyclerView"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p0, v4

    :cond_2
    iget-object p1, p1, Lcom/zinhao/kikoeru/WorksActivity;->scrollListener:Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    if-nez p1, :cond_3

    const-string p1, "scrollListener"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    move-object v4, p1

    :goto_2
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    goto :goto_4

    .line 834
    :cond_4
    iget-object v1, p1, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez v1, :cond_5

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v4

    :cond_5
    check-cast v0, Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 835
    iget-object v0, p1, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 836
    iget-object v1, p1, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez v1, :cond_6

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v4

    :cond_6
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    sub-int/2addr v1, v5

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 837
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    .line 835
    invoke-virtual {v0, v1, p0}, Lcom/zinhao/kikoeru/WorkAdapter;->notifyItemRangeInserted(II)V

    .line 839
    iget-object p0, p1, Lcom/zinhao/kikoeru/WorksActivity;->works:Ljava/util/List;

    if-nez p0, :cond_7

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_3

    :cond_7
    move-object v4, p0

    :goto_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result p0

    iget v0, p1, Lcom/zinhao/kikoeru/WorksActivity;->totalCount:I

    if-ne p0, v0, :cond_8

    .line 840
    iget-object p0, p1, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/WorkAdapter;->setLoading(Z)V

    :cond_8
    :goto_4
    if-eqz p2, :cond_9

    .line 843
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    :cond_9
    return-void
.end method


# virtual methods
.method public final loadFromNetWork(I)V
    .locals 2

    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogGeneration:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogGeneration:I

    invoke-static {}, Lcom/zinhao/kikoeru/Api;->getSubtitleFilter()I

    move-result v0

    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogSubtitle:I

    new-instance v0, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;

    invoke-direct {v0, p0}, Lcom/zinhao/kikoeru/WorksActivity$apisCallback$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    .line 341
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 342
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkAdapter;->setLoading(Z)V

    .line 344
    :cond_0
    iput p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    invoke-direct {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->updateBottomSelection(I)V

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    .line 370
    :pswitch_0
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesName:Ljava/lang/String;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 371
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-wide v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesId:J

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, v0, v1, p0}, Lcom/zinhao/kikoeru/Api;->doGetWorkByCircles(IJLcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 367
    :pswitch_1
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 368
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, v0, p0}, Lcom/zinhao/kikoeru/Api;->doGetWorkByVa(ILjava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 373
    :pswitch_2
    sget-object p1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p1

    invoke-virtual {p1}, Lcom/zinhao/kikoeru/App;->isSaveExternal()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "\u5916\u90e8\u516c\u5171\u76ee\u5f55"

    goto :goto_0

    :cond_1
    const-string p1, "\u5185\u90e8\u79c1\u6709\u76ee\u5f55"

    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "format(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 375
    :try_start_0
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object p1

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-virtual {p1, v0}, Lcom/zinhao/kikoeru/LocalFileCache;->readLocalDownloadWorks(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 377
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 378
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    goto :goto_1

    .line 364
    :pswitch_3
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 365
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, v0, p0}, Lcom/zinhao/kikoeru/Api;->doGetWorksByTag(IILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 361
    :pswitch_4
    sget p1, Lcom/zinhao/kikoeru/R$string;->postponed:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(I)V

    .line 362
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string v0, "postponed"

    invoke-static {v0, p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 358
    :pswitch_5
    sget p1, Lcom/zinhao/kikoeru/R$string;->replay:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(I)V

    .line 359
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string v0, "replay"

    invoke-static {v0, p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 355
    :pswitch_6
    sget p1, Lcom/zinhao/kikoeru/R$string;->marked:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(I)V

    .line 356
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string v0, "marked"

    invoke-static {v0, p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 352
    :pswitch_7
    sget p1, Lcom/zinhao/kikoeru/R$string;->listened:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(I)V

    .line 353
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string v0, "listened"

    invoke-static {v0, p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 349
    :pswitch_8
    sget p1, Lcom/zinhao/kikoeru/R$string;->listening:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(I)V

    .line 350
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    const-string v0, "listening"

    invoke-static {v0, p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetReview(Ljava/lang/String;ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    return-void

    .line 346
    :pswitch_9
    sget p1, Lcom/zinhao/kikoeru/R$string;->app_name:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 347
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->page:I

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->apisCallback:Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;

    invoke-static {p1, p0}, Lcom/zinhao/kikoeru/Api;->doGetWorks(ILcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1eb
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final loadLastOpenWork()V
    .locals 2

    .line 307
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->workAdapter:Lcom/zinhao/kikoeru/WorkAdapter;

    if-eqz v0, :cond_0

    .line 308
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/WorkAdapter;->setLoading(Z)V

    .line 311
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/zinhao/kikoeru/LocalFileCache;->getInstance()Lcom/zinhao/kikoeru/LocalFileCache;

    move-result-object v0

    new-instance v1, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;

    invoke-direct {v1, p0}, Lcom/zinhao/kikoeru/WorksActivity$loadLastOpenWork$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast v1, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/LocalFileCache;->readLastOpenWorks(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 335
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 336
    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    .line 538
    invoke-super {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    invoke-static {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/AppShell;->homeResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :shell_result_continue

    return-void

    :shell_result_continue
    .line 539
    const-string v0, "resultType"

    const-string v1, "name"

    const-string v2, "id"

    const/4 v3, -0x1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    if-ne p2, v3, :cond_5

    if-eqz p3, :cond_5

    .line 566
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    goto/16 :goto_0

    .line 570
    :cond_0
    const-string p2, "circles"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-wide/16 p1, -0x1

    .line 571
    invoke-virtual {p3, v2, p1, p2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 572
    iget-wide v4, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesId:J

    cmp-long v0, v4, v2

    if-eqz v0, :cond_5

    cmp-long p1, v2, p1

    if-eqz p1, :cond_5

    .line 573
    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesName:Ljava/lang/String;

    .line 574
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 575
    iput-wide v2, p0, Lcom/zinhao/kikoeru/WorksActivity;->circlesId:J

    const/16 p1, 0x1f4

    .line 576
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    :pswitch_1
    if-ne p2, v3, :cond_5

    if-eqz p3, :cond_5

    .line 541
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 545
    :cond_1
    const-string p2, "va"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 546
    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 547
    iget-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 548
    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    .line 549
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 550
    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    :cond_2
    const/16 p1, 0x1f3

    .line 552
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    .line 553
    :cond_3
    const-string p2, "tag"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 554
    invoke-virtual {p3, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 555
    iget p2, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    if-eq p1, p2, :cond_4

    .line 556
    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    .line 557
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 558
    iput p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    :cond_4
    const/16 p1, 0x1f1

    .line 560
    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    :cond_5
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onAlbumChange(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 386
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->toggleBottom()V

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ivCover:Landroid/widget/ImageView;

    invoke-static {p0, v0, p1, p2}, Lcom/zinhao/kikoeru/PlayerArtwork;->bindLocal(Landroid/content/Context;Landroid/widget/ImageView;J)Z

    move-result v0

    if-eqz v0, :native_remote_mini_art

    return-void

    :native_remote_mini_art
    move-object v0, p0

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    invoke-static {v0}, Lcom/bumptech/glide/Glide;->with(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/zinhao/kikoeru/Api;->minCoverImageUrl(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object p2

    invoke-virtual {p2}, Lcom/zinhao/kikoeru/App;->getRadius5Pic()Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p1

    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ivCover:Landroid/widget/ImageView;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public onAudioChange(Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "audio"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 393
    :try_start_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tvTitle:Landroid/widget/TextView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tvWorkTitle:Landroid/widget/TextView;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "workTitle"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 396
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 397
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 83
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/zinhao/kikoeru/BottomDockStyle;->apply(Landroid/app/Activity;)V

    .line 84
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/WorksActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    move-result-object p1

    const-string v0, "inflate(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    const/4 v0, 0x0

    .line 85
    const-string v1, "viewBinding"

    if-nez p1, :cond_0

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_0
    iget-object p1, p1, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 86
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;

    if-nez p1, :cond_1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v0, p1

    :goto_0
    invoke-virtual {v0}, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->setContentView(Landroid/view/View;)V

    .line 87
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupView()V

    .line 89
    new-instance p1, Landroid/content/Intent;

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-class v1, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 90
    new-instance p1, Landroid/content/Intent;

    const-class v1, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/zinhao/kikoeru/WorksActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 92
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupData()V

    .line 93
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupProgressMenu()V

    .line 94
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupMoreMenu()V

    .line 95
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->setupListener()V

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->installHome(Landroid/app/Activity;)V

    .line 96
    new-instance p1, Lcom/zinhao/kikoeru/WorksActivity$onCreate$1;

    invoke-direct {p1}, Lcom/zinhao/kikoeru/WorksActivity$onCreate$1;-><init>()V

    check-cast p1, Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;

    invoke-static {p1}, Lcom/zinhao/kikoeru/Api;->doGetCirclesList(Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)V

    .line 109
    const/16 p1, 0x1eb

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void
.end method

.method public getCatalogGeneration()I
    .locals 1

    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogGeneration:I

    return v0
.end method

.method protected onResume()V
    .locals 4

    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onResume()V

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->homeResume(Landroid/app/Activity;)V

    iget-boolean v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogResumed:Z

    iget v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    iget v2, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogSubtitle:I

    invoke-static {}, Lcom/zinhao/kikoeru/Api;->getSubtitleFilter()I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/CatalogState;->refreshOnResume(ZIII)Z

    move-result v0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->catalogResumed:Z

    if-eqz v0, :done

    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    :done
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 6

    const-string v0, "menu"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 450
    const-string v0, "\u5207\u6362\u8d26\u53f7"

    check-cast v0, Ljava/lang/CharSequence;

    const/4 v1, 0x0

    invoke-interface {p1, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    const/16 v0, 0x9

    .line 453
    sget v2, Lcom/zinhao/kikoeru/R$string;->works_layout:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/Menu;->addSubMenu(IIII)Landroid/view/SubMenu;

    move-result-object v0

    .line 454
    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_view_column_24:I

    invoke-interface {v0, v2}, Landroid/view/SubMenu;->setIcon(I)Landroid/view/SubMenu;

    const/16 v2, 0xa

    .line 455
    sget v3, Lcom/zinhao/kikoeru/R$string;->list_layout:I

    const/4 v4, 0x2

    invoke-interface {v0, v4, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0xb

    .line 456
    sget v3, Lcom/zinhao/kikoeru/R$string;->cover_layout:I

    invoke-interface {v0, v4, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0xc

    .line 457
    sget v3, Lcom/zinhao/kikoeru/R$string;->detail_layout:I

    invoke-interface {v0, v4, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0xd

    .line 458
    sget v3, Lcom/zinhao/kikoeru/R$string;->staggered:I

    invoke-interface {v0, v4, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 459
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const/16 v0, 0x10

    .line 462
    sget v2, Lcom/zinhao/kikoeru/R$string;->sort:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/Menu;->addSubMenu(IIII)Landroid/view/SubMenu;

    move-result-object v0

    .line 463
    sget v2, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_sort_24:I

    invoke-interface {v0, v2}, Landroid/view/SubMenu;->setIcon(I)Landroid/view/SubMenu;

    const/16 v2, 0x11

    .line 464
    sget v3, Lcom/zinhao/kikoeru/R$string;->release_date:I

    const/4 v5, 0x3

    invoke-interface {v0, v5, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0x12

    .line 465
    sget v3, Lcom/zinhao/kikoeru/R$string;->rj_number:I

    invoke-interface {v0, v5, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0x13

    .line 466
    sget v3, Lcom/zinhao/kikoeru/R$string;->prize:I

    invoke-interface {v0, v5, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    const/16 v2, 0x14

    .line 467
    sget v3, Lcom/zinhao/kikoeru/R$string;->last_in_lib:I

    invoke-interface {v0, v5, v2, v2, v3}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 468
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const/16 v0, 0x16

    .line 470
    sget v2, Lcom/zinhao/kikoeru/R$string;->download_mission:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    const/16 v0, 0x18

    .line 471
    sget v2, Lcom/zinhao/kikoeru/R$string;->local_history:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    const/16 v0, 0x63

    .line 472
    sget v2, Lcom/zinhao/kikoeru/R$string;->more:I

    const/16 v3, 0xf

    invoke-interface {p1, v1, v3, v0, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    const/16 v0, 0x17

    .line 474
    sget v2, Lcom/zinhao/kikoeru/R$string;->search:I

    invoke-interface {p1, v1, v0, v0, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x4

    .line 475
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 477
    sget v1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_search_24:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 478
    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 479
    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AppShell;->homeMenu(Landroid/app/Activity;Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p0

    return p0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z
    move-result v0
    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AppShell;->homeMenu(Landroid/app/Activity;Landroid/view/Menu;)V
    return v0
.end method

.method protected onDestroy()V
    .locals 3

    invoke-static {p0}, Lcom/zinhao/kikoeru/AppShell;->removeHome(Landroid/app/Activity;)V

    .line 691
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, p0

    check-cast v1, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->removeMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    .line 693
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v0

    if-nez v0, :cond_0

    .line 695
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->stopService(Landroid/content/Intent;)Z

    goto :goto_0

    .line 697
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaControllerCompat;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/session/PlaybackStateCompat;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 699
    :cond_1
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/AudioService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->stopService(Landroid/content/Intent;)Z

    .line 702
    :goto_0
    move-object v0, p0

    check-cast v0, Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 703
    invoke-super {p0}, Lcom/zinhao/kikoeru/BaseActivity;->onDestroy()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 4

    const-string v0, "intent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 707
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onNewIntent(Landroid/content/Intent;)V

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AppShell;->homeIntent(Landroid/app/Activity;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :shell_continue

    return-void

    :shell_continue

    .line 708
    const-string v0, "resultType"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 709
    const-string v1, "va"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "name"

    const-string v3, "id"

    if-eqz v1, :cond_2

    .line 710
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 711
    iget-object v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/16 v3, 0x1f3

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    if-eq v1, v3, :cond_1

    .line 712
    :cond_0
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaName:Ljava/lang/String;

    .line 713
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 714
    iput-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->vaId:Ljava/lang/String;

    .line 716
    :cond_1
    invoke-virtual {p0, v3}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    .line 717
    :cond_2
    const-string v1, "tag"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, -0x1

    .line 718
    invoke-virtual {p1, v3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 719
    iget v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    const/16 v3, 0x1f1

    if-ne v0, v1, :cond_3

    iget v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    if-eq v1, v3, :cond_4

    .line 720
    :cond_3
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    .line 721
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 722
    iput v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    .line 724
    :cond_4
    invoke-virtual {p0, v3}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    return-void

    .line 726
    :cond_5
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    const/4 p1, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 727
    invoke-static {p0, v1, p1, v0}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork$default(Lcom/zinhao/kikoeru/WorksActivity;IILjava/lang/Object;)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    const-string v0, "item"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 483
    invoke-interface {p1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 485
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/16 v0, 0x34e

    goto :goto_0

    .line 487
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_1

    const/16 v0, 0x350

    goto :goto_0

    .line 489
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    const/16 v0, 0x351

    goto :goto_0

    :cond_2
    const/16 v0, 0x34f

    .line 492
    :goto_0
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v1

    const-string v2, "layout_type"

    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 493
    invoke-direct {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->initLayout(I)V

    .line 494
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    .line 497
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ne v0, v1, :cond_8

    .line 499
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x11

    if-ne v0, v1, :cond_4

    .line 500
    const-string p1, "release"

    invoke-static {p1}, Lcom/zinhao/kikoeru/Api;->setOrder(Ljava/lang/String;)V

    goto :goto_1

    .line 502
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x12

    if-ne v0, v1, :cond_5

    .line 503
    const-string p1, "id"

    invoke-static {p1}, Lcom/zinhao/kikoeru/Api;->setOrder(Ljava/lang/String;)V

    goto :goto_1

    .line 505
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x13

    if-ne v0, v1, :cond_6

    .line 506
    const-string p1, "price"

    invoke-static {p1}, Lcom/zinhao/kikoeru/Api;->setOrder(Ljava/lang/String;)V

    goto :goto_1

    .line 508
    :cond_6
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/16 v0, 0x14

    if-ne p1, v0, :cond_7

    .line 509
    const-string p1, "create_date"

    invoke-static {p1}, Lcom/zinhao/kikoeru/Api;->setOrder(Ljava/lang/String;)V

    .line 513
    :goto_1
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 514
    iget p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V

    :cond_7
    return v2

    .line 519
    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-nez v0, :cond_9

    .line 520
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    const-string v1, "update_time"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/zinhao/kikoeru/App;->setValue(Ljava/lang/String;J)V

    .line 521
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/UserSwitchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 522
    :cond_9
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-eq v0, v2, :cond_e

    .line 523
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0xf

    if-ne v0, v1, :cond_a

    .line 524
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/MoreActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 525
    :cond_a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v2, 0x15

    if-ne v0, v2, :cond_b

    .line 526
    new-instance v0, Landroid/content/Intent;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    const-class v3, Lcom/zinhao/kikoeru/VasActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0, v1}, Lcom/zinhao/kikoeru/WorksActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    .line 527
    :cond_b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x16

    if-ne v0, v1, :cond_c

    .line 528
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/DownLoadMissionActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 529
    :cond_c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x17

    if-ne v0, v1, :cond_d

    .line 530
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/SearchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 531
    :cond_d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/16 v1, 0x18

    if-ne v0, v1, :cond_e

    .line 532
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/zinhao/kikoeru/LastWatchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/zinhao/kikoeru/WorksActivity;->startActivity(Landroid/content/Intent;)V

    .line 534
    :cond_e
    :goto_2
    invoke-super {p0, p1}, Lcom/zinhao/kikoeru/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 410
    const-string p1, "null cannot be cast to non-null type com.zinhao.kikoeru.AudioService.CtrlBinder"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    iput-object p2, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    .line 411
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibStatus:Landroid/widget/ImageButton;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance p2, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$1;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast p2, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 424
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->bottomLayout:Landroid/view/View;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    new-instance p2, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;

    invoke-direct {p2, p0}, Lcom/zinhao/kikoeru/WorksActivity$onServiceConnected$2;-><init>(Lcom/zinhao/kikoeru/WorksActivity;)V

    check-cast p2, Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 443
    iget-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->ctrlBinder:Lcom/zinhao/kikoeru/AudioService$CtrlBinder;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p0, Lcom/zinhao/kikoeru/MusicChangeListener;

    invoke-virtual {p1, p0}, Lcom/zinhao/kikoeru/AudioService$CtrlBinder;->addMusicChangeListener(Lcom/zinhao/kikoeru/MusicChangeListener;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method

.method private updateBottomSelection(I)V
    .locals 4

    iget-object v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->viewBinding:Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;
    if-eqz v0, :done

    const/4 v1, 0x0
    const/16 v2, 0x1eb
    if-ne p1, v2, :home_ready
    const/4 v1, 0x1
    :home_ready
    iget-object v3, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt1:Landroid/widget/ImageButton;
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setSelected(Z)V

    const/4 v1, 0x0
    const/16 v2, 0x1ec
    if-lt p1, v2, :marked_ready
    const/16 v2, 0x1f0
    if-gt p1, v2, :marked_ready
    const/4 v1, 0x1
    :marked_ready
    iget-object v3, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt2:Landroid/widget/ImageButton;
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setSelected(Z)V

    const/4 v1, 0x0
    const/16 v2, 0x1f2
    if-ne p1, v2, :more_ready
    const/4 v1, 0x1
    :more_ready
    iget-object v3, v0, Lcom/zinhao/kikoeru/databinding/ActivityMainBinding;->bt3:Landroid/widget/ImageButton;
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setSelected(Z)V

    :done
    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/AppShell;->homeSelection(Landroid/app/Activity;I)V
    return-void
.end method

.method public onStatusChange(I)V
    .locals 0

    if-nez p1, :cond_0

    .line 403
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibStatus:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_play_arrow_white_24:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void

    .line 405
    :cond_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/WorksActivity;->ibStatus:Landroid/widget/ImageButton;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget p1, Lcom/zinhao/kikoeru/R$drawable;->ic_baseline_pause_white_24:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setImageResource(I)V

    return-void
.end method

.method public bridge synthetic onTagClick(Ljava/lang/Object;)V
    .locals 0

    .line 49
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->onTagClick(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onTagClick(Lorg/json/JSONObject;)V
    .locals 4

    const-string v0, "onTagClick: "

    if-eqz p1, :cond_2

    .line 735
    :try_start_0
    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 736
    const-string v2, "WorksActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    const/16 v2, 0x1f1

    if-ne v1, v0, :cond_0

    iget v0, p0, Lcom/zinhao/kikoeru/WorksActivity;->type:I

    if-eq v0, v2, :cond_1

    .line 738
    :cond_0
    const-string v0, "name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagStr:Ljava/lang/String;

    .line 739
    invoke-direct {p0}, Lcom/zinhao/kikoeru/WorksActivity;->clearWork()V

    .line 740
    iput v1, p0, Lcom/zinhao/kikoeru/WorksActivity;->tagId:I

    .line 742
    :cond_1
    invoke-virtual {p0, v2}, Lcom/zinhao/kikoeru/WorksActivity;->loadFromNetWork(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 744
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 745
    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/WorksActivity;->alertException(Ljava/lang/Exception;)V

    :cond_2
    :goto_0
    return-void
.end method
