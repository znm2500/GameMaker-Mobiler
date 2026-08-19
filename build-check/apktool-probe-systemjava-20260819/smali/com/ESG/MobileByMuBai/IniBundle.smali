.class Lcom/ESG/MobileByMuBai/IniBundle;
.super Ljava/lang/Object;
.source "IniBundle.java"


# instance fields
.field m_android:Lorg/ini4j/Profile$Section;

.field m_bundle:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    const/4 p1, 0x0

    .line 62
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz p2, :cond_0

    .line 66
    :try_start_0
    new-instance p1, Lorg/ini4j/Ini;

    invoke-direct {p1, p2}, Lorg/ini4j/Ini;-><init>(Ljava/io/InputStream;)V

    .line 67
    invoke-virtual {p1, p3}, Lorg/ini4j/Ini;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/ini4j/Profile$Section;

    iput-object p1, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 69
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "INI exception "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public static DoSetupIniFile(Landroid/app/Activity;Ljava/lang/String;)Lcom/ESG/MobileByMuBai/IniBundle;
    .locals 7

    const-string v0, "yoyo"

    const/4 v1, 0x0

    .line 36
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x80

    invoke-virtual {v2, p0, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    .line 37
    iget-object v2, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 39
    :try_start_1
    new-instance v3, Ljava/util/zip/ZipFile;

    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v3, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object p0

    .line 42
    :cond_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 43
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 45
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".ini"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_0

    .line 46
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "found INI file - "

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-virtual {v3, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v1, p0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v2, v1

    .line 54
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception while setting up Ini"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    :cond_1
    :goto_1
    new-instance p0, Lcom/ESG/MobileByMuBai/IniBundle;

    invoke-direct {p0, v2, v1, p1}, Lcom/ESG/MobileByMuBai/IniBundle;-><init>(Landroid/os/Bundle;Ljava/io/InputStream;Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public getBoolean(Ljava/lang/String;)Z
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    goto :goto_0

    .line 106
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    :goto_0
    return p1
.end method

.method public getInt(Ljava/lang/String;I)I
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    iget-object p2, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    invoke-interface {p2, p1}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    :goto_0
    return p1
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v0, "\""

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 81
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 88
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    const v2, -0x96b43f

    invoke-virtual {v1, p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-eq p1, v2, :cond_1

    .line 91
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    move-object p1, v0

    :cond_2
    :goto_0
    return-object p1
.end method

.method public hasAndroidIni()Z
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public keyExists(Ljava/lang/String;)Z
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/ini4j/Profile$Section;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 140
    :cond_0
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_bundle:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public setAndroidIni(Lorg/ini4j/Profile$Section;)V
    .locals 0

    .line 150
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    return-void
.end method

.method public setAndroidInt(Ljava/lang/String;I)V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-nez v0, :cond_0

    const-string p1, "yoyo"

    const-string p2, "Could not setIniString - no INI file in current bundle."

    .line 168
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 172
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lorg/ini4j/Profile$Section;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    return-void
.end method

.method public setAndroidString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/ESG/MobileByMuBai/IniBundle;->m_android:Lorg/ini4j/Profile$Section;

    if-nez v0, :cond_0

    const-string p1, "yoyo"

    const-string p2, "Could not setIniString - no INI file in current bundle."

    .line 157
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 161
    :cond_0
    invoke-interface {v0, p1, p2}, Lorg/ini4j/Profile$Section;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
