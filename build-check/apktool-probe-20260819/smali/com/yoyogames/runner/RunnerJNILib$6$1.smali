.class Lcom/yoyogames/runner/RunnerJNILib$6$1;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$6;Landroid/widget/EditText;)V
    .locals 0

    .line 1088
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$6$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$6$1;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1090
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$6$1;->val$input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    .line 1091
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    iget-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$6$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

    iget p2, p2, Lcom/yoyogames/runner/RunnerJNILib$6;->val$idDialog:I

    const/4 v0, 0x1

    invoke-static {p1, v0, p2}, Lcom/yoyogames/runner/RunnerJNILib;->InputResult(Ljava/lang/String;II)V

    return-void
.end method
