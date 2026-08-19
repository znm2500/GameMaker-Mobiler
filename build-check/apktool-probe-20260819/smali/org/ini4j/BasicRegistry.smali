.class public Lorg/ini4j/BasicRegistry;
.super Lorg/ini4j/BasicProfile;
.source "BasicRegistry.java"

# interfaces
.implements Lorg/ini4j/Registry;


# static fields
.field private static final serialVersionUID:J = -0x5945fd7718047e62L


# instance fields
.field private _version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lorg/ini4j/BasicProfile;-><init>()V

    const-string v0, "Windows Registry Editor Version 5.00"

    .line 31
    iput-object v0, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->add(Ljava/lang/String;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public add(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 46
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->get(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic get(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->get(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 51
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public get(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 56
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    return-object v0
.end method

.method bridge synthetic newSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->newSection(Ljava/lang/String;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method newSection(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
    .locals 1

    .line 86
    new-instance v0, Lorg/ini4j/BasicRegistryKey;

    invoke-direct {v0, p0, p1}, Lorg/ini4j/BasicRegistryKey;-><init>(Lorg/ini4j/BasicRegistry;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lorg/ini4j/Profile$Section;

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->put(Ljava/lang/String;Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lorg/ini4j/Profile$Section;

    invoke-virtual {p0, p1, p2, p3}, Lorg/ini4j/BasicRegistry;->put(Ljava/lang/String;Lorg/ini4j/Profile$Section;I)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 61
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public put(Ljava/lang/String;Lorg/ini4j/Profile$Section;I)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 66
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/BasicProfile;->put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->remove(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 0

    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->remove(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Profile$Section;
    .locals 0

    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 76
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public remove(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 81
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;
    .locals 0

    .line 71
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Registry$Key;

    return-object p1
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    return-void
.end method

.method store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;Ljava/lang/String;)V
    .locals 6

    .line 91
    invoke-interface {p2, p3}, Lorg/ini4j/Profile$Section;->getComment(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/ini4j/BasicRegistry;->store(Lorg/ini4j/spi/IniHandler;Ljava/lang/String;)V

    .line 92
    move-object v0, p2

    check-cast v0, Lorg/ini4j/Registry$Key;

    sget-object v1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    invoke-interface {v0, p3, v1}, Lorg/ini4j/Registry$Key;->getType(Ljava/lang/Object;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;

    move-result-object v0

    const-string v1, "@"

    .line 93
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, p3

    goto :goto_0

    :cond_0
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v1

    invoke-virtual {v1, p3}, Lorg/ini4j/spi/RegEscapeTool;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 94
    :goto_0
    invoke-interface {p2, p3}, Lorg/ini4j/Profile$Section;->length(Ljava/lang/Object;)I

    move-result v2

    new-array v3, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v2, :cond_1

    .line 98
    invoke-interface {p2, p3, v4}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 101
    :cond_1
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object p2

    new-instance p3, Lorg/ini4j/spi/TypeValuesPair;

    invoke-direct {p3, v0, v3}, Lorg/ini4j/spi/TypeValuesPair;-><init>(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Lorg/ini4j/spi/RegEscapeTool;->encode(Lorg/ini4j/spi/TypeValuesPair;)Ljava/lang/String;

    move-result-object p2

    .line 103
    invoke-interface {p1, v1, p2}, Lorg/ini4j/spi/IniHandler;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
