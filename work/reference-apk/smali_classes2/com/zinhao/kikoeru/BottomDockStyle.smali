.class public final Lcom/zinhao/kikoeru/BottomDockStyle;
.super Ljava/lang/Object;

.method public static apply(Landroid/app/Activity;)V
    .locals 2

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0

    const v1, -0xdbded3
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarDividerColor(I)V

    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I
    move-result v1

    and-int/lit8 v1, v1, -0x11
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method
