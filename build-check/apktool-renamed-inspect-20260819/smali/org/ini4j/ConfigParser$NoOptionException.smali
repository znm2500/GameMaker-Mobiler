.class public final Lorg/ini4j/ConfigParser$NoOptionException;
.super Lorg/ini4j/ConfigParser$ConfigParserException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NoOptionException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x75683fd3c61587c2L


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 387
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$ConfigParserException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V
    .locals 0

    .line 380
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$NoOptionException;-><init>(Ljava/lang/String;)V

    return-void
.end method
