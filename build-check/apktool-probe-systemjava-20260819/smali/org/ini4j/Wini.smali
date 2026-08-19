.class public Lorg/ini4j/Wini;
.super Lorg/ini4j/Ini;
.source "Wini.java"


# static fields
.field public static final PATH_SEPARATOR:C = '\\'

.field private static final serialVersionUID:J = -0x269970650f860398L


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 33
    invoke-direct {p0}, Lorg/ini4j/Ini;-><init>()V

    .line 34
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->clone()Lorg/ini4j/Config;

    move-result-object v0

    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEscape(Z)V

    .line 37
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEscapeNewline(Z)V

    const/4 v2, 0x1

    .line 38
    invoke-virtual {v0, v2}, Lorg/ini4j/Config;->setGlobalSection(Z)V

    .line 39
    invoke-virtual {v0, v2}, Lorg/ini4j/Config;->setEmptyOption(Z)V

    .line 40
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setMultiOption(Z)V

    const/16 v1, 0x5c

    .line 41
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setPathSeparator(C)V

    .line 42
    invoke-virtual {p0, v0}, Lorg/ini4j/Wini;->setConfig(Lorg/ini4j/Config;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 47
    invoke-direct {p0}, Lorg/ini4j/Wini;-><init>()V

    .line 48
    invoke-virtual {p0, p1}, Lorg/ini4j/Wini;->setFile(Ljava/io/File;)V

    .line 49
    invoke-virtual {p0}, Lorg/ini4j/Wini;->load()V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Lorg/ini4j/Wini;-><init>()V

    .line 61
    invoke-virtual {p0, p1}, Lorg/ini4j/Wini;->load(Ljava/io/InputStream;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Lorg/ini4j/Wini;-><init>()V

    .line 67
    invoke-virtual {p0, p1}, Lorg/ini4j/Wini;->load(Ljava/io/Reader;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Lorg/ini4j/Wini;-><init>()V

    .line 55
    invoke-virtual {p0, p1}, Lorg/ini4j/Wini;->load(Ljava/net/URL;)V

    return-void
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 72
    invoke-static {}, Lorg/ini4j/spi/WinEscapeTool;->getInstance()Lorg/ini4j/spi/WinEscapeTool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/ini4j/spi/WinEscapeTool;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public unescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 77
    invoke-static {}, Lorg/ini4j/spi/WinEscapeTool;->getInstance()Lorg/ini4j/spi/WinEscapeTool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/ini4j/spi/WinEscapeTool;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
