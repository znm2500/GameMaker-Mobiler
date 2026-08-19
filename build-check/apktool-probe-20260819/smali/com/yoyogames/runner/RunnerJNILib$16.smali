.class Lcom/yoyogames/runner/RunnerJNILib$16;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->OnKeyboardStringSet([I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$_newString:[I


# direct methods
.method constructor <init>([I)V
    .locals 0

    .line 2000
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$16;->val$_newString:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2003
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->GetKeyboardController()Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2006
    iget-object v1, p0, Lcom/yoyogames/runner/RunnerJNILib$16;->val$_newString:[I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->SetInputString([IZ)V

    :cond_0
    return-void
.end method
