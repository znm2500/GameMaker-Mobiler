.class abstract Lorg/ini4j/spi/AbstractParser;
.super Ljava/lang/Object;
.source "AbstractParser.java"


# instance fields
.field private final _comments:Ljava/lang/String;

.field private _config:Lorg/ini4j/Config;

.field private final _operators:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/spi/AbstractParser;->_config:Lorg/ini4j/Config;

    .line 37
    iput-object p1, p0, Lorg/ini4j/spi/AbstractParser;->_operators:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lorg/ini4j/spi/AbstractParser;->_comments:Ljava/lang/String;

    return-void
.end method

.method private indexOfOperator(Ljava/lang/String;)I
    .locals 6

    .line 116
    iget-object v0, p0, Lorg/ini4j/spi/AbstractParser;->_operators:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    array-length v1, v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    :goto_0
    if-ge v3, v1, :cond_2

    aget-char v5, v0, v3

    .line 118
    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ltz v5, :cond_1

    if-eq v4, v2, :cond_0

    if-ge v5, v4, :cond_1

    :cond_0
    move v4, v5

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v4
.end method


# virtual methods
.method protected getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 43
    iget-object v0, p0, Lorg/ini4j/spi/AbstractParser;->_config:Lorg/ini4j/Config;

    return-object v0
.end method

.method newIniSource(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;
    .locals 3

    .line 58
    new-instance v0, Lorg/ini4j/spi/IniSource;

    iget-object v1, p0, Lorg/ini4j/spi/AbstractParser;->_comments:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v2

    invoke-direct {v0, p1, p2, v1, v2}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    return-object v0
.end method

.method newIniSource(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;
    .locals 3

    .line 63
    new-instance v0, Lorg/ini4j/spi/IniSource;

    iget-object v1, p0, Lorg/ini4j/spi/AbstractParser;->_comments:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v2

    invoke-direct {v0, p1, p2, v1, v2}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    return-object v0
.end method

.method newIniSource(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    new-instance v0, Lorg/ini4j/spi/IniSource;

    iget-object v1, p0, Lorg/ini4j/spi/AbstractParser;->_comments:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v2

    invoke-direct {v0, p1, p2, v1, v2}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    return-object v0
.end method

.method protected parseError(Ljava/lang/String;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 53
    new-instance v0, Lorg/ini4j/InvalidFileFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parse error (at line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "): "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/ini4j/InvalidFileFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method parseOptionLine(Ljava/lang/String;Lorg/ini4j/spi/HandlerBase;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 73
    invoke-direct {p0, p1}, Lorg/ini4j/spi/AbstractParser;->indexOfOperator(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_1

    .line 79
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEmptyOption()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, v1

    move-object v1, p1

    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {p0, p1, p3}, Lorg/ini4j/spi/AbstractParser;->parseError(Ljava/lang/String;I)V

    move-object v0, v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 90
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/ini4j/spi/AbstractParser;->unescapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ini4j/spi/AbstractParser;->unescapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 94
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 96
    invoke-virtual {p0, p1, p3}, Lorg/ini4j/spi/AbstractParser;->parseError(Ljava/lang/String;I)V

    .line 99
    :cond_2
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object p1

    invoke-virtual {p1}, Lorg/ini4j/Config;->isLowerCaseOption()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 101
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 104
    :cond_3
    invoke-interface {p2, v1, v0}, Lorg/ini4j/spi/HandlerBase;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected setConfig(Lorg/ini4j/Config;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lorg/ini4j/spi/AbstractParser;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method unescapeFilter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 109
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEscape()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/ini4j/spi/EscapeTool;->getInstance()Lorg/ini4j/spi/EscapeTool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/ini4j/spi/EscapeTool;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method
