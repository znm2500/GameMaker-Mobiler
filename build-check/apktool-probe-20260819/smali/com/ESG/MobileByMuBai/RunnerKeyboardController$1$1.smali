.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1$1;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;)V
    .locals 0

    .line 294
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1$1;->this$1:Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 304
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1$1;->this$1:Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;

    iget-object p2, p2, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;->this$0:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-static {p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$200(Lcom/ESG/MobileByMuBai/RunnerKeyboardController;)Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 313
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 314
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_1

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p2, 0x0

    aput p2, p1, p2

    .line 320
    invoke-static {p1, p2}, Lcom/yoyogames/runner/RunnerJNILib;->OnVirtualKeyboardTextInserted([II)V

    return-void

    .line 327
    :cond_1
    invoke-static {p1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->access$300(Ljava/lang/String;)[I

    move-result-object p1

    .line 328
    array-length p2, p1

    invoke-static {p1, p2}, Lcom/yoyogames/runner/RunnerJNILib;->OnVirtualKeyboardTextInserted([II)V

    return-void
.end method
