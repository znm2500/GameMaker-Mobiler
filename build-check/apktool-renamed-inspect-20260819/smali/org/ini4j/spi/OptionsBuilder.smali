.class public Lorg/ini4j/spi/OptionsBuilder;
.super Ljava/lang/Object;
.source "OptionsBuilder.java"

# interfaces
.implements Lorg/ini4j/spi/OptionsHandler;


# instance fields
.field private _header:Z

.field private _lastComment:Ljava/lang/String;

.field private _options:Lorg/ini4j/Options;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    invoke-virtual {v0}, Lorg/ini4j/Options;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    return-object v0
.end method

.method protected static newInstance()Lorg/ini4j/spi/OptionsBuilder;
    .locals 1

    .line 100
    const-class v0, Lorg/ini4j/spi/OptionsBuilder;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/OptionsBuilder;

    return-object v0
.end method

.method public static newInstance(Lorg/ini4j/Options;)Lorg/ini4j/spi/OptionsBuilder;
    .locals 1

    .line 29
    invoke-static {}, Lorg/ini4j/spi/OptionsBuilder;->newInstance()Lorg/ini4j/spi/OptionsBuilder;

    move-result-object v0

    .line 31
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/OptionsBuilder;->setOptions(Lorg/ini4j/Options;)V

    return-object v0
.end method

.method private putComment(Ljava/lang/String;)V
    .locals 2

    .line 118
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    iget-object v1, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/Options;->putComment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private setHeaderComment()V
    .locals 2

    .line 110
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    iget-object v1, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/ini4j/Options;->setComment(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public endOptions()V
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    if-eqz v0, :cond_0

    .line 47
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->setHeaderComment()V

    :cond_0
    return-void
.end method

.method public handleComment(Ljava/lang/String;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    if-eqz v0, :cond_0

    .line 55
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->setHeaderComment()V

    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    .line 59
    :cond_0
    iput-object p1, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    return-void
.end method

.method public handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 64
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isMultiOption()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/Options;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 70
    :cond_0
    iget-object v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/Options;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :goto_0
    iget-object p2, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 75
    iget-boolean p2, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    if-eqz p2, :cond_1

    .line 77
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->setHeaderComment()V

    goto :goto_1

    .line 81
    :cond_1
    invoke-direct {p0, p1}, Lorg/ini4j/spi/OptionsBuilder;->putComment(Ljava/lang/String;)V

    :goto_1
    const/4 p1, 0x0

    .line 84
    iput-object p1, p0, Lorg/ini4j/spi/OptionsBuilder;->_lastComment:Ljava/lang/String;

    :cond_2
    const/4 p1, 0x0

    .line 87
    iput-boolean p1, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    return-void
.end method

.method public setOptions(Lorg/ini4j/Options;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lorg/ini4j/spi/OptionsBuilder;->_options:Lorg/ini4j/Options;

    return-void
.end method

.method public startOptions()V
    .locals 1

    .line 92
    invoke-direct {p0}, Lorg/ini4j/spi/OptionsBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isHeaderComment()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lorg/ini4j/spi/OptionsBuilder;->_header:Z

    :cond_0
    return-void
.end method
