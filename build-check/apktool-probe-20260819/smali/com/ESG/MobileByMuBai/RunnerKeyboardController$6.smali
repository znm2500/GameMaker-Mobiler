.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->OnVirtualKeyboardVisibilityCheckResult(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

.field final synthetic val$_resultCode:I


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;I)V
    .locals 0

    .line 587
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    iput p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->val$_resultCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 592
    iget v0, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->val$_resultCode:I

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 594
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$1000(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$000(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v3}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$1100(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;ILandroid/os/ResultReceiver;)Z

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 598
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$1000(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$000(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {v3}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$1100(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Lcom/ESG/MobileByMuBai/RunnerKeyboardController$KeyboardResultReceiver;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;ILandroid/os/ResultReceiver;)Z

    goto :goto_0

    .line 602
    :cond_1
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$6;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    :goto_0
    return-void
.end method
