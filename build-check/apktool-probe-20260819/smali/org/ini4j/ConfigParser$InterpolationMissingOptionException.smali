.class public final Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;
.super Lorg/ini4j/ConfigParser$InterpolationException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "InterpolationMissingOptionException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x284a03b2b2146087L


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 376
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$InterpolationException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V
    .locals 0

    .line 369
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$InterpolationMissingOptionException;-><init>(Ljava/lang/String;)V

    return-void
.end method
