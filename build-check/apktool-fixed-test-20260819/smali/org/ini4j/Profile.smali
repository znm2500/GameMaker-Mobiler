.class public interface abstract Lorg/ini4j/Profile;
.super Ljava/lang/Object;
.source "Profile.java"

# interfaces
.implements Lorg/ini4j/MultiMap;
.implements Lorg/ini4j/CommentedMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/Profile$Section;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/ini4j/MultiMap<",
        "Ljava/lang/String;",
        "Lorg/ini4j/Profile$Section;",
        ">;",
        "Lorg/ini4j/CommentedMap<",
        "Ljava/lang/String;",
        "Lorg/ini4j/Profile$Section;",
        ">;"
    }
.end annotation


# static fields
.field public static final PATH_SEPARATOR:C = '/'


# virtual methods
.method public abstract add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
.end method

.method public abstract add(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
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

.method public abstract fetch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract fetch(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract get(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation
.end method

.method public abstract get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract getComment()Ljava/lang/String;
.end method

.method public abstract put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Profile$Section;
.end method

.method public abstract setComment(Ljava/lang/String;)V
.end method
