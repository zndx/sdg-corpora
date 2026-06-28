---
chapter_id: ch_live_dataset_revision_of_56c005
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_revision_of', 'xdp_action_pass', 'trace_with_root_span']
model: engine-refine
---

In distributed data ecosystems, unambiguous asset identification forms the bedrock of auditability and reproducibility. Each lineage artifact is anchored by a persistent identifier—such as REVI-0001 for a dataset revision or SPAN-0001 for a trace segment—ensuring that downstream consumers can resolve dependencies without ambiguity. These identifiers operate within a versioned hierarchy, where successive iterations like version 12 or version 4 of a trace record capture incremental state changes while preserving historical fidelity. At the apex of each trace topology sits the root span, a structural anchor that aggregates child events and establishes execution context; spans such as SPAN-0002 or SPAN-0004 serve as the primary reference points for latency attribution and failure isolation. To maintain operational clarity across heterogeneous workloads, every root span is classified under a categorical taxonomy—Root Span Category 01 through 04—while supplementary misc annotations like Root Span Label 01 or Root Span Label 03 attach contextual metadata that enables semantic filtering and policy routing without altering the underlying trace structure.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

The physical characteristics of stored artifacts dictate both processing efficiency and infrastructure provisioning. Serialization format declarations, captured as mimetype fields such as application/parquet for columnar analytics or application/octet-stream for binary telemetry streams, determine how ingestion pipelines deserialize payloads and allocate compute resources. Coupled with precise size bytes accounting—where trace payloads routinely consume between 70,626,790 and 953,122,943 bytes—these metadata dimensions enable capacity forecasting, cost attribution, and SLA enforcement at scale. When a dataset revision such as genomics-raw-reads-q3 is persisted as application/parquet, the system can apply predicate pushdown and vectorized decoding, whereas an untyped application/octet-stream payload demands explicit schema validation before transformation. Size metrics and format declarations thus function as operational constraints, preventing pipeline bottlenecks and ensuring that storage tiers are matched to workload intensity and regulatory retention requirements.

Accountability in data pipelines is enforced through structured ownership and role-based access mappings that govern how assets are modified, observed, or synchronized. Dataset revisions carry explicit owner assignments—ml-infra managing sensor-fusion-calibration and satellite-telemetry-v2, while governance retains stewardship over market-index-initial—establishing clear lines of responsibility for data quality, lineage accuracy, and compliance. These ownership boundaries extend into execution workflows through junction mappings that link action passes to their constituent operations, where roles such as observer, owner, or contributor dictate permissible interactions. A compliance-xdp pass may delegate schema validation to an owner role while restricting downstream consumers to observer status, ensuring that sensitive operations like tag-PII or sync-replica execute only under authorized conditions. The subject and target fields in these relational mappings define directional dependencies, routing execution flow from source passes to downstream actions while preserving an auditable chain of custody across cross-functional teams.

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

Together, these metadata dimensions construct a self-describing governance layer that operates transparently across ingestion, transformation, and tracing stages. When a revision of grid-load-forecast-base is promoted through the pipeline, its mimetype and size bytes inform storage tiering, its version number guarantees reproducibility for downstream model training, and its root span classification enables real-time latency monitoring and anomaly detection. Role assignments and ownership tags are evaluated at each action pass boundary, ensuring that only authorized entities can modify critical assets like customer-churn-features or prod-ingest-xdp configurations. This layered metadata architecture eliminates reliance on implicit conventions, replacing them with explicit, queryable relationships that support regulatory compliance, incident response, and continuous system observability. By treating identifiers, formats, sizes, and access postures as first-class governance primitives, organizations maintain deterministic control over data lifecycles even as pipeline complexity scales.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |

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