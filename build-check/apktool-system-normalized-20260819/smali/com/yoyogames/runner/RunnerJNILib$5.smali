.class Lcom/yoyogames/runner/RunnerJNILib$5;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->InputString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$sDefault:Ljava/lang/String;

.field final synthetic val$sMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 961
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5;->val$sDefault:Ljava/lang/String;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$5;->val$sMessage:Ljava/lang/String;

    iput-object p3, p0, Lcom/yoyogames/runner/RunnerJNILib$5;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 963
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 964
    new-instance v1, Landroid/widget/EditText;

    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 965
    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$5;->val$sDefault:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 966
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 967
    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$5;->val$sMessage:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 968
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/yoyogames/runner/RunnerJNILib$5$1;

    invoke-direct {v3, p0, v1}, Lcom/yoyogames/runner/RunnerJNILib$5$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$5;Landroid/widget/EditText;)V

    const-string v1, "OK"

    .line 969
    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 975
    new-instance v1, Lcom/yoyogames/runner/RunnerJNILib$5$2;

    invoke-direct {v1, p0}, Lcom/yoyogames/runner/RunnerJNILib$5$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$5;)V

    const-string v2, "Cancel"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 982
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 983
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
