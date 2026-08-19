.class public interface abstract Lorg/ini4j/CommentedMap;
.super Ljava/lang/Object;
.source "CommentedMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;TV;>;"
    }
.end annotation


# virtual methods
.method public abstract getComment(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract putComment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract removeComment(Ljava/lang/Object;)Ljava/lang/String;
.end method
