.class public Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;
.super Landroid/opengl/GLSurfaceView;
.source "DemoGLSurfaceView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# static fields
.field public static m_usingGL2:I


# instance fields
.field public mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

.field private m_context:Landroid/content/Context;

.field private m_fpsTime:I

.field m_prev:I

.field private m_refreshHandler:Landroid/os/Handler;

.field private m_refreshTick:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 471
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_refreshHandler:Landroid/os/Handler;

    .line 37
    new-instance p2, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;

    invoke-direct {p2, p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView$1;-><init>(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)V

    iput-object p2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_refreshTick:Ljava/lang/Runnable;

    .line 473
    sget-object p2, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {p2}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupIniFile()V

    .line 476
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/ESG/MobileByMuBai/RunnerActivity;->RestrictOrientation(ZZZZZ)V

    .line 481
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    check-cast p2, Lcom/ESG/MobileByMuBai/RunnerActivity;

    sget-object p2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string p2, "yoyo"

    const-string v0, "Trying GL2 config..."

    .line 491
    invoke-static {p2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    invoke-direct {p0, p1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->checkGL20Support(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 496
    :goto_0
    sget-boolean v3, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    if-nez v3, :cond_2

    if-lez v0, :cond_1

    .line 499
    invoke-static {v1}, Lcom/yoyogames/runner/RunnerJNILib;->initGLFuncs(I)I

    move-result v0

    goto :goto_1

    .line 503
    :cond_1
    invoke-static {v2}, Lcom/yoyogames/runner/RunnerJNILib;->initGLFuncs(I)I

    move-result v0

    :cond_2
    :goto_1
    const/16 v3, 0x10

    const-string v4, "DemoGLSurfaceView: CREATED"

    if-nez v0, :cond_3

    .line 509
    sput v2, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_usingGL2:I

    const-string v0, "Using OpenGL ES 1 renderer"

    .line 512
    invoke-static {p2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    invoke-static {p2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    .line 515
    iput v2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_prev:I

    .line 516
    iput v3, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_fpsTime:I

    .line 517
    new-instance p2, Lcom/ESG/MobileByMuBai/DemoRenderer;

    invoke-direct {p2, p1}, Lcom/ESG/MobileByMuBai/DemoRenderer;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    .line 519
    invoke-virtual {p0, p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 521
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    goto :goto_2

    .line 529
    :cond_3
    sput v1, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_usingGL2:I

    const/4 v0, 0x2

    .line 531
    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->setEGLContextClientVersion(I)V

    const-string v0, "Using OpenGL ES 2 renderer"

    .line 534
    invoke-static {p2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    invoke-static {p2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    .line 537
    iput v2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_prev:I

    .line 538
    iput v3, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_fpsTime:I

    .line 539
    new-instance p2, Lcom/ESG/MobileByMuBai/DemoRendererGL2;

    invoke-direct {p2, p1}, Lcom/ESG/MobileByMuBai/DemoRendererGL2;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    .line 541
    invoke-virtual {p0, p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    .line 543
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    :goto_2
    return-void
.end method

.method static synthetic access$000(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)I
    .locals 0

    .line 26
    iget p0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_fpsTime:I

    return p0
.end method

.method static synthetic access$100(Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;)Landroid/os/Handler;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_refreshHandler:Landroid/os/Handler;

    return-object p0
.end method

.method private checkGL20Support(Landroid/content/Context;)Z
    .locals 10

    .line 440
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-ge p1, v1, :cond_0

    const-string p1, "yoyo"

    const-string v1, "Android OS version below minimum required for GL2..."

    .line 442
    invoke-static {p1, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    .line 446
    :cond_0
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object p1

    check-cast p1, Ljavax/microedition/khronos/egl/EGL10;

    .line 447
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {p1, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v7

    const/4 v1, 0x2

    new-array v1, v1, [I

    .line 450
    invoke-interface {p1, v7, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    const/16 v1, 0x9

    new-array v3, v1, [I

    .line 453
    fill-array-data v3, :array_0

    const/16 v1, 0xa

    new-array v4, v1, [Ljavax/microedition/khronos/egl/EGLConfig;

    const/4 v8, 0x1

    new-array v9, v8, [I

    const/16 v5, 0xa

    move-object v1, p1

    move-object v2, v7

    move-object v6, v9

    .line 464
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 465
    invoke-interface {p1, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 466
    aget p1, v9, v0

    if-lez p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :array_0
    .array-data 4
        0x3024
        0x4
        0x3023
        0x4
        0x3022
        0x4
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method private dumpEvent(Landroid/view/MotionEvent;)V
    .locals 9

    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "DOWN"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "UP"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v3, "MOVE"

    aput-object v3, v0, v1

    const/4 v1, 0x3

    const-string v3, "CANCEL"

    aput-object v3, v0, v1

    const/4 v1, 0x4

    const-string v3, "OUTSIDE"

    aput-object v3, v0, v1

    const-string v1, "POINTER_DOWN"

    const/4 v3, 0x5

    aput-object v1, v0, v3

    const-string v1, "POINTER_UP"

    const/4 v4, 0x6

    aput-object v1, v0, v4

    const/4 v1, 0x7

    const-string v5, "7?"

    aput-object v5, v0, v1

    const-string v1, "8?"

    const/16 v5, 0x8

    aput-object v1, v0, v5

    const/16 v1, 0x9

    const-string v6, "9?"

    aput-object v6, v0, v1

    .line 555
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 556
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    and-int/lit16 v7, v6, 0xff

    const-string v8, "event ACTION_"

    .line 558
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v0, v0, v7

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(pid "

    if-eq v7, v3, :cond_0

    if-ne v7, v4, :cond_1

    .line 561
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shr-int/lit8 v3, v6, 0x8

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    .line 563
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v3, "["

    .line 565
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_3

    const-string v3, "#"

    .line 567
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 568
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")="

    .line 569
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ","

    .line 570
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    .line 571
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    const-string v3, ";"

    .line 572
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    const-string p1, "]"

    .line 574
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "yoyo"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 400
    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 401
    aget p1, v0, p1

    return p1

    :cond_0
    return p5
.end method

.method private generateConfigSortKey(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Z)I
    .locals 10

    const/16 v4, 0x3020

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 408
    invoke-direct/range {v0 .. v5}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    const/16 v5, 0x3025

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 409
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v1

    const/16 v6, 0x3026

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 410
    invoke-direct/range {v2 .. v7}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    const/16 v7, 0x3027

    const/4 v8, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    .line 411
    invoke-direct/range {v3 .. v8}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v3

    const/16 v8, 0x3032

    const/4 v9, 0x0

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    .line 412
    invoke-direct/range {v4 .. v9}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result p1

    const/16 p2, 0x3038

    const/4 p3, 0x1

    if-eq v3, p2, :cond_1

    const/16 p2, 0x3050

    if-eq v3, p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x2

    :goto_0
    shl-int/lit8 p2, p2, 0x18

    rsub-int/lit8 p1, p1, 0x20

    shl-int/lit8 p1, p1, 0x12

    or-int/2addr p1, p2

    shl-int/lit8 p2, v0, 0xc

    or-int/2addr p1, p2

    shl-int/lit8 p2, v1, 0x6

    or-int/2addr p1, p2

    or-int/2addr p1, v2

    if-ne p4, p3, :cond_2

    const/16 p2, 0x10

    if-le v0, p2, :cond_2

    const/4 p1, -0x1

    :cond_2
    return p1
.end method

.method private printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljava/lang/String;
    .locals 17

    const/16 v4, 0x3028

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 349
    invoke-direct/range {v0 .. v5}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    const/16 v5, 0x3024

    const/4 v6, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 350
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v1

    const/16 v6, 0x3023

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    .line 351
    invoke-direct/range {v2 .. v7}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    const/16 v7, 0x3022

    const/4 v8, 0x0

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    .line 352
    invoke-direct/range {v3 .. v8}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v3

    const/16 v8, 0x3021

    const/4 v9, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    .line 353
    invoke-direct/range {v4 .. v9}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v4

    const/16 v9, 0x3025

    const/4 v10, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    .line 354
    invoke-direct/range {v5 .. v10}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v5

    const/16 v10, 0x3026

    const/4 v11, 0x0

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    .line 355
    invoke-direct/range {v6 .. v11}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v6

    .line 366
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v9, 0x7

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v10, 0x0

    aput-object v0, v9, v10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v9, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v9, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x3

    aput-object v0, v9, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x4

    aput-object v0, v9, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x5

    aput-object v0, v9, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x6

    aput-object v0, v9, v2

    const-string v0, "EGLConfig %d: rgba=%d%d%d%d depth=%d stencil=%d"

    invoke-static {v8, v0, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " EGL_ALPHA_MASK_SIZE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v15, 0x303e

    const/16 v16, 0x0

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    .line 367
    invoke-direct/range {v11 .. v16}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_BUFFER_SIZE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v15, 0x3020

    .line 370
    invoke-direct/range {v11 .. v16}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_COLOR_BUFFER_TYPE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v15, 0x303f

    .line 371
    invoke-direct/range {v11 .. v16}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v1, v1, [Ljava/lang/Object;

    const/16 v15, 0x3027

    .line 372
    invoke-direct/range {v11 .. v16}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v10

    const-string v2, " EGL_CONFIG_CAVEAT=0x%04x"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " EGL_LEVEL="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3029

    const/4 v6, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 374
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_LUMINANCE_SIZE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x303d

    .line 375
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_MAX_PBUFFER_WIDTH="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x302c

    .line 376
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_MAX_PBUFFER_HEIGHT="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x302a

    .line 377
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " EGL_MAX_PBUFFER_PIXELS="

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v12, 0x302b

    const/4 v13, 0x0

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v11, p3

    .line 378
    invoke-direct/range {v8 .. v13}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v12, 0x302a

    .line 381
    invoke-direct/range {v8 .. v13}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    invoke-direct/range {v8 .. v13}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_NATIVE_RENDERABLE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x302d

    move-object/from16 v1, p0

    .line 383
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_NATIVE_VISUAL_TYPE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x302f

    .line 384
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_RENDERABLE_TYPE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3040

    .line 385
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_SAMPLE_BUFFERS="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3032

    .line 386
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_SAMPLES="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3031

    .line 387
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_SURFACE_TYPE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3033

    .line 388
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_TRANSPARENT_TYPE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3034

    .line 389
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_TRANSPARENT_RED_VALUE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3037

    .line 390
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_TRANSPARENT_GREEN_VALUE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3036

    .line 391
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " EGL_TRANSPARENT_BLUE_VALUE="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3035

    .line 392
    invoke-direct/range {v1 .. v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    const-string v9, "yoyo"

    const-string v1, "chooseConfig"

    .line 49
    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x1

    new-array v11, v10, [I

    const/4 v12, 0x0

    aput v12, v11, v12

    const/16 v1, 0xb

    new-array v13, v1, [I

    const/16 v1, 0x3024

    aput v1, v13, v12

    const/4 v1, 0x5

    aput v1, v13, v10

    const/16 v2, 0x3023

    const/4 v14, 0x2

    aput v2, v13, v14

    const/4 v15, 0x3

    const/4 v2, 0x6

    aput v2, v13, v15

    const/16 v3, 0x3022

    const/4 v4, 0x4

    aput v3, v13, v4

    aput v1, v13, v1

    const/16 v1, 0x3025

    aput v1, v13, v2

    const/4 v1, 0x7

    const/16 v2, 0x10

    aput v2, v13, v1

    const/16 v1, 0x8

    const/16 v2, 0x3040

    aput v2, v13, v1

    .line 73
    sget v1, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_usingGL2:I

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    const/16 v6, 0x9

    aput v4, v13, v6

    const/16 v1, 0xa

    const/16 v16, 0x3038

    aput v16, v13, v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    const/16 v14, 0x9

    move-object v6, v11

    .line 82
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 83
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    const-string v6, "No EGL configs match our minimum required spec"

    const/16 v5, 0x3000

    if-eq v5, v1, :cond_2

    .line 85
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error choosing original minspec EGL config : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-array v13, v14, [I

    .line 87
    fill-array-data v13, :array_0

    const/4 v4, 0x0

    const/4 v14, 0x0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    const/16 v10, 0x3000

    move v5, v14

    move-object v14, v6

    move-object v6, v11

    .line 94
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 95
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    if-ne v10, v1, :cond_1

    goto :goto_1

    .line 97
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Still an error choosing cutdown minspec EGL config : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    move-object v14, v6

    const/16 v10, 0x3000

    :goto_1
    move-object v3, v13

    .line 103
    aget v1, v11, v12

    if-lez v1, :cond_1e

    .line 109
    aget v13, v11, v12

    .line 110
    new-array v14, v13, [Ljavax/microedition/khronos/egl/EGLConfig;

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v4, v14

    move v5, v13

    move-object v6, v11

    .line 111
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 112
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    if-eq v10, v1, :cond_3

    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error fetching EGL configs : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    const/16 v1, 0x3098

    new-array v2, v15, [I

    aput v1, v2, v12

    .line 119
    sget v1, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_usingGL2:I

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    const/16 v17, 0x2

    goto :goto_2

    :cond_4
    const/4 v1, 0x1

    const/16 v17, 0x1

    :goto_2
    aput v17, v2, v1

    const/4 v1, 0x2

    aput v16, v2, v1

    .line 125
    aget-object v1, v14, v12

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v7, v8, v1, v3, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    .line 126
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v3

    const/16 v4, 0x3004

    const/4 v5, 0x0

    if-ne v4, v3, :cond_5

    const-string v1, "Bad Attrib on eglCreateContext... using empty attrib_list"

    .line 129
    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    aget-object v1, v14, v12

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v7, v8, v1, v2, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    .line 132
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v3

    move-object v2, v5

    :cond_5
    if-ne v3, v10, :cond_b

    if-eqz v1, :cond_b

    .line 135
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v1, v4, :cond_b

    .line 137
    aget-object v3, v14, v12

    invoke-virtual/range {p0 .. p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v4

    invoke-interface {v7, v8, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    if-eqz v3, :cond_9

    .line 139
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v3, v4, :cond_6

    goto :goto_5

    .line 152
    :cond_6
    invoke-interface {v7, v8, v3, v3, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "EGLHelper"

    const-string v6, "eglMakeCurrent broke"

    .line 157
    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x1

    goto :goto_4

    .line 162
    :cond_7
    invoke-virtual {v1}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v4

    .line 163
    instance-of v6, v4, Ljavax/microedition/khronos/opengles/GL10;

    if-eqz v6, :cond_8

    .line 165
    check-cast v4, Ljavax/microedition/khronos/opengles/GL10;

    const/16 v6, 0x1f03

    .line 167
    invoke-interface {v4, v6}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v4

    .line 168
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "OpenGL ES Extensions : "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "GL_OES_rgb8_rgba8"

    .line 171
    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v6, 0x1

    if-ne v4, v6, :cond_8

    const-string v4, "Device supports 32bit display formats"

    .line 174
    invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x0

    goto :goto_3

    :cond_8
    const/4 v4, 0x1

    .line 180
    :goto_3
    sget-object v6, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v15, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v7, v8, v6, v11, v15}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 186
    :goto_4
    invoke-interface {v7, v8, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    goto :goto_6

    .line 140
    :cond_9
    :goto_5
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v3

    if-eq v3, v10, :cond_a

    const-string v3, "window surface can\'t be created"

    .line 143
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    const/4 v4, 0x1

    .line 190
    :goto_6
    invoke-interface {v7, v8, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move v1, v4

    goto :goto_8

    .line 193
    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not create test "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_usingGL2:I

    if-eqz v4, :cond_c

    const-string v4, "GL2"

    goto :goto_7

    :cond_c
    const-string v4, "GL1"

    :goto_7
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "context. EGLError: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    .line 197
    :goto_8
    iget-object v3, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    if-eqz v3, :cond_e

    instance-of v4, v3, Lcom/ESG/MobileByMuBai/RunnerActivity;

    if-eqz v4, :cond_e

    check-cast v3, Lcom/ESG/MobileByMuBai/RunnerActivity;

    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz v3, :cond_e

    .line 199
    iget-object v3, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    check-cast v3, Lcom/ESG/MobileByMuBai/RunnerActivity;

    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v4, "YYUse24Bit"

    invoke-virtual {v3, v4}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_d

    const-string v3, "24 bit colour depth allowed"

    .line 202
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :cond_d
    const-string v1, "16 bit colour depth forced"

    .line 207
    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    goto :goto_9

    :cond_e
    const/4 v4, 0x1

    .line 213
    iget-object v3, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    if-nez v3, :cond_f

    const-string v3, "Context NULL"

    .line 215
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_f
    iget-object v3, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    instance-of v3, v3, Lcom/ESG/MobileByMuBai/RunnerActivity;

    if-nez v3, :cond_10

    const-string v3, "Context not RunnerActivity"

    .line 220
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :cond_10
    iget-object v3, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->m_context:Landroid/content/Context;

    check-cast v3, Lcom/ESG/MobileByMuBai/RunnerActivity;

    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-nez v3, :cond_11

    const-string v3, "mYYPrefs null"

    .line 225
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_11
    :goto_9
    new-array v3, v13, [I

    const/4 v6, 0x0

    :goto_a
    if-ge v6, v13, :cond_12

    .line 235
    aget-object v11, v14, v6

    invoke-direct {v0, v7, v8, v11, v1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->generateConfigSortKey(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Z)I

    move-result v11

    aput v11, v3, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    :cond_12
    const/4 v1, 0x0

    :cond_13
    if-nez v1, :cond_15

    const/4 v1, 0x1

    const/4 v6, 0x0

    :goto_b
    add-int/lit8 v11, v13, -0x1

    if-ge v6, v11, :cond_13

    .line 248
    aget v11, v3, v6

    add-int/lit8 v15, v6, 0x1

    aget v4, v3, v15

    if-ge v11, v4, :cond_14

    .line 253
    aget-object v1, v14, v6

    .line 254
    aget-object v4, v14, v15

    aput-object v4, v14, v6

    .line 255
    aput-object v1, v14, v15

    .line 257
    aget v1, v3, v6

    .line 258
    aget v4, v3, v15

    aput v4, v3, v6

    .line 259
    aput v1, v3, v15

    const/4 v1, 0x0

    :cond_14
    move v6, v15

    const/4 v4, 0x1

    goto :goto_b

    :cond_15
    const/4 v1, -0x1

    const/4 v3, -0x1

    :goto_c
    if-ge v12, v13, :cond_1c

    .line 278
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Trying EGL config : "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v14, v12

    invoke-direct {v0, v7, v8, v6}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    aget-object v4, v14, v12

    sget-object v6, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v7, v8, v4, v6, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v4

    .line 281
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v6

    if-ne v6, v10, :cond_1a

    if-eqz v4, :cond_1a

    .line 282
    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v4, v11, :cond_1a

    .line 287
    aget-object v6, v14, v12

    invoke-virtual/range {p0 .. p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v11

    invoke-interface {v7, v8, v6, v11, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v6

    if-eqz v6, :cond_18

    .line 289
    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v6, v11, :cond_16

    goto :goto_e

    .line 304
    :cond_16
    invoke-interface {v7, v8, v6, v6, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v11

    if-nez v11, :cond_17

    const-string v11, "eglMakeCurrent failed - can\'t use this mode"

    .line 306
    invoke-static {v9, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    :cond_17
    const-string v3, "Selected EGL config working"

    .line 311
    invoke-static {v9, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v15, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v7, v8, v3, v11, v15}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move v3, v12

    .line 322
    :goto_d
    invoke-interface {v7, v8, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    goto :goto_f

    .line 290
    :cond_18
    :goto_e
    invoke-interface/range {p1 .. p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v6

    if-eq v6, v10, :cond_19

    const-string v6, "Surface can\'t be created - can\'t use this mode"

    .line 293
    invoke-static {v9, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    :cond_19
    :goto_f
    invoke-interface {v7, v8, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    goto :goto_10

    .line 330
    :cond_1a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Selected EGL config failed: "

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_10
    if-eq v3, v1, :cond_1b

    goto :goto_11

    :cond_1b
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_c

    :cond_1c
    :goto_11
    if-eq v3, v1, :cond_1d

    .line 340
    aget-object v1, v14, v3

    return-object v1

    .line 343
    :cond_1d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No valid EGL configs match our minimum required spec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_1e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_13

    :goto_12
    throw v1

    :goto_13
    goto :goto_12

    nop

    :array_0
    .array-data 4
        0x3024
        0x5
        0x3023
        0x6
        0x3022
        0x5
        0x3025
        0x10
        0x3038
    .end array-data
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 580
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 582
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 584
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v1, v1, v0

    instance-of v1, v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v1, :cond_0

    .line 586
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 593
    :cond_1
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 620
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 622
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 624
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v2, v2, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 626
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v2, v2, v0

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 633
    :cond_1
    sget-boolean v0, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    return v2

    .line 641
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v3, v0, 0xff

    const/4 v4, 0x6

    if-ne v3, v4, :cond_3

    .line 645
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->performClick()Z

    .line 647
    :cond_3
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 649
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    const/4 v6, 0x5

    if-eq v3, v6, :cond_5

    if-ne v3, v4, :cond_4

    goto :goto_2

    .line 665
    :cond_4
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-static {v3, v5, v6, v7}, Lcom/yoyogames/runner/RunnerJNILib;->TouchEvent(IIFF)V

    goto :goto_3

    :cond_5
    :goto_2
    const v6, 0xff00

    and-int/2addr v6, v0

    shr-int/lit8 v6, v6, 0x8

    if-ne v6, v1, :cond_6

    .line 657
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-static {v3, v5, v6, v7}, Lcom/yoyogames/runner/RunnerJNILib;->TouchEvent(IIFF)V

    goto :goto_3

    :cond_6
    const/4 v6, 0x2

    .line 661
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    invoke-static {v6, v5, v7, v8}, Lcom/yoyogames/runner/RunnerJNILib;->TouchEvent(IIFF)V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 669
    :cond_7
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    iget-object p1, p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    if-nez p1, :cond_8

    const-wide/16 v0, 0x10

    .line 673
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p1

    .line 677
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_8
    :goto_4
    return v2
.end method

.method public performClick()Z
    .locals 3

    .line 599
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->performClick()Z

    .line 601
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 603
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 605
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v2, v2, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 607
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v2, v2, v0

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2}, Lcom/ESG/MobileByMuBai/IExtensionBase;->performClick()Z

    move-result v2

    if-eqz v2, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method
