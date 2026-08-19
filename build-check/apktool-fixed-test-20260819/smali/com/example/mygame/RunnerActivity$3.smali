.class Lcom/example/mygame/RunnerActivity$3;
.super Ljava/lang/Object;
.source "RunnerActivity.java"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/mygame/RunnerActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 340
    iput-object p1, p0, Lcom/example/mygame/RunnerActivity$3;->this$0:Lcom/example/mygame/RunnerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSystemUiVisibilityChange(I)V
    .locals 0

    .line 345
    iget-object p1, p0, Lcom/example/mygame/RunnerActivity$3;->this$0:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerActivity;->setupUiVisibility()V

    .line 346
    iget-object p1, p0, Lcom/example/mygame/RunnerActivity$3;->this$0:Lcom/example/mygame/RunnerActivity;

    invoke-virtual {p1}, Lcom/example/mygame/RunnerActivity;->setupUiVisibilityDelayed()V

    return-void
.end method
