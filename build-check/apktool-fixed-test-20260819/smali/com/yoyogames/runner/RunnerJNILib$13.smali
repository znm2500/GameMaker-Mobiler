.class Lcom/yoyogames/runner/RunnerJNILib$13;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->setSystemUIVisibilityFlags(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$flags:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .line 1741
    iput p1, p0, Lcom/yoyogames/runner/RunnerJNILib$13;->val$flags:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1744
    iget v0, p0, Lcom/yoyogames/runner/RunnerJNILib$13;->val$flags:I

    sput v0, Lcom/example/mygame/RunnerActivity;->UIVisibilityFlags:I

    .line 1745
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerActivity;->setupUiVisibility()V

    .line 1746
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerActivity;->setupUiVisibilityDelayed()V

    return-void
.end method
