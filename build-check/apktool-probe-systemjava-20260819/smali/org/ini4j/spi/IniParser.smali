.class public Lorg/ini4j/spi/IniParser;
.super Lorg/ini4j/spi/AbstractParser;
.source "IniParser.java"


# static fields
.field private static final COMMENTS:Ljava/lang/String; = ";#"

.field private static final OPERATORS:Ljava/lang/String; = ":="

.field static final SECTION_BEGIN:C = '['

.field static final SECTION_END:C = ']'


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, ":="

    const-string v1, ";#"

    .line 38
    invoke-direct {p0, v0, v1}, Lorg/ini4j/spi/AbstractParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static newInstance()Lorg/ini4j/spi/IniParser;
    .locals 1

    .line 43
    const-class v0, Lorg/ini4j/spi/IniParser;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/IniParser;

    return-object v0
.end method

.method public static newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/IniParser;
    .locals 1

    .line 48
    invoke-static {}, Lorg/ini4j/spi/IniParser;->newInstance()Lorg/ini4j/spi/IniParser;

    move-result-object v0

    .line 50
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/IniParser;->setConfig(Lorg/ini4j/Config;)V

    return-object v0
.end method

.method private parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 72
    invoke-interface {p2}, Lorg/ini4j/spi/IniHandler;->startIni()V

    .line 75
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_4

    const/4 v2, 0x0

    .line 77
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5b

    if-ne v2, v3, :cond_1

    if-eqz v1, :cond_0

    .line 81
    invoke-interface {p2}, Lorg/ini4j/spi/IniHandler;->endSection()V

    .line 84
    :cond_0
    invoke-direct {p0, v0, p1, p2}, Lorg/ini4j/spi/IniParser;->parseSectionLine(Ljava/lang/String;Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_2

    :cond_1
    if-nez v1, :cond_3

    .line 90
    invoke-virtual {p0}, Lorg/ini4j/spi/IniParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v2

    invoke-virtual {v2}, Lorg/ini4j/Config;->isGlobalSection()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 92
    invoke-virtual {p0}, Lorg/ini4j/spi/IniParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getGlobalSectionName()Ljava/lang/String;

    move-result-object v1

    .line 93
    invoke-interface {p2, v1}, Lorg/ini4j/spi/IniHandler;->startSection(Ljava/lang/String;)V

    goto :goto_1

    .line 97
    :cond_2
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lorg/ini4j/spi/IniParser;->parseError(Ljava/lang/String;I)V

    .line 101
    :cond_3
    :goto_1
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v2

    invoke-virtual {p0, v0, p2, v2}, Lorg/ini4j/spi/IniParser;->parseOptionLine(Ljava/lang/String;Lorg/ini4j/spi/HandlerBase;I)V

    .line 75
    :goto_2
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    if-eqz v1, :cond_5

    .line 107
    invoke-interface {p2}, Lorg/ini4j/spi/IniHandler;->endSection()V

    .line 110
    :cond_5
    invoke-interface {p2}, Lorg/ini4j/spi/IniHandler;->endIni()V

    return-void
.end method

.method private parseSectionLine(Ljava/lang/String;Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 117
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_0

    .line 119
    invoke-virtual {p2}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/ini4j/spi/IniParser;->parseError(Ljava/lang/String;I)V

    .line 122
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/ini4j/spi/IniParser;->unescapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lorg/ini4j/spi/IniParser;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->isUnnamedSection()Z

    move-result v1

    if-nez v1, :cond_1

    .line 125
    invoke-virtual {p2}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->parseError(Ljava/lang/String;I)V

    .line 128
    :cond_1
    invoke-virtual {p0}, Lorg/ini4j/spi/IniParser;->getConfig()Lorg/ini4j/Config;

    move-result-object p1

    invoke-virtual {p1}, Lorg/ini4j/Config;->isLowerCaseSection()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 130
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 133
    :cond_2
    invoke-interface {p3, v0}, Lorg/ini4j/spi/IniHandler;->startSection(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;Lorg/ini4j/spi/IniHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 57
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->newIniSource(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method public parse(Ljava/io/Reader;Lorg/ini4j/spi/IniHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->newIniSource(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method public parse(Ljava/net/URL;Lorg/ini4j/spi/IniHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 67
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->newIniSource(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/IniParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method
