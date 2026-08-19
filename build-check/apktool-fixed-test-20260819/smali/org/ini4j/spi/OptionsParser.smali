.class public Lorg/ini4j/spi/OptionsParser;
.super Lorg/ini4j/spi/AbstractParser;
.source "OptionsParser.java"


# static fields
.field private static final COMMENTS:Ljava/lang/String; = "!#"

.field private static final OPERATORS:Ljava/lang/String; = ":="


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, ":="

    const-string v1, "!#"

    .line 34
    invoke-direct {p0, v0, v1}, Lorg/ini4j/spi/AbstractParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static newInstance()Lorg/ini4j/spi/OptionsParser;
    .locals 1

    .line 39
    const-class v0, Lorg/ini4j/spi/OptionsParser;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/OptionsParser;

    return-object v0
.end method

.method public static newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsParser;
    .locals 1

    .line 44
    invoke-static {}, Lorg/ini4j/spi/OptionsParser;->newInstance()Lorg/ini4j/spi/OptionsParser;

    move-result-object v0

    .line 46
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/OptionsParser;->setConfig(Lorg/ini4j/Config;)V

    return-object v0
.end method

.method private parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/OptionsHandler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 68
    invoke-interface {p2}, Lorg/ini4j/spi/OptionsHandler;->startOptions()V

    .line 69
    :goto_0
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p1}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v1

    invoke-virtual {p0, v0, p2, v1}, Lorg/ini4j/spi/OptionsParser;->parseOptionLine(Ljava/lang/String;Lorg/ini4j/spi/HandlerBase;I)V

    goto :goto_0

    .line 74
    :cond_0
    invoke-interface {p2}, Lorg/ini4j/spi/OptionsHandler;->endOptions()V

    return-void
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;Lorg/ini4j/spi/OptionsHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->newIniSource(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/OptionsHandler;)V

    return-void
.end method

.method public parse(Ljava/io/Reader;Lorg/ini4j/spi/OptionsHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->newIniSource(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/OptionsHandler;)V

    return-void
.end method

.method public parse(Ljava/net/URL;Lorg/ini4j/spi/OptionsHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 63
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->newIniSource(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;)Lorg/ini4j/spi/IniSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/OptionsParser;->parse(Lorg/ini4j/spi/IniSource;Lorg/ini4j/spi/OptionsHandler;)V

    return-void
.end method
