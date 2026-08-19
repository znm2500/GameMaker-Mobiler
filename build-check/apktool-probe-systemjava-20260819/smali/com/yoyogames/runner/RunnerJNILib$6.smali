.class Lcom/yoyogames/runner/RunnerJNILib$6;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->InputStringAsync(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$idDialog:I

.field final synthetic val$sDefault:Ljava/lang/String;

.field final synthetic val$sMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1080
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$6;->val$sDefault:Ljava/lang/String;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$6;->val$sMessage:Ljava/lang/String;

    iput p3, p0, Lcom/yoyogames/runner/RunnerJNILib$6;->val$idDialog:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1082
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1083
    new-instance v1, Landroid/widget/EditText;

    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1084
    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$6;->val$sDefault:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1085
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 1086
    iget-object v2, p0, Lcom/yoyogames/runner/RunnerJNILib$6;->val$sMessage:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 1087
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/yoyogames/runner/RunnerJNILib$6$1;

    invoke-direct {v3, p0, v1}, Lcom/yoyogames/runner/RunnerJNILib$6$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$6;Landroid/widget/EditText;)V

    const-string v1, "OK"

    .line 1088
    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1094
    new-instance v1, Lcom/yoyogames/runner/RunnerJNILib$6$2;

    invoke-direct {v1, p0}, Lcom/yoyogames/runner/RunnerJNILib$6$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$6;)V

    const-string v2, "Cancel"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1101
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1102
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
