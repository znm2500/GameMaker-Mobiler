.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$3;
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

    .line 417
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$3;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-direct {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;-><init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 421
    invoke-super {p0, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 422
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$3;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    return-void
.end method
