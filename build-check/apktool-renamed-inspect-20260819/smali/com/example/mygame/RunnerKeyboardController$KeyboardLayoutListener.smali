.class Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/RunnerKeyboardController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeyboardLayoutListener"
.end annotation


# instance fields
.field protected m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

.field final synthetic this$0:Lcom/example/mygame/RunnerKeyboardController;


# direct methods
.method constructor <init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;->this$0:Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 71
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    .line 75
    iput-object p2, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;->m_keyboardController:Lcom/example/mygame/RunnerKeyboardController;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerKeyboardController;->OnActivityLayoutChanged()V

    return-void
.end method
