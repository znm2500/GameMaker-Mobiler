.class public Lcom/example/mygame/RunnerVsyncHandler;
.super Ljava/lang/Object;
.source "RunnerVsyncHandler.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/mygame/RunnerVsyncHandler$Accessor;
    }
.end annotation


# static fields
.field private static final accessor:Lcom/example/mygame/RunnerVsyncHandler$Accessor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    new-instance v0, Lcom/example/mygame/RunnerVsyncHandler$Accessor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/example/mygame/RunnerVsyncHandler$Accessor;-><init>(Lcom/example/mygame/RunnerVsyncHandler$1;)V

    sput-object v0, Lcom/example/mygame/RunnerVsyncHandler;->accessor:Lcom/example/mygame/RunnerVsyncHandler$Accessor;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public PostFrameCallback()V
    .locals 1

    .line 44
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method

.method public RemoveFrameCallback()V
    .locals 1

    .line 49
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method

.method public doFrame(J)V
    .locals 0

    .line 23
    sget-object p1, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    sget-object p2, Lcom/example/mygame/RunnerVsyncHandler;->accessor:Lcom/example/mygame/RunnerVsyncHandler$Accessor;

    invoke-virtual {p1, p2}, Lcom/example/mygame/RunnerActivity;->GetGLView(Lcom/example/mygame/RunnerVsyncHandler$Accessor;)Lcom/example/mygame/DemoGLSurfaceView;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 25
    iget-object p1, p1, Lcom/example/mygame/DemoGLSurfaceView;->mRenderer:Lcom/example/mygame/DemoRenderer;

    if-eqz p1, :cond_0

    .line 27
    sget p1, Lcom/example/mygame/DemoRenderer;->elapsedVsyncs:I

    add-int/lit8 p1, p1, 0x1

    sput p1, Lcom/example/mygame/DemoRenderer;->elapsedVsyncs:I

    .line 39
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method
