.class public Lcom/ESG/MobileByMuBai/RunnerActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "RunnerActivity.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field public static APKExpansionFileReady:Z = false

.field public static AccelX:F = 0.0f

.field public static AccelY:F = 0.0f

.field public static AccelZ:F = 0.0f

.field public static AllowedOrientationMask:I = 0x0

.field public static final BASE64_PUBLIC_KEY:Ljava/lang/String; = ""

.field public static ConfigOrientation:I

.field public static CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

.field public static DefaultOrientation:I

.field public static DisplayHeight:I

.field public static DisplayWidth:I

.field public static FocusOverride:Z

.field public static HasFocus:Z

.field public static HasRestarted:Z

.field public static InputStringResult:Ljava/lang/String;

.field public static Orientation:I

.field public static final SALT:[B

.field public static SaveFilesDir:Ljava/lang/String;

.field public static ShowQuestionYesNo:I

.field public static UIVisibilityFlags:I

.field public static UseAPKExpansionFile:Z

.field public static UseDynamicAssetDelivery:Z

.field public static ViewHandler:Landroid/os/Handler;

.field public static XPeriaPlay:Z

.field public static mExtension:[Ljava/lang/Object;

.field private static mSetSystemUiVisibility:Ljava/lang/reflect/Method;

.field public static mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

.field public static m_versionName:Ljava/lang/String;


# instance fields
.field EVENT_OTHER_SYSTEM_EVENT:I

.field private mAccelerometer:Landroid/hardware/Sensor;

.field private mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

.field private mHandler:Landroid/os/Handler;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRestoreImmersiveModeHandler:Landroid/os/Handler;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mUpdateTimerTask:Ljava/lang/Runnable;

.field private m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

.field public mbAppSuspended:Z

.field private restoreImmersiveModeRunnable:Ljava/lang/Runnable;

.field public vsyncHandler:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x14

    new-array v0, v0, [B

    .line 67
    fill-array-data v0, :array_0

    sput-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->SALT:[B

    const/16 v0, 0x1706

    .line 69
    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->UIVisibilityFlags:I

    const/4 v0, 0x0

    .line 81
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->UseAPKExpansionFile:Z

    .line 82
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->APKExpansionFileReady:Z

    .line 84
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->UseDynamicAssetDelivery:Z

    .line 89
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->HasRestarted:Z

    .line 103
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->XPeriaPlay:Z

    const/4 v1, 0x0

    .line 105
    sput-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->SaveFilesDir:Ljava/lang/String;

    .line 106
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->FocusOverride:Z

    .line 107
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->HasFocus:Z

    const/16 v0, 0xf

    .line 110
    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->AllowedOrientationMask:I

    .line 124
    sput-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSetSystemUiVisibility:Ljava/lang/reflect/Method;

    return-void

    :array_0
    .array-data 1
        -0x5t
        0xct
        -0x44t
        0x7t
        -0xct
        0x43t
        0x3t
        0x4t
        0x4t
        0x13t
        0x6t
        0x7t
        0x10t
        0xbt
        0x9t
        0x33t
        0x47t
        0x22t
        0x13t
        0x10t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const/4 v0, 0x0

    .line 116
    iput-boolean v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mbAppSuspended:Z

    .line 126
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 128
    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    .line 130
    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    .line 139
    new-instance v0, Lcom/ESG/MobileByMuBai/RunnerActivity$1;

    invoke-direct {v0, p0}, Lcom/ESG/MobileByMuBai/RunnerActivity$1;-><init>(Lcom/ESG/MobileByMuBai/RunnerActivity;)V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mUpdateTimerTask:Ljava/lang/Runnable;

    .line 190
    new-instance v0, Lcom/ESG/MobileByMuBai/RunnerActivity$2;

    invoke-direct {v0, p0}, Lcom/ESG/MobileByMuBai/RunnerActivity$2;-><init>(Lcom/ESG/MobileByMuBai/RunnerActivity;)V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    const/16 v0, 0x4b

    .line 1201
    iput v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->EVENT_OTHER_SYSTEM_EVENT:I

    .line 1459
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mRestoreImmersiveModeHandler:Landroid/os/Handler;

    .line 1461
    new-instance v0, Lcom/ESG/MobileByMuBai/RunnerActivity$4;

    invoke-direct {v0, p0}, Lcom/ESG/MobileByMuBai/RunnerActivity$4;-><init>(Lcom/ESG/MobileByMuBai/RunnerActivity;)V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->restoreImmersiveModeRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private checkIsYoYoRunner()Z
    .locals 7

    const-string v0, "yoyo"

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1314
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "game.droid"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "#######!!!!!!! Checking for runner - found assets "

    .line 1317
    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1318
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const-string v3, "#######!!!!!!! Checking for runner - not found assets"

    .line 1322
    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v3, "#######!!!!!!! Checking for runner! failed"

    .line 1328
    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v3, 0x1

    :goto_1
    if-eqz v3, :cond_3

    .line 1349
    :try_start_1
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x80

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    .line 1350
    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v5, "IsBuiltAsYoYoRunner"

    .line 1351
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "YYDynamicAssetDelivery"

    .line 1352
    invoke-virtual {v4, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    const-string v6, "Yes"

    if-eqz v4, :cond_1

    .line 1354
    :try_start_2
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "Found DynamicAssetDelivery flag in manifest"

    .line 1356
    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1357
    sput-boolean v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->UseDynamicAssetDelivery:Z

    goto :goto_2

    :cond_1
    if-eqz v5, :cond_2

    .line 1360
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v1, "Found Runner flag in manifest, not using APK expansion"

    .line 1363
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v3

    goto :goto_2

    :cond_2
    const-string v4, "#######!!!!!!! using APK Expansion file"

    .line 1368
    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1370
    :try_start_3
    sput-boolean v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->UseAPKExpansionFile:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :goto_2
    move v3, v1

    goto :goto_4

    :catch_1
    move-exception v2

    move-object v1, v2

    const/4 v3, 0x0

    goto :goto_3

    :catch_2
    move-exception v1

    .line 1375
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while reading package meta data"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_4
    return v3
.end method

.method private checkXPeriaPlay()V
    .locals 5

    .line 1451
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "@@@@@@@ Build.Display = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " BRAND="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " DEVICE="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " MANUFACTURER="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " MODEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " PRODUCT="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1455
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v2, "Sony Ericsson"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "R800"

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->XPeriaPlay:Z

    .line 1456
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "@@@@@@@ XPeriaPlay="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v4, Lcom/ESG/MobileByMuBai/RunnerActivity;->XPeriaPlay:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " manufacturer="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " model="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private ourSetSystemUiVisibility(I)V
    .locals 5

    .line 1573
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSetSystemUiVisibility:Ljava/lang/reflect/Method;

    const-string v1, "yoyo"

    if-eqz v0, :cond_0

    .line 1575
    :try_start_0
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1578
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception while calling setSystemUiVisibility "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1582
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "!!!!Unable to do mSetSystemUiVisibility("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private replaceLanguageAndRegion(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, "%lang%"

    .line 1619
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "%region%"

    if-nez v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1620
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 1621
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1622
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method private setupExtensions()V
    .locals 8

    .line 1390
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_0

    return-void

    .line 1395
    :cond_0
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v1, "yoyo"

    if-nez v0, :cond_1

    const-string v0, "Unable to initialise extensions as preferences have not been loaded"

    .line 1397
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const-string v2, "YYNumExtensionClasses"

    .line 1401
    invoke-virtual {v0, v2}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_2

    .line 1404
    new-array v2, v0, [Ljava/lang/Object;

    sput-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    :cond_2
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_4

    .line 1408
    sget-object v4, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "YYExtensionClass"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ESG/MobileByMuBai/IniBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1411
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 1415
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "com.ESG.MobileByMuBai."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1416
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Attempting to initialise extension class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1417
    sget-object v6, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    new-array v7, v2, [Ljava/lang/Object;

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v6, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1422
    :try_start_1
    sget-object v5, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "Init"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    if-eqz v5, :cond_3

    const-string v6, "Method found, attempting to invoke Init"

    .line 1425
    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1426
    sget-object v6, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    aget-object v6, v6, v3

    new-array v7, v2, [Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v5

    .line 1431
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No Init method found on extension class:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " returned "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1432
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v4

    .line 1438
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception thrown attempting to create extension class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1439
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method


# virtual methods
.method public DoSetupIniFile(Ljava/lang/String;)Lcom/ESG/MobileByMuBai/IniBundle;
    .locals 7

    .line 395
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "File Path for INI:: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 401
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 402
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 404
    :try_start_1
    new-instance v3, Ljava/util/zip/ZipFile;

    invoke-direct {v3, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 405
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object p1

    .line 407
    :cond_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 408
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 410
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".ini"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_0

    .line 411
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "found INI file - "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    invoke-virtual {v3, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v0, p1

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object v2, v0

    .line 419
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while setting up Ini"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    :cond_1
    :goto_1
    new-instance p1, Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v1, "Android"

    invoke-direct {p1, v2, v0, v1}, Lcom/ESG/MobileByMuBai/IniBundle;-><init>(Landroid/os/Bundle;Ljava/io/InputStream;Ljava/lang/String;)V

    return-object p1
.end method

.method public GetGLView(Lcom/ESG/MobileByMuBai/RunnerVsyncHandler$Accessor;)Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;
    .locals 0

    .line 134
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 136
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    return-object p1
.end method

.method public GetKeyboardController()Lcom/ESG/MobileByMuBai/RunnerKeyboardController;
    .locals 2

    .line 1698
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    if-nez v0, :cond_0

    .line 1700
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 1701
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->ViewHandler:Landroid/os/Handler;

    invoke-static {p0, v0, v1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->Create(Landroid/content/Context;Landroid/view/View;Landroid/os/Handler;)Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    move-result-object v0

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    .line 1704
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    return-object v0
.end method

.method public GetOrientation()I
    .locals 4

    .line 1632
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x7

    if-le v0, v1, :cond_0

    .line 1633
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    goto :goto_0

    .line 1636
    :cond_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getOrientation()I

    move-result v0

    .line 1638
    :goto_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 1640
    iget v2, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    if-eqz v0, :cond_2

    if-eq v0, v3, :cond_2

    :cond_1
    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ne v1, v3, :cond_3

    if-eq v0, v3, :cond_2

    if-ne v0, v2, :cond_3

    :cond_2
    move v1, v0

    goto :goto_1

    :cond_3
    add-int/lit8 v1, v0, 0x1

    and-int/2addr v1, v2

    .line 1651
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "calculated orientation - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " from rotation "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "yoyo"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public RestrictOrientation(ZZZZZ)V
    .locals 4

    const-string v0, "yoyo"

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p5, :cond_5

    .line 532
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz p1, :cond_3

    const-string p1, "RestrictOrientation setting from YYPrefs"

    .line 534
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string p2, "OrientLandscape"

    invoke-virtual {p1, p2}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 536
    :goto_0
    sget-object p2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string p3, "OrientPortrait"

    invoke-virtual {p2, p3}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    .line 537
    :goto_1
    sget-object p3, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string p4, "OrientLandscapeFlipped"

    invoke-virtual {p3, p4}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result p3

    if-eqz p3, :cond_2

    const/4 p3, 0x1

    goto :goto_2

    :cond_2
    const/4 p3, 0x0

    .line 538
    :goto_2
    sget-object p4, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string p5, "OrientPortraitFlipped"

    invoke-virtual {p4, p5}, Lcom/ESG/MobileByMuBai/IniBundle;->getInt(Ljava/lang/String;)I

    move-result p4

    if-eqz p4, :cond_4

    const/4 p4, 0x1

    goto :goto_3

    :cond_3
    const/4 p1, 0x0

    const/4 p2, 0x0

    const/4 p3, 0x0

    :cond_4
    const/4 p4, 0x0

    .line 543
    :cond_5
    :goto_3
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RestrictOrientation(\""

    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "\", \""

    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "\")"

    invoke-virtual {p5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {v0, p5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p2, :cond_6

    const/4 p5, 0x2

    goto :goto_4

    :cond_6
    const/4 p5, 0x0

    :goto_4
    or-int/2addr p5, p1

    if-eqz p3, :cond_7

    const/4 v0, 0x4

    goto :goto_5

    :cond_7
    const/4 v0, 0x0

    :goto_5
    or-int/2addr p5, v0

    const/16 v0, 0x8

    if-eqz p4, :cond_8

    const/16 v3, 0x8

    goto :goto_6

    :cond_8
    const/4 v3, 0x0

    :goto_6
    or-int/2addr p5, v3

    .line 545
    sput p5, Lcom/ESG/MobileByMuBai/RunnerActivity;->AllowedOrientationMask:I

    if-eqz p1, :cond_9

    if-nez p2, :cond_9

    if-nez p3, :cond_9

    if-nez p4, :cond_9

    .line 549
    invoke-virtual {p0, v2}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto/16 :goto_7

    :cond_9
    if-nez p1, :cond_a

    if-eqz p2, :cond_a

    if-nez p3, :cond_a

    if-nez p4, :cond_a

    .line 553
    invoke-virtual {p0, v1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto/16 :goto_7

    :cond_a
    if-nez p1, :cond_b

    if-nez p2, :cond_b

    if-eqz p3, :cond_b

    if-nez p4, :cond_b

    .line 557
    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto :goto_7

    :cond_b
    if-nez p1, :cond_c

    if-nez p2, :cond_c

    if-nez p3, :cond_c

    if-eqz p4, :cond_c

    const/16 p1, 0x9

    .line 561
    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto :goto_7

    :cond_c
    if-eqz p1, :cond_d

    if-nez p2, :cond_d

    if-eqz p3, :cond_d

    if-eqz p4, :cond_f

    :cond_d
    if-eqz p1, :cond_e

    if-eqz p2, :cond_e

    if-eqz p3, :cond_e

    if-eqz p4, :cond_f

    :cond_e
    if-eqz p1, :cond_10

    if-nez p2, :cond_10

    if-eqz p3, :cond_10

    if-eqz p4, :cond_10

    :cond_f
    const/4 p1, 0x6

    .line 568
    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto :goto_7

    :cond_10
    if-nez p1, :cond_11

    if-eqz p2, :cond_11

    if-nez p3, :cond_11

    if-nez p4, :cond_13

    :cond_11
    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    if-nez p3, :cond_12

    if-nez p4, :cond_13

    :cond_12
    if-nez p1, :cond_14

    if-eqz p2, :cond_14

    if-eqz p3, :cond_14

    if-eqz p4, :cond_14

    :cond_13
    const/4 p1, 0x7

    .line 575
    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    goto :goto_7

    :cond_14
    const/4 p1, -0x1

    .line 578
    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setRequestedOrientation(I)V

    :goto_7
    return-void
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1279
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 1281
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 1283
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 1285
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1293
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const v1, 0x1000010

    if-eq v0, v1, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/16 v1, 0x401

    if-ne v0, v1, :cond_3

    .line 1295
    :cond_2
    invoke-static {p1}, Lcom/ESG/MobileByMuBai/Gamepad;->handleMotionEvent(Landroid/view/MotionEvent;)V

    .line 1298
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardGetStatus()Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    .line 1304
    :cond_3
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_4
    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3

    .line 1257
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 1259
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 1261
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 1263
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1270
    :cond_1
    invoke-static {p1}, Lcom/ESG/MobileByMuBai/Gamepad;->handleKeyEvent(Landroid/view/KeyEvent;)V

    .line 1272
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public doSetup(Ljava/lang/String;)V
    .locals 9

    .line 461
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "doSetup called - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-nez v0, :cond_2

    const/4 v0, 0x0

    .line 470
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 471
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 473
    :try_start_1
    new-instance v3, Ljava/util/zip/ZipFile;

    invoke-direct {v3, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 474
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object p1

    .line 476
    :cond_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 477
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 479
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".ini"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_0

    .line 480
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "found INI file - "

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    invoke-virtual {v3, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v0, p1

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move-object v2, v0

    .line 488
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while setting up Ini"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    :cond_1
    :goto_1
    new-instance p1, Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v1, "Android"

    invoke-direct {p1, v2, v0, v1}, Lcom/ESG/MobileByMuBai/IniBundle;-><init>(Landroid/os/Bundle;Ljava/io/InputStream;Ljava/lang/String;)V

    sput-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    .line 506
    :cond_2
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupExtensions()V

    .line 511
    invoke-static {}, Lcom/ESG/MobileByMuBai/Gamepad;->Initialise()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v3, p0

    .line 514
    invoke-virtual/range {v3 .. v8}, Lcom/ESG/MobileByMuBai/RunnerActivity;->RestrictOrientation(ZZZZZ)V

    .line 516
    sget-object p1, Lcom/ESG/MobileByMuBai/DemoRenderer$eState;->WaitOnTimer:Lcom/ESG/MobileByMuBai/DemoRenderer$eState;

    sput-object p1, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_state:Lcom/ESG/MobileByMuBai/DemoRenderer$eState;

    return-void
.end method

.method public getDeviceDefaultOrientation()I
    .locals 5

    const/4 v0, 0x1

    :try_start_0
    const-string v1, "android.view.Display"

    .line 1130
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getRotation"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    .line 1133
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    if-eqz v1, :cond_4

    const-string v1, "window"

    .line 1135
    invoke-virtual {p0, v1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 1137
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    .line 1138
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v1

    const/4 v3, 0x2

    if-eqz v1, :cond_0

    if-ne v1, v3, :cond_1

    .line 1140
    :cond_0
    iget v4, v2, Landroid/content/res/Configuration;->orientation:I

    if-eq v4, v3, :cond_3

    :cond_1
    if-eq v1, v0, :cond_2

    const/4 v4, 0x3

    if-ne v1, v4, :cond_4

    :cond_2
    iget v1, v2, Landroid/content/res/Configuration;->orientation:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v1, v0, :cond_4

    :cond_3
    return v3

    :catch_0
    move-exception v1

    .line 1149
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ERROR: Enumerating API level "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "yoyo"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return v0
.end method

.method public getRefreshRate()F
    .locals 2

    .line 1686
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    const/high16 v0, 0x42700000    # 60.0f

    :cond_0
    return v0
.end method

.method public isTablet()Z
    .locals 6

    const/4 v0, 0x0

    .line 177
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 178
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    iget v3, v1, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v2, v3

    .line 179
    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    iget v1, v1, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v3, v1

    mul-float v2, v2, v2

    mul-float v3, v3, v3

    add-float/2addr v2, v3

    float-to-double v1, v2

    .line 180
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/high16 v3, 0x4018000000000000L    # 6.0

    cmpl-double v5, v1, v3

    if-ltz v5, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catchall_0
    const-string v1, "yoyo"

    const-string v2, "Failed to compute screen size"

    .line 183
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1174
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Got activity result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1177
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1179
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 1181
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 1183
    aget-object v3, v2, v0

    instance-of v3, v3, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v3, :cond_0

    .line 1184
    aget-object v2, v2, v0

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2, p1, p2, p3}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1191
    :cond_1
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 1192
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    const-string p1, "End Got activity result"

    .line 1195
    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4

    .line 1657
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1659
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->GetOrientation()I

    move-result v0

    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->Orientation:I

    .line 1662
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->GetKeyboardController()Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1665
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 1666
    :goto_0
    invoke-virtual {v0, v3}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->SetPhysicalKeyboardConnected(Z)V

    .line 1670
    :cond_1
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_3

    .line 1672
    :goto_1
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 1674
    aget-object v2, v0, v1

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_2

    .line 1675
    aget-object v0, v0, v1

    check-cast v0, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v0, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8

    const/4 v0, 0x1

    .line 221
    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->requestWindowFeature(I)Z

    .line 222
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    sput-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->ViewHandler:Landroid/os/Handler;

    const-string v1, "yoyo"

    const-string v2, "onCreate"

    .line 223
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 227
    invoke-static {p0}, Lcom/yoyogames/runner/RunnerJNILib;->Init(Landroid/content/Context;)V

    .line 229
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->checkIsYoYoRunner()Z

    const/4 p1, 0x0

    .line 234
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const-string v3, "1.0.xxx"

    .line 238
    sput-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_versionName:Ljava/lang/String;

    .line 239
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_versionName:Ljava/lang/String;

    sput-object v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_versionName:Ljava/lang/String;

    .line 242
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "###@@@@!!!~~~~###### versionName - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_versionName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    if-eqz v2, :cond_1

    if-eq v2, v0, :cond_0

    .line 249
    sput p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->Orientation:I

    goto :goto_1

    .line 252
    :cond_0
    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->Orientation:I

    goto :goto_1

    .line 255
    :cond_1
    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->Orientation:I

    .line 260
    :goto_1
    sput-object p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    .line 263
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 264
    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    move-result v3

    sput v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->DisplayWidth:I

    .line 265
    invoke-virtual {v2}, Landroid/view/Display;->getHeight()I

    move-result v2

    sput v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->DisplayHeight:I

    const-string v2, "sensor"

    .line 270
    invoke-virtual {p0, v2}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/SensorManager;

    iput-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSensorManager:Landroid/hardware/SensorManager;

    .line 271
    invoke-virtual {v2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    iput-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mAccelerometer:Landroid/hardware/Sensor;

    .line 273
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getDeviceDefaultOrientation()I

    move-result v2

    sput v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->DefaultOrientation:I

    .line 274
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "###@@@@!!!~~~~###### default orientation - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->DefaultOrientation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupIniFile()V

    .line 278
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupExtensions()V

    .line 284
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->checkXPeriaPlay()V

    const-string v2, "GooglePlayLicensingAsExt"

    const-string v3, "checkLicensing"

    const/4 v4, 0x0

    .line 287
    invoke-static {v2, v3, p1, v4}, Lcom/yoyogames/runner/RunnerJNILib;->CallExtensionFunction(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "!!!!!!! Checking if APK Expansion file required..."

    .line 293
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    sget-boolean v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->UseAPKExpansionFile:Z

    const-string v3, "PlayAPKExpansionExtension"

    if-eqz v2, :cond_2

    const-string v2, "StartAPKExpansionDownload"

    .line 297
    invoke-static {v3, v2, p1, v4}, Lcom/yoyogames/runner/RunnerJNILib;->CallExtensionFunction(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 300
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    if-eqz v2, :cond_3

    .line 305
    sget-boolean v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->HasRestarted:Z

    if-nez v2, :cond_3

    const-string v2, "setupDownloadView"

    .line 308
    invoke-static {v3, v2, p1, v4}, Lcom/yoyogames/runner/RunnerJNILib;->CallExtensionFunction(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 312
    :cond_3
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupView()V

    .line 315
    :goto_3
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz v2, :cond_5

    const-string v3, "YYiCadeSupport"

    .line 317
    invoke-virtual {v2, v3}, Lcom/ESG/MobileByMuBai/IniBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "Registering receiver to receive bluetooth device connection messages"

    .line 319
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v3, "android.bluetooth.device.action.ACL_DISCONNECTED"

    .line 321
    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 322
    iget-object v3, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v2}, Lcom/ESG/MobileByMuBai/RunnerActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_4

    :cond_4
    const-string v2, "Option not set so not connecting receiver"

    .line 325
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_5
    const-string v2, "No prefs set so not connecting receiver"

    .line 329
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    :goto_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_6

    .line 339
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    .line 340
    new-instance v3, Lcom/ESG/MobileByMuBai/RunnerActivity$3;

    invoke-direct {v3, p0}, Lcom/ESG/MobileByMuBai/RunnerActivity$3;-><init>(Lcom/ESG/MobileByMuBai/RunnerActivity;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    .line 352
    :cond_6
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_7

    const-string v2, "!!!!!!! Using frame count timing if possible..."

    .line 354
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    new-instance v2, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;

    invoke-direct {v2}, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;-><init>()V

    iput-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    .line 359
    :cond_7
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->GetKeyboardController()Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 363
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    if-ne v3, v0, :cond_8

    goto :goto_5

    :cond_8
    const/4 v0, 0x0

    .line 364
    :goto_5
    invoke-virtual {v2, v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->SetPhysicalKeyboardConnected(Z)V

    .line 367
    :cond_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v0, v2, :cond_b

    .line 371
    :try_start_1
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 372
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 373
    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {v3}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getSupportedModes()[Landroid/view/Display$Mode;

    move-result-object v3

    .line 375
    array-length v4, v3

    :goto_6
    if-ge p1, v4, :cond_b

    aget-object v5, v3, p1

    .line 377
    invoke-virtual {v5}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    const/16 v7, 0x3c

    if-ne v6, v7, :cond_a

    .line 379
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[Display Frame Rate] Set: "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getModeId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/view/Display$Mode;->getRefreshRate()F

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    invoke-virtual {v5}, Landroid/view/Display$Mode;->getModeId()I

    move-result p1

    iput p1, v2, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    .line 381
    invoke-virtual {v0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    :cond_a
    add-int/lit8 p1, p1, 0x1

    goto :goto_6

    :catch_1
    move-exception p1

    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[Display Frame Rate] Error: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    :goto_7
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 3

    .line 1238
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 1240
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 1242
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 1244
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4

    .line 957
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 959
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 961
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 963
    aget-object v3, v2, v0

    instance-of v3, v3, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v3, :cond_0

    .line 965
    aget-object v2, v2, v0

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method protected onDestroy()V
    .locals 5

    const-string v0, "yoyo"

    const-string v1, "onDestroy"

    .line 694
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    .line 699
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    .line 701
    :goto_0
    sget-object v3, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 703
    aget-object v4, v3, v1

    instance-of v4, v4, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v4, :cond_0

    .line 704
    aget-object v3, v3, v1

    check-cast v3, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v3}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onDestroy()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 710
    :cond_1
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->GetVirtualKeyboardVisible()Z

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    .line 712
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {v1}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardHide()V

    .line 715
    :cond_2
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz v1, :cond_3

    const-string v3, "YYiCadeSupport"

    .line 717
    invoke-virtual {v1, v3}, Lcom/ESG/MobileByMuBai/IniBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "Unregistering receiver"

    .line 719
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 726
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "About to attempt kill of process in onDestroy::"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 730
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 10

    .line 1024
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getSource()I

    move-result v0

    .line 1025
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    and-int/lit16 v4, v0, 0x101

    const/16 v5, 0x101

    if-ne v4, v5, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    and-int/lit16 v5, v0, 0x401

    const/16 v6, 0x401

    if-ne v5, v6, :cond_2

    const/4 v5, 0x1

    goto :goto_2

    :cond_2
    const/4 v5, 0x0

    :goto_2
    const v6, 0x1000010

    and-int v7, v0, v6

    if-ne v7, v6, :cond_3

    const/4 v6, 0x1

    goto :goto_3

    :cond_3
    const/4 v6, 0x0

    .line 1031
    :goto_3
    sget-object v7, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v7, :cond_5

    const/4 v7, 0x0

    .line 1033
    :goto_4
    sget-object v8, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v9, v8

    if-ge v7, v9, :cond_5

    .line 1035
    aget-object v9, v8, v7

    instance-of v9, v9, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v9, :cond_4

    .line 1037
    aget-object v8, v8, v7

    check-cast v8, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v8, p1, p2}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v8

    if-eqz v8, :cond_4

    return v8

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_5
    if-eqz v1, :cond_6

    if-eqz v4, :cond_6

    if-nez v5, :cond_6

    if-nez v6, :cond_6

    .line 1048
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->GetKeyboardController()Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 1051
    invoke-virtual {v1, p1, p2}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->OnPhysicalKeyboardKeyEvent(ILandroid/view/KeyEvent;)V

    :cond_6
    if-eqz p1, :cond_7

    if-nez v5, :cond_7

    if-nez v6, :cond_7

    .line 1058
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v1

    invoke-static {v2, p1, v1, v0}, Lcom/yoyogames/runner/RunnerJNILib;->KeyEvent(IIII)V

    :cond_7
    const/4 v0, 0x4

    if-ne p1, v0, :cond_8

    .line 1064
    invoke-virtual {p2}, Landroid/view/KeyEvent;->startTracking()V

    return v3

    :cond_8
    const/16 v0, 0x18

    if-eq p1, v0, :cond_a

    const/16 v0, 0x19

    if-eq p1, v0, :cond_a

    const/4 v0, 0x3

    if-eq p1, v0, :cond_a

    const/16 v0, 0x52

    if-eq p1, v0, :cond_a

    const/16 v0, 0x4f

    if-lt p1, v0, :cond_9

    goto :goto_5

    :cond_9
    return v3

    .line 1074
    :cond_a
    :goto_5
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 1075
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    .line 1076
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 149
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 151
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 153
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 155
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1, p2}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    .line 165
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->BackKeyLongPressEvent()V

    const/4 p1, 0x1

    return p1

    .line 170
    :cond_2
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentActivity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 6

    .line 1087
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getSource()I

    move-result v0

    and-int/lit16 v1, v0, 0x401

    const/16 v2, 0x401

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const v2, 0x1000010

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 1093
    :goto_1
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v2, :cond_3

    .line 1095
    :goto_2
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v5, v2

    if-ge v3, v5, :cond_3

    .line 1097
    aget-object v5, v2, v3

    instance-of v5, v5, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v5, :cond_2

    .line 1099
    aget-object v2, v2, v3

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2, p1, p2}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v2

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    if-nez v1, :cond_4

    if-nez v0, :cond_4

    .line 1108
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    invoke-static {v4, p1, v0, v1}, Lcom/yoyogames/runner/RunnerJNILib;->KeyEvent(IIII)V

    :cond_4
    const/16 v0, 0x18

    if-eq p1, v0, :cond_6

    const/16 v0, 0x19

    if-eq p1, v0, :cond_6

    const/4 v0, 0x3

    if-eq p1, v0, :cond_6

    const/16 v0, 0x52

    if-eq p1, v0, :cond_6

    const/16 v0, 0x4f

    if-lt p1, v0, :cond_5

    goto :goto_3

    :cond_5
    return v4

    .line 1116
    :cond_6
    :goto_3
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 3

    .line 736
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 737
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 739
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 741
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 743
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 980
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 982
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 984
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 986
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 994
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    const/4 p1, 0x1

    return p1
.end method

.method protected onPause()V
    .locals 5

    const-string v0, "yoyo"

    const-string v1, "onPause"

    .line 793
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 794
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 796
    iget-boolean v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mbAppSuspended:Z

    if-nez v1, :cond_7

    const/4 v1, 0x1

    .line 798
    iput-boolean v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mbAppSuspended:Z

    .line 799
    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->mVideoPlayback:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->onPause()V

    .line 801
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v2, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    const-string v2, "Pausing the Runner"

    .line 803
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    sget-boolean v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 805
    invoke-static {v3}, Lcom/yoyogames/runner/RunnerJNILib;->Pause(I)V

    .line 808
    :cond_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz v2, :cond_1

    const-string v4, "YYiCadeSupport"

    .line 810
    invoke-virtual {v2, v4}, Lcom/ESG/MobileByMuBai/IniBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "Unregistering receiver"

    .line 812
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 813
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 818
    :cond_1
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_2

    .line 820
    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->onPause()V

    .line 823
    :cond_2
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    if-eqz v0, :cond_3

    .line 824
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iget-object v0, v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    iput-boolean v1, v0, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_pauseRunner:Z

    .line 830
    :cond_3
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->StoreMP3State()V

    .line 832
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->StopMP3()V

    .line 834
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_5

    .line 836
    :goto_0
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v0

    if-ge v3, v2, :cond_5

    .line 838
    aget-object v2, v0, v3

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_4

    .line 839
    aget-object v0, v0, v3

    check-cast v0, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v0}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onPause()V

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_5
    const/4 v0, -0x1

    .line 847
    sput v0, Lcom/ESG/MobileByMuBai/DemoRenderer;->elapsedVsyncs:I

    .line 849
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    if-eqz v0, :cond_6

    .line 851
    check-cast v0, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;->RemoveFrameCallback()V

    .line 855
    :cond_6
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->GetVirtualKeyboardVisible()Z

    move-result v0

    if-ne v0, v1, :cond_8

    .line 857
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardHide()V

    goto :goto_1

    :cond_7
    const-string v1, "onPause - ignored due to already being paused"

    .line 861
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    :goto_1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 6

    .line 1208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onRequestPermissionsResult "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " returned with: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " results:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 1211
    invoke-static {v0, v0, v0}, Lcom/yoyogames/runner/RunnerJNILib;->jCreateDsMap([Ljava/lang/String;[Ljava/lang/String;[D)I

    move-result v0

    const-string v1, "type"

    const-string v2, "permission_request_result"

    .line 1212
    invoke-static {v0, v1, v2}, Lcom/yoyogames/runner/RunnerJNILib;->DsMapAddString(ILjava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 1213
    :goto_0
    array-length v3, p3

    if-ge v2, v3, :cond_1

    .line 1214
    aget-object v3, p2, v2

    aget v4, p3, v2

    if-nez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    int-to-double v4, v4

    invoke-static {v0, v3, v4, v5}, Lcom/yoyogames/runner/RunnerJNILib;->DsMapAddDouble(ILjava/lang/String;D)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1216
    :cond_1
    iget v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->EVENT_OTHER_SYSTEM_EVENT:I

    invoke-static {v0, v2}, Lcom/yoyogames/runner/RunnerJNILib;->CreateAsynEventWithDSMap(II)V

    .line 1218
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_3

    .line 1220
    :goto_2
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 1222
    aget-object v2, v0, v1

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_2

    .line 1224
    aget-object v0, v0, v1

    check-cast v0, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v0, p1, p2, p3}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1230
    :cond_3
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method protected onRestart()V
    .locals 3

    const-string v0, "yoyo"

    const-string v1, "onRestart"

    .line 620
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onRestart()V

    .line 623
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 624
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 626
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 627
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onRestart()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 5

    const-string v0, "yoyo"

    const-string v1, "onResume"

    .line 871
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 876
    iget-boolean v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mbAppSuspended:Z

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    .line 878
    iput-boolean v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mbAppSuspended:Z

    .line 879
    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->mVideoPlayback:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->onResume()V

    .line 881
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 882
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    .line 886
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    iget-object v2, v2, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    if-eqz v2, :cond_0

    .line 888
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iget-object v2, v2, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    iget-boolean v2, v2, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_pauseRunner:Z

    if-ne v2, v3, :cond_0

    const-string v2, "resumeApp"

    .line 890
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    invoke-virtual {v2}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->onResume()V

    .line 894
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iget-object v2, v2, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->mRenderer:Lcom/ESG/MobileByMuBai/DemoRenderer;

    iput-boolean v1, v2, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_pauseRunner:Z

    .line 898
    :cond_0
    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    if-eqz v2, :cond_1

    sget-boolean v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    if-nez v2, :cond_1

    const-string v2, "Resuming the C++ Runner/resetting GL state"

    .line 900
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 901
    invoke-static {v1}, Lcom/yoyogames/runner/RunnerJNILib;->Resume(I)V

    .line 904
    :cond_1
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    if-eqz v2, :cond_2

    const-string v4, "YYiCadeSupport"

    .line 906
    invoke-virtual {v2, v4}, Lcom/ESG/MobileByMuBai/IniBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "Registering receiver to receive bluetooth device connection messages"

    .line 908
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    .line 910
    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 911
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 916
    :cond_2
    sget-object v0, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    if-eqz v0, :cond_3

    .line 919
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->RestoreMP3State()V

    .line 921
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->onGamepadChange()V

    .line 925
    :cond_3
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mAccelerometer:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 926
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    .line 928
    :goto_0
    sget-object v2, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v4, v2

    if-ge v0, v4, :cond_5

    .line 930
    aget-object v4, v2, v0

    instance-of v4, v4, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v4, :cond_4

    .line 931
    aget-object v2, v2, v0

    check-cast v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v2}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onResume()V

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 936
    :cond_5
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    if-eqz v0, :cond_6

    .line 939
    check-cast v0, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;->PostFrameCallback()V

    :cond_6
    :goto_1
    const/16 v0, 0xa

    if-ge v1, v0, :cond_8

    const v0, -0x34e76981    # -9999999.0f

    .line 945
    invoke-static {v3, v1, v0, v0}, Lcom/yoyogames/runner/RunnerJNILib;->TouchEvent(IIFF)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_7
    const-string v1, "onResume ignored due to not being paused"

    .line 950
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 5

    .line 1156
    sget v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->DefaultOrientation:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const v4, 0x411ce80a

    if-eq v0, v3, :cond_0

    .line 1159
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    div-float/2addr v0, v4

    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelX:F

    .line 1160
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v1

    div-float/2addr v0, v4

    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelY:F

    .line 1161
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v3

    div-float/2addr p1, v4

    sput p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelZ:F

    goto :goto_0

    .line 1164
    :cond_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v1

    div-float/2addr v0, v4

    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelX:F

    .line 1165
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    neg-float v0, v0

    div-float/2addr v0, v4

    sput v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelY:F

    .line 1166
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v3

    div-float/2addr p1, v4

    sput p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->AccelZ:F

    :goto_0
    return-void
.end method

.method protected onStart()V
    .locals 3

    const-string v0, "yoyo"

    const-string v1, "onStart"

    .line 588
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    .line 603
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 605
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 607
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 608
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onStart()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected onStop()V
    .locals 3

    const-string v0, "yoyo"

    const-string v1, "onStop"

    .line 642
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    .line 667
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 669
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 671
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_0

    .line 672
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onStop()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 681
    :cond_1
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->GetVirtualKeyboardVisible()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 683
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->m_keyboardController:Lcom/ESG/MobileByMuBai/RunnerKeyboardController;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerKeyboardController;->VirtualKeyboardHide()V

    :cond_2
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .line 760
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onWindowFocusChanged("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->FocusOverride:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onWindowFocusChanged(Z)V

    .line 763
    sget-boolean v0, Lcom/yoyogames/runner/RunnerJNILib;->ms_exitcalled:Z

    if-eqz v0, :cond_0

    const-string p1, "Ignoring focus change as we are exiting"

    .line 764
    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 768
    :cond_0
    sget-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->FocusOverride:Z

    or-int/2addr v0, p1

    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->HasFocus:Z

    const/4 v0, 0x0

    .line 769
    sput-boolean v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->FocusOverride:Z

    .line 772
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 773
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    .line 777
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 779
    :goto_0
    sget-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mExtension:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 781
    aget-object v2, v1, v0

    instance-of v2, v2, Lcom/ESG/MobileByMuBai/IExtensionBase;

    if-eqz v2, :cond_1

    .line 783
    aget-object v1, v1, v0

    check-cast v1, Lcom/ESG/MobileByMuBai/IExtensionBase;

    invoke-interface {v1, p1}, Lcom/ESG/MobileByMuBai/IExtensionBase;->onWindowFocusChanged(Z)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method protected resumeApp()V
    .locals 0

    return-void
.end method

.method public setupIniFile()V
    .locals 7

    .line 429
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 430
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#####!!!! package name is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "yoyo"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "com.yoyogames.runner"

    .line 432
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Android"

    const/16 v3, 0x80

    const-string v4, "Exception while setting up Ini"

    if-eqz v0, :cond_0

    .line 434
    :try_start_0
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 435
    invoke-static {p0, v1}, Lcom/ESG/MobileByMuBai/IniBundle;->DoSetupIniFile(Landroid/app/Activity;Ljava/lang/String;)Lcom/ESG/MobileByMuBai/IniBundle;

    move-result-object v0

    sput-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v0, "INI loaded from assets/Options.INI"

    .line 436
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 438
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    const-string v0, "Loading INI from manifest file"

    .line 443
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 446
    :try_start_1
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 447
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v3

    .line 450
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v0

    .line 453
    :goto_0
    new-instance v4, Lcom/ESG/MobileByMuBai/IniBundle;

    invoke-direct {v4, v3, v0, v1}, Lcom/ESG/MobileByMuBai/IniBundle;-><init>(Landroid/os/Bundle;Ljava/io/InputStream;Ljava/lang/String;)V

    sput-object v4, Lcom/ESG/MobileByMuBai/RunnerActivity;->mYYPrefs:Lcom/ESG/MobileByMuBai/IniBundle;

    const-string v0, "INI loaded from AndroidManifest.xml"

    .line 454
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method public setupUiVisibility()V
    .locals 4

    .line 1476
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :try_start_0
    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    .line 1481
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    .line 1482
    const-class v2, Landroid/view/View;

    const-string v3, "setSystemUiVisibility"

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/ESG/MobileByMuBai/RunnerActivity;->mSetSystemUiVisibility:Ljava/lang/reflect/Method;

    .line 1492
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1

    .line 1494
    sget v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->UIVisibilityFlags:I

    and-int/lit16 v1, v0, 0x100

    if-eqz v1, :cond_0

    and-int/lit16 v0, v0, -0x101

    .line 1497
    invoke-direct {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->ourSetSystemUiVisibility(I)V

    .line 1502
    :cond_0
    sget v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->UIVisibilityFlags:I

    .line 1505
    :cond_1
    invoke-direct {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->ourSetSystemUiVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1509
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception while getting setSystemUiVisibility :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "yoyo"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    return-void
.end method

.method public setupUiVisibilityDelayed()V
    .locals 4

    .line 1471
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mRestoreImmersiveModeHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->restoreImmersiveModeRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public setupView()V
    .locals 2

    const-string v0, "yoyo"

    const-string v1, " + + + + setupView + + + +"

    .line 1520
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const v0, 0x7f0b001d

    .line 1521
    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setContentView(I)V

    const v0, 0x7f080054

    .line 1522
    invoke-virtual {p0, v0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    .line 1523
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 1524
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    .line 1527
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 1529
    check-cast v0, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;->PostFrameCallback()V

    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1552
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_0

    .line 1554
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    :cond_0
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1537
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_0

    .line 1539
    invoke-virtual {v0, p1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 1542
    :cond_0
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->vsyncHandler:Ljava/lang/Object;

    if-eqz p1, :cond_1

    .line 1545
    check-cast p1, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerVsyncHandler;->PostFrameCallback()V

    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1561
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/RunnerActivity;->mGLView:Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;

    if-eqz v0, :cond_0

    .line 1563
    invoke-virtual {v0, p1}, Lcom/ESG/MobileByMuBai/DemoGLSurfaceView;->surfaceDestroyed(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method
