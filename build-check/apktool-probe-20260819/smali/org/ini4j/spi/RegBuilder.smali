.class public Lorg/ini4j/spi/RegBuilder;
.super Lorg/ini4j/spi/AbstractProfileBuilder;
.source "RegBuilder.java"


# instance fields
.field private _reg:Lorg/ini4j/Reg;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;-><init>()V

    return-void
.end method

.method private static newInstance()Lorg/ini4j/spi/RegBuilder;
    .locals 1

    .line 71
    const-class v0, Lorg/ini4j/spi/RegBuilder;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/RegBuilder;

    return-object v0
.end method

.method public static newInstance(Lorg/ini4j/Reg;)Lorg/ini4j/spi/RegBuilder;
    .locals 1

    .line 31
    invoke-static {}, Lorg/ini4j/spi/RegBuilder;->newInstance()Lorg/ini4j/spi/RegBuilder;

    move-result-object v0

    .line 33
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/RegBuilder;->setReg(Lorg/ini4j/Reg;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic endIni()V
    .locals 0

    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->endIni()V

    return-void
.end method

.method public bridge synthetic endSection()V
    .locals 0

    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->endSection()V

    return-void
.end method

.method getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    invoke-virtual {v0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    return-object v0
.end method

.method getProfile()Lorg/ini4j/Profile;
    .locals 1

    .line 66
    iget-object v0, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    return-object v0
.end method

.method public bridge synthetic handleComment(Ljava/lang/String;)V
    .locals 0

    .line 25
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->handleComment(Ljava/lang/String;)V

    return-void
.end method

.method public handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x22

    if-ne v1, v2, :cond_0

    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/ini4j/spi/RegEscapeTool;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    :cond_0
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/ini4j/spi/RegEscapeTool;->decode(Ljava/lang/String;)Lorg/ini4j/spi/TypeValuesPair;

    move-result-object p2

    .line 48
    invoke-virtual {p2}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v1

    sget-object v2, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    if-eq v1, v2, :cond_1

    .line 50
    invoke-virtual {p0}, Lorg/ini4j/spi/RegBuilder;->getCurrentSection()Lorg/ini4j/Profile$Section;

    move-result-object v1

    check-cast v1, Lorg/ini4j/Registry$Key;

    invoke-virtual {p2}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lorg/ini4j/Registry$Key;->putType(Ljava/lang/String;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;

    .line 53
    :cond_1
    invoke-virtual {p2}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object p2

    array-length v1, p2

    :goto_0
    if-ge v0, v1, :cond_2

    aget-object v2, p2, v0

    .line 55
    invoke-super {p0, p1, v2}, Lorg/ini4j/spi/AbstractProfileBuilder;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setReg(Lorg/ini4j/Reg;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    return-void
.end method

.method public bridge synthetic startIni()V
    .locals 0

    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->startIni()V

    return-void
.end method

.method public bridge synthetic startSection(Ljava/lang/String;)V
    .locals 0

    .line 25
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->startSection(Ljava/lang/String;)V

    return-void
.end method
