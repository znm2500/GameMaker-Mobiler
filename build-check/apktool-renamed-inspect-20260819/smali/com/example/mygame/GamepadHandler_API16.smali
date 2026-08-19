.class Lcom/example/mygame/GamepadHandler_API16;
.super Lcom/example/mygame/GamepadHandler_API12;
.source "Gamepad.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 291
    invoke-direct {p0}, Lcom/example/mygame/GamepadHandler_API12;-><init>()V

    return-void
.end method


# virtual methods
.method public GetJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;
    .locals 2

    .line 297
    invoke-virtual {p1}, Landroid/view/InputDevice;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 298
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 302
    :cond_0
    invoke-super {p0, p1}, Lcom/example/mygame/GamepadHandler_API12;->GetJoystickDescriptor(Landroid/view/InputDevice;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
