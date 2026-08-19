.class Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/RunnerKeyboardController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeyboardInputConnectionWrapper"
.end annotation


# instance fields
.field protected m_inputConnection:Landroid/view/inputmethod/InputConnection;

.field protected m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;


# direct methods
.method public constructor <init>(Lcom/example/mygame/RunnerKeyboardController;Landroid/view/inputmethod/InputConnection;ZLcom/example/mygame/RunnerKeyboardController;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    .line 93
    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    const/4 p1, 0x0

    .line 88
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    .line 89
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->m_inputConnection:Landroid/view/inputmethod/InputConnection;

    .line 94
    iput-object p4, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    .line 95
    iput-object p2, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->m_inputConnection:Landroid/view/inputmethod/InputConnection;

    return-void
.end method


# virtual methods
.method public setComposingRegion(II)Z
    .locals 4

    if-lez p1, :cond_2

    .line 116
    new-instance v0, Landroid/view/inputmethod/ExtractedTextRequest;

    invoke-direct {v0}, Landroid/view/inputmethod/ExtractedTextRequest;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;I)Landroid/view/inputmethod/ExtractedText;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 117
    iget-object v1, v0, Landroid/view/inputmethod/ExtractedText;->text:Ljava/lang/CharSequence;

    if-eqz v1, :cond_0

    .line 118
    iget-object v0, v0, Landroid/view/inputmethod/ExtractedText;->text:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 122
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 126
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_1
    if-lez p1, :cond_2

    add-int/lit8 v1, p1, -0x1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 134
    invoke-static {v1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v3

    .line 138
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eq v1, v2, :cond_2

    const-string v1, "\\p{Punct}"

    invoke-static {v1, v3}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-ne v1, v2, :cond_1

    goto :goto_2

    :cond_1
    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    .line 150
    :cond_2
    :goto_2
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->setComposingRegion(II)Z

    move-result p1

    return p1
.end method

.method public setTarget(Landroid/view/inputmethod/InputConnection;)V
    .locals 0

    .line 103
    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->setTarget(Landroid/view/inputmethod/InputConnection;)V

    .line 104
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;->m_inputConnection:Landroid/view/inputmethod/InputConnection;

    return-void
.end method
