.class Lcom/ESG/MobileByMuBai/RunnerActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "RunnerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ESG/MobileByMuBai/RunnerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/RunnerActivity;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/RunnerActivity;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity$2;->this$0:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 193
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.bluetooth.device.extra.DEVICE"

    .line 194
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    const-string p2, "android.bluetooth.device.action.ACL_CONNECTED"

    .line 198
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 201
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->onGamepadChange()V

    goto :goto_0

    :cond_0
    const-string p2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    .line 205
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 208
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->onGamepadChange()V

    :cond_1
    :goto_0
    return-void
.end method
