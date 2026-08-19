.class public Lorg/ini4j/spi/EscapeTool;
.super Ljava/lang/Object;
.source "EscapeTool.java"


# static fields
.field private static final ASCII_MAX:C = '~'

.field private static final ASCII_MIN:C = ' '

.field static final DOUBLE_QUOTE:C = '\"'

.field private static final ESCAPEABLE_CHARS:Ljava/lang/String; = "\\\t\n\u000c\u0008\r"

.field private static final ESCAPE_CHAR:C = '\\'

.field private static final ESCAPE_LETTERS:Ljava/lang/String; = "\\tnfbr"

.field static final HEX:[C

.field static final HEX_DIGIT_1_OFFSET:I = 0xc

.field static final HEX_DIGIT_2_OFFSET:I = 0x8

.field static final HEX_DIGIT_3_OFFSET:I = 0x4

.field static final HEX_DIGIT_MASK:I = 0xf

.field static final HEX_RADIX:I = 0x10

.field private static final INSTANCE:Lorg/ini4j/spi/EscapeTool;

.field private static final UNICODE_HEX_DIGITS:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "0123456789abcdef"

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    .line 24
    const-class v0, Lorg/ini4j/spi/EscapeTool;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/EscapeTool;

    sput-object v0, Lorg/ini4j/spi/EscapeTool;->INSTANCE:Lorg/ini4j/spi/EscapeTool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/ini4j/spi/EscapeTool;
    .locals 1

    .line 37
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->INSTANCE:Lorg/ini4j/spi/EscapeTool;

    return-object v0
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v2, v0, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const-string v4, "\\\t\n\u000c\u0008\r"

    .line 48
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_0

    const/16 v3, 0x5c

    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v3, "\\tnfbr"

    .line 53
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_0
    const/16 v4, 0x20

    if-lt v3, v4, :cond_2

    const/16 v4, 0x7e

    if-le v3, v4, :cond_1

    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 59
    :cond_2
    :goto_1
    invoke-virtual {p0, v1, v3}, Lorg/ini4j/spi/EscapeTool;->escapeBinary(Ljava/lang/StringBuilder;C)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 68
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method escapeBinary(Ljava/lang/StringBuilder;C)V
    .locals 2

    const-string v0, "\\u"

    .line 168
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    ushr-int/lit8 v1, p2, 0xc

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v0, v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    ushr-int/lit8 v1, p2, 0x8

    and-int/lit8 v1, v1, 0xf

    .line 170
    aget-char v1, v0, v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    ushr-int/lit8 v1, p2, 0x4

    and-int/lit8 v1, v1, 0xf

    .line 171
    aget-char v1, v0, v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 p2, p2, 0xf

    .line 172
    aget-char p2, v0, p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method public quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    if-eqz p1, :cond_3

    .line 75
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x22

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 80
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 82
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-eq v3, v4, :cond_0

    if-ne v3, v1, :cond_1

    .line 86
    :cond_0
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 92
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_3
    return-object p1
.end method

.method public unescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    add-int/lit8 v3, v2, 0x1

    .line 107
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x5c

    if-ne v2, v4, :cond_2

    add-int/lit8 v2, v3, 0x1

    .line 111
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 112
    invoke-virtual {p0, v1, v3, p1, v2}, Lorg/ini4j/spi/EscapeTool;->unescapeBinary(Ljava/lang/StringBuilder;CLjava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_1

    const-string v4, "\\tnfbr"

    .line 116
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_0

    const-string v3, "\\\t\n\u000c\u0008\r"

    .line 120
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 123
    :cond_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    move v2, v4

    goto :goto_0

    .line 132
    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v3

    goto :goto_0

    .line 136
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method unescapeBinary(Ljava/lang/StringBuilder;CLjava/lang/String;I)I
    .locals 1

    const/16 v0, 0x75

    if-ne p2, v0, :cond_0

    add-int/lit8 p2, p4, 0x4

    .line 183
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

    move p4, p2

    goto :goto_0

    :catch_0
    move-exception p1

    .line 188
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "Malformed \\uxxxx encoding."

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_0
    :goto_0
    return p4
.end method

.method public unquote(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 144
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v2

    if-ge v3, v5, :cond_2

    .line 146
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_1

    if-nez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    .line 160
    :cond_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 163
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
