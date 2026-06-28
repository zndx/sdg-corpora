---
chapter_id: ch_live_evidence_subclass_44a6df
topic_id: 105
family: 06_belief_structure
cited_terms: ['evidence_subclass', 'belief_interval_exactly_two_bounds', 'dempster_combinant_first']
model: engine-refine
---

Identifiers serve as the immutable anchors of any evidence management system, providing stable handles that survive the inevitable churn of provenance, versioning, and cross-referencing. An identifier such as EVID-0001 or FIRS-0003 is not merely a label; it is the primary key that allows disparate records—whether an IoT sensor reading batch, a query execution plan, or a Western blot film—to be located, related, and audited across the entire knowledge graph. In the Dempster-Shafer framework, identifiers appear at every level: evidence items carry identifiers like EVID-0001 through EVID-0004, belief intervals are keyed by BOUN-0001 through BOUN-0004, and Dempster combinants themselves are identified by FIRS-0001 through FIRS-0004. This consistent use of structured identifiers ensures that every claim, every bound, and every inference engine can be traced back to its origin without ambiguity.

**t_belief_interval_exactly_two_bounds**

| id | belief |
| --- | --- |
| BOUN-0001 | battery charge decay |
| BOUN-0002 | turbine vibration threshold |
| BOUN-0003 | blood glucose trend |
| BOUN-0004 | reactor core temperature estimate |
| BOUN-0005 | filter clog probability |
| BOUN-0006 | turbine vibration threshold |

**t_dempster_combinant_first**

| id | dempster |
| --- | --- |
| FIRS-0001 | UncertaintyPropagationPipeline |
| FIRS-0002 | MultiSourceInferenceEngine |
| FIRS-0003 | EvidenceCombinationModel |
| FIRS-0004 | ProvenanceAggregator |
| FIRS-0005 | DataQualityFusionService |
| FIRS-0006 | BeliefFusionEngine |

**t_dempster_combinant_first_first_combinant**

| id | first_combinant |
| --- | --- |
| FIRS-0001 | HistoricalLogArchive |
| FIRS-0002 | CoreTelemetryFeed |
| FIRS-0003 | GroundTruthLabels |
| FIRS-0004 | PrimaryFlightData |
| FIRS-0005 | LIDARPointCloud |
| FIRS-0006 | BaselineSensorArray |

Language introduces a critical dimension of provenance and interpretability. Evidence does not exist in a vacuum; it is produced, recorded, and consumed within specific linguistic contexts that affect how it is understood and combined. The evidence subclass table captures this by recording the language of each evidence item—Japanese (ja) for an IoT sensor reading batch (EVID-0001), Spanish (es) for a query execution plan (EVID-0002), and French (fr) for two separate Western blot film records (EVID-0003 and EVID-0004). When evidence from different linguistic sources feeds into a single Dempster combinant such as the EvidenceCombinationModel (FIRS-0003), the language field becomes essential for downstream translation, validation, and quality assurance. A system that ignores language metadata risks combining semantically misaligned evidence, producing conclusions that are mathematically sound but contextually incoherent.

**t_evidence_subclass**

| id | evidence | supports_claim | uncertainty | language |
| --- | --- | --- | --- | --- |
| EVID-0001 | IoT sensor reading batch | FIRS-0003 | 777.57 | ja |
| EVID-0002 | Query execution plan | FIRS-0005 | 535.87 | es |
| EVID-0003 | Western blot film | FIRS-0005 | 239.52 | fr |
| EVID-0004 | Western blot film | FIRS-0004 | 418.27 | fr |
| EVID-0005 | IoT sensor reading batch | FIRS-0002 | 969.30 | es |
| EVID-0006 | ETL pipeline log | FIRS-0006 | 692.45 | fr |

