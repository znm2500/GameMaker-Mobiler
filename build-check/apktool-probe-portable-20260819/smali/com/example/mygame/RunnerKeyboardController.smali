.class public Lcom/example/mygame/RunnerKeyboardController;
.super Ljava/lang/Object;
.source "RunnerKeyboardController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/mygame/RunnerKeyboardController$KeyboardInputEditText;,
        Lcom/example/mygame/RunnerKeyboardController$KeyboardInputConnectionWrapper;,
        Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;,
        Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;
    }
.end annotation


# static fields
.field public static final DEBUG_SHOW_HIDDEN_TEXT_FIELD:Z = false

.field public static final KEYBOARD_EVENT_SOURCE_DEFAULT:I = 0x1103

.field public static final KEYBOARD_STATUS_HIDDEN:Ljava/lang/String; = "hidden"

.field public static final KEYBOARD_STATUS_HIDING:Ljava/lang/String; = "hiding"

.field public static final KEYBOARD_STATUS_SHOWING:Ljava/lang/String; = "showing"

.field public static final KEYBOARD_STATUS_VISIBLE:Ljava/lang/String; = "visible"

.field private static ms_estimatedKeyboardHeight:I


# instance fields
.field private m_activityView:Landroid/view/View;

.field private m_context:Landroid/content/Context;

.field private m_currentAutocapitalizationType:I

.field private m_currentKeyboardHeight:I

.field private m_currentKeyboardType:I

.field private m_currentPredictiveTextEnabled:Z

.field private m_currentReturnKeyType:I

.field private m_editText:Landroid/widget/EditText;

.field private m_inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private m_keyboardStatus:Ljava/lang/String;

.field private m_physicalKeyboardConnected:Z

.field private m_setTextHandlerEnabled:Z

.field private m_viewActiveRect:Landroid/graphics/Rect;

.field private m_viewHandler:Landroid/os/Handler;

.field private m_virtualKeyboardActive:Z

.field private m_virtualKeyboardStatusRequested:Z

.field private m_virtualKeyboardToggleResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

.field private m_virtualKeyboardVisibilityCheckAdjustReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

.field private m_virtualKeyboardVisibilityCheckResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

.field private m_virtualKeyboardVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 233
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/16 v0, 0x30

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v0, v0, 0x64

    sput v0, Lcom/example/mygame/RunnerKeyboardController;->ms_estimatedKeyboardHeight:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;Landroid/os/Handler;)V
    .locals 2

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 215
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_context:Landroid/content/Context;

    .line 216
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 217
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    .line 218
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewHandler:Landroid/os/Handler;

    const-string v1, "hidden"

    .line 220
    iput-object v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    const/4 v1, 0x0

    .line 221
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardActive:Z

    .line 222
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisible:Z

    .line 223
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardStatusRequested:Z

    .line 224
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_physicalKeyboardConnected:Z

    .line 226
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardToggleResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 227
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisibilityCheckAdjustReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 228
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisibilityCheckResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 230
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    .line 232
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewActiveRect:Landroid/graphics/Rect;

    .line 235
    iput v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentKeyboardType:I

    .line 236
    iput v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentReturnKeyType:I

    .line 237
    iput v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentAutocapitalizationType:I

    .line 238
    iput v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentKeyboardHeight:I

    .line 239
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentPredictiveTextEnabled:Z

    .line 241
    iput-boolean v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_setTextHandlerEnabled:Z

    .line 249
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_context:Landroid/content/Context;

    .line 250
    iput-object p2, p0, Lcom/example/mygame/RunnerKeyboardController;->m_inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 251
    iput-object p3, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    .line 252
    iput-object p4, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewHandler:Landroid/os/Handler;

    return-void
.end method

.method public static Create(Landroid/content/Context;Landroid/view/View;Landroid/os/Handler;)Lcom/example/mygame/RunnerKeyboardController;
    .locals 2

    const-string v0, "input_method"

    .line 258
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 265
    :cond_0
    new-instance v1, Lcom/example/mygame/RunnerKeyboardController;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/example/mygame/RunnerKeyboardController;-><init>(Landroid/content/Context;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;Landroid/os/Handler;)V

    .line 266
    invoke-direct {v1}, Lcom/example/mygame/RunnerKeyboardController;->Init()V

    return-object v1
.end method

