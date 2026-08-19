.class public final enum Lcom/example/mygame/DemoRenderer$eState;
.super Ljava/lang/Enum;
.source "DemoRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/mygame/DemoRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "eState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/example/mygame/DemoRenderer$eState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum APKExpansionDownload:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum DoStartup:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum InitRunner:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum Process:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum Splash:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum Splash2:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum Startup:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum WaitForDoStartup:Lcom/example/mygame/DemoRenderer$eState;

.field public static final enum WaitOnTimer:Lcom/example/mygame/DemoRenderer$eState;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 68
    new-instance v0, Lcom/example/mygame/DemoRenderer$eState;

    const-string v1, "Startup"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/example/mygame/DemoRenderer$eState;->Startup:Lcom/example/mygame/DemoRenderer$eState;

    .line 69
    new-instance v1, Lcom/example/mygame/DemoRenderer$eState;

    const-string v3, "Splash"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/example/mygame/DemoRenderer$eState;->Splash:Lcom/example/mygame/DemoRenderer$eState;

    .line 70
    new-instance v3, Lcom/example/mygame/DemoRenderer$eState;

    const-string v5, "Splash2"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/example/mygame/DemoRenderer$eState;->Splash2:Lcom/example/mygame/DemoRenderer$eState;

    .line 71
    new-instance v5, Lcom/example/mygame/DemoRenderer$eState;

    const-string v7, "APKExpansionDownload"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/example/mygame/DemoRenderer$eState;->APKExpansionDownload:Lcom/example/mygame/DemoRenderer$eState;

    .line 72
    new-instance v7, Lcom/example/mygame/DemoRenderer$eState;

    const-string v9, "InitRunner"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/example/mygame/DemoRenderer$eState;->InitRunner:Lcom/example/mygame/DemoRenderer$eState;

    .line 73
    new-instance v9, Lcom/example/mygame/DemoRenderer$eState;

    const-string v11, "WaitForDoStartup"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/example/mygame/DemoRenderer$eState;->WaitForDoStartup:Lcom/example/mygame/DemoRenderer$eState;

    .line 74
    new-instance v11, Lcom/example/mygame/DemoRenderer$eState;

    const-string v13, "WaitOnTimer"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/example/mygame/DemoRenderer$eState;->WaitOnTimer:Lcom/example/mygame/DemoRenderer$eState;

    .line 75
    new-instance v13, Lcom/example/mygame/DemoRenderer$eState;

    const-string v15, "DoStartup"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/example/mygame/DemoRenderer$eState;->DoStartup:Lcom/example/mygame/DemoRenderer$eState;

    .line 76
    new-instance v15, Lcom/example/mygame/DemoRenderer$eState;

    const-string v14, "Process"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Lcom/example/mygame/DemoRenderer$eState;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/example/mygame/DemoRenderer$eState;->Process:Lcom/example/mygame/DemoRenderer$eState;

    const/16 v14, 0x9

    new-array v14, v14, [Lcom/example/mygame/DemoRenderer$eState;

    aput-object v0, v14, v2

    aput-object v1, v14, v4

    aput-object v3, v14, v6

    aput-object v5, v14, v8

    aput-object v7, v14, v10

    const/4 v0, 0x5

    aput-object v9, v14, v0

    const/4 v0, 0x6

    aput-object v11, v14, v0

    const/4 v0, 0x7

    aput-object v13, v14, v0

    aput-object v15, v14, v12

    .line 66
    sput-object v14, Lcom/example/mygame/DemoRenderer$eState;->$VALUES:[Lcom/example/mygame/DemoRenderer$eState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/mygame/DemoRenderer$eState;
    .locals 1

    .line 66
    const-class v0, Lcom/example/mygame/DemoRenderer$eState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/example/mygame/DemoRenderer$eState;

    return-object p0
.end method

.method public static values()[Lcom/example/mygame/DemoRenderer$eState;
    .locals 1

    .line 66
    sget-object v0, Lcom/example/mygame/DemoRenderer$eState;->$VALUES:[Lcom/example/mygame/DemoRenderer$eState;

    invoke-virtual {v0}, [Lcom/example/mygame/DemoRenderer$eState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/example/mygame/DemoRenderer$eState;

    return-object v0
.end method
