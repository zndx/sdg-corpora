---
chapter_id: ch_live_cardinality_exactly_one_generic_550c17
topic_id: 186
family: 01_foundation
cited_terms: ['cardinality_exactly_one_generic', 'xdp_action_pass', 'trace_subclass']
model: engine-refine
---

Within distributed data processing systems, every operation is anchored by a unique identifier that serves as the primary key for tracking, correlation, and auditability. Trace records carry identifiers such as TRAC-0001 through TRAC-0004, while pipeline actions are similarly distinguished by codes like PASS-0001 and GENE-0001. These identifiers are not merely labels; they form the connective tissue across the entire observability stack, linking execution metrics to their categorical classifications and to the roles of the entities that govern them. A trace identified as TRAC-0001, for instance, can be traced through its associated spans, its duration measurements, and the cardinality constraints that define its ownership—here, an ExclusiveOwner relationship to a CoreService.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

**t_xdp_action_pass**

| id | xdp |
| --- | --- |
| PASS-0001 | prod-ingest-xdp |
| PASS-0002 | edge-telemetry-xdp |
| PASS-0003 | compliance-xdp |
| PASS-0004 | prod-ingest-xdp |
| PASS-0005 | streaming-fabric-xdp |
| PASS-0006 | cloud-sync-xdp |

**t_xdp_action_pass_x_d_p_action**

| id | x_d_p_action |
| --- | --- |
| PASS-0001 | route-to-lake |
| PASS-0002 | validate-schema |
| PASS-0003 | sync-replica |
| PASS-0004 | tag-PII |
| PASS-0005 | drop-invalid |
| PASS-0006 | encrypt-payload |

**t_xdp_action_pass__x_d_p_action**

| id | xdp_id | x_d_p_action_id | role |
| --- | --- | --- | --- |
| PASS-0001 | PASS-0001 | PASS-0005 | observer |
| PASS-0002 | PASS-0002 | PASS-0004 | owner |
| PASS-0003 | PASS-0005 | PASS-0003 | observer |
| PASS-0004 | PASS-0005 | PASS-0005 | contributor |
| PASS-0005 | PASS-0003 | PASS-0006 | observer |
| PASS-0006 | PASS-0005 | PASS-0006 | contributor |
| PASS-0007 | PASS-0005 | PASS-0001 | observer |
| PASS-0008 | PASS-0002 | PASS-0001 | contributor |

The temporal and outcome dimensions of a trace are captured through duration seconds and exit codes, which together provide a quantitative snapshot of execution health. A trace may consume 1874.27 seconds to complete, while another stretches to 3940.66 seconds, reflecting the variable complexity and load conditions inherent in production workloads. Exit codes such as 491, 900, 420, and 60 encode the termination state of each trace, enabling downstream systems to classify outcomes as successful, degraded, or failed. These metrics are not isolated; they are attached to specific spans, which represent discrete units of work within a broader trace. A span identified as TRAC-0005 might serve as the spans_key for a trace, effectively pointing to the parent execution context from which the span originated.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

Resilience in these systems is quantified through retry counts, which measure how many times a failed operation was retried before reaching a final state. Retry counts in the observed data range from 179 to 459, indicating that certain traces undergo extensive recovery cycles before stabilization. A retry count of 459, for example, suggests a particularly volatile operation that required repeated attempts—perhaps due to transient network failures, resource contention, or downstream service unavailability. These counts are critical for capacity planning and SLA compliance, as they reveal the operational friction embedded in the system. When combined with duration and exit data, retry counts paint a complete picture of trace reliability and the effectiveness of retry policies.

Spans are further classified through a category hierarchy that supports both operational categorization and governance. Each span carries a category identifier that references a category definition table, where category names such as Category Name 01 through Category Name 04 provide human-readable groupings. The spans themselves also carry a misc label—Spans Label 01 through Spans Label 04—and a spans_category field that may differ from the canonical category_id, allowing for flexible, context-dependent classification. This dual-layer categorization enables both rigid governance (through the category_id foreign key) and ad-hoc operational labeling (through the misc field), ensuring that spans can be queried and filtered along multiple axes.

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

The relationships between data processing actions and their associated operations are governed by a join table that introduces the concepts of subject, target, and role. Here, a subject column (xdp_id) references a specific XDP action—such as prod-ingest-xdp or compliance-xdp—while the target column (x_d_p_action_id) points to the action being performed, such as route-to-lake, validate-schema, sync-replica, or tag-PII. The role column assigns a governance posture to each relationship, with values like observer, owner, and contributor defining the level of authority and responsibility. For example, an XDP action may have an observer role for one target operation and a contributor role for another, reflecting the principle that the same entity can hold different levels of accountability depending on the context.

Cardinality constraints enforce the structural integrity of ownership and dependency relationships across the system. The cardinality table records relationships such as ExclusiveOwner, which asserts sole ownership (as seen with GENE-0001 and GENE-0002, both tied to CoreService and SingleSource respectively), and StrictParent, which defines hierarchical dependencies (as with GENE-0003 and GENE-0004, linked to DesignatedOwner and SourceSystem). These constraints are essential for governance frameworks, as they prevent ambiguous ownership, ensure that critical resources have a single accountable entity, and maintain the integrity of parent-child relationships in complex data pipelines. Without such cardinality rules, the system would lack the structural guarantees necessary for auditability, incident response, and compliance reporting.