.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;
.super Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->InitReceivers()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)V
    .locals 0

    .line 389
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-direct {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;-><init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    .line 393
    invoke-super {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

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
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    goto :goto_0

    .line 406
    :cond_1
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {v0, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    .line 410
    :goto_0
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {p2, p1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->UpdateKeyboardStatusFromIMMResult(I)V

    .line 411
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$2;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    return-void
.end method
