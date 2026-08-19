.class public Lcom/example/mygame/DemoRenderer;
.super Ljava/lang/Object;
.source "DemoRenderer.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/mygame/DemoRenderer$eState;
    }
.end annotation


# static fields
.field public static volatile elapsedVsyncs:I = -0x1

.field public static final kGameAssetsDROID:Ljava/lang/String; = "GameAssetsDROID.zip"

.field public static m_apkFilePath:Ljava/lang/String; = null

.field public static m_defaultFrameBuffer:I = -0x1

.field public static m_saveFilesDir:Ljava/lang/String;

.field public static m_state:Lcom/example/mygame/DemoRenderer$eState;

.field public static ms_displayedLoadLibraryFailed:Z

.field public static volatile waiterObject:Ljava/lang/Object;


# instance fields
.field private localeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end field

.field public m_RequestedPermissions:Z

.field private m_SplashFillColour:I

.field private m_SplashFillMode:I

.field private m_context:Landroid/content/Context;

.field private m_height:I

.field private m_packageName:Ljava/lang/String;

.field public m_pauseRunner:Z

.field public m_refreshRate:F

.field public m_renderCount:I

.field private m_texHeight:I

.field private m_texRawHeight:I

.field private m_texRawWidth:I

.field private m_texWidth:I

.field private m_width:I

.field private splashEndTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    .line 95
    iput v0, p0, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    .line 97
    iput-boolean v0, p0, Lcom/example/mygame/DemoRenderer;->m_RequestedPermissions:Z

    .line 102
    iput-boolean v0, p0, Lcom/example/mygame/DemoRenderer;->m_pauseRunner:Z

    const-wide/16 v1, 0x0

    .line 105
    iput-wide v1, p0, Lcom/example/mygame/DemoRenderer;->splashEndTime:J

    const/high16 v1, 0x42700000    # 60.0f

    .line 107
    iput v1, p0, Lcom/example/mygame/DemoRenderer;->m_refreshRate:F

    .line 137
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sput-object v1, Lcom/example/mygame/DemoRenderer;->waiterObject:Ljava/lang/Object;

    .line 138
    iput-object p1, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    .line 139
    sget-object p1, Lcom/example/mygame/DemoRenderer$eState;->Startup:Lcom/example/mygame/DemoRenderer$eState;

    sput-object p1, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    .line 140
    iput v0, p0, Lcom/example/mygame/DemoRenderer;->m_renderCount:I

    .line 141
    iget-object p1, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/example/mygame/DemoRenderer;->m_packageName:Ljava/lang/String;

    return-void
.end method

.method public static WaitForVsync()V
    .locals 8

    .line 323
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 324
    sget v2, Lcom/example/mygame/DemoRenderer;->elapsedVsyncs:I

    .line 325
    :cond_0
    sget v3, Lcom/example/mygame/DemoRenderer;->elapsedVsyncs:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    sget v3, Lcom/example/mygame/DemoRenderer;->elapsedVsyncs:I

    if-ne v2, v3, :cond_1

    .line 327
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v0

    const-wide/32 v5, 0x5f5e100

    cmp-long v7, v3, v5

    if-lez v7, :cond_0

    const-string v0, "yoyo"

    const-string v1, "vsync timeout..."

    .line 331
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method private getNextPow2(I)I
    .locals 1

    add-int/lit8 p1, p1, -0x1

    shr-int/lit8 v0, p1, 0x1

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x2

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x4

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x8

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x10

    or-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    if-nez p1, :cond_0

    add-int/lit8 p1, p1, 0x1

    :cond_0
    return p1
.end method

