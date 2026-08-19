.class Lcom/yoyogames/runner/RunnerJNILib$14;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->powersaveEnable(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$enable:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 1756
    iput-boolean p1, p0, Lcom/yoyogames/runner/RunnerJNILib$14;->val$enable:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1758
    iget-boolean v0, p0, Lcom/yoyogames/runner/RunnerJNILib$14;->val$enable:Z

    const/16 v1, 0x80

    if-eqz v0, :cond_0

    .line 1759
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 1762
    :cond_0
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    :goto_0
    return-void
.end method
