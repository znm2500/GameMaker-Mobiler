.class public Lorg/ini4j/ConfigParser$InterpolationException;
.super Lorg/ini4j/ConfigParser$ConfigParserException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InterpolationException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7bd9fde686e101fbL


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 365
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$ConfigParserException;-><init>(Ljava/lang/String;)V

    return-void
.end method
