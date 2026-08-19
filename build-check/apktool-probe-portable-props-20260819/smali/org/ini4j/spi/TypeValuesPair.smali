.class public Lorg/ini4j/spi/TypeValuesPair;
.super Ljava/lang/Object;
.source "TypeValuesPair.java"


# instance fields
.field private final _type:Lorg/ini4j/Registry$Type;

.field private final _values:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/ini4j/spi/TypeValuesPair;->_type:Lorg/ini4j/Registry$Type;

    .line 29
    iput-object p2, p0, Lorg/ini4j/spi/TypeValuesPair;->_values:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getType()Lorg/ini4j/Registry$Type;
    .locals 1

    .line 34
    iget-object v0, p0, Lorg/ini4j/spi/TypeValuesPair;->_type:Lorg/ini4j/Registry$Type;

    return-object v0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lorg/ini4j/spi/TypeValuesPair;->_values:[Ljava/lang/String;

    return-object v0
.end method
