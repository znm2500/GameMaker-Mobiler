.class Lcom/example/mygame/RunnerKeyboardController$2;
.super Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/mygame/RunnerKeyboardController;->InitReceivers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;


# direct methods
.method constructor <init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V
    .locals 0

    .line 389
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$2;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {p0, p1, p2}, Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    .line 393
    invoke-super {p0, p1, p2}, Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    if-eq p1, p2, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 p2, 0x3

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 401
    :cond_0
    iget-object p2, p0, Lcom/example/mygame/RunnerKeyboardController$2;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/example/mygame/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    goto :goto_0

    .line 406
    :cond_1
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$2;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {v0, p2}, Lcom/example/mygame/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    .line 410
    :goto_0
    iget-object p2, p0, Lcom/example/mygame/RunnerKeyboardController$2;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {p2, p1}, Lcom/example/mygame/RunnerKeyboardController;->UpdateKeyboardStatusFromIMMResult(I)V

    .line 411
    iget-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$2;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    return-void
.end method
