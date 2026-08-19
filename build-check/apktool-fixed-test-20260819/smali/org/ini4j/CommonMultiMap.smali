.class public Lorg/ini4j/CommonMultiMap;
.super Lorg/ini4j/BasicMultiMap;
.source "CommonMultiMap.java"

# interfaces
.implements Lorg/ini4j/CommentedMap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/ini4j/BasicMultiMap<",
        "TK;TV;>;",
        "Lorg/ini4j/CommentedMap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final FIRST_CATEGORY:Ljava/lang/String; = ""

.field private static final LAST_CATEGORY:Ljava/lang/String; = "zzzzzzzzzzzzzzzzzzzzzz"

.field private static final META_COMMENT:Ljava/lang/String; = "comment"

.field private static final SEPARATOR:Ljava/lang/String; = ";#;"

.field private static final serialVersionUID:J = 0x29ced5700e028b72L


# instance fields
.field private _meta:Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Lorg/ini4j/BasicMultiMap;-><init>()V

    return-void
.end method

.method private makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ";#;"

    .line 119
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private meta()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-nez v0, :cond_0

    .line 129
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    .line 132
    :cond_0
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 38
    invoke-super {p0}, Lorg/ini4j/BasicMultiMap;->clear()V

    .line 39
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-eqz v0, :cond_0

    .line 41
    invoke-interface {v0}, Ljava/util/SortedMap;->clear()V

    :cond_0
    return-void
.end method

.method public getComment(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    const-string v0, "comment"

    .line 33
    invoke-virtual {p0, v0, p1}, Lorg/ini4j/CommonMultiMap;->getMeta(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method getMeta(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 93
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 48
    invoke-super {p0, p1}, Lorg/ini4j/BasicMultiMap;->putAll(Ljava/util/Map;)V

    .line 49
    instance-of v0, p1, Lorg/ini4j/CommonMultiMap;

    if-eqz v0, :cond_0

    .line 51
    check-cast p1, Lorg/ini4j/CommonMultiMap;

    iget-object p1, p1, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-eqz p1, :cond_0

    .line 55
    invoke-direct {p0}, Lorg/ini4j/CommonMultiMap;->meta()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method public putComment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "comment"

    .line 62
    invoke-virtual {p0, v0, p1, p2}, Lorg/ini4j/CommonMultiMap;->putMeta(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method putMeta(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TK;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 98
    invoke-direct {p0}, Lorg/ini4j/CommonMultiMap;->meta()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 67
    invoke-super {p0, p1}, Lorg/ini4j/BasicMultiMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 69
    invoke-virtual {p0, p1}, Lorg/ini4j/CommonMultiMap;->removeMeta(Ljava/lang/Object;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .line 76
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicMultiMap;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p2

    .line 78
    invoke-virtual {p0, p1}, Lorg/ini4j/CommonMultiMap;->length(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_0

    .line 80
    invoke-virtual {p0, p1}, Lorg/ini4j/CommonMultiMap;->removeMeta(Ljava/lang/Object;)V

    :cond_0
    return-object p2
.end method

.method public removeComment(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    const-string v0, "comment"

    .line 88
    invoke-virtual {p0, v0, p1}, Lorg/ini4j/CommonMultiMap;->removeMeta(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method removeMeta(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 111
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method removeMeta(Ljava/lang/Object;)V
    .locals 3

    .line 103
    iget-object v0, p0, Lorg/ini4j/CommonMultiMap;->_meta:Ljava/util/SortedMap;

    if-eqz v0, :cond_0

    const-string v1, ""

    .line 105
    invoke-direct {p0, v1, p1}, Lorg/ini4j/CommonMultiMap;->makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "zzzzzzzzzzzzzzzzzzzzzz"

    invoke-direct {p0, v2, p1}, Lorg/ini4j/CommonMultiMap;->makeKey(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/SortedMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/SortedMap;->clear()V

    :cond_0
    return-void
.end method
