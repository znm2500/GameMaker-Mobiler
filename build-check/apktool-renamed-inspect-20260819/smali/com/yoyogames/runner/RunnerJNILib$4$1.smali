.class Lcom/yoyogames/runner/RunnerJNILib$4$1;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$4;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$4;)V
    .locals 0

    .line 939
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$4$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 941
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$4$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$4;

    iget p1, p1, Lcom/yoyogames/runner/RunnerJNILib$4;->val$idDialog:I

    const-string p2, "OK"

    const/4 v0, 0x1

    invoke-static {p2, v0, p1}, Lcom/yoyogames/runner/RunnerJNILib;->InputResult(Ljava/lang/String;II)V

    return-void
.end method
