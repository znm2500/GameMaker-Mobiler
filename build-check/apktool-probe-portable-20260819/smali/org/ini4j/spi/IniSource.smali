.class Lorg/ini4j/spi/IniSource;
.super Ljava/lang/Object;
.source "IniSource.java"


# static fields
.field private static final ESCAPE_CHAR:C = '\\'

.field public static final INCLUDE_BEGIN:C = '<'

.field public static final INCLUDE_END:C = '>'

.field public static final INCLUDE_OPTIONAL:C = '?'


# instance fields
.field private _base:Ljava/net/URL;

.field private _chain:Lorg/ini4j/spi/IniSource;

.field private final _commentChars:Ljava/lang/String;

.field private final _config:Lorg/ini4j/Config;

.field private final _handler:Lorg/ini4j/spi/HandlerBase;

.field private final _reader:Ljava/io/LineNumberReader;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .locals 2

    .line 42
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader;

    invoke-virtual {p4}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/ini4j/spi/UnicodeInputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    return-void
.end method

.method constructor <init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/io/LineNumberReader;

    invoke-direct {v0, p1}, Ljava/io/LineNumberReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    .line 48
    iput-object p2, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    .line 49
    iput-object p3, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method constructor <init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p4}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/ini4j/spi/UnicodeInputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    .line 56
    iput-object p1, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    return-void
.end method

.method private close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v0}, Ljava/io/LineNumberReader;->close()V

    return-void
.end method

.method private countEndingEscapes(Ljava/lang/String;)I
    .locals 4

    .line 105
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    :goto_0
    if-ltz v0, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5c

    if-ne v2, v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method private handleComment(Ljava/lang/StringBuilder;)V
    .locals 2

    .line 115
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 118
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/ini4j/spi/HandlerBase;->handleComment(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 119
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    :cond_0
    return-void
.end method

.method private handleInclude(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v0}, Lorg/ini4j/Config;->isInclude()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_4

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x3c

    if-ne v1, v2, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x3e

    if-ne v1, v3, :cond_4

    .line 129
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x3f

    if-ne v1, v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-eqz v0, :cond_1

    .line 134
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 137
    :cond_1
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    if-nez v1, :cond_2

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    invoke-direct {v1, v2, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    :goto_0
    if-eqz v0, :cond_3

    .line 143
    :try_start_0
    new-instance p1, Lorg/ini4j/spi/IniSource;

    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    iget-object v2, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-direct {p1, v1, v0, v2, v3}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    iput-object p1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 151
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    throw p1

    :catch_0
    :goto_1
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .line 156
    :cond_3
    new-instance p1, Lorg/ini4j/spi/IniSource;

    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    iget-object v2, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-direct {p1, v1, v0, v2, v3}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    iput-object p1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    .line 157
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object p1

    :cond_4
    :goto_2
    return-object p1
.end method

.method private readLineLocal()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->readLineSkipComments()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 170
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->close()V

    goto :goto_0

    .line 174
    :cond_0
    invoke-direct {p0, v0}, Lorg/ini4j/spi/IniSource;->handleInclude(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private readLineSkipComments()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    :goto_0
    iget-object v2, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v2}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 188
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 189
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 191
    invoke-direct {p0, v0}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    goto :goto_0

    .line 193
    :cond_0
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v5, 0x1

    if-ltz v3, :cond_1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 195
    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    iget-object v2, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v2}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 200
    :cond_1
    invoke-direct {p0, v0}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    .line 201
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v3}, Lorg/ini4j/Config;->isEscapeNewline()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-direct {p0, v2}, Lorg/ini4j/spi/IniSource;->countEndingEscapes(Ljava/lang/String;)I

    move-result v3

    and-int/2addr v3, v5

    if-nez v3, :cond_2

    goto :goto_1

    .line 209
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v5

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 203
    :cond_3
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_4
    if-nez v2, :cond_5

    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-eqz v1, :cond_5

    .line 216
    invoke-direct {p0, v0}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    :cond_5
    return-object v2
.end method


# virtual methods
.method getLineNumber()I
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    if-nez v0, :cond_0

    .line 65
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v0}, Ljava/io/LineNumberReader;->getLineNumber()I

    move-result v0

    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {v0}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v0

    :goto_0
    return v0
.end method

.method readLine()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    if-nez v0, :cond_0

    .line 81
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->readLineLocal()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {v0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    .line 89
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    :cond_1
    :goto_0
    return-object v0
.end method
