.class public Lcom/example/mygame/NullBilling;
.super Lcom/example/mygame/IRunnerBilling;
.source "NullBilling.java"


# static fields
.field public static final EmptyString:Ljava/lang/String; = ""


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/example/mygame/IRunnerBilling;-><init>()V

    return-void
.end method


# virtual methods
.method public Destroy()V
    .locals 0

    return-void
.end method

.method public consumeCatalogItem(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    const-string p1, "yoyo"

    const-string p2, "NULL-BILLING: Store is not available"

    .line 48
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public getCatalogItemDetails(Ljava/lang/String;)V
    .locals 1

    const-string p1, "yoyo"

    const-string v0, "NULL-BILLING: Store is not available"

    .line 56
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected getContentPurchasedKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const-string p1, ""

    return-object p1
.end method

.method public loadStore([Ljava/lang/String;)V
    .locals 1

    const-string p1, "yoyo"

    const-string v0, "NULL-BILLING: Store is not available"

    .line 23
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public purchaseCatalogItem(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    const-string p1, "yoyo"

    const-string p2, "NULL-BILLING: Store is not available"

    .line 40
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public restorePurchasedItems()V
    .locals 2

    const-string v0, "yoyo"

    const-string v1, "NULL-BILLING: Store is not available"

    .line 32
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public revokeCatalogItem(Ljava/lang/String;)V
    .locals 1

    const-string p1, "yoyo"

    const-string v0, "NULL-BILLING: Store is not available"

    .line 64
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
