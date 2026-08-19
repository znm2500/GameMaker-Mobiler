.class public Lorg/ini4j/spi/WinEscapeTool;
.super Lorg/ini4j/spi/EscapeTool;
.source "WinEscapeTool.java"


# static fields
.field private static final ANSI_HEX_DIGITS:I = 0x2

.field private static final ANSI_OCTAL_DIGITS:I = 0x3

.field private static final INSTANCE:Lorg/ini4j/spi/WinEscapeTool;

.field private static final OCTAL_RADIX:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    new-instance v0, Lorg/ini4j/spi/WinEscapeTool;

    invoke-direct {v0}, Lorg/ini4j/spi/WinEscapeTool;-><init>()V

    sput-object v0, Lorg/ini4j/spi/WinEscapeTool;->INSTANCE:Lorg/ini4j/spi/WinEscapeTool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Lorg/ini4j/spi/EscapeTool;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/ini4j/spi/WinEscapeTool;
    .locals 1

    .line 27
    sget-object v0, Lorg/ini4j/spi/WinEscapeTool;->INSTANCE:Lorg/ini4j/spi/WinEscapeTool;

    return-object v0
.end method


# virtual methods
.method escapeBinary(Ljava/lang/StringBuilder;C)V
    .locals 2

    const-string v0, "\\x"

    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    sget-object v0, Lorg/ini4j/spi/WinEscapeTool;->HEX:[C

    ushr-int/lit8 v1, p2, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    sget-object v0, Lorg/ini4j/spi/WinEscapeTool;->HEX:[C

    and-int/lit8 p2, p2, 0xf

    aget-char p2, v0, p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method unescapeBinary(Ljava/lang/StringBuilder;CLjava/lang/String;I)I
    .locals 1

    const/16 v0, 0x78

    if-ne p2, v0, :cond_0

    add-int/lit8 p2, p4, 0x2

    .line 45
    :try_start_0
    invoke-virtual {p3, p4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    const/16 p4, 0x10

    invoke-static {p3, p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p3

    int-to-char p3, p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    move p4, p2

    goto :goto_1

    :catch_0
    move-exception p1

    .line 50
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Malformed \\xHH encoding."

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_0
    const/16 v0, 0x6f

    if-ne p2, v0, :cond_1

    add-int/lit8 p2, p4, 0x3

    .line 57
    :try_start_1
    invoke-virtual {p3, p4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    const/16 p4, 0x8

    invoke-static {p3, p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p3

    int-to-char p3, p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 62
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Malformed \\oOO encoding."

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_1
    :goto_1
    return p4
.end method
