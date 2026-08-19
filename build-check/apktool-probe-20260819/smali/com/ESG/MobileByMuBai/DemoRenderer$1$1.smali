.class Lcom/ESG/MobileByMuBai/DemoRenderer$1$1;
.super Ljava/lang/Object;
.source "DemoRenderer.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/DemoRenderer$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ESG/MobileByMuBai/DemoRenderer$1;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/DemoRenderer$1;)V
    .locals 0

    .line 366
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/DemoRenderer$1$1;->this$1:Lcom/ESG/MobileByMuBai/DemoRenderer$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 368
    sget-object p1, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    invoke-virtual {p1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->finish()V

    return-void
.end method
