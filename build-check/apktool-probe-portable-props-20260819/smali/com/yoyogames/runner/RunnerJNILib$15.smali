.class Lcom/yoyogames/runner/RunnerJNILib$15;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->MoveTaskToBack()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1770
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1773
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/example/mygame/RunnerActivity;->moveTaskToBack(Z)Z

    return-void
.end method
