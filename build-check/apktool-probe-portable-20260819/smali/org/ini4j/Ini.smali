.class public Lorg/ini4j/Ini;
.super Lorg/ini4j/BasicProfile;
.source "Ini.java"

# interfaces
.implements Lorg/ini4j/Persistable;
.implements Lorg/ini4j/Configurable;


# static fields
.field private static final serialVersionUID:J = -0x53ad0a18e273e2e9L


# instance fields
.field private _config:Lorg/ini4j/Config;

.field private _file:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lorg/ini4j/BasicProfile;-><init>()V

    .line 44
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/Ini;->_config:Lorg/ini4j/Config;

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

    .line 67
    invoke-direct {p0}, Lorg/ini4j/Ini;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/ini4j/Ini;->_file:Ljava/io/File;

    .line 69
    invoke-virtual {p0}, Lorg/ini4j/Ini;->load()V

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

    .line 55
    invoke-direct {p0}, Lorg/ini4j/Ini;-><init>()V

    .line 56
    invoke-virtual {p0, p1}, Lorg/ini4j/Ini;->load(Ljava/io/InputStream;)V

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

    .line 49
    invoke-direct {p0}, Lorg/ini4j/Ini;-><init>()V

    .line 50
    invoke-virtual {p0, p1}, Lorg/ini4j/Ini;->load(Ljava/io/Reader;)V

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

    .line 61
    invoke-direct {p0}, Lorg/ini4j/Ini;-><init>()V

    .line 62
    invoke-virtual {p0, p1}, Lorg/ini4j/Ini;->load(Ljava/net/URL;)V

    return-void
.end method


# virtual methods
.method public getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 74
    iget-object v0, p0, Lorg/ini4j/Ini;->_config:Lorg/ini4j/Config;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .line 84
    iget-object v0, p0, Lorg/ini4j/Ini;->_file:Ljava/io/File;

    return-object v0
.end method

.method getPathSeparator()C
    .locals 1

    .line 178
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getPathSeparator()C

    move-result v0

    return v0
.end method

.method isPropertyFirstUpper()Z
    .locals 1

    .line 183
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isPropertyFirstUpper()Z

    move-result v0

    return v0
.end method

.method isTreeMode()Z
    .locals 1

    .line 173
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isTree()Z

    move-result v0

    return v0
.end method

.method public load()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lorg/ini4j/Ini;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0, v0}, Lorg/ini4j/Ini;->load(Ljava/io/File;)V

    return-void

    .line 96
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0}, Ljava/io/FileNotFoundException;-><init>()V

    throw v0
.end method

.method public load(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 114
    invoke-virtual {p1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Ini;->load(Ljava/net/URL;)V

    return-void
.end method

.method public load(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 104
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Ini;->load(Ljava/io/Reader;)V

    return-void
.end method

.method public load(Ljava/io/Reader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 109
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {v0}, Lorg/ini4j/spi/IniParser;->newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/IniParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/Ini;->newBuilder()Lorg/ini4j/spi/IniHandler;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/IniParser;->parse(Ljava/io/Reader;Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method public load(Ljava/net/URL;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 119
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {v0}, Lorg/ini4j/spi/IniParser;->newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/IniParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/Ini;->newBuilder()Lorg/ini4j/spi/IniHandler;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/IniParser;->parse(Ljava/net/URL;Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method protected newBuilder()Lorg/ini4j/spi/IniHandler;
    .locals 1

    .line 152
    invoke-static {p0}, Lorg/ini4j/spi/IniBuilder;->newInstance(Lorg/ini4j/Ini;)Lorg/ini4j/spi/IniBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setConfig(Lorg/ini4j/Config;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lorg/ini4j/Ini;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lorg/ini4j/Ini;->_file:Ljava/io/File;

    return-void
.end method

.method public store()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lorg/ini4j/Ini;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p0, v0}, Lorg/ini4j/Ini;->store(Ljava/io/File;)V

    return-void

    .line 126
    :cond_0
    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-direct {v0}, Ljava/io/FileNotFoundException;-><init>()V

    throw v0
.end method

.method public store(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 146
    invoke-virtual {p0, v0}, Lorg/ini4j/Ini;->store(Ljava/io/OutputStream;)V

    .line 147
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public store(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Ini;->store(Ljava/io/Writer;)V

    return-void
.end method

.method public store(Ljava/io/Writer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/ini4j/spi/IniFormatter;->newInstance(Ljava/io/Writer;Lorg/ini4j/Config;)Lorg/ini4j/spi/IniFormatter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Ini;->store(Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method protected store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;)V
    .locals 1

    .line 157
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEmptySection()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Lorg/ini4j/Profile$Section;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 159
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;)V

    :cond_1
    return-void
.end method

.method protected store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;Ljava/lang/String;I)V
    .locals 1

    .line 165
    invoke-virtual {p0}, Lorg/ini4j/Ini;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isMultiOption()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p2, p3}, Lorg/ini4j/Profile$Section;->length(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p4, v0, :cond_1

    .line 167
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lorg/ini4j/BasicProfile;->store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;Ljava/lang/String;I)V

    :cond_1
    return-void
.end method
