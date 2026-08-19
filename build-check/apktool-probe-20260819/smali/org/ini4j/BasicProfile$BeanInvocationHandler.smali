.class final Lorg/ini4j/BasicProfile$BeanInvocationHandler;
.super Lorg/ini4j/spi/AbstractBeanInvocationHandler;
.source "BasicProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/BasicProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BeanInvocationHandler"
.end annotation


# instance fields
.field private final _prefix:Ljava/lang/String;

.field final synthetic this$0:Lorg/ini4j/BasicProfile;


# direct methods
.method private constructor <init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;)V
    .locals 0

    .line 277
    iput-object p1, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-direct {p0}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;-><init>()V

    .line 278
    iput-object p2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;Lorg/ini4j/BasicProfile$1;)V
    .locals 0

    .line 272
    invoke-direct {p0, p1, p2}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;-><init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getPropertySpi(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 283
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 286
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1, p1}, Lorg/ini4j/BasicProfile;->length(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    .line 291
    :goto_0
    iget-object v2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v2, p1}, Lorg/ini4j/BasicProfile;->length(Ljava/lang/Object;)I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 293
    iget-object v2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v2, p1, v1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/ini4j/Profile$Section;

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/ini4j/Profile$Section;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 298
    :cond_0
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_1
    return-object v0
.end method

.method protected hasPropertySpi(Ljava/lang/String;)Z
    .locals 1

    .line 332
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected setPropertySpi(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 307
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 309
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    .line 312
    invoke-virtual {p3}, Ljava/lang/Class;->isArray()Z

    move-result p3

    if-eqz p3, :cond_0

    const/4 p3, 0x0

    .line 314
    :goto_0
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    if-ge p3, v0, :cond_1

    .line 316
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    .line 318
    invoke-static {p2, p3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/ini4j/Profile$Section;->from(Ljava/lang/Object;)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 323
    :cond_0
    iget-object p3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {p3, p1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    .line 325
    invoke-interface {p1, p2}, Lorg/ini4j/Profile$Section;->from(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method transform(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 337
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    if-nez v0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    :goto_0
    iget-object v1, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->isPropertyFirstUpper()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 341
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 343
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    .line 344
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method
