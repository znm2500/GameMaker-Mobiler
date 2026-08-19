.class public Lcom/ESG/MobileByMuBai/VideoPlayback;
.super Lcom/ESG/MobileByMuBai/RunnerSocial;
.source "VideoPlayback.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnInfoListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnSeekCompleteListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;
.implements Landroid/view/TextureView$SurfaceTextureListener;


# static fields
.field private static final EVENT_OTHER_SOCIAL:I = 0x46

.field private static mAssetManager:Landroid/content/res/AssetManager;

.field private static mContext:Landroid/content/Context;

.field private static mInitialised:Z

.field private static mMediaPlayer:Landroid/media/MediaPlayer;

.field private static mResources:Landroid/content/res/Resources;

.field private static mTextureView:Landroid/view/TextureView;


# instance fields
.field Looping:Z

.field private VideoPlayback_Status:I

.field player_status:I

.field private video_format_rgba:I

.field private video_format_yuv:I

.field private video_status_closed:I

.field private video_status_paused:I

.field private video_status_playing:I

.field private video_status_preparing:I

.field volume:D


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 41
    invoke-direct {p0}, Lcom/ESG/MobileByMuBai/RunnerSocial;-><init>()V

    const/4 v0, 0x0

    .line 59
    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_format_rgba:I

    const/4 v1, 0x1

    .line 60
    iput v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_format_yuv:I

    .line 62
    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_closed:I

    .line 63
    iput v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_preparing:I

    const/4 v1, 0x2

    .line 64
    iput v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_playing:I

    const/4 v1, 0x3

    .line 65
    iput v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_paused:I

    const/4 v1, -0x2

    .line 71
    iput v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    .line 420
    iput-boolean v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->Looping:Z

    .line 481
    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 497
    iput-wide v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->volume:D

    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
    .locals 1

    .line 41
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$002(Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    .line 41
    sput-object p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100()Landroid/content/res/Resources;
    .locals 1

    .line 41
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method static synthetic access$102(Landroid/content/res/Resources;)Landroid/content/res/Resources;
    .locals 0

    .line 41
    sput-object p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mResources:Landroid/content/res/Resources;

    return-object p0
.end method

.method static synthetic access$200()Landroid/content/res/AssetManager;
    .locals 1

    .line 41
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mAssetManager:Landroid/content/res/AssetManager;

    return-object v0
.end method

.method static synthetic access$202(Landroid/content/res/AssetManager;)Landroid/content/res/AssetManager;
    .locals 0

    .line 41
    sput-object p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mAssetManager:Landroid/content/res/AssetManager;

    return-object p0
.end method

.method static synthetic access$300()Landroid/media/MediaPlayer;
    .locals 1

    .line 41
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$302(Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .locals 0

    .line 41
    sput-object p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method static synthetic access$400()Landroid/view/TextureView;
    .locals 1

    .line 41
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mTextureView:Landroid/view/TextureView;

    return-object v0
.end method

.method static synthetic access$402(Landroid/view/TextureView;)Landroid/view/TextureView;
    .locals 0

    .line 41
    sput-object p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mTextureView:Landroid/view/TextureView;

    return-object p0
.end method

.method static synthetic access$502(Lcom/ESG/MobileByMuBai/VideoPlayback;I)I
    .locals 0

    .line 41
    iput p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    return p1
.end method

.method static synthetic access$600(Lcom/ESG/MobileByMuBai/VideoPlayback;)I
    .locals 0

    .line 41
    iget p0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_preparing:I

    return p0
.end method

.method private getInfo(I)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/16 v0, 0x385

    if-eq p1, v0, :cond_1

    const/16 v0, 0x386

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 383
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNKNOWN: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_0
    const-string p1, "MEDIA_INFO_METADATA_UPDATE"

    return-object p1

    :pswitch_1
    const-string p1, "MEDIA_INFO_NOT_SEEKABLE"

    return-object p1

    :pswitch_2
    const-string p1, "MEDIA_INFO_BAD_INTERLEAVING"

    return-object p1

    :pswitch_3
    const-string p1, "MEDIA_INFO_BUFFERING_END"

    return-object p1

    :pswitch_4
    const-string p1, "MEDIA_INFO_BUFFERING_START"

    return-object p1

    :pswitch_5
    const-string p1, "MEDIA_INFO_VIDEO_TRACK_LAGGING"

    return-object p1

    :cond_0
    const-string p1, "MEDIA_INFO_SUBTITLE_TIMED_OUT"

    return-object p1

    :cond_1
    const-string p1, "MEDIA_INFO_UNSUPPORTED_SUBTITLE"

    return-object p1

    :cond_2
    const-string p1, "MEDIA_INFO_VIDEO_RENDERING_START"

    return-object p1

    :cond_3
    const-string p1, "MEDIA_INFO_UNKNOWN"

    return-object p1

    :pswitch_data_0
    .packed-switch 0x2bc
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x320
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public VideoPlayback_Close()V
    .locals 2

    .line 94
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 97
    :cond_0
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_closed:I

    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    const/4 v0, -0x2

    .line 99
    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    const/4 v0, 0x0

    .line 100
    sput-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    .line 101
    sput-boolean v1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    .line 102
    sget-object v1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 103
    sget-object v1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 105
    sput-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mTextureView:Landroid/view/TextureView;

    return-void
.end method

.method public VideoPlayback_EnableLoop(D)V
    .locals 3

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 425
    :goto_0
    :try_start_0
    iput-boolean p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->Looping:Z

    .line 426
    sget-object p2, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p2, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public VideoPlayback_GetDuration()D
    .locals 3

    .line 453
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    .line 458
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-double v0, v0

    return-wide v0

    :catch_0
    return-wide v1
.end method

.method public VideoPlayback_GetFormat()D
    .locals 2

    .line 489
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_format_rgba:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public VideoPlayback_GetPosition()D
    .locals 3

    .line 468
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    .line 473
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-double v0, v0

    return-wide v0

    :catch_0
    return-wide v1
.end method

.method public VideoPlayback_GetStatus()D
    .locals 2

    .line 484
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public VideoPlayback_Pause()V
    .locals 1

    .line 390
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 395
    :cond_0
    :try_start_0
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_paused:I

    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    .line 396
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public VideoPlayback_PlayVideo(Ljava/lang/String;)V
    .locals 2

    .line 135
    sget-object v0, Lcom/ESG/MobileByMuBai/RunnerActivity;->CurrentActivity:Lcom/ESG/MobileByMuBai/RunnerActivity;

    new-instance v1, Lcom/ESG/MobileByMuBai/VideoPlayback$1;

    invoke-direct {v1, p0, p0, p1}, Lcom/ESG/MobileByMuBai/VideoPlayback$1;-><init>(Lcom/ESG/MobileByMuBai/VideoPlayback;Lcom/ESG/MobileByMuBai/VideoPlayback;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ESG/MobileByMuBai/RunnerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public VideoPlayback_Resume()V
    .locals 1

    .line 406
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 411
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 412
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_playing:I

    iput v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public VideoPlayback_SeekTo(D)V
    .locals 1

    .line 436
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 441
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 442
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    double-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 443
    iget p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    iget p2, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_playing:I

    if-ne p1, p2, :cond_1

    .line 444
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Resume()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-void
.end method

.method public VideoPlayback_SetVolume(D)V
    .locals 2

    .line 84
    iput-wide p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->volume:D

    .line 86
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 89
    :cond_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    double-to-float v1, p1

    double-to-float p1, p1

    invoke-virtual {v0, v1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    return-void
.end method

.method public VideoPlayback_Status()D
    .locals 2

    .line 79
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public VideoPlayback_VideoGetVolume()D
    .locals 2

    .line 500
    iget-wide v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->volume:D

    return-wide v0
.end method

.method public VideoPlayback_VideoHeight()D
    .locals 5

    .line 227
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    .line 232
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-double v0, v0

    return-wide v0

    :catch_0
    move-exception v0

    .line 238
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception thrown attempting to get video height:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "yoyo"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-wide v1
.end method

.method public VideoPlayback_VideoIsLooping()D
    .locals 2

    .line 494
    iget-boolean v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->Looping:Z

    if-eqz v0, :cond_0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public VideoPlayback_VideoWidth()D
    .locals 5

    .line 208
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    const-wide/16 v1, 0x0

    if-nez v0, :cond_0

    return-wide v1

    .line 213
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    int-to-double v0, v0

    return-wide v0

    :catch_0
    move-exception v0

    .line 219
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception thrown attempting to get video width:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "yoyo"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-wide v1
.end method

.method public VideoPlayback_WriteToBuffer(Ljava/nio/ByteBuffer;)D
    .locals 4

    const-string v0, "yoyo"

    .line 250
    :try_start_0
    sget-object v1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mTextureView:Landroid/view/TextureView;

    if-eqz v1, :cond_1

    .line 252
    sget-object v2, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v2

    sget-object v3, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/view/TextureView;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 258
    invoke-virtual {v1, p1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    return-wide v0

    :cond_0
    const-string p1, "Null bitmap generated"

    .line 262
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string p1, "Surface View null when attempting to draw"

    .line 265
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 270
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception thrown trying to write to surface:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 0

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 279
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Close()V

    const/4 p1, 0x0

    .line 282
    invoke-static {p1, p1, p1}, Lcom/yoyogames/runner/RunnerJNILib;->jCreateDsMap([Ljava/lang/String;[Ljava/lang/String;[D)I

    move-result p1

    const-string v0, "type"

    const-string v1, "video_end"

    .line 283
    invoke-static {p1, v0, v1}, Lcom/yoyogames/runner/RunnerJNILib;->DsMapAddString(ILjava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x46

    .line 284
    invoke-static {p1, v0}, Lcom/yoyogames/runner/RunnerJNILib;->CreateAsynEventWithDSMap(II)V

    const/4 p1, -0x2

    .line 286
    iput p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1

    const/4 p1, -0x1

    .line 299
    iput p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    .line 303
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "VideoPlayback onError: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->getInfo(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " Extra: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 1

    .line 292
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "VideoPlayback: onInfo: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p2}, Lcom/ESG/MobileByMuBai/VideoPlayback;->getInfo(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " Extra: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method public onPause()V
    .locals 1

    .line 505
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 512
    :cond_0
    :try_start_0
    sget-object v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 310
    sget-object p1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    const/4 p1, 0x0

    .line 311
    iput p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Status:I

    .line 313
    iget p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_playing:I

    iput p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    const/4 p1, 0x1

    .line 315
    sput-boolean p1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    .line 317
    iget-boolean p1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->Looping:Z

    if-eqz p1, :cond_0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 318
    invoke-virtual {p0, v0, v1}, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_EnableLoop(D)V

    .line 320
    :cond_0
    iget-wide v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->volume:D

    invoke-virtual {p0, v0, v1}, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_SetVolume(D)V

    const/4 p1, 0x0

    .line 323
    invoke-static {p1, p1, p1}, Lcom/yoyogames/runner/RunnerJNILib;->jCreateDsMap([Ljava/lang/String;[Ljava/lang/String;[D)I

    move-result p1

    const-string v0, "type"

    const-string v1, "video_start"

    .line 324
    invoke-static {p1, v0, v1}, Lcom/yoyogames/runner/RunnerJNILib;->DsMapAddString(ILjava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x46

    .line 325
    invoke-static {p1, v0}, Lcom/yoyogames/runner/RunnerJNILib;->CreateAsynEventWithDSMap(II)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 523
    sget-boolean v0, Lcom/ESG/MobileByMuBai/VideoPlayback;->mInitialised:Z

    if-nez v0, :cond_0

    return-void

    .line 526
    :cond_0
    iget v0, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->player_status:I

    iget v1, p0, Lcom/ESG/MobileByMuBai/VideoPlayback;->video_status_playing:I

    if-ne v0, v1, :cond_1

    .line 527
    invoke-virtual {p0}, Lcom/ESG/MobileByMuBai/VideoPlayback;->VideoPlayback_Resume()V

    :cond_1
    return-void
.end method

.method public onSeekComplete(Landroid/media/MediaPlayer;)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 111
    new-instance p2, Landroid/view/Surface;

    invoke-direct {p2, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 112
    sget-object p1, Lcom/ESG/MobileByMuBai/VideoPlayback;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1, p2}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "VideoPlayback onSurfaceTextureSizeChanged with width "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " height "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 1

    .line 355
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "VideoPlayback: onVideoSizeChanged: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "yoyo"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
