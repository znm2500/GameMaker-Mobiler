.class Lcom/yoyogames/runner/RunnerJNILib$2;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->LeaveRating(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$sNo:Ljava/lang/String;

.field final synthetic val$sText:Ljava/lang/String;

.field final synthetic val$sUrl:Ljava/lang/String;

.field final synthetic val$sYes:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 483
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sText:Ljava/lang/String;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sYes:Ljava/lang/String;

    iput-object p3, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sNo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 485
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 486
    iget-object v1, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 487
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sYes:Ljava/lang/String;

    new-instance v3, Lcom/yoyogames/runner/RunnerJNILib$2$2;

    invoke-direct {v3, p0}, Lcom/yoyogames/runner/RunnerJNILib$2$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$2;)V

    .line 488
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sNo:Ljava/lang/String;

    new-instance v3, Lcom/yoyogames/runner/RunnerJNILib$2$1;

    invoke-direct {v3, p0}, Lcom/yoyogames/runner/RunnerJNILib$2$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$2;)V

    .line 494
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 499
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 500
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
