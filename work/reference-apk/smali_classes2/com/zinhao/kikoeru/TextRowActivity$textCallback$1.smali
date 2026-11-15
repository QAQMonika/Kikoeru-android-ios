.class public final Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
.source "TextRowActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zinhao/kikoeru/TextRowActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u00020\u00032\u000e\u0010\u0004\u001a\n\u0018\u00010\u0005j\u0004\u0018\u0001`\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/zinhao/kikoeru/TextRowActivity$textCallback$1",
        "Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;",
        "onCompleted",
        "",
        "e",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
        "asyncHttpResponse",
        "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
        "s",
        "",
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
.field final synthetic this$0:Lcom/zinhao/kikoeru/TextRowActivity;


# direct methods
.method public static synthetic $r8$lambda$eEHxulgnrn1bBfe2mXPZsmiavRo(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->onCompleted$lambda$0(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hlTQB7XV0K4bQTGdpHftwR5nYV0(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->onCompleted$lambda$1(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/zinhao/kikoeru/TextRowActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->this$0:Lcom/zinhao/kikoeru/TextRowActivity;

    .line 26
    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;-><init>()V

    return-void
.end method

.method private static final onCompleted$lambda$0(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->access$init(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    return-void
.end method

.method private static final onCompleted$lambda$1(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V
    .locals 0

    .line 36
    invoke-static {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->access$init(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V
    .locals 1

    const-string v0, "s"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 29
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->this$0:Lcom/zinhao/kikoeru/TextRowActivity;

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->alertException(Ljava/lang/Exception;)V

    return-void

    :cond_0
    if-eqz p2, :cond_2

    .line 32
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result p1

    const/16 p2, 0xc8

    if-eq p1, p2, :cond_1

    goto :goto_0

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->this$0:Lcom/zinhao/kikoeru/TextRowActivity;

    new-instance p1, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, p3}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1$$ExternalSyntheticLambda1;-><init>(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 33
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->this$0:Lcom/zinhao/kikoeru/TextRowActivity;

    new-instance p1, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0, p3}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1$$ExternalSyntheticLambda0;-><init>(Lcom/zinhao/kikoeru/TextRowActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/zinhao/kikoeru/TextRowActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 26
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3}, Lcom/zinhao/kikoeru/TextRowActivity$textCallback$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V

    return-void
.end method
