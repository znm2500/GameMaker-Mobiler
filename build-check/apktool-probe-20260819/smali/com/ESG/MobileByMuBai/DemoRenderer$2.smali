.class Lcom/ESG/MobileByMuBai/DemoRenderer$2;
.super Ljava/lang/Object;
.source "DemoRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/DemoRenderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/DemoRenderer;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/DemoRenderer;)V
    .locals 0

    .line 452
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/DemoRenderer$2;->this$0:Lcom/ESG/MobileByMuBai/DemoRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 454
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    sget-object v1, Lcom/ESG/MobileByMuBai/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->doSetup(Ljava/lang/String;)V

    return-void
.end method
