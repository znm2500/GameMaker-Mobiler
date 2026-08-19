.class public interface abstract Lorg/ini4j/Registry$Key;
.super Ljava/lang/Object;
.source "Registry.java"

# interfaces
.implements Lorg/ini4j/Profile$Section;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/Registry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Key"
.end annotation


# static fields
.field public static final DEFAULT_NAME:Ljava/lang/String; = "@"


# virtual methods
.method public abstract addChild(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract getChild(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract getParent()Lorg/ini4j/Registry$Key;
.end method

.method public abstract getType(Ljava/lang/Object;)Lorg/ini4j/Registry$Type;
.end method

.method public abstract getType(Ljava/lang/Object;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;
.end method

.method public varargs abstract lookup([Ljava/lang/String;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract putType(Ljava/lang/String;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;
.end method

.method public abstract removeType(Ljava/lang/Object;)Lorg/ini4j/Registry$Type;
.end method