.method private static GetStringCodepoints(Ljava/lang/String;)[I
    .locals 6

    .line 747
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 753
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    add-int/lit8 v3, v3, 0x1

    .line 755
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v2, v4

    goto :goto_0

    .line 759
    :cond_0
    new-array v2, v3, [I

    const/4 v3, 0x0

    :goto_1
    if-ge v1, v0, :cond_1

    .line 764
    invoke-virtual {p0, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    add-int/lit8 v5, v3, 0x1

    .line 765
    aput v4, v2, v3

    .line 766
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v3

    add-int/2addr v1, v3

    move v3, v5

    goto :goto_1

    :cond_1
    return-object v2
.end method

.method private Init()V
    .locals 0

    .line 275
    invoke-direct {p0}, Lcom/example/mygame/RunnerKeyboardController;->InitTextField()V

    .line 276
    invoke-direct {p0}, Lcom/example/mygame/RunnerKeyboardController;->InitReceivers()V

    return-void
.end method

.method private InitReceivers()V
    .locals 2

    .line 389
    new-instance v0, Lcom/example/mygame/RunnerKeyboardController$2;

    invoke-direct {v0, p0, p0}, Lcom/example/mygame/RunnerKeyboardController$2;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardToggleResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 416
    new-instance v0, Lcom/example/mygame/RunnerKeyboardController$3;

    invoke-direct {v0, p0, p0}, Lcom/example/mygame/RunnerKeyboardController$3;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisibilityCheckAdjustReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 427
    new-instance v0, Lcom/example/mygame/RunnerKeyboardController$4;

    invoke-direct {v0, p0, p0}, Lcom/example/mygame/RunnerKeyboardController$4;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisibilityCheckResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    .line 437
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;

    invoke-direct {v1, p0, p0}, Lcom/example/mygame/RunnerKeyboardController$KeyboardLayoutListener;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method private InitTextField()V
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewHandler:Landroid/os/Handler;

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$1;

    invoke-direct {v1, p0, p0}, Lcom/example/mygame/RunnerKeyboardController$1;-><init>(Lcom/example/mygame/RunnerKeyboardController;Lcom/example/mygame/RunnerKeyboardController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic access$000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/widget/EditText;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$002(Lcom/example/mygame/RunnerKeyboardController;Landroid/widget/EditText;)Landroid/widget/EditText;
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    return-object p1
.end method

.method static synthetic access$100(Lcom/example/mygame/RunnerKeyboardController;)Landroid/content/Context;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/example/mygame/RunnerKeyboardController;)Landroid/view/inputmethod/InputMethodManager;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/example/mygame/RunnerKeyboardController;)Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisibilityCheckAdjustReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    return-object p0
.end method

.method static synthetic access$200(Lcom/example/mygame/RunnerKeyboardController;)Z
    .locals 0

    .line 36
    iget-boolean p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_setTextHandlerEnabled:Z

    return p0
.end method

.method static synthetic access$300(Ljava/lang/String;)[I
    .locals 0

    .line 36
    invoke-static {p0}, Lcom/example/mygame/RunnerKeyboardController;->GetStringCodepoints(Ljava/lang/String;)[I

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/example/mygame/RunnerKeyboardController;)Landroid/view/View;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$502(Lcom/example/mygame/RunnerKeyboardController;I)I
    .locals 0

    .line 36
    iput p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentKeyboardType:I

    return p1
.end method

.method static synthetic access$602(Lcom/example/mygame/RunnerKeyboardController;I)I
    .locals 0

    .line 36
    iput p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentReturnKeyType:I

    return p1
.end method

.method static synthetic access$702(Lcom/example/mygame/RunnerKeyboardController;I)I
    .locals 0

    .line 36
    iput p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentAutocapitalizationType:I

    return p1
.end method

.method static synthetic access$802(Lcom/example/mygame/RunnerKeyboardController;Z)Z
    .locals 0

    .line 36
    iput-boolean p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentPredictiveTextEnabled:Z

    return p1
.end method

.method static synthetic access$900(Lcom/example/mygame/RunnerKeyboardController;)Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardToggleResultReceiver:Lcom/example/mygame/RunnerKeyboardController$KeyboardResultReceiver;

    return-object p0
.end method


# virtual methods
.method public GetInputString()Ljava/lang/String;
    .locals 1

    .line 736
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 738
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public GetPhysicalKeyboardConnected()Z
    .locals 1

    .line 696
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_physicalKeyboardConnected:Z

    return v0
.end method

.method public GetPredictiveTextEnabled()Z
    .locals 1

    .line 706
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentPredictiveTextEnabled:Z

    return v0
.end method

.method public GetVirtualKeyboardActive()Z
    .locals 1

    .line 674
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardActive:Z

    return v0
.end method

.method public GetVirtualKeyboardHeightCached()I
    .locals 1

    .line 701
    iget v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentKeyboardHeight:I

    return v0
.end method

.method public GetVirtualKeyboardVisible()Z
    .locals 1

    .line 685
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisible:Z

    return v0
.end method

.method public OnActivityLayoutChanged()V
    .locals 4

    .line 637
    invoke-virtual {p0}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardGetHeight()I

    move-result v0

    .line 638
    sget v1, Lcom/example/mygame/RunnerKeyboardController;->ms_estimatedKeyboardHeight:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    .line 640
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/4 v3, 0x1

    .line 638
    invoke-static {v3, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 642
    :goto_0
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisible:Z

    if-ne v3, v0, :cond_1

    return-void

    .line 645
    :cond_1
    invoke-virtual {p0, v3}, Lcom/example/mygame/RunnerKeyboardController;->SetVirtualKeyboardVisible(Z)V

    if-eqz v3, :cond_2

    const-string v0, "visible"

    .line 648
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    goto :goto_1

    :cond_2
    const-string v0, "hidden"

    .line 650
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    .line 652
    :goto_1
    invoke-virtual {p0}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardReportStatus()V

    return-void
.end method

.method public OnPhysicalKeyboardKeyEvent(ILandroid/view/KeyEvent;)V
    .locals 0

    return-void
.end method

.method public OnVirtualKeyboardVisibilityCheckResult(I)V
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 576
    invoke-virtual {p0, v0}, Lcom/example/mygame/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    const-string v0, "hidden"

    .line 577
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    goto :goto_0

    .line 581
    :cond_1
    invoke-virtual {p0, v0}, Lcom/example/mygame/RunnerKeyboardController;->SetVirtualKeyboardActive(Z)V

    const-string v0, "visible"

    .line 582
    iput-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    .line 586
    :goto_0
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewHandler:Landroid/os/Handler;

    new-instance v1, Lcom/example/mygame/RunnerKeyboardController$6;

    invoke-direct {v1, p0, p1}, Lcom/example/mygame/RunnerKeyboardController$6;-><init>(Lcom/example/mygame/RunnerKeyboardController;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public SetInputString([IZ)V
    .locals 3

    .line 712
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    .line 716
    iput-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_setTextHandlerEnabled:Z

    .line 718
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 719
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 721
    aget v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 724
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 725
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[VK] SetInputString. Length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ". New string: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "yoyo"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    iget-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 728
    iget-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    if-eqz p2, :cond_3

    const/4 p1, 0x1

    .line 731
    iput-boolean p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_setTextHandlerEnabled:Z

    :cond_3
    return-void
.end method

.method public SetPhysicalKeyboardConnected(Z)V
    .locals 0

    .line 691
    iput-boolean p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_physicalKeyboardConnected:Z

    return-void
.end method

.method public SetVirtualKeyboardActive(Z)V
    .locals 0

    .line 669
    iput-boolean p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardActive:Z

    return-void
.end method

.method public SetVirtualKeyboardVisible(Z)V
    .locals 0

    .line 680
    iput-boolean p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardVisible:Z

    return-void
.end method

.method public UpdateKeyboardStatusFromIMMResult(I)V
    .locals 1

    if-eqz p1, :cond_3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "hiding"

    .line 659
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string p1, "showing"

    .line 661
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const-string p1, "hidden"

    .line 660
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const-string p1, "visible"

    .line 662
    iput-object p1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method public VirtualKeyboardGetHeight()I
    .locals 3

    .line 611
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    iget-object v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewActiveRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 612
    iget-object v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_activityView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewActiveRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/example/mygame/RunnerKeyboardController;->m_viewActiveRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    sub-int/2addr v0, v1

    return v0
.end method

.method public VirtualKeyboardGetStatus()Z
    .locals 1

    .line 549
    iget-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardActive:Z

    return v0
.end method

.method public VirtualKeyboardHide()V
    .locals 8

    .line 542
    invoke-virtual {p0}, Lcom/example/mygame/RunnerKeyboardController;->GetInputString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/example/mygame/RunnerKeyboardController;->GetStringCodepoints(Ljava/lang/String;)[I

    move-result-object v7

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, p0

    invoke-virtual/range {v1 .. v7}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardToggle(ZIIIZ[I)V

    return-void
.end method

.method public VirtualKeyboardReportStatus()V
    .locals 2

    const/4 v0, 0x0

    .line 556
    iput-boolean v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_virtualKeyboardStatusRequested:Z

    .line 557
    invoke-virtual {p0}, Lcom/example/mygame/RunnerKeyboardController;->VirtualKeyboardGetHeight()I

    move-result v0

    iput v0, p0, Lcom/example/mygame/RunnerKeyboardController;->m_currentKeyboardHeight:I

    .line 558
    iget-object v1, p0, Lcom/example/mygame/RunnerKeyboardController;->m_keyboardStatus:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/yoyogames/runner/RunnerJNILib;->OnVirtualKeyboardStatus(Ljava/lang/String;I)V

    return-void
.end method

.method public VirtualKeyboardToggle(ZIIIZ[I)V
    .locals 11

    move-object v8, p0

    .line 444
    iget-object v9, v8, Lcom/example/mygame/RunnerKeyboardController;->m_viewHandler:Landroid/os/Handler;

    new-instance v10, Lcom/example/mygame/RunnerKeyboardController$5;

    move-object v0, v10

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p4

    move/from16 v5, p5

    move v6, p3

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/example/mygame/RunnerKeyboardController$5;-><init>(Lcom/example/mygame/RunnerKeyboardController;ZIIZI[I)V

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
