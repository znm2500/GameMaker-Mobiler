.class Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;
.super Landroidx/appcompat/widget/AppCompatEditText;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/RunnerKeyboardController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeyboardInputEditText"
.end annotation


# instance fields
.field protected m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;


# direct methods
.method public constructor <init>(Lcom/example/mygame/RunnerKeyboardController;Landroid/content/Context;Lcom/example/mygame/RunnerKeyboardController;)V
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    .line 161
    invoke-direct {p0, p2}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 157
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    .line 162
    iput-object p3, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    return-void
.end method


# virtual methods
.method public isSuggestionsEnabled()Z
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {v0}, Lcom/example/mygame/RunnerKeyboardController;->GetPredictiveTextEnabled()Z

    move-result v0

    return v0

    .line 197
    :cond_0
    invoke-super {p0}, Landroidx/appcompat/widget/AppCompatEditText;->isSuggestionsEnabled()Z

    move-result v0

    return v0
.end method

.method public onCheckIsTextEditor()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 4

    .line 205
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatEditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object p1

    .line 206
    new-instance v0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;

    iget-object v1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    const/4 v3, 0x1

    invoke-direct {v0, v1, p1, v3, v2}, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;-><init>(Lcom/example/mygame/RunnerKeyboardController;Landroid/view/inputmethod/InputConnection;ZLcom/example/mygame/RunnerKeyboardController;)V

    return-object v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 172
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x61

    if-ne p1, v0, :cond_1

    .line 173
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getSource()I

    move-result p1

    const/16 p2, 0x401

    and-int/2addr p1, p2

    if-ne p1, p2, :cond_1

    .line 176
    :cond_0
    iget-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardHide()V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
