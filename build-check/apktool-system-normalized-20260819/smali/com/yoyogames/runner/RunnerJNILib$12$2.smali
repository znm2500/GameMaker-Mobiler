.class Lcom/yoyogames/runner/RunnerJNILib$12$2;
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


# direct methods
.method constructor <init>(Lcom/yoyogames/runner/RunnerJNILib$12;)V
    .locals 0

    .line 1511
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$12$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1513
    iget-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$12$2;->this$0:Lcom/yoyogames/runner/RunnerJNILib$12;

    iget p1, p1, Lcom/yoyogames/runner/RunnerJNILib$12;->val$idDialog:I

    const-string p2, ""

    invoke-static {p2, p2, p1}, Lcom/yoyogames/runner/RunnerJNILib;->LoginResult(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method
