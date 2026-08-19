.class Lcom/yoyogames/runner/RunnerJNILib$2$1;
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

    .line 494
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$2$1;->this$0:Lcom/yoyogames/runner/RunnerJNILib$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 496
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method
