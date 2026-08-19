.class public Lorg/ini4j/spi/OptionsFormatter;
.super Lorg/ini4j/spi/AbstractFormatter;
.source "OptionsFormatter.java"

# interfaces
.implements Lorg/ini4j/spi/OptionsHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractFormatter;-><init>()V

    return-void
.end method

.method private static newInstance()Lorg/ini4j/spi/OptionsFormatter;
    .locals 1

    .line 47
    const-class v0, Lorg/ini4j/spi/OptionsFormatter;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/OptionsFormatter;

    return-object v0
.end method

.method public static newInstance(Ljava/io/Writer;Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsFormatter;
    .locals 2

    .line 27
    invoke-static {}, Lorg/ini4j/spi/OptionsFormatter;->newInstance()Lorg/ini4j/spi/OptionsFormatter;

    move-result-object v0

    .line 29
    instance-of v1, p0, Ljava/io/PrintWriter;

    if-eqz v1, :cond_0

    check-cast p0, Ljava/io/PrintWriter;

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, p0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object p0, v1

    :goto_0
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/OptionsFormatter;->setOutput(Ljava/io/PrintWriter;)V

    .line 30
    invoke-virtual {v0, p1}, Lorg/ini4j/spi/OptionsFormatter;->setConfig(Lorg/ini4j/Config;)V

    return-object v0
.end method


# virtual methods
.method public endOptions()V
    .locals 1

    .line 37
    invoke-virtual {p0}, Lorg/ini4j/spi/OptionsFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    return-void
.end method

.method public bridge synthetic handleComment(Ljava/lang/String;)V
    .locals 0

    .line 23
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractFormatter;->handleComment(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 23
    invoke-super {p0, p1, p2}, Lorg/ini4j/spi/AbstractFormatter;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public startOptions()V
    .locals 0

    return-void
.end method
