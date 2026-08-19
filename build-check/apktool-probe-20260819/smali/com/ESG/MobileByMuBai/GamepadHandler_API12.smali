.class Lcom/ESG/MobileByMuBai/GamepadHandler_API12;
.super Lcom/ESG/MobileByMuBai/GamepadHandler;
.source "Gamepad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ESG/MobileByMuBai/GamepadHandler_API12$RangeComparator;,
        Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;
    }
.end annotation


# instance fields
.field private m_Gamepads:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 86
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/GamepadHandler;-><init>()V

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public GetButtonMask(Landroid/view/InputDevice;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public GetGamepad(I)Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;
    .locals 3

    const/4 v0, 0x0

    .line 118
    :goto_0
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 119
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    .line 120
    iget v2, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public GetJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;
    .locals 0

    .line 93
    invoke-virtual {p1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public GetProductId(Landroid/view/InputDevice;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public GetVendorId(Landroid/view/InputDevice;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public HandleKeyEvent(ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 271
    invoke-virtual {p0, p1}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetGamepad(I)Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 273
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_0

    .line 275
    iget p1, p1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p2

    invoke-static {p1, p2}, Lcom/yoyogames/runner/RunnerJNILib;->onGPKeyDown(II)V

    goto :goto_0

    :cond_0
    if-ne v1, v0, :cond_1

    .line 279
    iget p1, p1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p2

    invoke-static {p1, p2}, Lcom/yoyogames/runner/RunnerJNILib;->onGPKeyUp(II)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public HandleMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 234
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const v1, 0x1000010

    and-int/2addr v0, v1

    if-eqz v0, :cond_2

    .line 235
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 236
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    goto/16 :goto_2

    .line 239
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetGamepad(I)Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    move-result-object v1

    if-eqz v1, :cond_2

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 241
    :goto_0
    iget-object v4, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 242
    iget-object v4, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/InputDevice$MotionRange;

    const/high16 v5, 0x40000000    # 2.0f

    .line 243
    invoke-virtual {v4}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v6

    invoke-virtual {p1, v6, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v6

    invoke-virtual {v4}, Landroid/view/InputDevice$MotionRange;->getMin()F

    move-result v7

    sub-float/2addr v6, v7

    invoke-virtual {v4}, Landroid/view/InputDevice$MotionRange;->getRange()F

    move-result v4

    div-float/2addr v6, v4

    mul-float v6, v6, v5

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v6, v4

    .line 245
    iget v4, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    invoke-static {v4, v3, v6}, Lcom/yoyogames/runner/RunnerJNILib;->onGPNativeAxis(IIF)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 248
    :cond_1
    :goto_1
    iget-object v3, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 249
    iget-object v3, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/InputDevice$MotionRange;

    .line 250
    iget-object v4, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/InputDevice$MotionRange;

    .line 251
    invoke-virtual {v3}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v3

    invoke-virtual {p1, v3, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 252
    invoke-virtual {v4}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v4

    invoke-virtual {p1, v4, v0}, Landroid/view/MotionEvent;->getAxisValue(II)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 254
    iget v5, v1, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    div-int/lit8 v6, v2, 0x2

    int-to-float v3, v3

    int-to-float v4, v4

    invoke-static {v5, v6, v3, v4}, Lcom/yoyogames/runner/RunnerJNILib;->onGPNativeHat(IIFF)V

    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    :cond_2
    :goto_2
    const/4 p1, 0x1

    return p1
.end method

.method public PollInputDevices()V
    .locals 25

    move-object/from16 v0, p0

    .line 134
    invoke-static {}, Landroid/view/InputDevice;->getDeviceIds()[I

    move-result-object v1

    const/4 v3, 0x0

    .line 135
    :goto_0
    array-length v4, v1

    const-string v5, " numAxes:"

    const-string v6, " numHats:"

    const-string v7, " maskButtons:"

    const-string v8, " vendorId:"

    const-string v9, " productId:"

    const-string v10, " desc:"

    const-string v11, " name:"

    const-string v12, "yoyo"

    if-ge v3, v4, :cond_8

    .line 136
    aget v4, v1, v3

    if-gez v4, :cond_0

    goto/16 :goto_3

    .line 140
    :cond_0
    invoke-virtual {v0, v4}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetGamepad(I)Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    move-result-object v13

    if-eqz v13, :cond_1

    goto/16 :goto_3

    .line 143
    :cond_1
    invoke-static {v4}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    move-result-object v13

    .line 144
    invoke-virtual {v13}, Landroid/view/InputDevice;->getSources()I

    move-result v14

    and-int/lit8 v15, v14, 0x10

    const/16 v2, 0x10

    if-eq v15, v2, :cond_2

    and-int/lit16 v15, v14, 0x401

    const/16 v2, 0x401

    if-eq v15, v2, :cond_2

    and-int/lit16 v2, v14, 0x201

    const/16 v14, 0x201

    if-ne v2, v14, :cond_7

    .line 149
    :cond_2
    new-instance v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    invoke-direct {v2}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;-><init>()V

    .line 150
    invoke-virtual {v13}, Landroid/view/InputDevice;->getMotionRanges()Ljava/util/List;

    move-result-object v14

    .line 151
    new-instance v15, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$RangeComparator;

    invoke-direct {v15}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$RangeComparator;-><init>()V

    invoke-static {v14, v15}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 152
    iput v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    .line 153
    invoke-virtual {v13}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->name:Ljava/lang/String;

    .line 154
    invoke-virtual {v0, v13}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->desc:Ljava/lang/String;

    .line 155
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    .line 156
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    .line 157
    invoke-virtual {v0, v13}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetVendorId(Landroid/view/InputDevice;)I

    move-result v4

    iput v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->vendorId:I

    .line 158
    invoke-virtual {v0, v13}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetProductId(Landroid/view/InputDevice;)I

    move-result v4

    iput v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->productId:I

    .line 159
    invoke-virtual {v0, v13}, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->GetButtonMask(Landroid/view/InputDevice;)I

    move-result v4

    iput v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->buttonMask:I

    .line 161
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/InputDevice$MotionRange;

    .line 162
    invoke-virtual {v13}, Landroid/view/InputDevice$MotionRange;->getSource()I

    move-result v14

    const/16 v15, 0x10

    and-int/2addr v14, v15

    if-eqz v14, :cond_3

    .line 163
    invoke-virtual {v13}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v14

    const/16 v15, 0xf

    if-eq v14, v15, :cond_5

    .line 164
    invoke-virtual {v13}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result v14

    const/16 v15, 0x10

    if-ne v14, v15, :cond_4

    goto :goto_2

    .line 168
    :cond_4
    iget-object v14, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    const/16 v15, 0x10

    .line 165
    :goto_2
    iget-object v14, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 173
    :cond_6
    iget-object v4, v0, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    iget v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    iget-object v13, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->name:Ljava/lang/String;

    iget-object v14, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->desc:Ljava/lang/String;

    iget v15, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->productId:I

    iget v0, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->vendorId:I

    move-object/from16 v24, v12

    iget-object v12, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v21

    iget-object v12, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    div-int/lit8 v22, v12, 0x2

    iget v12, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->buttonMask:I

    move/from16 v16, v4

    move-object/from16 v17, v13

    move-object/from16 v18, v14

    move/from16 v19, v15

    move/from16 v20, v0

    move/from16 v23, v12

    invoke-static/range {v16 .. v23}, Lcom/yoyogames/runner/RunnerJNILib;->onGPDeviceAdded(ILjava/lang/String;Ljava/lang/String;IIIII)V

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GAMEPAD :: found device id:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v4, v1, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->name:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->desc:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->productId:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->vendorId:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->buttonMask:I

    .line 181
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    .line 182
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    .line 183
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v2, v24

    .line 176
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    :goto_3
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_8
    move-object v2, v12

    .line 189
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    move-object/from16 v3, p0

    .line 190
    :goto_4
    iget-object v12, v3, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v4, v12, :cond_c

    .line 191
    iget-object v12, v3, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    const/4 v13, 0x0

    .line 193
    :goto_5
    array-length v14, v1

    if-ge v13, v14, :cond_a

    .line 194
    iget v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    aget v15, v1, v13

    if-ne v14, v15, :cond_9

    goto :goto_6

    :cond_9
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 197
    :cond_a
    :goto_6
    array-length v14, v1

    if-ne v13, v14, :cond_b

    .line 198
    iget v13, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "GAMEPAD :: removed device id:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->desc:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->productId:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->vendorId:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->buttonMask:I

    .line 204
    invoke-static {v14}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->hats:Ljava/util/ArrayList;

    .line 205
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v12, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->axes:Ljava/util/ArrayList;

    .line 206
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 199
    invoke-static {v2, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_4

    :cond_c
    const/4 v1, 0x0

    .line 212
    :goto_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_f

    .line 213
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 215
    invoke-static {v4}, Lcom/yoyogames/runner/RunnerJNILib;->onGPDeviceRemoved(I)V

    const/4 v5, 0x0

    .line 218
    :goto_8
    iget-object v6, v3, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_e

    .line 219
    iget-object v6, v3, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;

    iget v6, v6, Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;->idDevice:I

    if-ne v6, v4, :cond_d

    .line 220
    iget-object v4, v3, Lcom/ESG/MobileByMuBai/GamepadHandler_API12;->m_Gamepads:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_9

    :cond_d
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_e
    :goto_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_f
    const-string v0, "GAMEPAD: Enumeration complete"

    .line 226
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
