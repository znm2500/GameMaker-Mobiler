.class public Lorg/ini4j/spi/RegEscapeTool;
.super Lorg/ini4j/spi/EscapeTool;
.source "RegEscapeTool.java"


# static fields
.field private static final DIGIT_SIZE:I = 0x4

.field private static final HEX_CHARSET:Ljava/nio/charset/Charset;

.field private static final INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

.field private static final LOWER_DIGIT:I = 0xf

.field private static final UPPER_DIGIT:I = 0xf0


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    const-class v0, Lorg/ini4j/spi/RegEscapeTool;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/RegEscapeTool;

    sput-object v0, Lorg/ini4j/spi/RegEscapeTool;->INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

    const-string v0, "UTF-16LE"

    .line 31
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/ini4j/spi/EscapeTool;-><init>()V

    return-void
.end method

.method private bytes2string([B)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    .line 212
    :try_start_0
    new-instance v1, Ljava/lang/String;

    array-length v2, p1

    add-int/lit8 v2, v2, -0x2

    sget-object v3, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, v0, v2, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 218
    :catch_0
    :try_start_1
    new-instance v1, Ljava/lang/String;

    array-length v2, p1

    sget-object v3, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p1, v0, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-object v1

    :catch_1
    move-exception p1

    .line 222
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static final getInstance()Lorg/ini4j/spi/RegEscapeTool;
    .locals 1

    .line 38
    sget-object v0, Lorg/ini4j/spi/RegEscapeTool;->INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

    return-object v0
.end method

.method private splitMulti(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6

    .line 231
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 237
    invoke-virtual {p1, v1, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ltz v2, :cond_1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    if-lt v2, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    goto :goto_0

    .line 247
    :cond_1
    :goto_1
    new-array v0, v3, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_2
    if-ge v2, v3, :cond_2

    .line 252
    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 253
    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v2

    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_2
    return-object v0
.end method

.method private string2bytes(Ljava/lang/String;)[B
    .locals 1

    .line 267
    :try_start_0
    sget-object v0, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 273
    :catch_0
    :try_start_1
    sget-object v0, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-object p1

    :catch_1
    move-exception p1

    .line 277
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method binary(Ljava/lang/String;)[B
    .locals 8

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    new-array v0, v0, [B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x4

    .line 100
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_3

    .line 102
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 104
    invoke-static {v6}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_1

    :cond_0
    const/16 v7, 0x2c

    if-ne v6, v7, :cond_1

    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x4

    goto :goto_1

    :cond_1
    const/16 v7, 0x10

    .line 116
    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v6

    if-ltz v6, :cond_2

    .line 120
    aget-byte v7, v0, v4

    shl-int v5, v6, v5

    or-int/2addr v5, v7

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    const/4 v5, 0x0

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 126
    invoke-static {v0, v2, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    return-object p1
.end method

.method public decode(Ljava/lang/String;)Lorg/ini4j/spi/TypeValuesPair;
    .locals 5

    .line 43
    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->type(Ljava/lang/String;)Lorg/ini4j/Registry$Type;

    move-result-object v0

    .line 44
    sget-object v1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lorg/ini4j/Registry$Type;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 47
    :goto_0
    sget-object v1, Lorg/ini4j/spi/RegEscapeTool$1;->$SwitchMap$org$ini4j$Registry$Type:[I

    invoke-virtual {v0}, Lorg/ini4j/Registry$Type;->ordinal()I

    move-result v3

    aget v1, v1, v3

    if-eq v1, v2, :cond_2

    const/4 v3, 0x2

    if-eq v1, v3, :cond_2

    const/4 v3, 0x3

    if-eq v1, v3, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x10

    .line 56
    invoke-static {p1, v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 52
    :cond_2
    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->binary(Ljava/lang/String;)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->bytes2string([B)Ljava/lang/String;

    move-result-object p1

    .line 66
    :goto_1
    sget-object v1, Lorg/ini4j/Registry$Type;->REG_MULTI_SZ:Lorg/ini4j/Registry$Type;

    if-ne v0, v1, :cond_3

    .line 68
    invoke-direct {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->splitMulti(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_3
    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    move-object p1, v1

    .line 75
    :goto_2
    new-instance v1, Lorg/ini4j/spi/TypeValuesPair;

    invoke-direct {v1, v0, p1}, Lorg/ini4j/spi/TypeValuesPair;-><init>(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)V

    return-object v1
.end method

.method encode(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    invoke-virtual {p1}, Lorg/ini4j/Registry$Type;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3a

    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    sget-object v1, Lorg/ini4j/spi/RegEscapeTool$1;->$SwitchMap$org$ini4j$Registry$Type:[I

    invoke-virtual {p1}, Lorg/ini4j/Registry$Type;->ordinal()I

    move-result p1

    aget p1, v1, p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v1, :cond_3

    const/4 v3, 0x2

    if-eq p1, v3, :cond_1

    const/4 v3, 0x3

    if-eq p1, v3, :cond_0

    .line 159
    aget-object p1, p2, v2

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_0
    new-array p1, v1, [Ljava/lang/Object;

    .line 143
    aget-object p2, p2, v2

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, p1, v2

    const-string p2, "%08x"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 147
    :cond_1
    array-length p1, p2

    :goto_0
    if-ge v2, p1, :cond_2

    .line 151
    aget-object v1, p2, v2

    invoke-virtual {p0, v1}, Lorg/ini4j/spi/RegEscapeTool;->hexadecimal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const-string p1, "00,00"

    .line 155
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 139
    :cond_3
    aget-object p1, p2, v2

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->hexadecimal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public encode(Lorg/ini4j/spi/TypeValuesPair;)Ljava/lang/String;
    .locals 3

    .line 82
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v0

    sget-object v1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 84
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v2

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v2

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v0

    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/ini4j/spi/RegEscapeTool;->encode(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method hexadecimal(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_1

    .line 170
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 172
    invoke-direct {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->string2bytes(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v1, 0x0

    .line 174
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 176
    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xf0

    shr-int/lit8 v2, v2, 0x4

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 177
    aget-byte v2, p1, v1

    and-int/lit8 v2, v2, 0xf

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v2, 0x2c

    .line 178
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "00,00"

    .line 181
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method type(Ljava/lang/String;)Lorg/ini4j/Registry$Type;
    .locals 3

    const/4 v0, 0x0

    .line 191
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x22

    if-ne v1, v2, :cond_0

    .line 193
    sget-object p1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    goto :goto_0

    :cond_0
    const/16 v1, 0x3a

    .line 197
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 199
    sget-object p1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/ini4j/Registry$Type;->fromString(Ljava/lang/String;)Lorg/ini4j/Registry$Type;

    move-result-object p1

    :goto_0
    return-object p1
.end method
