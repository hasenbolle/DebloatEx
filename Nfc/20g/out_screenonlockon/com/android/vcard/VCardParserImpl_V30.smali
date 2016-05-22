.class Lcom/android/vcard/VCardParserImpl_V30;
.super Lcom/android/vcard/VCardParserImpl_V21;
.source "VCardParserImpl_V30.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "vCard"


# instance fields
.field private mEmittedAgentWarning:Z

.field private mPreviousLine:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/android/vcard/VCardParserImpl_V21;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/vcard/VCardParserImpl_V30;->mEmittedAgentWarning:Z

    .line 46
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "vcardType"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/android/vcard/VCardParserImpl_V21;-><init>(I)V

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/vcard/VCardParserImpl_V30;->mEmittedAgentWarning:Z

    .line 50
    return-void
.end method

.method private splitAndPutParam(Lcom/android/vcard/VCardProperty;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "property"    # Lcom/android/vcard/VCardProperty;
    .param p2, "paramName"    # Ljava/lang/String;
    .param p3, "paramValue"    # Ljava/lang/String;

    .prologue
    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 202
    .local v3, "insideDquote":Z
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v4

    .line 203
    .local v4, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v4, :cond_7f

    .line 204
    invoke-virtual {p3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 205
    .local v1, "ch":C
    const/16 v5, 0x22

    if-ne v1, v5, :cond_40

    .line 206
    if-eqz v3, :cond_23

    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/vcard/VCardParserImpl_V30;->encodeParamValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, p2, v5}, Lcom/android/vcard/VCardProperty;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    const/4 v0, 0x0

    .line 210
    const/4 v3, 0x0

    .line 203
    :goto_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 212
    :cond_23
    if-eqz v0, :cond_32

    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_34

    .line 216
    const-string v5, "vCard"

    const-string v6, "Unexpected Dquote inside property."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_32
    :goto_32
    const/4 v3, 0x1

    goto :goto_20

    .line 221
    :cond_34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/vcard/VCardParserImpl_V30;->encodeParamValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, p2, v5}, Lcom/android/vcard/VCardProperty;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32

    .line 226
    :cond_40
    const/16 v5, 0x2c

    if-ne v1, v5, :cond_74

    if-nez v3, :cond_74

    .line 227
    if-nez v0, :cond_67

    .line 228
    const-string v5, "vCard"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Comma is used before actual string comes. ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 231
    :cond_67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/vcard/VCardParserImpl_V30;->encodeParamValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, p2, v5}, Lcom/android/vcard/VCardProperty;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    const/4 v0, 0x0

    goto :goto_20

    .line 237
    :cond_74
    if-nez v0, :cond_7b

    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_7b
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 243
    .end local v1    # "ch":C
    :cond_7f
    if-eqz v3, :cond_88

    .line 246
    const-string v5, "vCard"

    const-string v6, "Dangling Dquote."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    :cond_88
    if-eqz v0, :cond_97

    .line 249
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-nez v5, :cond_98

    .line 250
    const-string v5, "vCard"

    const-string v6, "Unintended behavior. We must not see empty StringBuilder at the end of parameter value parsing."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    :cond_97
    :goto_97
    return-void

    .line 253
    :cond_98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/vcard/VCardParserImpl_V30;->encodeParamValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, p2, v5}, Lcom/android/vcard/VCardProperty;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_97
.end method

