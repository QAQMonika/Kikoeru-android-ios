.class public Lcom/koushikdutta/async/http/BasicNameValuePair;
.super Ljava/lang/Object;
.source "BasicNameValuePair.java"

# interfaces
.implements Lcom/koushikdutta/async/http/NameValuePair;
.implements Ljava/lang/Cloneable;


# instance fields
.field private final name:Ljava/lang/String;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 120
    iput-object p1, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    .line 121
    iput-object p2, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    return-void

    .line 118
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Name may not be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 169
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    return v1

    .line 155
    :cond_1
    instance-of v2, p1, Lcom/koushikdutta/async/http/NameValuePair;

    if-eqz v2, :cond_2

    .line 156
    check-cast p1, Lcom/koushikdutta/async/http/BasicNameValuePair;

    .line 157
    iget-object v2, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object p0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    iget-object p1, p1, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    .line 158
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 130
    iget-object p0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    return-object p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 139
    iget-object p0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object p0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    xor-int/2addr p0, v0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lcom/koushikdutta/async/http/BasicNameValuePair;->value:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
