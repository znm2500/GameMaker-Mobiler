.class Lcom/example/mygame/RunnerKeyboardController$1;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/mygame/RunnerKeyboardController;->InitTextField()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;

.field final synthetic val$keyboardController:Lcom/example/mygame/RunnerKeyboardController;


# direct methods
.method constructor <init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V
    .locals 0

    .line 285
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    iput-object p2, p0, Lcom/example/mygame/RunnerKeyboardController$1;->val$keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 290
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v2}, Lcom/example/mygame/RunnerKeyboardController;->access$100(Lcom/example/mygame/RunnerKeyboardController;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/example/mygame/RunnerKeyboardController$1;->val$keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {v1, v2, v3, v4}, Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;-><init>(Lcom/example/mygame/RunnerKeyboardController;Landroid/content/Context;Lcom/example/mygame/RunnerKeyboardController;)V

    invoke-static {v0, v1}, Lcom/example/mygame/RunnerKeyboardController;->access$002(Lcom/example/mygame/RunnerKeyboardController;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 293
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$1$1;

    invoke-direct {v1, p0}, Lcom/example/mygame/RunnerKeyboardController$1$1;-><init>(Lcom/example/mygame/RunnerKeyboardController$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 339
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$1$2;

    invoke-direct {v1, p0}, Lcom/example/mygame/RunnerKeyboardController$1$2;-><init>(Lcom/example/mygame/RunnerKeyboardController$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 352
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v2, -0x1

    .line 353
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 354
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 355
    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v2}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 357
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 358
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 359
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 363
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 364
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 365
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 373
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->access$400(Lcom/example/mygame/RunnerKeyboardController;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/high16 v3, 0x20000

    .line 374
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 375
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setFocusableInTouchMode(Z)V

    .line 376
    iget-object v3, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-static {v3}, Lcom/example/mygame/RunnerKeyboardController;->access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-array v0, v1, [I

    aput v2, v0, v2

    .line 380
    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController$1;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {v2, v0, v1}, Lcom/example/mygame/RunnerKeyboardController;->SetInputString([IZ)V

    return-void
.end method
