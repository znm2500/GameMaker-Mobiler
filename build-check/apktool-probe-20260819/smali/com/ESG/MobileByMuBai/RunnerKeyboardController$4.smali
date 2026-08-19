.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$4;
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

    .line 427
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$4;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-direct {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;-><init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 431
    invoke-super {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 432
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$4;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {p2, p1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->OnVirtualKeyboardVisibilityCheckResult(I)V

    return-void
.end method
