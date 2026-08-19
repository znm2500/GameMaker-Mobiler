.class public interface abstract Lorg/ini4j/spi/IniHandler;
.super Ljava/lang/Object;
.source "IniHandler.java"

# interfaces
.implements Lorg/ini4j/spi/HandlerBase;


# virtual methods
.method public abstract endIni()V
.end method

.method public abstract endSection()V
.end method

.method public abstract handleComment(Ljava/lang/String;)V
.end method

.method public abstract handleOption(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract startIni()V
.end method

.method public abstract startSection(Ljava/lang/String;)V
.end method
