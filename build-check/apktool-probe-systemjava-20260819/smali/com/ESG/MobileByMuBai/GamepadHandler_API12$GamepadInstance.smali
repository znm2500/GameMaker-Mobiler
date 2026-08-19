.class Lcom/ESG/MobileByMuBai/GamepadHandler_API12$GamepadInstance;
.super Ljava/lang/Object;
.source "Gamepad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ESG/MobileByMuBai/GamepadHandler_API12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GamepadInstance"
.end annotation


# instance fields
.field public axes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/InputDevice$MotionRange;",
            ">;"
        }
    .end annotation
.end field

.field public buttonMask:I

.field public desc:Ljava/lang/String;

.field public hats:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/InputDevice$MotionRange;",
            ">;"
        }
    .end annotation
.end field

.field public idDevice:I

.field public name:Ljava/lang/String;

.field public productId:I

.field public vendorId:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