.method public static unescapeCharacter(C)Ljava/lang/String;
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 342
    const/16 v0, 0x6e

    if-eq p0, v0, :cond_8

    const/16 v0, 0x4e

    if-ne p0, v0, :cond_b

    .line 343
    :cond_8
    const-string v0, "\n"

    .line 345
    :goto_a
    return-object v0

    :cond_b
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public static unescapeText(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 319
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 320
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v3, :cond_36

    .line 321
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 322
    .local v1, "ch":C
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_32

    add-int/lit8 v5, v3, -0x1

    if-ge v2, v5, :cond_32

    .line 323
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 324
    .local v4, "next_ch":C
    const/16 v5, 0x6e

    if-eq v4, v5, :cond_26

    const/16 v5, 0x4e

    if-ne v4, v5, :cond_2e

    .line 325
    :cond_26
    const-string v5, "\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .end local v4    # "next_ch":C
    :goto_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 327
    .restart local v4    # "next_ch":C
    :cond_2e
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 330
    .end local v4    # "next_ch":C
    :cond_32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 333
    .end local v1    # "ch":C
    :cond_36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method protected encodeParamValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "paramValue"    # Ljava/lang/String;

    .prologue
    .line 262
    const-string v0, "ISO-8859-1"

    const-string v1, "UTF-8"

    invoke-static {p1, v0, v1}, Lcom/android/vcard/VCardUtils;->convertStringCharset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getBase64(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "firstString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/vcard/exception/VCardException;
        }
    .end annotation

    .prologue
    .line 302
    return-object p1
.end method

.method protected getKnownPropertyNameSet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 351
    sget-object v0, Lcom/android/vcard/VCardParser_V30;->sKnownPropertyNameSet:Ljava/util/Set;

    return-object v0
.end method

.method protected getLine()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v1, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 65
    iget-object v0, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    .line 66
    .local v0, "ret":Ljava/lang/String;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    .line 69
    .end local v0    # "ret":Ljava/lang/String;
    :goto_9
    return-object v0

    :cond_a
    iget-object v1, p0, Lcom/android/vcard/VCardParserImpl_V30;->mReader:Lcom/android/vcard/VCardParserImpl_V21$CustomBufferedReader;

    invoke-virtual {v1}, Lcom/android/vcard/VCardParserImpl_V21$CustomBufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method protected getNonEmptyLine()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/vcard/exception/VCardException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mReader:Lcom/android/vcard/VCardParserImpl_V21$CustomBufferedReader;

    invoke-virtual {v3}, Lcom/android/vcard/VCardParserImpl_V21$CustomBufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_42

    .line 84
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 86
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-eq v3, v4, :cond_20

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x9

    if-ne v3, v4, :cond_3c

    .line 89
    :cond_20
    if-nez v0, :cond_27

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_27
    iget-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    if-eqz v3, :cond_33

    .line 93
    iget-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    .line 96
    :cond_33
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 98
    :cond_3c
    if-nez v0, :cond_42

    iget-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    if-eqz v3, :cond_55

    .line 105
    :cond_42
    const/4 v2, 0x0

    .line 106
    .local v2, "ret":Ljava/lang/String;
    if-eqz v0, :cond_58

    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 111
    :cond_49
    :goto_49
    iput-object v1, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    .line 112
    if-nez v2, :cond_5f

    .line 113
    new-instance v3, Lcom/android/vcard/exception/VCardException;

    const-string v4, "Reached end of buffer."

    invoke-direct {v3, v4}, Lcom/android/vcard/exception/VCardException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 101
    .end local v2    # "ret":Ljava/lang/String;
    :cond_55
    iput-object v1, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    goto :goto_2

    .line 108
    .restart local v2    # "ret":Ljava/lang/String;
    :cond_58
    iget-object v3, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    if-eqz v3, :cond_49

    .line 109
    iget-object v2, p0, Lcom/android/vcard/VCardParserImpl_V30;->mPreviousLine:Ljava/lang/String;

    goto :goto_49

    .line 115
    :cond_5f
    return-object v2
.end method

.method protected getVersion()I
    .registers 2

    .prologue
    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method protected getVersionString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    const-string v0, "3.0"

    return-object v0
.end method

.method protected handleAgent(Lcom/android/vcard/VCardProperty;)V
    .registers 4
    .param p1, "property"    # Lcom/android/vcard/VCardProperty;

    .prologue
    .line 286
    iget-boolean v0, p0, Lcom/android/vcard/VCardParserImpl_V30;->mEmittedAgentWarning:Z

    if-nez v0, :cond_e

    .line 287
    const-string v0, "vCard"

    const-string v1, "AGENT in vCard 3.0 is not supported yet. Ignore it"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/vcard/VCardParserImpl_V30;->mEmittedAgentWarning:Z

    .line 290
    :cond_e
    return-void
.end method

.method protected handleAnyParam(Lcom/android/vcard/VCardProperty;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "propertyData"    # Lcom/android/vcard/VCardProperty;
    .param p2, "paramName"    # Ljava/lang/String;
    .param p3, "paramValue"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-direct {p0, p1, p2, p3}, Lcom/android/vcard/VCardParserImpl_V30;->splitAndPutParam(Lcom/android/vcard/VCardProperty;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method protected handleParamWithoutName(Lcom/android/vcard/VCardProperty;Ljava/lang/String;)V
    .registers 3
    .param p1, "property"    # Lcom/android/vcard/VCardProperty;
    .param p2, "paramValue"    # Ljava/lang/String;

    .prologue
    .line 159
    invoke-virtual {p0, p1, p2}, Lcom/android/vcard/VCardParserImpl_V30;->handleType(Lcom/android/vcard/VCardProperty;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method protected handleParams(Lcom/android/vcard/VCardProperty;Ljava/lang/String;)V
    .registers 8
    .param p1, "propertyData"    # Lcom/android/vcard/VCardProperty;
    .param p2, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/vcard/exception/VCardException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    .line 137
    :try_start_1
    invoke-super {p0, p1, p2}, Lcom/android/vcard/VCardParserImpl_V21;->handleParams(Lcom/android/vcard/VCardProperty;Ljava/lang/String;)V
    :try_end_4
    .catch Lcom/android/vcard/exception/VCardException; {:try_start_1 .. :try_end_4} :catch_5

    .line 149
    :goto_4
    return-void

    .line 138
    :catch_5
    move-exception v0

    .line 140
    .local v0, "e":Lcom/android/vcard/exception/VCardException;
    const-string v2, "="

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 141
    .local v1, "strArray":[Ljava/lang/String;
    array-length v2, v1

    if-ne v2, v3, :cond_19

    .line 142
    const/4 v2, 0x0

    aget-object v2, v1, v2

    const/4 v3, 0x1

    aget-object v3, v1, v3

    invoke-virtual {p0, p1, v2, v3}, Lcom/android/vcard/VCardParserImpl_V30;->handleAnyParam(Lcom/android/vcard/VCardProperty;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 145
    :cond_19
    new-instance v2, Lcom/android/vcard/exception/VCardException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown params value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/vcard/exception/VCardException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected handleType(Lcom/android/vcard/VCardProperty;Ljava/lang/String;)V
    .registers 4
    .param p1, "property"    # Lcom/android/vcard/VCardProperty;
    .param p2, "paramValue"    # Ljava/lang/String;

    .prologue
    .line 176
    const-string v0, "TYPE"

    invoke-direct {p0, p1, v0, p2}, Lcom/android/vcard/VCardParserImpl_V30;->splitAndPutParam(Lcom/android/vcard/VCardProperty;Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method protected maybeUnescapeCharacter(C)Ljava/lang/String;
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 338
    invoke-static {p1}, Lcom/android/vcard/VCardParserImpl_V30;->unescapeCharacter(C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected maybeUnescapeText(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 314
    invoke-static {p1}, Lcom/android/vcard/VCardParserImpl_V30;->unescapeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected readBeginVCard(Z)Z
    .registers 3
    .param p1, "allowGarbage"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/vcard/exception/VCardException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-super {p0, p1}, Lcom/android/vcard/VCardParserImpl_V21;->readBeginVCard(Z)Z

    move-result v0

    return v0
.end method