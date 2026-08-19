.class Lcom/yoyogames/runner/RunnerJNILib$2$2;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yoyogames/runner/RunnerJNILib$2;


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$2;)V
    .locals 0

    .line 488
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$2$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 491
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$2$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$2;

    iget-object p1, p1, Lcom/yoyogames/runner/RunnerJNILib$2;->val$sUrl:Ljava/lang/String;

    invoke-static {p1}, Lcom/yoyogames/runner/RunnerJNILib;->OpenURL(Ljava/lang/String;)V

    return-void
.end method
