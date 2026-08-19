.class Lcom/yoyogames/runner/RunnerJNILib$7;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->ShowQuestion(Ljava/lang/String;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$sMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1116
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$7;->val$sMessage:Ljava/lang/String;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$7;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1118
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1119
    iget-object v1, p0, Lcom/yoyogames/runner/RunnerJNILib$7;->val$sMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 1120
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/yoyogames/runner/RunnerJNILib$7$1;

    invoke-direct {v2, p0}, Lcom/yoyogames/runner/RunnerJNILib$7$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$7;)V

    const-string v3, "Yes"

    .line 1121
    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1127
    new-instance v1, Lcom/yoyogames/runner/RunnerJNILib$7$2;

    invoke-direct {v1, p0}, Lcom/yoyogames/runner/RunnerJNILib$7$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$7;)V

    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1133
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1134
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
