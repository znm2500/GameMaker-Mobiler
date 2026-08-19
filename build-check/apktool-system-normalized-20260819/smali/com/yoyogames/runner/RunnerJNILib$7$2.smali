.class Lcom/yoyogames/runner/RunnerJNILib$7$2;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$7;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$7;)V
    .locals 0

    .line 1127
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$7$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 1129
    sput p1, Lcom/example/mygame/RunnerActivity;->ShowQuestionYesNo:I

    .line 1130
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$7$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$7;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$7;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
