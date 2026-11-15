.class Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;
.super Ljava/lang/Object;
.source "LicenseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/LicenseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OpenSourceProject"
.end annotation


# instance fields
.field licenseUrl:Ljava/lang/String;

.field name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "licenseUrl"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->name:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->licenseUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getLicenseUrl()Ljava/lang/String;
    .locals 0

    .line 81
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->licenseUrl:Ljava/lang/String;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 77
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->name:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 86
    iget-object p0, p0, Lcom/zinhao/kikoeru/LicenseActivity$OpenSourceProject;->name:Ljava/lang/String;

    return-object p0
.end method
