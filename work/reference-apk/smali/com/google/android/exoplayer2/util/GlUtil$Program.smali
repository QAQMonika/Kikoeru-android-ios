.class public final Lcom/google/android/exoplayer2/util/GlUtil$Program;
.super Ljava/lang/Object;
.source "GlUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/util/GlUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Program"
.end annotation


# instance fields
.field private final programId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    invoke-static {p1, p2}, Lcom/google/android/exoplayer2/util/GlUtil;->loadAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p3}, Lcom/google/android/exoplayer2/util/GlUtil;->loadAsset(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lcom/google/android/exoplayer2/util/GlUtil$Program;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    .line 70
    invoke-static {}, Lcom/google/android/exoplayer2/util/GlUtil;->checkGlError()V

    const v0, 0x8b31

    .line 73
    invoke-direct {p0, v0, p1}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->addShader(ILjava/lang/String;)V

    const p1, 0x8b30

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->addShader(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;)V
    .locals 1

    .line 99
    const-string v0, "\n"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer2/util/GlUtil$Program;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private addShader(ILjava/lang/String;)V
    .locals 3

    .line 195
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p1

    .line 196
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 197
    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const/4 v0, 0x0

    .line 199
    filled-new-array {v0}, [I

    move-result-object v1

    const v2, 0x8b81

    .line 200
    invoke-static {p1, v2, v1, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 201
    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 202
    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0xa

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", source: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/exoplayer2/util/GlUtil;->access$000(Ljava/lang/String;)V

    .line 205
    :cond_0
    iget p0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 206
    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 207
    invoke-static {}, Lcom/google/android/exoplayer2/util/GlUtil;->checkGlError()V

    return-void
.end method

.method private createAttribute(I)Lcom/google/android/exoplayer2/util/GlUtil$Attribute;
    .locals 17

    move-object/from16 v0, p0

    const/4 v1, 0x1

    .line 161
    new-array v2, v1, [I

    .line 162
    iget v3, v0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const v4, 0x8b8a

    const/4 v5, 0x0

    invoke-static {v3, v4, v2, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 164
    new-array v13, v1, [I

    .line 165
    new-array v11, v1, [I

    .line 166
    aget v8, v2, v5

    new-array v15, v8, [B

    .line 167
    new-array v9, v1, [I

    .line 169
    iget v6, v0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v7, p1

    invoke-static/range {v6 .. v16}, Landroid/opengl/GLES20;->glGetActiveAttrib(III[II[II[II[BI)V

    .line 171
    new-instance v1, Ljava/lang/String;

    invoke-static {v15}, Lcom/google/android/exoplayer2/util/GlUtil;->access$100([B)I

    move-result v2

    invoke-direct {v1, v15, v5, v2}, Ljava/lang/String;-><init>([BII)V

    .line 172
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->getAttribLocation(Ljava/lang/String;)I

    move-result v0

    .line 174
    new-instance v2, Lcom/google/android/exoplayer2/util/GlUtil$Attribute;

    invoke-direct {v2, v1, v7, v0}, Lcom/google/android/exoplayer2/util/GlUtil$Attribute;-><init>(Ljava/lang/String;II)V

    return-object v2
.end method

.method private createUniform(I)Lcom/google/android/exoplayer2/util/GlUtil$Uniform;
    .locals 17

    move-object/from16 v0, p0

    const/4 v1, 0x1

    .line 178
    new-array v2, v1, [I

    .line 179
    iget v3, v0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const v4, 0x8b87

    const/4 v5, 0x0

    invoke-static {v3, v4, v2, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 181
    new-array v13, v1, [I

    .line 182
    new-array v11, v1, [I

    .line 183
    aget v8, v2, v5

    new-array v15, v8, [B

    .line 184
    new-array v9, v1, [I

    .line 186
    iget v6, v0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v7, p1

    invoke-static/range {v6 .. v16}, Landroid/opengl/GLES20;->glGetActiveUniform(III[II[II[II[BI)V

    .line 188
    new-instance v1, Ljava/lang/String;

    invoke-static {v15}, Lcom/google/android/exoplayer2/util/GlUtil;->access$100([B)I

    move-result v2

    invoke-direct {v1, v15, v5, v2}, Ljava/lang/String;-><init>([BII)V

    .line 189
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->getUniformLocation(Ljava/lang/String;)I

    move-result v0

    .line 191
    new-instance v2, Lcom/google/android/exoplayer2/util/GlUtil$Uniform;

    aget v3, v13, v5

    invoke-direct {v2, v1, v0, v3}, Lcom/google/android/exoplayer2/util/GlUtil$Uniform;-><init>(Ljava/lang/String;II)V

    return-object v2
.end method


# virtual methods
.method public delete()V
    .locals 0

    .line 119
    iget p0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    return-void
.end method

.method public getAttribLocation(Ljava/lang/String;)I
    .locals 0

    .line 124
    iget p0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getAttributes()[Lcom/google/android/exoplayer2/util/GlUtil$Attribute;
    .locals 5

    const/4 v0, 0x1

    .line 134
    new-array v0, v0, [I

    .line 135
    iget v1, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const v2, 0x8b89

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 136
    aget v1, v0, v3

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 140
    new-array v1, v1, [Lcom/google/android/exoplayer2/util/GlUtil$Attribute;

    move v2, v3

    .line 141
    :goto_0
    aget v4, v0, v3

    if-ge v2, v4, :cond_0

    .line 142
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->createAttribute(I)Lcom/google/android/exoplayer2/util/GlUtil$Attribute;

    move-result-object v4

    aput-object v4, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    .line 137
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Expected two attributes."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getUniformLocation(Ljava/lang/String;)I
    .locals 0

    .line 129
    iget p0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public getUniforms()[Lcom/google/android/exoplayer2/util/GlUtil$Uniform;
    .locals 5

    const/4 v0, 0x1

    .line 149
    new-array v0, v0, [I

    .line 150
    iget v1, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const v2, 0x8b86

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 152
    aget v1, v0, v3

    new-array v1, v1, [Lcom/google/android/exoplayer2/util/GlUtil$Uniform;

    move v2, v3

    .line 153
    :goto_0
    aget v4, v0, v3

    if-ge v2, v4, :cond_0

    .line 154
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer2/util/GlUtil$Program;->createUniform(I)Lcom/google/android/exoplayer2/util/GlUtil$Uniform;

    move-result-object v4

    aput-object v4, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public use()V
    .locals 4

    .line 105
    iget v0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    const/4 v0, 0x0

    .line 106
    filled-new-array {v0}, [I

    move-result-object v1

    .line 107
    iget v2, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    const v3, 0x8b82

    invoke-static {v2, v3, v1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 108
    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 109
    iget v0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    .line 110
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "Unable to link shader program: \n"

    if-eqz v1, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 109
    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer2/util/GlUtil;->access$000(Ljava/lang/String;)V

    .line 112
    :cond_1
    invoke-static {}, Lcom/google/android/exoplayer2/util/GlUtil;->checkGlError()V

    .line 114
    iget p0, p0, Lcom/google/android/exoplayer2/util/GlUtil$Program;->programId:I

    invoke-static {p0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method
