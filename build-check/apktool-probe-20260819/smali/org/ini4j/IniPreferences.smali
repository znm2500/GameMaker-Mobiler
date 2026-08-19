.class public Lorg/ini4j/IniPreferences;
.super Ljava/util/prefs/AbstractPreferences;
.source "IniPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/IniPreferences$SectionPreferences;
    }
.end annotation


# static fields
.field private static final EMPTY:[Ljava/lang/String;


# instance fields
.field private final _ini:Lorg/ini4j/Ini;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 33
    sput-object v0, Lorg/ini4j/IniPreferences;->EMPTY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const-string v1, ""

    .line 77
    invoke-direct {p0, v0, v1}, Ljava/util/prefs/AbstractPreferences;-><init>(Ljava/util/prefs/AbstractPreferences;Ljava/lang/String;)V

    .line 78
    new-instance v0, Lorg/ini4j/Ini;

    invoke-direct {v0, p1}, Lorg/ini4j/Ini;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const-string v1, ""

    .line 61
    invoke-direct {p0, v0, v1}, Ljava/util/prefs/AbstractPreferences;-><init>(Ljava/util/prefs/AbstractPreferences;Ljava/lang/String;)V

    .line 62
    new-instance v0, Lorg/ini4j/Ini;

    invoke-direct {v0, p1}, Lorg/ini4j/Ini;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/ini4j/InvalidFileFormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const-string v1, ""

    .line 93
    invoke-direct {p0, v0, v1}, Ljava/util/prefs/AbstractPreferences;-><init>(Ljava/util/prefs/AbstractPreferences;Ljava/lang/String;)V

    .line 94
    new-instance v0, Lorg/ini4j/Ini;

    invoke-direct {v0, p1}, Lorg/ini4j/Ini;-><init>(Ljava/net/URL;)V

    iput-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-void
.end method

.method public constructor <init>(Lorg/ini4j/Ini;)V
    .locals 2

    const/4 v0, 0x0

    const-string v1, ""

    .line 45
    invoke-direct {p0, v0, v1}, Ljava/util/prefs/AbstractPreferences;-><init>(Ljava/util/prefs/AbstractPreferences;Ljava/lang/String;)V

    .line 46
    iput-object p1, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .line 29
    sget-object v0, Lorg/ini4j/IniPreferences;->EMPTY:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lorg/ini4j/IniPreferences;)Lorg/ini4j/Ini;
    .locals 0

    .line 29
    iget-object p0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic childSpi(Ljava/lang/String;)Ljava/util/prefs/AbstractPreferences;
    .locals 0

    .line 29
    invoke-virtual {p0, p1}, Lorg/ini4j/IniPreferences;->childSpi(Ljava/lang/String;)Lorg/ini4j/IniPreferences$SectionPreferences;

    move-result-object p1

    return-object p1
.end method

.method protected childSpi(Ljava/lang/String;)Lorg/ini4j/IniPreferences$SectionPreferences;
    .locals 2

    .line 151
    iget-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    invoke-virtual {v0, p1}, Lorg/ini4j/Ini;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Profile$Section;

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 156
    iget-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    invoke-virtual {v0, p1}, Lorg/ini4j/Ini;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    .line 159
    :cond_1
    new-instance p1, Lorg/ini4j/IniPreferences$SectionPreferences;

    invoke-direct {p1, p0, p0, v0, v1}, Lorg/ini4j/IniPreferences$SectionPreferences;-><init>(Lorg/ini4j/IniPreferences;Ljava/util/prefs/AbstractPreferences;Lorg/ini4j/Profile$Section;Z)V

    return-object p1
.end method

.method protected childrenNamesSpi()[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/prefs/BackingStoreException;
        }
    .end annotation

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 132
    iget-object v1, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    invoke-virtual {v1}, Lorg/ini4j/Ini;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 134
    iget-object v3, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    invoke-virtual {v3}, Lorg/ini4j/Ini;->getPathSeparator()C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_0

    .line 136
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 140
    :cond_1
    sget-object v1, Lorg/ini4j/IniPreferences;->EMPTY:[Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method protected flushSpi()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/prefs/BackingStoreException;
        }
    .end annotation

    return-void
.end method

.method protected getIni()Lorg/ini4j/Ini;
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/ini4j/IniPreferences;->_ini:Lorg/ini4j/Ini;

    return-object v0
.end method

.method protected getSpi(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 119
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected keysSpi()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/prefs/BackingStoreException;
        }
    .end annotation

    .line 186
    sget-object v0, Lorg/ini4j/IniPreferences;->EMPTY:[Ljava/lang/String;

    return-object v0
.end method

.method protected putSpi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 201
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected removeNodeSpi()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/prefs/BackingStoreException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 214
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected removeSpi(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 225
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method protected syncSpi()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/prefs/BackingStoreException;
        }
    .end annotation

    return-void
.end method
