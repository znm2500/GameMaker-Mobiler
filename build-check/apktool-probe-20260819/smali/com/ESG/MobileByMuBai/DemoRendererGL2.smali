.class public Lcom/ESG/MobileByMuBai/DemoRendererGL2;
.super Lcom/ESG/MobileByMuBai/DemoRenderer;
.source "DemoRendererGL2.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1}, Lcom/ESG/MobileByMuBai/DemoRenderer;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 3

    .line 70
    sget-object v0, Lcom/ESG/MobileByMuBai/DemoRendererGL2;->m_state:Lcom/ESG/MobileByMuBai/DemoRenderer$eState;

    sget-object v1, Lcom/ESG/MobileByMuBai/DemoRenderer$eState;->Startup:Lcom/ESG/MobileByMuBai/DemoRenderer$eState;

    const-string v2, "yoyo"

    if-eq v0, v1, :cond_0

    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "onSurfaceCreated() aborted on re-create 1, state is currently "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/ESG/MobileByMuBai/DemoRendererGL2;->m_state:Lcom/ESG/MobileByMuBai/DemoRenderer$eState;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 76
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v0

    const v1, 0x8ca6

    .line 77
    invoke-interface {p1, v1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    const/4 v1, 0x0

    .line 79
    invoke-virtual {v0, v1}, Ljava/nio/IntBuffer;->get(I)I

    move-result v0

    sput v0, Lcom/ESG/MobileByMuBai/DemoRendererGL2;->m_defaultFrameBuffer:I

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Renderer instance is gl2.0, framebuffer object is: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/ESG/MobileByMuBai/DemoRendererGL2;->m_defaultFrameBuffer:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-super {p0, p1, p2}, Lcom/ESG/MobileByMuBai/DemoRenderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    return-void
.end method
