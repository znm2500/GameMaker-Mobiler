.class Lcom/yoyogames/runner/RunnerJNILib$12;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->ShowLogin(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$idDialog:I

.field final synthetic val$sDefaultPassword:Ljava/lang/String;

.field final synthetic val$sDefaultUserName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1494
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$sDefaultUserName:Ljava/lang/String;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$sDefaultPassword:Ljava/lang/String;

    iput p3, p0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$idDialog:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1496
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1497
    sget-object v1, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b0031

    const/4 v3, 0x0

    .line 1499
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 1500
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    const v2, 0x7f0800bd

    .line 1501
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    const v3, 0x7f08007c

    .line 1502
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 1503
    iget-object v3, p0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$sDefaultUserName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1504
    iget-object v3, p0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$sDefaultPassword:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 v3, 0x0

    .line 1505
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lcom/yoyogames/runner/RunnerJNILib$12$1;

    invoke-direct {v4, p0, v2, v1}, Lcom/yoyogames/runner/RunnerJNILib$12$1;-><init>(Lcom/yoyogames/runner/RunnerJNILib$12;Landroid/widget/EditText;Landroid/widget/EditText;)V

    const-string v1, "OK"

    .line 1506
    invoke-virtual {v3, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1511
    new-instance v1, Lcom/yoyogames/runner/RunnerJNILib$12$2;

    invoke-direct {v1, p0}, Lcom/yoyogames/runner/RunnerJNILib$12$2;-><init>(Lcom/yoyogames/runner/RunnerJNILib$12;)V

    const-string v2, "Cancel"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1517
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1518
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
