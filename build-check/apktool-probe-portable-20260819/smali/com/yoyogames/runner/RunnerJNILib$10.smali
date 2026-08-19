.class Lcom/yoyogames/runner/RunnerJNILib$10;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->HttpPost(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$id:I

.field final synthetic val$post:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1278
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$url:Ljava/lang/String;

    iput p2, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$id:I

    iput-object p3, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$post:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    const-string v0, "yoyo"

    const-string v1, "IOException"

    const/16 v2, 0x194

    const/4 v3, 0x0

    .line 1284
    :try_start_0
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$url:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1285
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1292
    :catch_0
    iget v4, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$id:I

    invoke-static {v1, v2, v4}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    goto :goto_0

    .line 1288
    :catch_1
    iget v4, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$id:I

    const-string v5, "MalformedURLException"

    invoke-static {v5, v2, v4}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :goto_0
    move-object v4, v3

    :goto_1
    if-eqz v4, :cond_3

    const/4 v5, 0x1

    .line 1298
    :try_start_1
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 1299
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const/4 v6, 0x0

    .line 1300
    invoke-virtual {v4, v6}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const-string v7, "POST"

    .line 1301
    invoke-virtual {v4, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1303
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    .line 1305
    iget-object v7, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$post:Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 1306
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/io/OutputStream;->write([B)V

    .line 1307
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    .line 1308
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 1310
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    .line 1311
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "HttpPost: Got response code \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 1315
    :try_start_2
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 1316
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v10, 0x1000

    new-array v10, v10, [B

    .line 1319
    :goto_2
    invoke-virtual {v8, v10}, Ljava/io/InputStream;->read([B)I

    move-result v11

    const/4 v12, -0x1

    if-eq v11, v12, :cond_0

    .line 1320
    invoke-virtual {v9, v10, v6, v11}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    .line 1322
    :cond_0
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 1323
    :try_start_3
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 1324
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_3

    :catch_2
    move-object v8, v3

    :catch_3
    :try_start_4
    const-string v9, "HttpPost: IO exception"

    .line 1328
    invoke-static {v0, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    if-eqz v8, :cond_1

    .line 1332
    array-length v0, v8

    if-nez v0, :cond_2

    :cond_1
    new-array v8, v5, [B

    aput-byte v6, v8, v6

    .line 1336
    :cond_2
    iget v0, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$id:I

    invoke-static {v4}, Lcom/yoyogames/runner/RunnerJNILib;->access$000(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v7, v0, v3, v5}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResult([BIILjava/lang/String;Ljava/lang/String;)V

    .line 1338
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    .line 1342
    :catch_4
    iget v0, p0, Lcom/yoyogames/runner/RunnerJNILib$10;->val$id:I

    invoke-static {v1, v2, v0}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :cond_3
    :goto_4
    return-void
.end method
