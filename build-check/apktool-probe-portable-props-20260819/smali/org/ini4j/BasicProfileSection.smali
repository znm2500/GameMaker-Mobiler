.class Lorg/ini4j/BasicProfileSection;
.super Lorg/ini4j/BasicOptionMap;
.source "BasicProfileSection.java"

# interfaces
.implements Lorg/ini4j/Profile$Section;


# static fields
.field private static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field private static final REGEXP_ESCAPE_CHAR:C = '\\'

.field private static final serialVersionUID:J = 0xdae448305121a86L


# instance fields
.field private final _childPattern:Ljava/util/regex/Pattern;

.field private final _name:Ljava/lang/String;

.field private final _profile:Lorg/ini4j/BasicProfile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 25
    sput-object v0, Lorg/ini4j/BasicProfileSection;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lorg/ini4j/BasicOptionMap;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    .line 34
    iput-object p2, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    .line 35
    invoke-direct {p0, p2}, Lorg/ini4j/BasicProfileSection;->newChildPattern(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lorg/ini4j/BasicProfileSection;->_childPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method private childName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private newChildPattern(Ljava/lang/String;)Ljava/util/regex/Pattern;
    .locals 2

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x5e

    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x5c

    .line 142
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 143
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "[^"

    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    iget-object p1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {p1}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p1, "]+$"

    .line 147
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public addChild(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 1

    .line 72
    invoke-direct {p0, p1}, Lorg/ini4j/BasicProfileSection;->childName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 74
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object p1

    return-object p1
.end method

.method public childrenNames()[Ljava/lang/String;
    .locals 4

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 83
    iget-object v3, p0, Lorg/ini4j/BasicProfileSection;->_childPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 85
    iget-object v3, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    :cond_1
    sget-object v1, Lorg/ini4j/BasicProfileSection;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getChild(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 1

    .line 40
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-direct {p0, p1}, Lorg/ini4j/BasicProfileSection;->childName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    return-object p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lorg/ini4j/Profile$Section;
    .locals 3

    .line 51
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    .line 55
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 57
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1, v0}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Profile$Section;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v1}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 67
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/ini4j/BasicProfileSection;->_name:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method isPropertyFirstUpper()Z
    .locals 1

    .line 118
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0}, Lorg/ini4j/BasicProfile;->isPropertyFirstUpper()Z

    move-result v0

    return v0
.end method

.method public varargs lookup([Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .locals 5

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-eqz v4, :cond_0

    .line 100
    iget-object v4, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v4}, Lorg/ini4j/BasicProfile;->getPathSeparator()C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 106
    :cond_1
    iget-object p1, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/ini4j/BasicProfileSection;->childName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    return-object p1
.end method

.method public removeChild(Ljava/lang/String;)V
    .locals 1

    .line 111
    invoke-direct {p0, p1}, Lorg/ini4j/BasicProfileSection;->childName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 113
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method resolve(Ljava/lang/StringBuilder;)V
    .locals 1

    .line 123
    iget-object v0, p0, Lorg/ini4j/BasicProfileSection;->_profile:Lorg/ini4j/BasicProfile;

    invoke-virtual {v0, p1, p0}, Lorg/ini4j/BasicProfile;->resolve(Ljava/lang/StringBuilder;Lorg/ini4j/Profile$Section;)V

    return-void
.end method
