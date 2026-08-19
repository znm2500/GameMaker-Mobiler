.class public interface abstract Lorg/ini4j/OptionMap;
.super Ljava/lang/Object;
.source "OptionMap.java"

# interfaces
.implements Lorg/ini4j/MultiMap;
.implements Lorg/ini4j/CommentedMap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/ini4j/MultiMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;",
        "Lorg/ini4j/CommentedMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract add(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract add(Ljava/lang/String;Ljava/lang/Object;I)V
.end method

.method public abstract as(Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract as(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
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
.end method

.method public abstract fetch(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract fetch(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract fetch(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
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
.end method

.method public abstract fetch(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract fetch(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public abstract fetch(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract fetchAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract from(Ljava/lang/Object;)V
.end method

.method public abstract from(Ljava/lang/Object;Ljava/lang/String;)V
.end method

.method public abstract get(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract get(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
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
.end method

.method public abstract get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
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
.end method

.method public abstract put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract put(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public abstract putAll(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract to(Ljava/lang/Object;)V
.end method

.method public abstract to(Ljava/lang/Object;Ljava/lang/String;)V
.end method
