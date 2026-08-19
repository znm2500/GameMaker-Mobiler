.class Lcom/example/mygame/RunnerKeyboardController$5;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardToggle(ZIIIZ[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;

.field final synthetic val$_autoCapitalizationType:I

.field final synthetic val$_inputString:[I

.field final synthetic val$_keyboardType:I

.field final synthetic val$_predictiveTextEnabled:Z

.field final synthetic val$_returnKeyType:I

.field final synthetic val$_toggleOn:Z


# direct methods
.method constructor <init>(Lcom/example/mygame/RunnerKeyboardController;ZIIZI[I)V
    .locals 0

    .line 445
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iput-boolean p2, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_toggleOn:Z

    iput p3, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_keyboardType:I

    iput p4, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_autoCapitalizationType:I

    iput-boolean p5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_predictiveTextEnabled:Z

    iput p6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_returnKeyType:I

    iput-object p7, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_inputString:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 450
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_toggleOn:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_5

    const/4 v0, 0x0

    .line 462
    iget v3, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_keyboardType:I

    const/4 v4, 0x3

    const/4 v5, 0x2

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    const/4 v3, 0x0

    goto :goto_0

    :pswitch_1
    const/16 v3, 0x60

    goto :goto_0

    :pswitch_2
    const/4 v3, 0x3

    goto :goto_0

    :pswitch_3
    const/4 v3, 0x2

    goto :goto_0

    :pswitch_4
    const/16 v3, 0x20

    goto :goto_0

    :pswitch_5
    const/16 v3, 0x10

    goto :goto_0

    :pswitch_6
    const/4 v3, 0x1

    .line 474
    :goto_0
    iget v6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_autoCapitalizationType:I

    if-eq v6, v2, :cond_2

    if-eq v6, v5, :cond_1

    if-eq v6, v4, :cond_0

    goto :goto_1

    :cond_0
    or-int/lit16 v3, v3, 0x1000

    goto :goto_1

    :cond_1
    or-int/lit16 v3, v3, 0x4000

    goto :goto_1

    :cond_2
    or-int/lit16 v3, v3, 0x2000

    .line 482
    :goto_1
    iget-boolean v4, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_predictiveTextEnabled:Z

    if-nez v4, :cond_4

    .line 485
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v5, "HTC"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/high16 v4, 0x80000

    goto :goto_2

    :cond_3
    const v4, 0x80090

    :goto_2
    or-int/2addr v3, v4

    .line 492
    :cond_4
    iget v4, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_returnKeyType:I

    const v5, 0x32000005

    const v6, 0x32000003

    const v7, 0x32000002

    packed-switch v4, :pswitch_data_1

    const/high16 v5, 0x32000000

    goto :goto_5

    :pswitch_7
    const-string v0, "Emergency Call"

    goto :goto_4

    :pswitch_8
    const-string v0, "Continue"

    goto :goto_5

    :pswitch_9
    const v5, 0x32000006

    goto :goto_5

    :pswitch_a
    const-string v0, "Yahoo"

    goto :goto_3

    :pswitch_b
    const v5, 0x32000004

    goto :goto_5

    :pswitch_c
    const-string v0, "Route"

    goto :goto_4

    :pswitch_d
    const-string v0, "Next"

    goto :goto_5

    :pswitch_e
    const-string v0, "Join"

    goto :goto_4

    :pswitch_f
    const-string v0, "Google"

    :goto_3
    :pswitch_10
    const v5, 0x32000003

    goto :goto_5

    :pswitch_11
    const-string v0, "Go"

    :goto_4
    const v5, 0x32000002

    :goto_5
    const v4, -0x10001

    and-int/2addr v4, v5

    const v5, -0x8001

    and-int/2addr v4, v5

    .line 513
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget v6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_keyboardType:I

    invoke-static {v5, v6}, Lcom/example/mygame/RunnerKeyboardController;->access$502(Lcom/example/mygame/RunnerKeyboardController;I)I

    .line 514
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget v6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_returnKeyType:I

    invoke-static {v5, v6}, Lcom/example/mygame/RunnerKeyboardController;->access$602(Lcom/example/mygame/RunnerKeyboardController;I)I

    .line 515
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget v6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_autoCapitalizationType:I

    invoke-static {v5, v6}, Lcom/example/mygame/RunnerKeyboardController;->access$702(Lcom/example/mygame/RunnerKeyboardController;I)I

    .line 516
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget-boolean v6, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_predictiveTextEnabled:Z

    invoke-static {v5, v6}, Lcom/example/mygame/RunnerKeyboardController;->access$802(Lcom/example/mygame/RunnerKeyboardController;Z)Z

    .line 519
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v5}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 520
    iget-object v5, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v5}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5, v0, v4}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 521
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 522
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 524
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iget-object v3, p0, Lcom/example/mygame/RunnerKeyboardController$5;->val$_inputString:[I

    invoke-virtual {v0, v3, v2}, Lcom/example/mygame/RunnerKeyboardController;->SetInputString([IZ)V

    .line 527
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$1000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v2}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v3}, Lcom/example/mygame/RunnerKeyboardController;->access$900(Lcom/example/mygame/RunnerKeyboardController;)Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;ILandroid/os/ResultReceiver;)Z

    goto :goto_6

    .line 532
    :cond_5
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 533
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$1000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v2}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    iget-object v3, p0, Lcom/example/mygame/RunnerKeyboardController$5;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v3}, Lcom/example/mygame/RunnerKeyboardController;->access$900(Lcom/example/mygame/RunnerKeyboardController;)Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;ILandroid/os/ResultReceiver;)Z

    :goto_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_11
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_10
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method