.method private initCountryCodeMapping()V
    .locals 7

    .line 112
    invoke-static {}, Ljava/util/Locale;->getISOCountries()[Ljava/lang/String;

    move-result-object v0

    .line 113
    new-instance v1, Ljava/util/HashMap;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/example/mygame/DemoRenderer;->localeMap:Ljava/util/Map;

    .line 114
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 115
    new-instance v4, Ljava/util/Locale;

    const-string v5, ""

    invoke-direct {v4, v5, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v3, p0, Lcom/example/mygame/DemoRenderer;->localeMap:Ljava/util/Map;

    invoke-virtual {v4}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private iso3CountryCodeToIso2CountryCode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->localeMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 122
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method


# virtual methods
.method public getResourceAsReader(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 146
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    :try_start_0
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 149
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 153
    :catch_0
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "Exception while getting Resource"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public getScreenOrientation()I
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    return v0
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 358
    sget-boolean v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    .line 359
    sget-boolean v0, Lcom/example/mygame/DemoRenderer;->ms_displayedLoadLibraryFailed:Z

    if-nez v0, :cond_0

    .line 360
    sput-boolean v3, Lcom/example/mygame/DemoRenderer;->ms_displayedLoadLibraryFailed:Z

    .line 361
    sget-object v0, Lcom/example/mygame/RunnerActivity;->ViewHandler:Landroid/os/Handler;

    new-instance v2, Lcom/example/mygame/DemoRenderer$1;

    invoke-direct {v2, v1}, Lcom/example/mygame/DemoRenderer$1;-><init>(Lcom/example/mygame/DemoRenderer;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void

    .line 382
    :cond_1
    iget-boolean v2, v1, Lcom/example/mygame/DemoRenderer;->m_pauseRunner:Z

    const-string v4, "yoyo"

    if-eqz v2, :cond_2

    const-wide/16 v2, 0x64

    .line 384
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v2, v0

    const-string v0, "Paused runner has thrown an exception!"

    .line 386
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    return-void

    .line 392
    :cond_2
    sget-object v2, Lcom/example/mygame/DemoRenderer$3;->$SwitchMap$com$yuhang$upe$DemoRenderer$eState:[I

    sget-object v5, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    invoke-virtual {v5}, Lcom/example/mygame/DemoRenderer$eState;->ordinal()I

    move-result v5

    aget v2, v2, v5

    const/4 v5, 0x0

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_5

    .line 488
    :pswitch_0
    sget-boolean v0, Lcom/yoyogames/runner/RunnerJNILib;->ms_exitcalled:Z

    if-nez v0, :cond_9

    .line 491
    sget-boolean v0, Lcom/example/mygame/RunnerActivity;->XPeriaPlay:Z

    const/4 v2, 0x2

    if-eqz v0, :cond_3

    iget-object v0, v1, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->navigation:I

    if-ne v0, v2, :cond_3

    iget-object v0, v1, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    .line 492
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->navigationHidden:I

    if-ne v0, v3, :cond_3

    const/4 v5, 0x1

    .line 497
    :cond_3
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerActivity;->getRefreshRate()F

    move-result v0

    iput v0, v1, Lcom/example/mygame/DemoRenderer;->m_refreshRate:F

    .line 500
    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    sget v8, Lcom/example/mygame/RunnerActivity;->AccelX:F

    sget v9, Lcom/example/mygame/RunnerActivity;->AccelY:F

    sget v10, Lcom/example/mygame/RunnerActivity;->AccelZ:F

    sget v12, Lcom/example/mygame/RunnerActivity;->Orientation:I

    iget v13, v1, Lcom/example/mygame/DemoRenderer;->m_refreshRate:F

    move v11, v5

    invoke-static/range {v6 .. v13}, Lcom/yoyogames/runner/RunnerJNILib;->Process(IIFFFIIF)I

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "RunnerJNILib.Process returned 0"

    .line 503
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->ExitApplication()V

    goto :goto_1

    :cond_4
    if-ne v0, v2, :cond_5

    const-string v0, "RunnerJNILib.Process has returned that it is due to restart"

    .line 508
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->Startup:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    .line 510
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    sput-boolean v3, Lcom/example/mygame/RunnerActivity;->HasRestarted:Z

    .line 513
    :cond_5
    :goto_1
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->canFlip()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    sget-object v6, Lcom/example/mygame/DemoRenderer$eState;->Process:Lcom/example/mygame/DemoRenderer$eState;

    if-eq v0, v6, :cond_3

    goto/16 :goto_5

    :pswitch_1
    new-array v2, v3, [I

    .line 474
    invoke-interface {v0, v3, v2, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDeleteTextures(I[II)V

    .line 475
    sget-object v0, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    if-nez v0, :cond_6

    .line 476
    sget-object v0, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    sget-object v2, Lcom/example/mygame/DemoRenderer;->m_saveFilesDir:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/mygame/DemoRenderer;->m_packageName:Ljava/lang/String;

    sget-boolean v6, Lcom/example/mygame/RunnerActivity;->UseDynamicAssetDelivery:Z

    invoke-static {v0, v2, v4, v5, v6}, Lcom/yoyogames/runner/RunnerJNILib;->Startup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    goto :goto_2

    .line 479
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sleepmargin: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    const-string v5, "SleepMargin"

    invoke-virtual {v2, v5}, Lcom/example/mygame/IniBundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    sget-object v0, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    sget-object v2, Lcom/example/mygame/DemoRenderer;->m_saveFilesDir:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/mygame/DemoRenderer;->m_packageName:Ljava/lang/String;

    sget-object v6, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    invoke-virtual {v6, v5}, Lcom/example/mygame/IniBundle;->getInt(Ljava/lang/String;)I

    move-result v5

    sget-boolean v6, Lcom/example/mygame/RunnerActivity;->UseDynamicAssetDelivery:Z

    invoke-static {v0, v2, v4, v5, v6}, Lcom/yoyogames/runner/RunnerJNILib;->Startup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 482
    :goto_2
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->Process:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    goto/16 :goto_5

    .line 465
    :pswitch_2
    iget v4, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v5, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v8, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v9, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v10, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v11, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    invoke-static/range {v4 .. v11}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    .line 466
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 467
    iget-wide v6, v1, Lcom/example/mygame/DemoRenderer;->splashEndTime:J

    cmp-long v0, v4, v6

    if-ltz v0, :cond_9

    .line 468
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->DoStartup:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    goto/16 :goto_5

    .line 460
    :pswitch_3
    iget v4, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v5, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v8, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v9, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v10, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v11, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    invoke-static/range {v4 .. v11}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    goto/16 :goto_5

    .line 450
    :pswitch_4
    iget v12, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v13, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v14, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v15, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v0, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v2, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v4, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v5, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    move/from16 v16, v0

    move/from16 v17, v2

    move/from16 v18, v4

    move/from16 v19, v5

    invoke-static/range {v12 .. v19}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    .line 451
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->WaitForDoStartup:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    .line 452
    sget-object v0, Lcom/example/mygame/RunnerActivity;->ViewHandler:Landroid/os/Handler;

    new-instance v2, Lcom/example/mygame/DemoRenderer$2;

    invoke-direct {v2, v1}, Lcom/example/mygame/DemoRenderer$2;-><init>(Lcom/example/mygame/DemoRenderer;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_5

    .line 435
    :pswitch_5
    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v8, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v9, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v10, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v11, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v12, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v13, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    invoke-static/range {v6 .. v13}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    .line 436
    sget-boolean v0, Lcom/example/mygame/RunnerActivity;->APKExpansionFileReady:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    const-string v2, "PlayAPKExpansionExtension"

    const-string v6, "GetExpansionAPKFilename"

    .line 441
    invoke-static {v2, v6, v5, v0}, Lcom/yoyogames/runner/RunnerJNILib;->CallExtensionFunction(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 442
    check-cast v0, Ljava/lang/String;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    .line 444
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Download complete- path is:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->InitRunner:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    goto/16 :goto_5

    .line 420
    :pswitch_6
    iget v4, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v5, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v8, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v9, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v10, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v11, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    invoke-static/range {v4 .. v11}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    goto/16 :goto_5

    .line 400
    :pswitch_7
    sget-object v0, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    if-nez v0, :cond_7

    .line 402
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    add-long/2addr v5, v7

    iput-wide v5, v1, Lcom/example/mygame/DemoRenderer;->splashEndTime:J

    goto :goto_3

    .line 406
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget-object v0, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    const-string v2, "SplashscreenTime"

    invoke-virtual {v0, v2}, Lcom/example/mygame/IniBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v7, v0

    add-long/2addr v5, v7

    iput-wide v5, v1, Lcom/example/mygame/DemoRenderer;->splashEndTime:J

    .line 408
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State->Splash    time: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State->Splash endTime: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v1, Lcom/example/mygame/DemoRenderer;->splashEndTime:J

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    sget-boolean v0, Lcom/example/mygame/RunnerActivity;->UseAPKExpansionFile:Z

    if-eqz v0, :cond_8

    .line 411
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->APKExpansionDownload:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    const-string v0, "State->APKExpansionDownload"

    .line 412
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_8
    const-string v0, "State->InitRunner"

    .line 414
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->InitRunner:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    .line 417
    :goto_4
    iget v4, v1, Lcom/example/mygame/DemoRenderer;->m_width:I

    iget v5, v1, Lcom/example/mygame/DemoRenderer;->m_height:I

    iget v6, v1, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    iget v7, v1, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    iget v8, v1, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    iget v9, v1, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    iget v10, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    iget v11, v1, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    invoke-static/range {v4 .. v11}, Lcom/yoyogames/runner/RunnerJNILib;->RenderSplash(IIIIIIII)V

    goto :goto_5

    .line 394
    :pswitch_8
    sget-object v2, Lcom/example/mygame/DemoRenderer$eState;->Splash:Lcom/example/mygame/DemoRenderer$eState;

    sput-object v2, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    const-string v2, "State->Splash"

    .line 395
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    .line 396
    invoke-interface {v0, v2, v2, v2, v2}, Ljavax/microedition/khronos/opengles/GL10;->glClearColor(FFFF)V

    const/16 v2, 0x4000

    .line 397
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    .line 517
    :cond_9
    :goto_5
    iget v0, v1, Lcom/example/mygame/DemoRenderer;->m_renderCount:I

    sub-int/2addr v0, v3

    iput v0, v1, Lcom/example/mygame/DemoRenderer;->m_renderCount:I

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 1

    .line 315
    iput p2, p0, Lcom/example/mygame/DemoRenderer;->m_width:I

    .line 316
    iput p3, p0, Lcom/example/mygame/DemoRenderer;->m_height:I

    const/4 v0, 0x0

    .line 317
    invoke-interface {p1, v0, v0, p2, p3}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 318
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "onSurfaceChanged :: width="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/example/mygame/DemoRenderer;->m_width:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " height="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/example/mygame/DemoRenderer;->m_height:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 6

    .line 190
    sget-object p2, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->Startup:Lcom/example/mygame/DemoRenderer$eState;

    const-string v1, "yoyo"

    if-eq p2, v0, :cond_0

    .line 191
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "onSurfaceCreated() aborted on re-create, state is currently "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/example/mygame/DemoRenderer;->m_state:Lcom/example/mygame/DemoRenderer$eState;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 196
    :cond_0
    sget p2, Lcom/example/mygame/DemoRenderer;->m_defaultFrameBuffer:I

    const/4 v0, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p2, v0, :cond_1

    .line 198
    instance-of p2, p1, Ljavax/microedition/khronos/opengles/GL11;

    if-eqz p2, :cond_1

    .line 199
    invoke-static {v2}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object p2

    const v0, 0x8ca6

    .line 200
    invoke-interface {p1, v0, p2}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    .line 202
    invoke-virtual {p2, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result p2

    sput p2, Lcom/example/mygame/DemoRenderer;->m_defaultFrameBuffer:I

    .line 203
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Renderer instance is gl1.1, framebuffer object is: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lcom/example/mygame/DemoRenderer;->m_defaultFrameBuffer:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sput-object p2, Lcom/example/mygame/DemoRenderer;->m_saveFilesDir:Ljava/lang/String;

    const/4 p2, 0x0

    .line 212
    sput-object p2, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    .line 214
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :try_start_0
    const-string v4, "com.example.mygame"

    .line 216
    invoke-virtual {v0, v4, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    .line 222
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    sput-object v0, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "APK File Path :: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-array v0, v2, [I

    .line 228
    invoke-interface {p1, v2, v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glGenTextures(I[II)V

    .line 231
    aget v0, v0, v3

    const/16 v4, 0xde1

    invoke-interface {p1, v4, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/16 v0, 0x2801

    const/high16 v5, 0x46180000    # 9728.0f

    .line 233
    invoke-interface {p1, v4, v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    const/16 v0, 0x2800

    const v5, 0x46180400    # 9729.0f

    .line 234
    invoke-interface {p1, v4, v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 241
    iget-object p1, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    .line 242
    invoke-virtual {p1}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object p1

    .line 243
    iget v0, p1, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    const/high16 v5, 0x20000

    if-lt v0, v5, :cond_2

    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "OpenGL ES-2.0 is supported: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 247
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "OpenGL ES-CM 1.1 is supported: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    :goto_0
    invoke-virtual {p0}, Lcom/example/mygame/DemoRenderer;->getScreenOrientation()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    const-string p1, "splash.png"

    .line 253
    invoke-virtual {p0, p1}, Lcom/example/mygame/DemoRenderer;->getResourceAsReader(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_1

    :cond_3
    const-string p1, "portrait_splash.png"

    .line 255
    invoke-virtual {p0, p1}, Lcom/example/mygame/DemoRenderer;->getResourceAsReader(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    :goto_1
    if-eqz p1, :cond_5

    .line 261
    :try_start_1
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 262
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 263
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v5, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 264
    invoke-static {p1, p2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 265
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    .line 266
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/example/mygame/DemoRenderer;->m_texHeight:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    :catch_0
    nop

    .line 278
    :goto_2
    sget-object p1, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    if-eqz p1, :cond_4

    .line 280
    sget-object p1, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    const-string v1, "SplashscreenFill"

    invoke-virtual {p1, v1, v0}, Lcom/example/mygame/IniBundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/example/mygame/DemoRenderer;->m_SplashFillMode:I

    .line 281
    sget-object p1, Lcom/example/mygame/RunnerActivity;->mYYPrefs:Lcom/example/mygame/IniBundle;

    const-string v1, "YYLaunchScreenBackgroundColour"

    invoke-virtual {p1, v1}, Lcom/example/mygame/IniBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/example/mygame/DemoRenderer;->m_SplashFillColour:I

    .line 284
    :cond_4
    iget p1, p0, Lcom/example/mygame/DemoRenderer;->m_texWidth:I

    invoke-direct {p0, p1}, Lcom/example/mygame/DemoRenderer;->getNextPow2(I)I

    move-result p1

    iput p1, p0, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    .line 285
    iget p1, p0, Lcom/example/mygame/DemoRenderer;->m_texHeight:I

    invoke-direct {p0, p1}, Lcom/example/mygame/DemoRenderer;->getNextPow2(I)I

    move-result p1

    iput p1, p0, Lcom/example/mygame/DemoRenderer;->m_texRawHeight:I

    .line 288
    iget v1, p0, Lcom/example/mygame/DemoRenderer;->m_texRawWidth:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, p1, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 289
    invoke-static {v4, v3, p1, v3}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 290
    invoke-static {v4, v3, v3, v3, p2}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 291
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_3

    :catchall_0
    move-exception p2

    .line 271
    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 277
    :catch_1
    throw p2

    .line 295
    :cond_5
    :goto_3
    invoke-direct {p0}, Lcom/example/mygame/DemoRenderer;->initCountryCodeMapping()V

    .line 296
    sget-boolean p1, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    if-eqz p1, :cond_6

    return-void

    .line 299
    :cond_6
    sget-object p1, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerActivity;->isTablet()Z

    move-result p1

    const-string p2, ""

    invoke-static {v3, p1, p2}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    .line 300
    iget-object p1, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, v3, p1}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    .line 301
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v3, p1}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    const/4 p1, 0x3

    .line 302
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-static {p1, v0, p2}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    const/4 p1, 0x4

    .line 303
    iget-object v0, p0, Lcom/example/mygame/DemoRenderer;->m_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-static {p1, v0, p2}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    const/4 p1, 0x5

    .line 304
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    const/16 p1, 0x8

    .line 306
    :try_start_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/example/mygame/DemoRenderer;->iso3CountryCodeToIso2CountryCode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v3, p2}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V
    :try_end_4
    .catch Ljava/util/MissingResourceException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_4

    :catch_2
    const-string p2, "zz"

    .line 309
    invoke-static {p1, v3, p2}, Lcom/yoyogames/runner/RunnerJNILib;->SetKeyValue(IILjava/lang/String;)V

    :goto_4
    return-void

    :catch_3
    move-exception p1

    .line 219
    invoke-virtual {p1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 220
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Unable to locate assets, aborting..."

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
