.class public Lcom/ESG/MobileByMuBai/Gamepad;
.super Ljava/lang/Object;
.source "Gamepad.java"


# static fields
.field protected static ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 420
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static EnumerateDevices()V
    .locals 1

    .line 445
    sget-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    if-nez v0, :cond_0

    .line 446
    invoke-static {}, Lcom/ESG/MobileByMuBai/Gamepad;->Initialise()V

    .line 448
    :cond_0
    sget-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    invoke-virtual {v0}, Lcom/ESG/MobileByMuBai/GamepadHandler;->PollInputDevices()V

    return-void
.end method

.method public static Initialise()V
    .locals 2

    .line 425
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 426
    new-instance v0, Lcom/ESG/MobileByMuBai/GamepadHandler_API19;

    invoke-direct {v0}, Lcom/ESG/MobileByMuBai/GamepadHandler_API19;-><init>()V

    sput-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    goto :goto_0

    .line 428
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    .line 429
    new-instance v0, Lcom/ESG/MobileByMuBai/GamepadHandler_API16;

    invoke-direct {v0}, Lcom/ESG/MobileByMuBai/GamepadHandler_API16;-><init>()V

    sput-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    goto :goto_0

    .line 431
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_2

    .line 432
    new-instance v0, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;

    invoke-direct {v0}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;-><init>()V

    sput-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    goto :goto_0

    .line 435
    :cond_2
    new-instance v0, Lcom/ESG/MobileByMuBai/GamepadHandler;

    invoke-direct {v0}, Lcom/ESG/MobileByMuBai/GamepadHandler;-><init>()V

    sput-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    :goto_0
    return-void
.end method

.method public static handleKeyEvent(Landroid/view/KeyEvent;)V
    .locals 4

    .line 457
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v0

    .line 458
    invoke-static {v0}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v1

    if-eqz v1, :cond_1

    if-ltz v0, :cond_1

    .line 460
    invoke-virtual {v1}, Landroid/view/InputDevice;->getSources()I

    move-result v1

    and-int/lit8 v2, v1, 0x10

    const/16 v3, 0x10

    if-eq v2, v3, :cond_0

    and-int/lit16 v2, v1, 0x401

    const/16 v3, 0x401

    if-eq v2, v3, :cond_0

    const/16 v2, 0x201

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_1

    .line 464
    :cond_0
    sget-object v1, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    if-eqz v1, :cond_1

    .line 465
    invoke-virtual {v1, v0, p0}, Lcom/ESG/MobileByMuBai/GamepadHandler;->HandleKeyEvent(ILandroid/view/KeyEvent;)Z

    :cond_1
    return-void
.end method

.method public static handleMotionEvent(Landroid/view/MotionEvent;)V
    .locals 2

    .line 481
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/16 v1, 0x201

    if-eq v0, v1, :cond_0

    const/16 v1, 0x401

    if-eq v0, v1, :cond_0

    const v1, 0x1000010

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 485
    :cond_0
    sget-object v0, Lcom/ESG/MobileByMuBai/Gamepad;->ms_GamepadHandler:Lcom/ESG/MobileByMuBai/GamepadHandler;

    if-eqz v0, :cond_1

    .line 486
    invoke-virtual {v0, p0}, Lcom/ESG/MobileByMuBai/GamepadHandler;->HandleMotionEvent(Landroid/view/MotionEvent;)Z

    :cond_1
    :goto_0
    return-void
.end method
