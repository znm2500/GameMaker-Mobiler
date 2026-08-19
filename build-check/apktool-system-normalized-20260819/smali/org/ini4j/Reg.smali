.class public Lorg/ini4j/Reg;
.super Lorg/ini4j/BasicRegistry;
.source "Reg.java"

# interfaces
.implements Lorg/ini4j/Registry;
.implements Lorg/ini4j/Persistable;
.implements Lorg/ini4j/Configurable;


# static fields
.field private static final CR:C = '\r'

.field protected static final DEFAULT_SUFFIX:Ljava/lang/String; = ".reg"

.field private static final LF:C = '\n'

.field private static final PROP_OS_NAME:Ljava/lang/String; = "os.name"

.field private static final STDERR_BUFF_SIZE:I = 0x2000

.field protected static final TMP_PREFIX:Ljava/lang/String; = "reg-"

.field private static final WINDOWS:Z

.field private static final serialVersionUID:J = -0x149debf20c4afdb8L


# instance fields
.field private _config:Lorg/ini4j/Config;

.field private _file:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "os.name"

    const-string v1, "Unknown"

    .line 44
    invoke-static {v0, v1}, Lorg/ini4j/Config;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/ini4j/Reg;->WINDOWS:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 51
    invoke-direct {p0}, Lorg/ini4j/BasicRegistry;-><init>()V

    .line 52
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->clone()Lorg/ini4j/Config;

    move-result-object v0

    const/4 v1, 0x0

    .line 54
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEscape(Z)V

    .line 55
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setGlobalSection(Z)V

    const/4 v1, 0x1

    .line 56
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEmptyOption(Z)V

    .line 57
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setMultiOption(Z)V

    .line 58
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setStrictOperator(Z)V

    .line 59
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setEmptySection(Z)V

    const/16 v1, 0x5c

    .line 60
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setPathSeparator(C)V

    .line 61
    sget-object v1, Lorg/ini4j/Reg;->FILE_ENCODING:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setFileEncoding(Ljava/nio/charset/Charset;)V

    const-string v1, "\r\n"

    .line 62
    invoke-virtual {v0, v1}, Lorg/ini4j/Config;->setLineSeparator(Ljava/lang/String;)V

    .line 63
    iput-object v0, p0, Lorg/ini4j/Reg;->_config:Lorg/ini4j/Config;

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

    .line 74
    invoke-direct {p0}, Lorg/ini4j/Reg;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/ini4j/Reg;->_file:Ljava/io/File;

    .line 76
    invoke-virtual {p0}, Lorg/ini4j/Reg;->load()V

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

    .line 87
    invoke-direct {p0}, Lorg/ini4j/Reg;-><init>()V

    .line 88
    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->load(Ljava/io/InputStream;)V

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

    .line 93
    invoke-direct {p0}, Lorg/ini4j/Reg;-><init>()V

    .line 94
    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->load(Ljava/io/Reader;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    invoke-direct {p0}, Lorg/ini4j/Reg;-><init>()V

    .line 69
    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->read(Ljava/lang/String;)V

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

    .line 81
    invoke-direct {p0}, Lorg/ini4j/Reg;-><init>()V

    .line 82
    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->load(Ljava/net/URL;)V

    return-void
.end method

.method private createTempFile()Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "reg-"

    const-string v1, ".reg"

    .line 288
    invoke-static {v0, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 290
    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    return-object v0
.end method

.method public static isWindows()Z
    .locals 1

    .line 99
    sget-boolean v0, Lorg/ini4j/Reg;->WINDOWS:Z

    return v0
.end method

.method private regExport(Ljava/lang/String;Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 297
    invoke-direct {p0}, Lorg/ini4j/Reg;->requireWindows()V

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "cmd"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/c"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "reg"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "export"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    aput-object p1, v0, v1

    .line 298
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x5

    aput-object p1, v0, p2

    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->exec([Ljava/lang/String;)V

    return-void
.end method

.method private regImport(Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    invoke-direct {p0}, Lorg/ini4j/Reg;->requireWindows()V

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "cmd"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/c"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "reg"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "import"

    aput-object v2, v0, v1

    .line 304
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x4

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->exec([Ljava/lang/String;)V

    return-void
.end method

.method private requireWindows()V
    .locals 2

    .line 309
    sget-boolean v0, Lorg/ini4j/Reg;->WINDOWS:Z

    if-eqz v0, :cond_0

    return-void

    .line 311
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unsupported operating system or runtime environment"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method exec([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 264
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p1

    .line 268
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Process;->waitFor()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 272
    :cond_0
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 p1, 0x2000

    new-array p1, p1, [C

    .line 274
    invoke-virtual {v0, p1}, Ljava/io/Reader;->read([C)I

    move-result v1

    .line 276
    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 277
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3, v1}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 282
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    invoke-virtual {v0, p1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object p1

    check-cast p1, Ljava/io/IOException;

    check-cast p1, Ljava/io/IOException;

    throw p1
.end method

.method public getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/ini4j/Reg;->_config:Lorg/ini4j/Config;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .line 114
    iget-object v0, p0, Lorg/ini4j/Reg;->_file:Ljava/io/File;

    return-object v0
.end method

.method getPathSeparator()C
    .locals 1

    .line 254
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getPathSeparator()C

    move-result v0

    return v0
.end method

.method isPropertyFirstUpper()Z
    .locals 1

    .line 259
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isPropertyFirstUpper()Z

    move-result v0

    return v0
.end method

.method isTreeMode()Z
    .locals 1

    .line 249
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

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

    .line 124
    iget-object v0, p0, Lorg/ini4j/Reg;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->load(Ljava/io/File;)V

    return-void

    .line 126
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

    .line 178
    invoke-virtual {p1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->load(Ljava/net/URL;)V

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

    .line 134
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->load(Ljava/io/Reader;)V

    return-void
.end method

.method public load(Ljava/io/Reader;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    const/4 v2, 0x2

    :goto_0
    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    const/16 v3, 0xa

    if-ne v1, v3, :cond_0

    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_1

    goto :goto_1

    :cond_0
    const/16 v3, 0xd

    if-eq v1, v3, :cond_1

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    int-to-char v1, v1

    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 147
    :cond_1
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v1

    goto :goto_0

    .line 163
    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-eqz v1, :cond_4

    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/ini4j/Reg;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 173
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {v0}, Lorg/ini4j/spi/IniParser;->newInstance(Lorg/ini4j/Config;)Lorg/ini4j/spi/IniParser;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/Reg;->newBuilder()Lorg/ini4j/spi/IniHandler;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/IniParser;->parse(Ljava/io/Reader;Lorg/ini4j/spi/IniHandler;)V

    return-void

    .line 170
    :cond_3
    new-instance p1, Lorg/ini4j/InvalidFileFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/ini4j/InvalidFileFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 165
    :cond_4
    new-instance p1, Lorg/ini4j/InvalidFileFormatException;

    const-string v0, "Missing version header"

    invoke-direct {p1, v0}, Lorg/ini4j/InvalidFileFormatException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public load(Ljava/net/URL;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    .line 139
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->load(Ljava/io/Reader;)V

    return-void
.end method

.method protected newBuilder()Lorg/ini4j/spi/IniHandler;
    .locals 1

    .line 244
    invoke-static {p0}, Lorg/ini4j/spi/RegBuilder;->newInstance(Lorg/ini4j/Reg;)Lorg/ini4j/spi/RegBuilder;

    move-result-object v0

    return-object v0
.end method

.method public read(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    invoke-direct {p0}, Lorg/ini4j/Reg;->createTempFile()Ljava/io/File;

    move-result-object v0

    .line 187
    :try_start_0
    invoke-direct {p0, p1, v0}, Lorg/ini4j/Reg;->regExport(Ljava/lang/String;Ljava/io/File;)V

    .line 188
    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->load(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw p1
.end method

.method public setConfig(Lorg/ini4j/Config;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lorg/ini4j/Reg;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lorg/ini4j/Reg;->_file:Ljava/io/File;

    return-void
.end method

.method public store()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    iget-object v0, p0, Lorg/ini4j/Reg;->_file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->store(Ljava/io/File;)V

    return-void

    .line 200
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

    .line 221
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 223
    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->store(Ljava/io/OutputStream;)V

    .line 224
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

    .line 208
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v1

    invoke-virtual {v1}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->store(Ljava/io/Writer;)V

    return-void
.end method

.method public store(Ljava/io/Writer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 213
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 214
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/ini4j/spi/IniFormatter;->newInstance(Ljava/io/Writer;Lorg/ini4j/Config;)Lorg/ini4j/spi/IniFormatter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/ini4j/Reg;->store(Lorg/ini4j/spi/IniHandler;)V

    return-void
.end method

.method public write()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    invoke-direct {p0}, Lorg/ini4j/Reg;->createTempFile()Ljava/io/File;

    move-result-object v0

    .line 233
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/ini4j/Reg;->store(Ljava/io/File;)V

    .line 234
    invoke-direct {p0, v0}, Lorg/ini4j/Reg;->regImport(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    throw v1
.end method
