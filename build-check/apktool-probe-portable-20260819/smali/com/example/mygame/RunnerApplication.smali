.class public Lcom/example/mygame/RunnerApplication;
.super Landroidx/multidex/MultiDexApplication;
.source "RunnerApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroidx/multidex/MultiDexApplication;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .line 26
    invoke-super {p0}, Landroidx/multidex/MultiDexApplication;->onCreate()V

    .line 29
    sget-boolean v0, Lcom/yoyogames/runner/RunnerJNILib;->ms_loadLibraryFailed:Z

    if-nez v0, :cond_0

    .line 30
    invoke-static {}, Lcom/yoyogames/runner/RunnerJNILib;->Init()V

    :cond_0
    return-void
.end method
