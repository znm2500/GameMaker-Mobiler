.class public final Lorg/ini4j/ConfigParser$NoSectionException;
.super Lorg/ini4j/ConfigParser$ConfigParserException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NoSectionException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x76b497195e292606L


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 398
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$ConfigParserException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V
    .locals 0

    .line 391
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$NoSectionException;-><init>(Ljava/lang/String;)V

    return-void
.end method
