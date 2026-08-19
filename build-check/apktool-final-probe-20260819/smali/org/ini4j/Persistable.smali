.class public interface abstract Lorg/ini4j/Persistable;
.super Ljava/lang/Object;
.source "Persistable.java"


# virtual methods
.method public abstract getFile()Ljava/io/File;
.end method

.method public abstract load()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation
.end method

.method public abstract load(Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation
.end method

.method public abstract load(Ljava/io/InputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation
.end method

.method public abstract load(Ljava/io/Reader;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation
.end method

.method public abstract load(Ljava/net/URL;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation
.end method

.method public abstract setFile(Ljava/io/File;)V
.end method

.method public abstract store()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract store(Ljava/io/File;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract store(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract store(Ljava/io/Writer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