Role is the relational glue that specifies how one entity participates in a connection to another. In the belief interval schema, the junction table linking belief intervals to their lower bounds assigns roles such as observer, reviewer, and contributor to each pairing. For instance, the belief interval BOUN-0006 participates as an observer in relation to the lower bound BOUN-0004, while BOUN-0003 and BOUN-0002 both participate as reviewers in relation to bounds BOUN-0001 and BOUN-0004 respectively. Similarly, in the Dempster combinant structure, roles distinguish between observer, reviewer, and owner relationships: the UncertaintyPropagationPipeline (FIRS-0001) acts as an observer when linked to the EvidenceCombinationModel (FIRS-0001) and to the GroundTruthLabels combinant (FIRS-0004), whereas the ProvenanceAggregator (FIRS-0005) assumes the role of owner when connected to the PrimaryFlightData combinant (FIRS-0006). These role annotations are not decorative; they encode governance, accountability, and the chain of custody for every inference step.

**t_belief_interval_exactly_two_bounds_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| BOUN-0001 | 78.9 pct |
| BOUN-0002 | 22.4 dBm |
| BOUN-0003 | 0.001 |
| BOUN-0004 | 15.0 kPa |
| BOUN-0005 | 78.9 pct |
| BOUN-0006 | 78.9 pct |

Subject and target formalize the directionality of relationships, making explicit which entity is the source of a connection and which is its destination. In the belief interval lower-bound junction table, the belief_id column identifies the subject—the belief interval initiating the relationship—while belief_lower_bound_id identifies the target—the bound being referenced. The same pattern appears in the Dempster combinant junction table, where dempster_id is the subject and first_combinant_id is the target. This subject-target distinction is fundamental to graph-based reasoning: it allows the system to answer questions like "which belief intervals reference this lower bound?" (target-centric) versus "which lower bounds does this belief interval reference?" (subject-centric). Without explicit subject and target columns, relationships become undirected edges, and the provenance trail collapses.

**t_belief_interval_exactly_two_bounds__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0006 | BOUN-0004 | observer |
| BOUN-0002 | BOUN-0003 | BOUN-0001 | reviewer |
| BOUN-0003 | BOUN-0002 | BOUN-0004 | reviewer |
| BOUN-0004 | BOUN-0001 | BOUN-0002 | contributor |
| BOUN-0005 | BOUN-0001 | BOUN-0001 | reviewer |
| BOUN-0006 | BOUN-0003 | BOUN-0004 | observer |
| BOUN-0007 | BOUN-0001 | BOUN-0004 | reviewer |
| BOUN-0008 | BOUN-0005 | BOUN-0002 | observer |

**t_dempster_combinant_first__first_combinant**

| id | dempster_id | first_combinant_id | role |
| --- | --- | --- | --- |
| FIRS-0001 | FIRS-0001 | FIRS-0005 | observer |
| FIRS-0002 | FIRS-0005 | FIRS-0002 | reviewer |
| FIRS-0003 | FIRS-0001 | FIRS-0004 | observer |
| FIRS-0004 | FIRS-0005 | FIRS-0006 | owner |
| FIRS-0005 | FIRS-0004 | FIRS-0005 | owner |
| FIRS-0006 | FIRS-0005 | FIRS-0005 | owner |
| FIRS-0007 | FIRS-0006 | FIRS-0004 | contributor |
| FIRS-0008 | FIRS-0002 | FIRS-0005 | observer |

Uncertainty quantifies the confidence—or lack thereof—attached to each piece of evidence, and it is the numerical core of the Dempster-Shafer reasoning process. The evidence subclass table records uncertainty values as floating-point numbers: 777.57 for the IoT sensor reading batch (EVID-0001), 535.87 for the query execution plan (EVID-0002), 239.52 for the first Western blot film (EVID-0003), and 418.27 for the second Western blot film (EVID-0004). These values are not arbitrary; they represent the degree of belief mass assigned to each evidence item and determine how strongly each item influences the combined conclusion. The belief interval table further structures uncertainty by defining lower bounds for belief—such as 78.9 percent for battery charge decay (BOUN-0001), 22.4 dBm for turbine vibration threshold (BOUN-0002), 0.001 for blood glucose trend (BOUN-0003), and 15.0 kPa for reactor core temperature estimate (BOUN-0004)—thereby converting abstract uncertainty into actionable confidence intervals. When multiple evidence items with different uncertainty levels feed into a single Dempster combinant like the MultiSourceInferenceEngine (FIRS-0002), the system must reconcile these disparate uncertainty values to produce a coherent combined belief state.