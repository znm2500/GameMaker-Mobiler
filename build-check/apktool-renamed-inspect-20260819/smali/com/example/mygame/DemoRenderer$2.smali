.class Lcom/example/mygame/DemoRenderer$2;
.super Ljava/lang/Object;
.source "DemoRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/mygame/DemoRenderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/mygame/DemoRenderer;


# direct methods
.method constructor <init>(Lcom/example/mygame/DemoRenderer;)V
    .locals 0

    .line 452
    iput-object p1, p0, Lcom/example/mygame/DemoRenderer$2;->this$0:Lcom/example/mygame/DemoRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 454
    sget-object v0, Lcom/example/mygame/RunnerActivity;->CurrentActivity:Lcom/example/mygame/RunnerActivity;

    sget-object v1, Lcom/example/mygame/DemoRenderer;->m_apkFilePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/example/mygame/RunnerActivity;->doSetup(Ljava/lang/String;)V

    return-void
.end method
