.class abstract Lorg/ini4j/spi/AbstractFormatter;
.super Ljava/lang/Object;
.source "AbstractFormatter.java"

# interfaces
.implements Lorg/ini4j/spi/HandlerBase;


# static fields
.field private static final COMMENT:C = '#'

.field private static final OPERATOR:C = '='

.field private static final SPACE:C = ' '


# instance fields
.field private _config:Lorg/ini4j/Config;

.field private _header:Z

.field private _output:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-static {}, Lorg/ini4j/Config;->getGlobal()Lorg/ini4j/Config;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/spi/AbstractFormatter;->_config:Lorg/ini4j/Config;

    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lorg/ini4j/spi/AbstractFormatter;->_header:Z

    return-void
.end method


# virtual methods
.method escapeFilter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 116
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEscape()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/ini4j/spi/EscapeTool;->getInstance()Lorg/ini4j/spi/EscapeTool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/ini4j/spi/EscapeTool;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method protected getConfig()Lorg/ini4j/Config;
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/ini4j/spi/AbstractFormatter;->_config:Lorg/ini4j/Config;

    return-object v0
.end method

.method protected getOutput()Ljava/io/PrintWriter;
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/ini4j/spi/AbstractFormatter;->_output:Ljava/io/PrintWriter;

    return-object v0
.end method

.method public handleComment(Ljava/lang/String;)V
    .locals 6

    .line 33
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isComment()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/ini4j/spi/AbstractFormatter;->_header:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isHeaderComment()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 35
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 37
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v4

    const/16 v5, 0x23

    invoke-virtual {v4, v5}, Ljava/io/PrintWriter;->print(C)V

    .line 38
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 39
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v4

    invoke-virtual {v4}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 42
    :cond_1
    iget-boolean p1, p0, Lorg/ini4j/spi/AbstractFormatter;->_header:Z

    if-eqz p1, :cond_2

    .line 44
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 48
    :cond_2
    iput-boolean v1, p0, Lorg/ini4j/spi/AbstractFormatter;->_header:Z

    return-void
.end method

.method public handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 53
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isStrictOperator()Z

    move-result v0

    const/16 v1, 0x3d

    if-eqz v0, :cond_4

    .line 55
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEmptyOption()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p2, :cond_1

    .line 57
    :cond_0
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/AbstractFormatter;->escapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(C)V

    :cond_1
    if-eqz p2, :cond_2

    .line 63
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p0, p2}, Lorg/ini4j/spi/AbstractFormatter;->escapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 66
    :cond_2
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object p1

    invoke-virtual {p1}, Lorg/ini4j/Config;->isEmptyOption()Z

    move-result p1

    if-nez p1, :cond_3

    if-eqz p2, :cond_6

    .line 68
    :cond_3
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object p2

    invoke-virtual {p2}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    if-nez p2, :cond_5

    .line 73
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/ini4j/Config;->isEmptyOption()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string p2, ""

    :cond_5
    if-eqz p2, :cond_6

    .line 77
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/AbstractFormatter;->escapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 78
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(C)V

    .line 79
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(C)V

    .line 80
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(C)V

    .line 81
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p0, p2}, Lorg/ini4j/spi/AbstractFormatter;->escapeFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p0}, Lorg/ini4j/spi/AbstractFormatter;->getConfig()Lorg/ini4j/Config;

    move-result-object p2

    invoke-virtual {p2}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    :cond_6
    :goto_0
    const/4 p1, 0x0

    .line 86
    invoke-virtual {p0, p1}, Lorg/ini4j/spi/AbstractFormatter;->setHeader(Z)V

    return-void
.end method

.method protected setConfig(Lorg/ini4j/Config;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lorg/ini4j/spi/AbstractFormatter;->_config:Lorg/ini4j/Config;

    return-void
.end method

.method setHeader(Z)V
    .locals 0

    .line 111
    iput-boolean p1, p0, Lorg/ini4j/spi/AbstractFormatter;->_header:Z

    return-void
.end method

.method protected setOutput(Ljava/io/PrintWriter;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lorg/ini4j/spi/AbstractFormatter;->_output:Ljava/io/PrintWriter;

    return-void
.end method
