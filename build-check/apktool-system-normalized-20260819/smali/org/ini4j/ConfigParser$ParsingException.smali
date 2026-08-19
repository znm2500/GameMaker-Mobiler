.class public final Lorg/ini4j/ConfigParser$ParsingException;
.super Ljava/io/IOException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ParsingException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4ae26889325044aeL


# direct methods
.method private constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    .line 409
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 410
    invoke-virtual {p0, p1}, Lorg/ini4j/ConfigParser$ParsingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Throwable;Lorg/ini4j/ConfigParser$1;)V
    .locals 0

    .line 402
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$ParsingException;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method
