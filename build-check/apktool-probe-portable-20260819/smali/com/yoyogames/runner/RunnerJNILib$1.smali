.class Lcom/yoyogames/runner/RunnerJNILib$1;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->ExitApplication()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 119
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerActivity;->finish()V

    return-void
.end method
