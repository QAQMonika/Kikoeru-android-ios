.class final Lcom/google/common/util/concurrent/AbstractFutureState$SynchronizedHelper;
.super Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;
.source "AbstractFutureState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractFutureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SynchronizedHelper"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 755
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;-><init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V
    .locals 0

    .line 755
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFutureState$SynchronizedHelper;-><init>()V

    return-void
.end method


# virtual methods
.method atomicHelperTypeForTest()Ljava/lang/String;
    .locals 0

    .line 825
    const-string p0, "SynchronizedHelper"

    return-object p0
.end method

.method casListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "future",
            "expect",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            ")Z"
        }
    .end annotation

    .line 781
    monitor-enter p1

    .line 782
    :try_start_0
    iget-object p0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    if-ne p0, p2, :cond_0

    .line 783
    iput-object p3, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    const/4 p0, 0x1

    .line 784
    monitor-exit p1

    return p0

    :cond_0
    const/4 p0, 0x0

    .line 786
    monitor-exit p1

    return p0

    :catchall_0
    move-exception p0

    .line 787
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method casValue(Lcom/google/common/util/concurrent/AbstractFutureState;Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "future",
            "expect",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 814
    monitor-enter p1

    .line 815
    :try_start_0
    iget-object p0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    if-ne p0, p2, :cond_0

    .line 816
    iput-object p3, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    const/4 p0, 0x1

    .line 817
    monitor-exit p1

    return p0

    :cond_0
    const/4 p0, 0x0

    .line 819
    monitor-exit p1

    return p0

    :catchall_0
    move-exception p0

    .line 820
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "future",
            "expect",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            ")Z"
        }
    .end annotation

    .line 769
    monitor-enter p1

    .line 770
    :try_start_0
    iget-object p0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-ne p0, p2, :cond_0

    .line 771
    iput-object p3, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    const/4 p0, 0x1

    .line 772
    monitor-exit p1

    return p0

    :cond_0
    const/4 p0, 0x0

    .line 774
    monitor-exit p1

    return p0

    :catchall_0
    move-exception p0

    .line 775
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method gasListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Lcom/google/common/util/concurrent/AbstractFuture$Listener;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            ")",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;"
        }
    .end annotation

    .line 792
    monitor-enter p1

    .line 793
    :try_start_0
    iget-object p0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    if-eq p0, p2, :cond_0

    .line 795
    iput-object p2, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    .line 797
    :cond_0
    monitor-exit p1

    return-object p0

    :catchall_0
    move-exception p0

    .line 798
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method gasWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            ")",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;"
        }
    .end annotation

    .line 803
    monitor-enter p1

    .line 804
    :try_start_0
    iget-object p0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-eq p0, p2, :cond_0

    .line 806
    iput-object p2, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 808
    :cond_0
    monitor-exit p1

    return-object p0

    :catchall_0
    move-exception p0

    .line 809
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "waiter",
            "newValue"
        }
    .end annotation

    .line 763
    iput-object p2, p1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->next:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    return-void
.end method

.method putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "waiter",
            "newValue"
        }
    .end annotation

    .line 758
    iput-object p2, p1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    return-void
.end method
