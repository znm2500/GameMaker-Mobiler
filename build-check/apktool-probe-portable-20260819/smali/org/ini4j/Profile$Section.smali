.class public interface abstract Lorg/ini4j/Profile$Section;
.super Ljava/lang/Object;
.source "Profile.java"

# interfaces
.implements Lorg/ini4j/OptionMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/Profile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Section"
.end annotation


# virtual methods
.method public abstract addChild(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
.end method

.method public abstract childrenNames()[Ljava/lang/String;
.end method

.method public abstract getChild(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getParent()Lorg/ini4j/Profile$Section;
.end method

.method public abstract getSimpleName()Ljava/lang/String;
.end method

.method public varargs abstract lookup([Ljava/lang/String;)Lorg/ini4j/Profile$Section;
.end method

.method public abstract removeChild(Ljava/lang/String;)V
.end method
