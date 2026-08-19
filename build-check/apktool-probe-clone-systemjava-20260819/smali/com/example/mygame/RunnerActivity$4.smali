.class Lcom/example/mygame/RunnerActivity$4;
.super Ljava/lang/Object;
.source "RunnerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/RunnerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/mygame/RunnerActivity;


# direct methods
.method constructor <init>(Lcom/example/mygame/RunnerActivity;)V
    .locals 0

    .line 1462
    iput-object p1, p0, Lcom/example/mygame/RunnerActivity$4;->this$0:Lcom/example/mygame/RunnerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1465
    iget-object v0, p0, Lcom/example/mygame/RunnerActivity$4;->this$0:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {v0}, Lcom/example/mygame/RunnerActivity;->setupUiVisibility()V

    return-void
.end method
