.class Lcom/yoyogames/runner/RunnerJNILib$12$1;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$12;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$12;

.field final synthetic val$passwordEditText:Landroid/widget/EditText;

.field final synthetic val$userNameEditText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$12;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .line 1506
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$12;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->val$userNameEditText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->val$passwordEditText:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1508
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->val$userNameEditText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p2, 0x23

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->val$passwordEditText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->val$userNameEditText:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/yoyogames/runner/RunnerJNILib$12$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$12;

    iget v0, v0, Lcom/yoyogames/runner/RunnerJNILib$12;->val$idDialog:I

    invoke-static {p1, p2, v0}, Lcom/yoyogames/runner/RunnerJNILib;->LoginResult(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method
