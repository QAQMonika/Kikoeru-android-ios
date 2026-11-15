.class Lcom/google/common/graph/AbstractBaseGraph$3$1;
.super Lcom/google/common/graph/IncidentEdgeSet;
.source "AbstractBaseGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/AbstractBaseGraph$3;->inEdges(Ljava/lang/Object;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/IncidentEdgeSet<",
        "TN;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/graph/AbstractBaseGraph$3;


# direct methods
.method constructor <init>(Lcom/google/common/graph/AbstractBaseGraph$3;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            "this$1",
            "graph",
            "node",
            "edgeType"
        }
    .end annotation

    .line 249
    iput-object p1, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->this$1:Lcom/google/common/graph/AbstractBaseGraph$3;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/common/graph/IncidentEdgeSet;-><init>(Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    return-void
.end method


# virtual methods
.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 252
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->graph:Lcom/google/common/graph/ArchetypeGraph;

    iget-object v1, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->node:Ljava/lang/Object;

    .line 254
    invoke-interface {v0, v1}, Lcom/google/common/graph/ArchetypeGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/graph/AbstractBaseGraph$3$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/google/common/graph/AbstractBaseGraph$3$1$$ExternalSyntheticLambda0;-><init>(Lcom/google/common/graph/AbstractBaseGraph$3$1;)V

    .line 253
    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    .line 252
    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 0

    .line 249
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3$1;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$iterator$0$com-google-common-graph-AbstractBaseGraph$3$1(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .locals 1

    .line 256
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->node:Ljava/lang/Object;

    invoke-static {p1, p0}, Lcom/google/common/graph/EndpointPair;->ordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0

    .line 258
    :cond_0
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$1;->node:Ljava/lang/Object;

    invoke-static {p1, p0}, Lcom/google/common/graph/EndpointPair;->unordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method
