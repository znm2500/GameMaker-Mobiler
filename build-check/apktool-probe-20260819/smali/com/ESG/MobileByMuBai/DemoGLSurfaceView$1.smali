.class Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;
.super Ljava/lang/Object;
.source "DemoGLSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)V
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 39
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    invoke-static {v0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->access$100(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    invoke-static {v1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->access$000(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 40
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iget-object v0, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    iget v0, v0, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_renderCount:I

    if-gtz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iget-object v0, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    iget v1, v0, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_renderCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_renderCount:I

    .line 42
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;->this$0:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->requestRender()V

    :cond_0
    return-void
.end method
