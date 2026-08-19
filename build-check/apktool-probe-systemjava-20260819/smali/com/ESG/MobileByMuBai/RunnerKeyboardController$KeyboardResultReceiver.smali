.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;
.super Landroid/os/ResultReceiver;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ESG/MobileByMuBai/RunnerKeyboardController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeyboardResultReceiver"
.end annotation


# instance fields
.field protected m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

.field final synthetic this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    const/4 p1, 0x0

    .line 57
    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 53
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    .line 58
    iput-object p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 0

    return-void
.end method
