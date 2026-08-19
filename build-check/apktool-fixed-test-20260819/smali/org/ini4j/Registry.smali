.class public interface abstract Lorg/ini4j/Registry;
.super Ljava/lang/Object;
.source "Registry.java"

# interfaces
.implements Lorg/ini4j/Profile;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/Registry$Key;,
        Lorg/ini4j/Registry$Type;,
        Lorg/ini4j/Registry$Hive;
    }
.end annotation


# static fields
.field public static final ESCAPE_CHAR:C = '\\'

.field public static final FILE_ENCODING:Ljava/nio/charset/Charset;

.field public static final KEY_SEPARATOR:C = '\\'

.field public static final LINE_SEPARATOR:Ljava/lang/String; = "\r\n"

.field public static final TYPE_SEPARATOR:C = ':'

.field public static final VERSION:Ljava/lang/String; = "Windows Registry Editor Version 5.00"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "UnicodeLittle"

    .line 83
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/ini4j/Registry;->FILE_ENCODING:Ljava/nio/charset/Charset;

    return-void
.end method


# virtual methods
.method public abstract get(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract get(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method

.method public abstract put(Ljava/lang/String;Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract put(Ljava/lang/String;Lorg/ini4j/Profile$Section;I)Lorg/ini4j/Registry$Key;
.end method

.method public abstract remove(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
.end method

.method public abstract remove(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
.end method

.method public abstract setVersion(Ljava/lang/String;)V
.end method
