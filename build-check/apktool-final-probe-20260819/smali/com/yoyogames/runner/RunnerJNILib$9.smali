.class Lcom/yoyogames/runner/RunnerJNILib$9;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->HttpGet(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$id:I

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1199
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$url:Ljava/lang/String;

    iput p2, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    const-string v0, "IOException"

    const-string v1, "yoyo"

    const/16 v2, 0x194

    const/4 v3, 0x0

    .line 1205
    :try_start_0
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$url:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1206
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1213
    :catch_0
    iget v4, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    invoke-static {v0, v2, v4}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    goto :goto_0

    .line 1209
    :catch_1
    iget v4, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    const-string v5, "MalformedURLException"

    invoke-static {v5, v2, v4}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :goto_0
    move-object v4, v3

    :goto_1
    if-eqz v4, :cond_2

    :try_start_1
    const-string v5, "Accept-Encoding"

    const-string v6, "identity"

    .line 1219
    invoke-virtual {v4, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v5, 0x1

    .line 1220
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    const/4 v5, 0x0

    .line 1221
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 1222
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 1223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    .line 1226
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    const/16 v6, 0xc8

    if-ne v5, v6, :cond_0

    .line 1230
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const/16 v7, 0x1000

    new-array v7, v7, [B

    .line 1233
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1234
    :goto_2
    invoke-virtual {v6, v7}, Ljava/io/InputStream;->read([B)I

    move-result v9

    const/4 v8, -0x1

    if-eq v9, v8, :cond_1

    .line 1238
    iget v10, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    const-string v12, ""

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v13

    move-object v8, v7

    move-object v11, v14

    invoke-static/range {v8 .. v13}, Lcom/yoyogames/runner/RunnerJNILib;->HttpProgress([BIILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_2

    .line 1248
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received responseCode "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v14, v3

    .line 1256
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "http_get responseCode="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", finalurl="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " headers="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/yoyogames/runner/RunnerJNILib;->access$000(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1257
    iget v6, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    invoke-static {v4}, Lcom/yoyogames/runner/RunnerJNILib;->access$000(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v5, v6, v14, v7}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResult([BIILjava/lang/String;Ljava/lang/String;)V

    .line 1259
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_3

    :catch_2
    move-exception v3

    .line 1263
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1264
    iget v1, p0, Lcom/yoyogames/runner/RunnerJNILib$9;->val$id:I

    invoke-static {v0, v2, v1}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :cond_2
    :goto_3
    return-void
.end method
