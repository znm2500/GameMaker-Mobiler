.class Lcom/ESG/MobileByMuBai/VideoPlayback$1;
.super Ljava/lang/Object;
.source "VideoPlayback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_PlayVideo(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

.field final synthetic val$videoName:Ljava/lang/String;

.field final synthetic val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;


# direct methods
.method constructor <init>(Lcom/ESG/MobileByMuBai/VideoPlayback;Lcom/ESG/MobileByMuBai/VideoPlayback;Ljava/lang/String;)V
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    iput-object p2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    iput-object p3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$videoName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const-string v0, "yoyo"

    const/4 v1, 0x0

    .line 144
    :try_start_0
    sget-object v2, Lcom/yoyogames/runner/RunnerJNILib;->ms_context:Landroid/content/Context;

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$002(Landroid/content/Context;)Landroid/content/Context;

    .line 145
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$000()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$102(Landroid/content/res/Resources;)Landroid/content/res/Resources;

    .line 146
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$100()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$202(Landroid/content/res/AssetManager;)Landroid/content/res/AssetManager;

    .line 147
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$302(Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 148
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 149
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 150
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 151
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 152
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 153
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 154
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 156
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 158
    new-instance v2, Landroid/view/TextureView;

    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$000()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$402(Landroid/view/TextureView;)Landroid/view/TextureView;

    .line 159
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$400()Landroid/view/TextureView;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$vidplayer:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-virtual {v2, v3}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 160
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$000()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    const v3, 0x7f080054

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 163
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 164
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$400()Landroid/view/TextureView;

    move-result-object v4

    invoke-virtual {v2, v4, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 166
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$400()Landroid/view/TextureView;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, "VideoPlayback, failed to create textureview"

    .line 168
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 173
    :cond_0
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->reset()V

    .line 178
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$200()Landroid/content/res/AssetManager;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$videoName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    .line 179
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v3

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v5

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v7

    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 180
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 181
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 183
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-static {v2, v1}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$502(Lcom/ESG/MobileByMuBai/VideoPlayback;I)I

    .line 184
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-static {v2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$600(Lcom/ESG/MobileByMuBai/VideoPlayback;)I

    move-result v3

    iput v3, v2, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    :catch_0
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to find media:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$videoName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " in bundle, trying to play from URL"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->val$videoName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 192
    invoke-static {}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$300()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 193
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-static {v2, v1}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$502(Lcom/ESG/MobileByMuBai/VideoPlayback;I)I

    .line 194
    iget-object v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    invoke-static {v1}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$600(Lcom/ESG/MobileByMuBai/VideoPlayback;)I

    move-result v2

    iput v2, v1, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 198
    iget-object v2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback$1;->this$0:Lcom/ESG/MobileByMuBai/VideoPlayback;

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/ESG/MobileByMuBai/VideoPlayback;->access$502(Lcom/ESG/MobileByMuBai/VideoPlayback;I)I

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception thrown initing video player:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
