.class Lcom/example/mygame/RunnerKeyboardController$3;
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

    .line 417
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$3;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {p0, p1, p2}, Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    .line 421
    invoke-super {p0, p1, p2}, Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;->onReceiveResult(ILandroid/os/Bundle;)V

    .line 422
    iget-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$3;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    return-void
.end method
