.class public final Lorg/ini4j/ConfigParser$DuplicateSectionException;
.super Lorg/ini4j/ConfigParser$ConfigParserException;
.source "ConfigParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/ConfigParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DuplicateSectionException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x48c675e5bf3988dbL


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 354
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$ConfigParserException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/ini4j/ConfigParser$1;)V
    .locals 0

    .line 347
    invoke-direct {p0, p1}, Lorg/ini4j/ConfigParser$DuplicateSectionException;-><init>(Ljava/lang/String;)V

    return-void
.end method
