.class public Lorg/ini4j/ConfigParser;
.super Ljava/lang/Object;
.source "ConfigParser.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/ConfigParser$PyIni;,
        Lorg/ini4j/ConfigParser$ParsingException;,
        Lorg/ini4j/ConfigParser$NoSectionException;,
        Lorg/ini4j/ConfigParser$NoOptionException;,
        Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;,
        Lorg/ini4j/ConfigParser$InterpolationException;,
        Lorg/ini4j/ConfigParser$DuplicateSectionException;,
        Lorg/ini4j/ConfigParser$ConfigParserException;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7e8cb0292202bd41L


# instance fields
.field private _ini:Lorg/ini4j/ConfigParser$PyIni;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-direct {p0, v0}, Lorg/ini4j/ConfigParser;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Lorg/ini4j/ConfigParser$PyIni;

    invoke-direct {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    return-void
.end method

.method private requireOption(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;
        }
    .end annotation

    .line 313
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser;->requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    .line 314
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    return-object p1

    .line 318
    :cond_0
    new-instance p1, Lorg/ini4j/ConfigParser$NoOptionException;

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lorg/ini4j/ConfigParser$NoOptionException;-><init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V

    throw p1
.end method

.method private requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;
        }
    .end annotation

    .line 326
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    return-object v0

    .line 330
    :cond_0
    new-instance v0, Lorg/ini4j/ConfigParser$NoSectionException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$NoSectionException;-><init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method


# virtual methods
.method public addSection(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$DuplicateSectionException;
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "DEFAULT"

    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    return-void

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_1
    new-instance v0, Lorg/ini4j/ConfigParser$DuplicateSectionException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$DuplicateSectionException;-><init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method

.method public defaults()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0}, Lorg/ini4j/ConfigParser$PyIni;->getDefaults()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 121
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 127
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 133
    invoke-direct {p0, p1, p2}, Lorg/ini4j/ConfigParser;->requireOption(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez p3, :cond_0

    if-eqz v0, :cond_0

    const/16 p3, 0x25

    .line 135
    invoke-virtual {v0, p3}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    if-ltz p3, :cond_0

    .line 137
    iget-object p3, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {p3, p1, p2, p4}, Lorg/ini4j/ConfigParser$PyIni;->fetch(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getBoolean(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 60
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "1"

    .line 62
    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "yes"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "true"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    const-string p2, "on"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_1

    :cond_0
    const-string p2, "0"

    .line 66
    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "no"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "false"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "off"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    .line 73
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    :goto_0
    const/4 p1, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 p1, 0x1

    :goto_2
    return p1
.end method

.method public getDouble(Ljava/lang/String;Ljava/lang/String;)D
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 81
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p1

    return-wide p1
.end method

.method public getFloat(Ljava/lang/String;Ljava/lang/String;)F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 86
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    return p1
.end method

.method protected getIni()Lorg/ini4j/Ini;
    .locals 1

    .line 308
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    return-object v0
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 91
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/String;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$NoOptionException;,
            Lorg/ini4j/ConfigParser$InterpolationException;
        }
    .end annotation

    .line 96
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/ConfigParser;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    return-wide p1
.end method

.method public hasOption(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 145
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    if-eqz p1, :cond_0

    .line 147
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hasSection(Ljava/lang/String;)Z
    .locals 1

    .line 152
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public items(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;
        }
    .end annotation

    .line 158
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/ini4j/ConfigParser;->items(Ljava/lang/String;ZLjava/util/Map;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public items(Ljava/lang/String;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;
        }
    .end annotation

    .line 165
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-virtual {p0, p1, p2, v0}, Lorg/ini4j/ConfigParser;->items(Ljava/lang/String;ZLjava/util/Map;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public items(Ljava/lang/String;ZLjava/util/Map;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;,
            Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;
        }
    .end annotation

    .line 171
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser;->requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    if-eqz p2, :cond_0

    .line 176
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_1

    .line 180
    :cond_0
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 181
    invoke-interface {p1}, Lorg/ini4j/Profile$Section;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 183
    iget-object v2, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v2, p1, v1, p3}, Lorg/ini4j/ConfigParser$PyIni;->fetch(Lorg/ini4j/Profile$Section;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 187
    :cond_1
    :goto_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1
.end method

.method public options(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;
        }
    .end annotation

    .line 192
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser;->requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    .line 194
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v1, p1}, Lorg/ini4j/ConfigParser$PyIni;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    invoke-interface {p1}, Lorg/ini4j/Profile$Section;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public read(Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/ConfigParser$ParsingException;
        }
    .end annotation

    .line 233
    :try_start_0
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, v1}, Lorg/ini4j/ConfigParser$PyIni;->load(Ljava/io/Reader;)V
    :try_end_0
    .catch Lorg/ini4j/InvalidFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 237
    new-instance v0, Lorg/ini4j/ConfigParser$ParsingException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$ParsingException;-><init>(Ljava/lang/Throwable;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method

.method public read(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/ConfigParser$ParsingException;
        }
    .end annotation

    .line 245
    :try_start_0
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Lorg/ini4j/InvalidFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 249
    new-instance v0, Lorg/ini4j/ConfigParser$ParsingException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$ParsingException;-><init>(Ljava/lang/Throwable;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method

.method public read(Ljava/io/Reader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/ConfigParser$ParsingException;
        }
    .end annotation

    .line 209
    :try_start_0
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->load(Ljava/io/Reader;)V
    :try_end_0
    .catch Lorg/ini4j/InvalidFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 213
    new-instance v0, Lorg/ini4j/ConfigParser$ParsingException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$ParsingException;-><init>(Ljava/lang/Throwable;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method

.method public read(Ljava/net/URL;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/ConfigParser$ParsingException;
        }
    .end annotation

    .line 221
    :try_start_0
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->load(Ljava/net/URL;)V
    :try_end_0
    .catch Lorg/ini4j/InvalidFileFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 225
    new-instance v0, Lorg/ini4j/ConfigParser$ParsingException;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/ini4j/ConfigParser$ParsingException;-><init>(Ljava/lang/Throwable;Lorg/ini4j/ConfigParser$1;)V

    throw v0
.end method

.method public varargs read([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/ConfigParser$ParsingException;
        }
    .end annotation

    .line 199
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 201
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/ini4j/ConfigParser;->read(Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeOption(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;
        }
    .end annotation

    .line 255
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser;->requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    .line 256
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 258
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method public removeSection(Ljava/lang/String;)Z
    .locals 2

    .line 265
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 267
    iget-object v1, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v1, p1}, Lorg/ini4j/ConfigParser$PyIni;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return v0
.end method

.method public sections()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 274
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v1}, Lorg/ini4j/ConfigParser$PyIni;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ini4j/ConfigParser$NoSectionException;
        }
    .end annotation

    .line 279
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser;->requireSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    if-nez p3, :cond_0

    .line 283
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 287
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lorg/ini4j/Profile$Section;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public write(Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, v1}, Lorg/ini4j/ConfigParser$PyIni;->store(Ljava/io/Writer;)V

    return-void
.end method

.method public write(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->store(Ljava/io/OutputStream;)V

    return-void
.end method

.method public write(Ljava/io/Writer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 293
    iget-object v0, p0, Lorg/ini4j/ConfigParser;->_ini:Lorg/ini4j/ConfigParser$PyIni;

    invoke-virtual {v0, p1}, Lorg/ini4j/ConfigParser$PyIni;->store(Ljava/io/Writer;)V

    return-void
.end method
