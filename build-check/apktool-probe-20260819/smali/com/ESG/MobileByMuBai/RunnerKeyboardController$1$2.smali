.class Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1$2;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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

    .line 340
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1$2;->this$1:Lcom/ESG/MobileByMuBai/RunnerKeyboardController$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x0

    const/16 p2, 0xd

    const/16 p3, 0x1103

    .line 345
    invoke-static {p1, p2, p2, p3}, Lcom/yoyogames/runner/RunnerJNILib;->KeyEvent(IIII)V

    const/4 p1, 0x1

    .line 346
    invoke-static {p1, p2, p2, p3}, Lcom/yoyogames/runner/RunnerJNILib;->KeyEvent(IIII)V

    return p1
.end method
