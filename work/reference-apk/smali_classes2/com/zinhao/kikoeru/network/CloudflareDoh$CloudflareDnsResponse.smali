.class Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse;
.super Ljava/lang/Object;
.source "CloudflareDoh.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zinhao/kikoeru/network/CloudflareDoh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CloudflareDnsResponse"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse$Answer;
    }
.end annotation


# instance fields
.field Answer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zinhao/kikoeru/network/CloudflareDoh$CloudflareDnsResponse$Answer;",
            ">;"
        }
    .end annotation
.end field

.field Status:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
