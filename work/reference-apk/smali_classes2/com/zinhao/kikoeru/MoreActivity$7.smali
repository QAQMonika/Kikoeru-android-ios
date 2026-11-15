.class Lcom/zinhao/kikoeru/MoreActivity$7;
.super Ljava/lang/Object;
.source "MoreActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/MoreActivity;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zinhao/kikoeru/MoreActivity;


# direct methods
.method constructor <init>(Lcom/zinhao/kikoeru/MoreActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 109
    iput-object p1, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 112
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 113
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_1

    .line 114
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 115
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CheckBox;->toggle()V

    return-void

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/MoreActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 121
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 122
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CheckBox;->toggle()V

    return-void

    .line 127
    :cond_1
    invoke-static {}, Lcom/zinhao/kikoeru/App;->getInstance()Lcom/zinhao/kikoeru/App;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/zinhao/kikoeru/App;->setSaveExternal(Z)V

    .line 128
    iget-object v0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {v0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_2

    .line 129
    iget-object p0, p0, Lcom/zinhao/kikoeru/MoreActivity$7;->this$0:Lcom/zinhao/kikoeru/MoreActivity;

    invoke-static {p0}, Lcom/zinhao/kikoeru/MoreActivity;->access$200(Lcom/zinhao/kikoeru/MoreActivity;)Landroid/widget/CheckBox;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CheckBox;->toggle()V

    :cond_2
    return-void
.end method
