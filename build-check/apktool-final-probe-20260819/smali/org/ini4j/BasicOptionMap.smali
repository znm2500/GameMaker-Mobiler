.class public Lorg/ini4j/BasicOptionMap;
.super Lorg/ini4j/CommonMultiMap;
.source "BasicOptionMap.java"

# interfaces
.implements Lorg/ini4j/OptionMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/BasicOptionMap$Access;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/ini4j/CommonMultiMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;",
        "Lorg/ini4j/OptionMap;"
    }
.end annotation


# static fields
.field private static final ENVIRONMENT_PREFIX:Ljava/lang/String; = "@env/"

.field private static final ENVIRONMENT_PREFIX_LEN:I = 0x5

.field private static final EXPRESSION:Ljava/util/regex/Pattern;

.field private static final G_INDEX:I = 0x4

.field private static final G_OPTION:I = 0x2

.field private static final SUBST_CHAR:C = '$'

.field private static final SYSTEM_PROPERTY_PREFIX:Ljava/lang/String; = "@prop/"

.field private static final SYSTEM_PROPERTY_PREFIX_LEN:I = 0x6

.field private static final serialVersionUID:J = 0x4844cfa9a6a3f40L


# instance fields
.field private _defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

.field private final _propertyFirstUpper:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "(?<!\\\\)\\$\\{(([^\\[\\}]+)(\\[([0-9]+)\\])?)\\}"

    .line 34
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/ini4j/BasicOptionMap;->EXPRESSION:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, v0}, Lorg/ini4j/BasicOptionMap;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lorg/ini4j/CommonMultiMap;-><init>()V

    .line 48
    iput-boolean p1, p0, Lorg/ini4j/BasicOptionMap;->_propertyFirstUpper:Z

    return-void
.end method

.method private requireArray(Ljava/lang/Class;)V
    .locals 1

    .line 280
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 282
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Array required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    if-eqz p2, :cond_1

    .line 69
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p2, Ljava/lang/String;

    :goto_1
    invoke-super {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 1

    if-eqz p2, :cond_1

    .line 74
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p2, Ljava/lang/String;

    :goto_1
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/CommonMultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;I)V

    return-void
.end method

.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 79
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->proxy(Ljava/lang/Class;Lorg/ini4j/spi/BeanAccess;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public as(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 84
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/spi/BeanTool;->proxy(Ljava/lang/Class;Lorg/ini4j/spi/BeanAccess;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public fetch(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 130
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 118
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 123
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 125
    :cond_0
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    :goto_0
    return-object p3
.end method

.method public fetch(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 89
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 91
    invoke-virtual {p0, p1, v0}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public fetch(Ljava/lang/Object;I)Ljava/lang/String;
    .locals 0

    .line 103
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    const/16 p2, 0x24

    .line 105
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(I)I

    move-result p2

    if-ltz p2, :cond_0

    .line 107
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->resolve(Ljava/lang/StringBuilder;)V

    .line 110
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 96
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p2, p1

    :goto_0
    return-object p2
.end method

.method public fetchAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 137
    invoke-direct {p0, p2}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 140
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    .line 141
    :goto_0
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 143
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v2

    invoke-virtual {p0, p1, v1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public from(Ljava/lang/Object;)V
    .locals 2

    .line 151
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/ini4j/spi/BeanTool;->inject(Lorg/ini4j/spi/BeanAccess;Ljava/lang/Object;)V

    return-void
.end method

.method public from(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 156
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object p2

    invoke-virtual {v0, p2, p1}, Lorg/ini4j/spi/BeanTool;->inject(Lorg/ini4j/spi/BeanAccess;Ljava/lang/Object;)V

    return-void
.end method

.method public get(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 180
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1, p3}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 161
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 173
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    goto :goto_0

    .line 175
    :cond_0
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object p3

    invoke-virtual {p3, p1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    :goto_0
    return-object p3
.end method

.method public get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 166
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p2, p1

    :goto_0
    return-object p2
.end method

.method public getAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 55
    invoke-direct {p0, p2}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 58
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    .line 59
    :goto_0
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 61
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v2

    invoke-virtual {p0, p1, v1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method declared-synchronized getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;
    .locals 1

    monitor-enter p0

    .line 224
    :try_start_0
    iget-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

    if-nez v0, :cond_0

    .line 226
    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->newBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

    .line 229
    :cond_0
    iget-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isPropertyFirstUpper()Z
    .locals 1

    .line 234
    iget-boolean v0, p0, Lorg/ini4j/BasicOptionMap;->_propertyFirstUpper:Z

    return v0
.end method

.method newBeanAccess()Lorg/ini4j/spi/BeanAccess;
    .locals 1

    .line 239
    new-instance v0, Lorg/ini4j/BasicOptionMap$Access;

    invoke-direct {v0, p0}, Lorg/ini4j/BasicOptionMap$Access;-><init>(Lorg/ini4j/BasicOptionMap;)V

    return-object v0
.end method

.method newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;
    .locals 1

    .line 244
    new-instance v0, Lorg/ini4j/BasicOptionMap$Access;

    invoke-direct {v0, p0, p1}, Lorg/ini4j/BasicOptionMap$Access;-><init>(Lorg/ini4j/BasicOptionMap;Ljava/lang/String;)V

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_1

    .line 185
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p2, Ljava/lang/String;

    :goto_1
    invoke-super {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_1

    .line 190
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p2, Ljava/lang/String;

    :goto_1
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/CommonMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public putAll(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    if-eqz p2, :cond_0

    .line 197
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 200
    :cond_0
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    .line 203
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 207
    invoke-static {p2, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/ini4j/BasicOptionMap;->add(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method resolve(Ljava/lang/StringBuilder;)V
    .locals 5

    .line 249
    sget-object v0, Lorg/ini4j/BasicOptionMap;->EXPRESSION:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 251
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, 0x2

    .line 253
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    .line 254
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    if-nez v3, :cond_1

    const/4 v2, -0x1

    goto :goto_1

    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    :goto_1
    const-string v3, "@env/"

    .line 257
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 259
    sget v2, Lorg/ini4j/BasicOptionMap;->ENVIRONMENT_PREFIX_LEN:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/ini4j/Config;->getEnvironment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_2
    const-string v3, "@prop/"

    .line 261
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 263
    sget v2, Lorg/ini4j/BasicOptionMap;->SYSTEM_PROPERTY_PREFIX_LEN:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/ini4j/Config;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_3
    if-ne v2, v4, :cond_4

    .line 267
    invoke-virtual {p0, v1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_4
    invoke-virtual {p0, v1, v2}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    :goto_2
    if-eqz v1, :cond_0

    .line 272
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    invoke-virtual {p1, v2, v3, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->reset(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    goto :goto_0

    :cond_5
    return-void
.end method

.method public to(Ljava/lang/Object;)V
    .locals 2

    .line 214
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->inject(Ljava/lang/Object;Lorg/ini4j/spi/BeanAccess;)V

    return-void
.end method

.method public to(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 219
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/ini4j/spi/BeanTool;->inject(Ljava/lang/Object;Lorg/ini4j/spi/BeanAccess;)V

    return-void
.end method
