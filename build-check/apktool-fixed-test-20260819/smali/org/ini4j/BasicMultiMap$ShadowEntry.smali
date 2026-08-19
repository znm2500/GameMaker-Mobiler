.class Lorg/ini4j/BasicMultiMap$ShadowEntry;
.super Ljava/lang/Object;
.source "BasicMultiMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/BasicMultiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShadowEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final _key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/ini4j/BasicMultiMap;


# direct methods
.method constructor <init>(Lorg/ini4j/BasicMultiMap;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 248
    iput-object p1, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->this$0:Lorg/ini4j/BasicMultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    iput-object p2, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->_key:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 254
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->_key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 259
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->this$0:Lorg/ini4j/BasicMultiMap;

    iget-object v1, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->_key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/ini4j/BasicMultiMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->this$0:Lorg/ini4j/BasicMultiMap;

    iget-object v1, p0, Lorg/ini4j/BasicMultiMap$ShadowEntry;->_key:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lorg/ini4j/BasicMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
