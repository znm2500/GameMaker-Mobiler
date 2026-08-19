.class final enum Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
.super Ljava/lang/Enum;
.source "UnicodeInputStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/spi/UnicodeInputStreamReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Bom"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF16BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF16LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF32BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF32LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF8:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;


# instance fields
.field private final _bytes:[B

.field private _charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 32
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const/4 v1, 0x4

    new-array v2, v1, [B

    fill-array-data v2, :array_0

    const-string v3, "UTF32BE"

    const/4 v4, 0x0

    const-string v5, "UTF-32BE"

    invoke-direct {v0, v3, v4, v5, v2}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 33
    new-instance v2, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    new-array v3, v1, [B

    fill-array-data v3, :array_1

    const-string v5, "UTF32LE"

    const/4 v6, 0x1

    const-string v7, "UTF-32LE"

    invoke-direct {v2, v5, v6, v7, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v2, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 34
    new-instance v3, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const/4 v5, 0x2

    new-array v7, v5, [B

    fill-array-data v7, :array_2

    const-string v8, "UTF16BE"

    const-string v9, "UTF-16BE"

    invoke-direct {v3, v8, v5, v9, v7}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v3, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 35
    new-instance v7, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    new-array v8, v5, [B

    fill-array-data v8, :array_3

    const-string v9, "UTF16LE"

    const/4 v10, 0x3

    const-string v11, "UTF-16LE"

    invoke-direct {v7, v9, v10, v11, v8}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v7, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 36
    new-instance v8, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    new-array v9, v10, [B

    fill-array-data v9, :array_4

    const-string v11, "UTF8"

    const-string v12, "UTF-8"

    invoke-direct {v8, v11, v1, v12, v9}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v8, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF8:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const/4 v9, 0x5

    new-array v9, v9, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v0, v9, v4

    aput-object v2, v9, v6

    aput-object v3, v9, v5

    aput-object v7, v9, v10

    aput-object v8, v9, v1

    .line 30
    sput-object v9, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->$VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        -0x2t
        -0x1t
    .end array-data

    :array_1
    .array-data 1
        -0x1t
        -0x2t
        0x0t
        0x0t
    .end array-data

    :array_2
    .array-data 1
        -0x2t
        -0x1t
    .end array-data

    nop

    :array_3
    .array-data 1
        -0x1t
        -0x2t
    .end array-data

    nop

    :array_4
    .array-data 1
        -0x11t
        -0x45t
        -0x41t
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 45
    :try_start_0
    invoke-static {p3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p1

    iput-object p1, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    .line 49
    iput-object p1, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    .line 52
    :goto_0
    iput-object p4, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    return-void
.end method

.method static synthetic access$000([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .locals 0

    .line 30
    invoke-static {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->find([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)Ljava/nio/charset/Charset;
    .locals 0

    .line 30
    iget-object p0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    return-object p0
.end method

.method static synthetic access$200(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)[B
    .locals 0

    .line 30
    iget-object p0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    return-object p0
.end method

.method private static find([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .locals 5

    .line 59
    invoke-static {}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->values()[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 61
    invoke-direct {v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->supported()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-direct {v3, p0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->match([B)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_1
    return-object v3
.end method

.method private match([B)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 76
    :goto_0
    iget-object v2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 78
    aget-byte v3, p1, v1

    aget-byte v2, v2, v1

    if-eq v3, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private supported()Z
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .locals 1

    .line 30
    const-class v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-object p0
.end method

.method public static values()[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .locals 1

    .line 30
    sget-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->$VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    invoke-virtual {v0}, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-object v0
.end method
