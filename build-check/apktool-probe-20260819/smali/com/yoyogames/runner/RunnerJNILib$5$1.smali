.class Lcom/yoyogames/runner/RunnerJNILib$5$1;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$5;Landroid/widget/EditText;)V
    .locals 0

    .line 969
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

    iput-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$5$1;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 971
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$1;->val$input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    .line 972
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$5;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
