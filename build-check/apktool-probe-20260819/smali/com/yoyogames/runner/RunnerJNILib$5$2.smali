.class Lcom/yoyogames/runner/RunnerJNILib$5$2;
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


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$5;)V
    .locals 0

    .line 975
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 977
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$5;->val$sDefault:Ljava/lang/String;

    sput-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    .line 978
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$5$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$5;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$5;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
