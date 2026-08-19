.class Lcom/example/mygame/GamepadHandler_API12$RangeComparator;
.super Ljava/lang/Object;
.source "Gamepad.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/GamepadHandler_API12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RangeComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/view/InputDevice$MotionRange;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/InputDevice$MotionRange;Landroid/view/InputDevice$MotionRange;)I
    .locals 2

    .line 65
    invoke-virtual {p1}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result p1

    .line 66
    invoke-virtual {p2}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result p2

    const/16 v0, 0x17

    const/16 v1, 0x16

    if-ne p1, v1, :cond_0

    const/16 p1, 0x17

    goto :goto_0

    :cond_0
    if-ne p1, v0, :cond_1

    const/16 p1, 0x16

    :cond_1
    :goto_0
    if-ne p2, v1, :cond_2

    const/16 p2, 0x17

    goto :goto_1

    :cond_2
    if-ne p2, v0, :cond_3

    const/16 p2, 0x16

    :cond_3
    :goto_1
    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Landroid/view/InputDevice$MotionRange;

    check-cast p2, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {p0, p1, p2}, Lcom/example/mygame/GamepadHandler_API12$RangeComparator;->compare(Landroid/view/InputDevice$MotionRange;Landroid/view/InputDevice$MotionRange;)I

    move-result p1

    return p1
.end method
