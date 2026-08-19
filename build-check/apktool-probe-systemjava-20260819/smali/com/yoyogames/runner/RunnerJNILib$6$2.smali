.class Lcom/yoyogames/runner/RunnerJNILib$6$2;
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


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$6;)V
    .locals 0

    .line 1094
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$6$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1096
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$6$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$6;->val$sDefault:Ljava/lang/String;

    sput-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    .line 1097
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->InputStringResult:Ljava/lang/String;

    iget-object p2, p0, Lcom/yoyogames/runner/RunnerJNILib$6$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$6;

    iget p2, p2, Lcom/yoyogames/runner/RunnerJNILib$6;->val$idDialog:I

    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/yoyogames/runner/RunnerJNILib;->InputResult(Ljava/lang/String;II)V

    return-void
.end method
