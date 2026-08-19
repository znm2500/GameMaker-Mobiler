.class Lorg/ini4j/spi/UnicodeInputStreamReader;
.super Ljava/io/Reader;
.source "UnicodeInputStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    }
.end annotation


# static fields
.field private static final BOM_SIZE:I = 0x4


# instance fields
.field private final _defaultEncoding:Ljava/nio/charset/Charset;

.field private _reader:Ljava/io/InputStreamReader;

.field private final _stream:Ljava/io/PushbackInputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    .locals 2

    .line 100
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 101
    new-instance v0, Ljava/io/PushbackInputStream;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    .line 102
    iput-object p2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_defaultEncoding:Ljava/nio/charset/Charset;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    invoke-virtual {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader;->init()V

    .line 108
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    return-void
.end method

.method protected init()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x4

    new-array v1, v0, [B

    .line 134
    iget-object v2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v0}, Ljava/io/PushbackInputStream;->read([BII)I

    move-result v2

    .line 135
    invoke-static {v1}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$000([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object v3

    if-nez v3, :cond_1

    .line 139
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_defaultEncoding:Ljava/nio/charset/Charset;

    move-object v4, v0

    move v0, v2

    goto :goto_0

    .line 144
    :cond_1
    invoke-static {v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$100(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)Ljava/nio/charset/Charset;

    move-result-object v4

    .line 145
    invoke-static {v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$200(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)[B

    move-result-object v3

    array-length v3, v3

    sub-int/2addr v0, v3

    :goto_0
    if-lez v0, :cond_2

    .line 150
    iget-object v3, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    sub-int/2addr v2, v0

    invoke-virtual {v3, v1, v2, v0}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 153
    :cond_2
    new-instance v0, Ljava/io/InputStreamReader;

    iget-object v1, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    invoke-direct {v0, v1, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    return-void
.end method

.method public read([CII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-virtual {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader;->init()V

    .line 115
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStreamReader;->read([CII)I

    move-result p1

    return p1
.end method
