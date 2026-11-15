.class final Lcom/google/common/util/concurrent/ClosingFuture$State;
.super Ljava/lang/Object;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

.field final future:Lcom/google/common/util/concurrent/FluentFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;"
        }
    .end annotation
.end field

.field final status:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/google/common/util/concurrent/ClosingFuture$Status;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/FluentFuture;Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "closeables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;",
            "Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;",
            ")V"
        }
    .end annotation

    .line 2093
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2089
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2094
    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    .line 2095
    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    return-void
.end method


# virtual methods
.method becomeSubsumedInto(Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "otherCloseables"
        }
    .end annotation

    .line 2116
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->SUBSUMED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    .line 2117
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->add(Ljava/lang/AutoCloseable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method cancel(Z)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mayInterruptIfRunning"
        }
    .end annotation

    .line 2179
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "cancelling {0}"

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->closingFutureToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2180
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    invoke-virtual {v0, p1}, Lcom/google/common/util/concurrent/FluentFuture;->cancel(Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2182
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->close()V

    :cond_0
    return p1
.end method

.method checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldStatus",
            "newStatus"
        }
    .end annotation

    .line 2100
    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result p0

    const-string v0, "Expected status to be %s, but it was %s"

    .line 2099
    invoke-static {p0, v0, p1, p2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method close()V
    .locals 4

    .line 2111
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "closing {0}"

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->closingFutureToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2112
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->close()V

    return-void
.end method

.method closeIfLeaked()V
    .locals 4

    .line 2188
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2189
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    .line 2190
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v2, "Uh oh! An open ClosingFuture has leaked and will close: {0}"

    .line 2194
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->closingFutureToString()Ljava/lang/String;

    move-result-object v3

    .line 2191
    invoke-virtual {v0, v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2195
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->finishToFuture()Lcom/google/common/util/concurrent/FluentFuture;

    :cond_0
    return-void
.end method

.method closingFutureToString()Ljava/lang/String;
    .locals 3

    .line 2201
    const-string v0, "ClosingFuture"

    invoke-static {v0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/String;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2202
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "status"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    .line 2203
    invoke-virtual {v0, p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->addValue(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object p0

    .line 2204
    invoke-virtual {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldStatus",
            "newStatus"
        }
    .end annotation

    .line 2107
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p0, p1, p2}, Landroidx/lifecycle/AtomicReference$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method finishToFuture()Lcom/google/common/util/concurrent/FluentFuture;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;"
        }
    .end annotation

    .line 2121
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2122
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "will close {0}"

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->closingFutureToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2123
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    new-instance v1, Lcom/google/common/util/concurrent/ClosingFuture$State$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/google/common/util/concurrent/ClosingFuture$State$$ExternalSyntheticLambda1;-><init>(Lcom/google/common/util/concurrent/ClosingFuture$State;)V

    .line 2129
    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 2123
    invoke-virtual {v0, v1, v2}, Lcom/google/common/util/concurrent/FluentFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_0

    .line 2131
    :cond_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->ordinal()I

    move-result v0

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    .line 2149
    :goto_0
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    return-object p0

    .line 2137
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() after calling finishToValueAndCloser()"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2143
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() twice"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2133
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() after deriving another step"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2146
    :cond_4
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method finishToValueAndCloser(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;Ljava/util/concurrent/Executor;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "consumer",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer<",
            "-TV;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 2153
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2154
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CREATE_VALUE_AND_CLOSER:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 2155
    iget-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p1}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->ordinal()I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_2

    const/4 p2, 0x2

    if-eq p1, p2, :cond_1

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    const/4 p2, 0x4

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    .line 2172
    new-instance p1, Ljava/lang/AssertionError;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 2167
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() twice"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2163
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() after calling finishToFuture()"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2157
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() after deriving another step"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2174
    :cond_3
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    new-instance v1, Lcom/google/common/util/concurrent/ClosingFuture$State$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/google/common/util/concurrent/ClosingFuture$State$$ExternalSyntheticLambda0;-><init>(Lcom/google/common/util/concurrent/ClosingFuture$State;Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V

    invoke-virtual {v0, v1, p2}, Lcom/google/common/util/concurrent/FluentFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method synthetic lambda$finishToFuture$0$com-google-common-util-concurrent-ClosingFuture$State()V
    .locals 2

    .line 2125
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    .line 2126
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->close()V

    .line 2127
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    return-void
.end method

.method synthetic lambda$finishToValueAndCloser$0$com-google-common-util-concurrent-ClosingFuture$State(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V
    .locals 0

    .line 2174
    invoke-static {p1, p0}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3100(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;Lcom/google/common/util/concurrent/ClosingFuture$State;)V

    return-void
.end method
