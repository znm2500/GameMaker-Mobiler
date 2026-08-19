.class Lcom/yoyogames/runner/RunnerJNILib$8;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->ShowQuestionAsync(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$idDialog:I

.field final synthetic val$sMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1155
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$8;->val$sMessage:Ljava/lang/String;

    iput p2, p0, Lcom/yoyogames/runner/RunnerJNILib$8;->val$idDialog:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1157
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1158
    iget-object v1, p0, Lcom/yoyogames/runner/RunnerJNILib$8;->val$sMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 1159
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/yoyogames/runner/RunnerJNILib$8$1;

    invoke-direct {v2, p0}, Lcom/yoyogames/runner/RunnerJNILib$8$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$8;)V

    const-string v3, "Yes"

    .line 1160
    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1165
    new-instance v1, Lcom/yoyogames/runner/RunnerJNILib$8$2;

    invoke-direct {v1, p0}, Lcom/yoyogames/runner/RunnerJNILib$8$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$8;)V

    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1170
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1171
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
