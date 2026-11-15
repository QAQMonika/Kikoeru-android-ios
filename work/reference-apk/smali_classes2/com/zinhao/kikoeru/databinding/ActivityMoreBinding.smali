.class public final Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;
.super Ljava/lang/Object;
.source "ActivityMoreBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final about:Landroid/widget/RelativeLayout;

.field public final appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

.field public final checkBox:Landroid/widget/CheckBox;

.field public final checkBox1:Landroid/widget/CheckBox;

.field public final checkBox3:Landroid/widget/CheckBox;

.field public final content:Landroid/widget/LinearLayout;

.field public final debug:Landroid/widget/RelativeLayout;

.field public final license:Landroid/widget/RelativeLayout;

.field public final relativeLayout:Landroid/widget/RelativeLayout;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final saveExternal:Landroid/widget/RelativeLayout;

.field public final textView10:Landroid/widget/TextView;

.field public final textView11:Landroid/widget/TextView;

.field public final textView12:Landroid/widget/TextView;

.field public final textView16:Landroid/widget/TextView;

.field public final textView6:Landroid/widget/TextView;

.field public final toolbar:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/appcompat/widget/Toolbar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "rootView",
            "about",
            "appBarLayout",
            "checkBox",
            "checkBox1",
            "checkBox3",
            "content",
            "debug",
            "license",
            "relativeLayout",
            "saveExternal",
            "textView10",
            "textView11",
            "textView12",
            "textView16",
            "textView6",
            "toolbar"
        }
    .end annotation

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->rootView:Landroid/widget/LinearLayout;

    .line 82
    iput-object p2, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->about:Landroid/widget/RelativeLayout;

    .line 83
    iput-object p3, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->appBarLayout:Lcom/google/android/material/appbar/AppBarLayout;

    .line 84
    iput-object p4, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->checkBox:Landroid/widget/CheckBox;

    .line 85
    iput-object p5, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->checkBox1:Landroid/widget/CheckBox;

    .line 86
    iput-object p6, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->checkBox3:Landroid/widget/CheckBox;

    .line 87
    iput-object p7, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->content:Landroid/widget/LinearLayout;

    .line 88
    iput-object p8, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->debug:Landroid/widget/RelativeLayout;

    .line 89
    iput-object p9, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->license:Landroid/widget/RelativeLayout;

    .line 90
    iput-object p10, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->relativeLayout:Landroid/widget/RelativeLayout;

    .line 91
    iput-object p11, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->saveExternal:Landroid/widget/RelativeLayout;

    .line 92
    iput-object p12, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->textView10:Landroid/widget/TextView;

    .line 93
    iput-object p13, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->textView11:Landroid/widget/TextView;

    .line 94
    iput-object p14, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->textView12:Landroid/widget/TextView;

    .line 95
    iput-object p15, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->textView16:Landroid/widget/TextView;

    move-object/from16 p1, p16

    .line 96
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->textView6:Landroid/widget/TextView;

    move-object/from16 p1, p17

    .line 97
    iput-object p1, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->toolbar:Landroidx/appcompat/widget/Toolbar;

    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;
    .locals 21
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rootView"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 127
    sget v1, Lcom/zinhao/kikoeru/R$id;->about:I

    .line 128
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_0

    .line 133
    sget v1, Lcom/zinhao/kikoeru/R$id;->appBarLayout:I

    .line 134
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v6, :cond_0

    .line 139
    sget v1, Lcom/zinhao/kikoeru/R$id;->checkBox:I

    .line 140
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/CheckBox;

    if-eqz v7, :cond_0

    .line 145
    sget v1, Lcom/zinhao/kikoeru/R$id;->checkBox1:I

    .line 146
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/CheckBox;

    if-eqz v8, :cond_0

    .line 151
    sget v1, Lcom/zinhao/kikoeru/R$id;->checkBox3:I

    .line 152
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/widget/CheckBox;

    if-eqz v9, :cond_0

    .line 157
    sget v1, Lcom/zinhao/kikoeru/R$id;->content:I

    .line 158
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroid/widget/LinearLayout;

    if-eqz v10, :cond_0

    .line 163
    sget v1, Lcom/zinhao/kikoeru/R$id;->debug:I

    .line 164
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/widget/RelativeLayout;

    if-eqz v11, :cond_0

    .line 169
    sget v1, Lcom/zinhao/kikoeru/R$id;->license:I

    .line 170
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Landroid/widget/RelativeLayout;

    if-eqz v12, :cond_0

    .line 175
    sget v1, Lcom/zinhao/kikoeru/R$id;->relativeLayout:I

    .line 176
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Landroid/widget/RelativeLayout;

    if-eqz v13, :cond_0

    .line 181
    sget v1, Lcom/zinhao/kikoeru/R$id;->saveExternal:I

    .line 182
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Landroid/widget/RelativeLayout;

    if-eqz v14, :cond_0

    .line 187
    sget v1, Lcom/zinhao/kikoeru/R$id;->textView10:I

    .line 188
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_0

    .line 193
    sget v1, Lcom/zinhao/kikoeru/R$id;->textView11:I

    .line 194
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Landroid/widget/TextView;

    if-eqz v16, :cond_0

    .line 199
    sget v1, Lcom/zinhao/kikoeru/R$id;->textView12:I

    .line 200
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Landroid/widget/TextView;

    if-eqz v17, :cond_0

    .line 205
    sget v1, Lcom/zinhao/kikoeru/R$id;->textView16:I

    .line 206
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Landroid/widget/TextView;

    if-eqz v18, :cond_0

    .line 211
    sget v1, Lcom/zinhao/kikoeru/R$id;->textView6:I

    .line 212
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Landroid/widget/TextView;

    if-eqz v19, :cond_0

    .line 217
    sget v1, Lcom/zinhao/kikoeru/R$id;->toolbar:I

    .line 218
    invoke-static {v0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Landroidx/appcompat/widget/Toolbar;

    if-eqz v20, :cond_0

    .line 223
    new-instance v3, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    move-object v4, v0

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-direct/range {v3 .. v20}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;-><init>(Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/LinearLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/appcompat/widget/Toolbar;)V

    return-object v3

    .line 227
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    .line 228
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Missing required view with ID: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inflater"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 108
    invoke-static {p0, v0, v1}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    move-result-object p0

    return-object p0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inflater",
            "parent",
            "attachToParent"
        }
    .end annotation

    .line 114
    sget v0, Lcom/zinhao/kikoeru/R$layout;->activity_more:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p2, :cond_0

    .line 116
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 118
    :cond_0
    invoke-static {p0}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->bind(Landroid/view/View;)Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 0

    .line 22
    invoke-virtual {p0}, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 0

    .line 103
    iget-object p0, p0, Lcom/zinhao/kikoeru/databinding/ActivityMoreBinding;->rootView:Landroid/widget/LinearLayout;

    return-object p0
.end method
