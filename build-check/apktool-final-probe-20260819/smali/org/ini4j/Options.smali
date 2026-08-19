.class public Lorg/ini4j/Options;
.super Lorg/ini4j/BasicOptionMap;
.source "Options.java"

# interfaces
.implements Lorg/ini4j/Persistable;
.implements Lorg/ini4j/Configurable;


# static fields
.field private static final serialVersionUID:J = -0xf8a29d34cd9fafeL


# instance fields
.field private _comment:Ljava/lang/String;

.field private _config:Lorg/ini4j/Config;

.field private _file:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Lorg/ini4j/BasicOptionMap;-><init>()V

    .line 45
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->clone()Lorg/ini4j/Config;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/Options;->_config:Lorg/ini4j/Config;

    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEmptyOption(Z)V

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

    .line 69
    invoke-direct {p0}, Lorg/ini4j/Options;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/ini4j/Options;->_file:Ljava/io/File;

    .line 71
    invoke-virtual {p0}, Lorg/ini4j/Options;->load()V

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

    .line 57
    invoke-direct {p0}, Lorg/ini4j/Options;-><init>()V

    .line 58
    invoke-virtual {p0, p1}, Lorg/ini4j/Options;->load(Ljava/io/InputStream;)V

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

    .line 51
    invoke-direct {p0}, Lorg/ini4j/Options;-><init>()V

    .line 52
    invoke-virtual {p0, p1}, Lorg/ini4j/Options;->load(Ljava/io/Reader;)V

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

    .line 63
    invoke-direct {p0}, Lorg/ini4j/Options;-><init>()V

    .line 64
    invoke-virtual {p0, p1}, Lorg/ini4j/Options;->load(Ljava/net/URL;)V

    return-void
.end method

.method private storeComment(Lorg/ini4j/spi/OptionsHandler;Ljava/lang/String;)V
    .locals 0

    .line 194
    invoke-interface {p1, p2}, Lorg/ini4j/spi/OptionsHandler;->handleComment(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/ini4j/Options;->_comment:Ljava/lang/String;

    return-object v0
.end method

.method public getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 86
    iget-object v0, p0, Lorg/ini4j/Options;->_config:Lorg/ini4j/Config;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/ini4j/Options;->_file:Ljava/io/File;

    return-object v0
.end method

.method isPropertyFirstUpper()Z
    .locals 1

    .line 189
    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isPropertyFirstUpper()Z

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

    .line 106
    iget-object v0, p0, Lorg/ini4j/Options;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {p0, v0}, Lorg/ini4j/Options;->load(Ljava/io/File;)V

    return-void

    .line 108
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

    .line 131
    invoke-virtual {p1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Options;->load(Ljava/net/URL;)V

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

    .line 116
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Options;->load(Ljava/io/Reader;)V

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

    .line 121
    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {v0}, Lorg/ini4j/spi/OptionsParser;->newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/Options;->newBuilder()Lorg/ini4j/spi/OptionsHandler;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/OptionsParser;->parse(Ljava/io/Reader;Lorg/ini4j/spi/OptionsHandler;)V

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

    .line 126
    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {v0}, Lorg/ini4j/spi/OptionsParser;->newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/Options;->newBuilder()Lorg/ini4j/spi/OptionsHandler;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/OptionsParser;->parse(Ljava/net/URL;Lorg/ini4j/spi/OptionsHandler;)V

    return-void
.end method

.method protected newBuilder()Lorg/ini4j/spi/OptionsHandler;
    .locals 1

    .line 164
    invoke-static {p0}, Lorg/ini4j/spi/OptionsBuilder;->newInstance(Lorg/ini4j/Options;)Lorg/ini4j/spi/OptionsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lorg/ini4j/Options;->_comment:Ljava/lang/String;

    return-void
.end method

.method public setConfig(Lorg/ini4j/Config;)V
    .locals 0

    .line 91
    iput-object p1, p0, Lorg/ini4j/Options;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lorg/ini4j/Options;->_file:Ljava/io/File;

    return-void
.end method

.method public store()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    iget-object v0, p0, Lorg/ini4j/Options;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0, v0}, Lorg/ini4j/Options;->store(Ljava/io/File;)V

    return-void

    .line 138
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

    .line 156
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 158
    invoke-virtual {p0, v0}, Lorg/ini4j/Options;->store(Ljava/io/OutputStream;)V

    .line 159
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

    .line 146
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Options;->store(Ljava/io/Writer;)V

    return-void
.end method

.method public store(Ljava/io/Writer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/ini4j/spi/OptionsFormatter;->newInstance(Ljava/io/Writer;Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsFormatter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Options;->store(Lorg/ini4j/spi/OptionsHandler;)V

    return-void
.end method

.method protected store(Lorg/ini4j/spi/OptionsHandler;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    invoke-interface {p1}, Lorg/ini4j/spi/OptionsHandler;->startOptions()V

    .line 170
    iget-object v0, p0, Lorg/ini4j/Options;->_comment:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lorg/ini4j/Options;->storeComment(Lorg/ini4j/spi/OptionsHandler;Ljava/lang/String;)V

    .line 171
    invoke-virtual {p0}, Lorg/ini4j/Options;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 173
    invoke-virtual {p0, v1}, Lorg/ini4j/Options;->getComment(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lorg/ini4j/Options;->storeComment(Lorg/ini4j/spi/OptionsHandler;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v2

    invoke-virtual {v2}, Lorg/ini4j/Config;->isMultiOption()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v1}, Lorg/ini4j/Options;->length(Ljava/lang/Object;)I

    move-result v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    :goto_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_0

    .line 178
    invoke-virtual {p0, v1, v3}, Lorg/ini4j/Options;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 180
    invoke-interface {p1, v1, v4}, Lorg/ini4j/spi/OptionsHandler;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 184
    :cond_2
    invoke-interface {p1}, Lorg/ini4j/spi/OptionsHandler;->endOptions()V

    return-void
.end method
