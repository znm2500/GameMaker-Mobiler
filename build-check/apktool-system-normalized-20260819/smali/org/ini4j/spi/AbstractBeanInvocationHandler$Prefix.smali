.class final enum Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
.super Ljava/lang/Enum;
.source "AbstractBeanInvocationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/spi/AbstractBeanInvocationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Prefix"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum ADD_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum ADD_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum HAS:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum READ:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum READ_BOOLEAN:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum REMOVE_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum REMOVE_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

.field public static final enum WRITE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;


# instance fields
.field private _len:I

.field private _value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 42
    new-instance v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v1, "READ"

    const/4 v2, 0x0

    const-string v3, "get"

    invoke-direct {v0, v1, v2, v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 43
    new-instance v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v3, "READ_BOOLEAN"

    const/4 v4, 0x1

    const-string v5, "is"

    invoke-direct {v1, v3, v4, v5}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->READ_BOOLEAN:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 44
    new-instance v3, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v5, "WRITE"

    const/4 v6, 0x2

    const-string v7, "set"

    invoke-direct {v3, v5, v6, v7}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->WRITE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 45
    new-instance v5, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v7, "ADD_CHANGE"

    const/4 v8, 0x3

    const-string v9, "addPropertyChangeListener"

    invoke-direct {v5, v7, v8, v9}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 46
    new-instance v7, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v9, "ADD_VETO"

    const/4 v10, 0x4

    const-string v11, "addVetoableChangeListener"

    invoke-direct {v7, v9, v10, v11}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->ADD_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 47
    new-instance v9, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v11, "REMOVE_CHANGE"

    const/4 v12, 0x5

    const-string v13, "removePropertyChangeListener"

    invoke-direct {v9, v11, v12, v13}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v9, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_CHANGE:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 48
    new-instance v11, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v13, "REMOVE_VETO"

    const/4 v14, 0x6

    const-string v15, "removeVetoableChangeListener"

    invoke-direct {v11, v13, v14, v15}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v11, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->REMOVE_VETO:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    .line 49
    new-instance v13, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const-string v15, "HAS"

    const/4 v14, 0x7

    const-string v12, "has"

    invoke-direct {v13, v15, v14, v12}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v13, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->HAS:Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    const/16 v12, 0x8

    new-array v12, v12, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    aput-object v0, v12, v2

    aput-object v1, v12, v4

    aput-object v3, v12, v6

    aput-object v5, v12, v8

    aput-object v7, v12, v10

    const/4 v0, 0x5

    aput-object v9, v12, v0

    const/4 v0, 0x6

    aput-object v11, v12, v0

    aput-object v13, v12, v14

    .line 40
    sput-object v12, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->$VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 55
    iput-object p3, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_value:Ljava/lang/String;

    .line 56
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_len:I

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .locals 5

    .line 63
    invoke-static {}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->values()[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 65
    invoke-virtual {v3}, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_1
    return-object v3
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .locals 1

    .line 40
    const-class v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-object p0
.end method

.method public static values()[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;
    .locals 1

    .line 40
    sget-object v0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->$VALUES:[Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    invoke-virtual {v0}, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;

    return-object v0
.end method


# virtual methods
.method public getTail(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 78
    iget v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_len:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 83
    iget-object v0, p0, Lorg/ini4j/spi/AbstractBeanInvocationHandler$Prefix;->_value:Ljava/lang/String;

    return-object v0
.end method
