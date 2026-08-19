.class abstract Lorg/ini4j/spi/AbstractProfileBuilder;
.super Ljava/lang/Object;
.source "AbstractProfileBuilder.java"

# interfaces
.implements Lorg/ini4j/spi/IniHandler;


# instance fields
.field private _currentSection:Lorg/ini4j/Profile$Section;

.field private _header:Z

.field private _lastComment:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private putComment(Lorg/ini4j/CommentedMap;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/ini4j/CommentedMap<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 131
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    invoke-interface {p1, p2, v0}, Lorg/ini4j/CommentedMap;->putComment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private setHeaderComment()V
    .locals 2

    .line 123
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isComment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getProfile()Lorg/ini4j/Profile;

    move-result-object v0

    iget-object v1, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/ini4j/Profile;->setComment(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public endIni()V
    .locals 1

    .line 33
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    if-eqz v0, :cond_0

    .line 35
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->setHeaderComment()V

    :cond_0
    return-void
.end method

.method public endSection()V
    .locals 1

    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    return-void
.end method

.method abstract getConfig()Lorg/ini4j/Config;
.end method

.method getCurrentSection()Lorg/ini4j/Profile$Section;
    .locals 1

    .line 118
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    return-object v0
.end method

.method abstract getProfile()Lorg/ini4j/Profile;
.end method

.method public handleComment(Ljava/lang/String;)V
    .locals 1

    .line 46
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    .line 49
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->setHeaderComment()V

    .line 52
    :cond_0
    iput-object p1, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    return-void
.end method

.method public handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    .line 58
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isMultiOption()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    invoke-interface {v0, p1, p2}, Lorg/ini4j/Profile$Section;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    invoke-interface {v0, p1, p2}, Lorg/ini4j/Profile$Section;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    :goto_0
    iget-object p2, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 69
    iget-object p2, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    invoke-direct {p0, p2, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->putComment(Lorg/ini4j/CommentedMap;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 70
    iput-object p1, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method public startIni()V
    .locals 1

    .line 76
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isHeaderComment()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    :cond_0
    return-void
.end method

.method public startSection(Ljava/lang/String;)V
    .locals 1

    .line 84
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isMultiSection()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getProfile()Lorg/ini4j/Profile;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getProfile()Lorg/ini4j/Profile;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Profile$Section;

    if-nez v0, :cond_1

    .line 92
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getProfile()Lorg/ini4j/Profile;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    :cond_1
    iput-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_currentSection:Lorg/ini4j/Profile$Section;

    .line 95
    :goto_0
    iget-object v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 97
    iget-boolean v0, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    if-eqz v0, :cond_2

    .line 99
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->setHeaderComment()V

    goto :goto_1

    .line 103
    :cond_2
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->getProfile()Lorg/ini4j/Profile;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->putComment(Lorg/ini4j/CommentedMap;Ljava/lang/String;)V

    :goto_1
    const/4 p1, 0x0

    .line 106
    iput-object p1, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_lastComment:Ljava/lang/String;

    :cond_3
    const/4 p1, 0x0

    .line 109
    iput-boolean p1, p0, Lorg/ini4j/spi/AbstractProfileBuilder;->_header:Z

    return-void
.end method
