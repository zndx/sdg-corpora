---
chapter_id: ch_live_log_within_span_context_f5b38f
topic_id: 65
family: 07_long_tail
cited_terms: ['log_within_span_context', 'annotation_only_about_artifact', 'ebpf_event_writes_to_map']
model: engine-refine
---

In distributed observability and trace analysis, the identifier serves as the immutable anchor for every recorded event, whether it denotes a log stream such as `CONT-0001` associated with `cache-eviction.out`, or an annotation record like `ARTI-0001` carrying a confidence of `0.845` against an uncertainty of `690.59`. These identifiers establish referential integrity across the schema, enabling a log entry to be correlated with its enclosing span context—`user-session-4492` for `CONT-0001`, `us-east-1-cluster` for `CONT-0002`, `ml-inference-run` for `CONT-0003`—and, through a junction relationship, with the role assumed by the originating entity: `reviewer`, `observer`, or `contributor`. The subject and target columns in this junction table encode the directional linkage between a log source and its contextual container, with the subject referencing the originating log identifier (e.g., `CONT-0006` pointing to `CONT-0003`) and the target identifying the span context to which the log belongs, thereby preserving the provenance of each observation within a nested hierarchy of spans.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

Annotation records introduce a layer of semantic enrichment, pairing each annotation key with a categorical label and a confidence score that quantifies the annotator's certainty in the classification. The confidence metric, ranging from `0.236` for `ARTI-0002` to `0.845` for `ARTI-0001`, operates inversely with the uncertainty field, which captures the absolute dispersion of the estimate—`593.98` for the lowest-confidence annotation and `22.02` for the highest. This dual representation allows downstream systems to weight annotations probabilistically rather than treating them as binary assertions. The annotation category and its associated label, drawn from a dimension table, provide the taxonomic framing: `Annotation Category 01` through `Annotation Category 04`, each mapped to a human-readable label such as `Annotation Label 01`. The misc column in the annotation fact table holds the raw or derived value of the annotation itself, with entries like `979.94` and `284.47` representing the quantitative payload that the category and confidence jointly qualify.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

The eBPF fact table extends this pattern to kernel-level telemetry, where the identifier `MAP-0001` through `MAP-0004` tags individual eBPF map write operations, each characterized by a duration in seconds—`5223.15`, `6511.30`, `6092.75`, `4285.04`—an exit code reflecting the termination status of the operation (`224`, `266`, `948`, `381`), and a retry count indicating how many times the operation was retried before completion (`439`, `25`, `201`, `33`). The duration_seconds column captures the wall-clock latency of each map write, a critical metric for identifying performance regressions in eBPF programs that interact with kernel data structures. The exit_code field encodes the final state of the operation, with values such as `224` and `948` suggesting non-zero termination conditions that may warrant investigation. The retry_count column, ranging from a single-digit `25` to a high of `439`, provides a direct signal of operational instability: a retry count of `439` for `MAP-0001` indicates persistent transient failures, whereas `25` for `MAP-0002` suggests a relatively stable execution path.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

The dimension tables for annotations and map writes follow a consistent pattern of separating categorical metadata from factual measurements. The `dim_annotation` table assigns each annotation an `annotation_label` and an `annotation_category`, while `dim_writes_to_map` assigns each map write a `writes_to_map_label` and a `writes_to_map_category`. These dimensions serve as lookup tables that enrich the fact tables with human-interpretable taxonomy, enabling aggregation and filtering by category without exposing the raw identifier space to end users. The misc column in both dimension tables provides additional free-form metadata that does not fit neatly into the categorical schema, preserving flexibility for attributes that may evolve over time. This separation of concerns—facts capturing measurements and dimensions capturing classification—mirrors the star-schema design pattern commonly employed in analytical databases, ensuring that the same categorical labels can be reused across multiple fact tables without duplication.

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |