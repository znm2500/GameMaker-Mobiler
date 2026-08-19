.class Lcom/ESG/MobileByMuBai/RunnerActivity$3;
.super Ljava/lang/Object;
.source "RunnerActivity.java"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/RunnerActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 340
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity$3;->this$0:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSystemUiVisibilityChange(I)V
    .locals 0

    .line 345
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity$3;->this$0:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibility()V

    .line 346
    iget-object p1, p0, Lcom/ESG/MobileByMuBai/RunnerActivity$3;->this$0:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->setupUiVisibilityDelayed()V

    return-void
.end method
