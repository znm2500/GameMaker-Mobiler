.class Lcom/yoyogames/runner/RunnerJNILib$11;
.super Ljava/lang/Object;
.source "RunnerJNILib.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yoyogames/runner/RunnerJNILib;->HttpRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$headers:Ljava/lang/String;

.field final synthetic val$id:I

.field final synthetic val$method:Ljava/lang/String;

.field final synthetic val$post:[B

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;[B)V
    .locals 0

    .line 1362
    iput-object p1, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$url:Ljava/lang/String;

    iput p2, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    iput-object p3, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$method:Ljava/lang/String;

    iput-object p4, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$headers:Ljava/lang/String;

    iput-object p5, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$post:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    const-string v0, ": "

    const-string v1, "GET"

    const-string v2, "yoyo"

    const/4 v3, 0x0

    const/16 v4, 0x194

    .line 1367
    :try_start_0
    new-instance v5, Ljava/net/URL;

    iget-object v6, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$url:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1368
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1375
    :catch_0
    iget v5, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    const-string v6, "IOException"

    invoke-static {v6, v4, v5}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    goto :goto_0

    .line 1371
    :catch_1
    iget v5, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    const-string v6, "MalformedURLException"

    invoke-static {v6, v4, v5}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :goto_0
    move-object v5, v3

    :goto_1
    if-eqz v5, :cond_a

    const/4 v6, 0x1

    .line 1381
    :try_start_1
    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 1383
    iget-object v7, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$method:Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$method:Ljava/lang/String;

    const-string v9, "HEAD"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_2

    :cond_0
    const-string v7, "Setting do output to true"

    .line 1392
    invoke-static {v2, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1393
    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_3

    .line 1386
    :cond_1
    :goto_2
    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v7, "Setting do output to false"

    .line 1387
    invoke-static {v2, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1395
    :goto_3
    invoke-virtual {v5, v8}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 1396
    iget-object v7, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$method:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1399
    iget-object v7, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$headers:Ljava/lang/String;

    const-string v9, "\r\n"

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 1400
    array-length v9, v7

    const/4 v10, 0x0

    :goto_4
    if-ge v10, v9, :cond_3

    aget-object v11, v7, v10

    .line 1401
    invoke-virtual {v11, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 1402
    array-length v13, v12

    const/4 v14, 0x2

    if-ne v13, v14, :cond_2

    .line 1403
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "HttpRequest: Found header "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v13, v12, v8

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v13, v12, v6

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1404
    aget-object v11, v12, v8

    aget-object v12, v12, v6

    invoke-virtual {v5, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 1407
    :cond_2
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "HttpRequest: Malformed header "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 1412
    :cond_3
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    .line 1415
    iget-object v0, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$post:[B

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1417
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    iget-object v1, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$post:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 1418
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 1419
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1423
    :cond_4
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 1424
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "HttpRequest: Got response code \'"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "\'"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 1430
    :try_start_2
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_6

    :catch_2
    move-object v1, v3

    :goto_6
    if-nez v1, :cond_5

    .line 1436
    :try_start_3
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    goto :goto_7

    :catch_3
    move-exception v1

    goto :goto_9

    :cond_5
    :goto_7
    if-eqz v1, :cond_7

    .line 1439
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v9, 0x1000

    new-array v9, v9, [B

    .line 1442
    :goto_8
    invoke-virtual {v1, v9}, Ljava/io/InputStream;->read([B)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_6

    .line 1443
    invoke-virtual {v7, v9, v8, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_8

    .line 1445
    :cond_6
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 1446
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_a

    .line 1451
    :goto_9
    :try_start_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "HttpRequest: IO exception:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    :goto_a
    if-eqz v3, :cond_8

    .line 1455
    array-length v1, v3

    if-nez v1, :cond_9

    :cond_8
    new-array v3, v6, [B

    aput-byte v8, v3, v8

    .line 1459
    :cond_9
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1460
    iget v6, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    invoke-static {v5}, Lcom/yoyogames/runner/RunnerJNILib;->access$000(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v0, v6, v1, v7}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResult([BIILjava/lang/String;Ljava/lang/String;)V

    .line 1462
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_b

    :catch_4
    move-exception v0

    .line 1471
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HttpRequest: exception:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1472
    iget v0, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    const-string v1, "HTTP request exception"

    invoke-static {v1, v4, v0}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    goto :goto_b

    :catch_5
    const-string v0, "HttpRequest: request timed out"

    .line 1466
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1467
    iget v0, p0, Lcom/yoyogames/runner/RunnerJNILib$11;->val$id:I

    const-string v1, "HTTP request timed out"

    invoke-static {v1, v4, v0}, Lcom/yoyogames/runner/RunnerJNILib;->HttpResultString(Ljava/lang/String;II)V

    :cond_a
    :goto_b
    return-void
.end method
