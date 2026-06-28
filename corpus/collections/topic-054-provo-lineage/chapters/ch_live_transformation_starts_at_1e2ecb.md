---
chapter_id: ch_live_transformation_starts_at_1e2ecb
topic_id: 54
family: 05_provo_lineage
cited_terms: ['transformation_starts_at', 'transformation_subclass', 'transformation_with_input_dataset']
model: engine-refine
---

In operational registries governing data transformation lifecycles, each activity is anchored by a persistent identifier—`STAR-0001` through `STAR-0004` for initiation events, `TRAN-0001` through `TRAN-0004` for subclass instances, and `DATA-0001` through `DATA-0004` for dataset-bound executions—providing the immutable reference point across all audit trails. These identifiers serve as the primary keys that bind together temporal metadata, role assignments, and execution outcomes into a coherent provenance chain. A transformation such as "record deduplication" or "Checksum Integrity Validation" is not merely a label; it is a named operation that must be traceable from its initiation timestamp through its final status, and the identifier is the thread that holds this chain together.

**t_transformation_starts_at**

| id | transformation |
| --- | --- |
| STAR-0001 | record deduplication |
| STAR-0002 | Metadata Enrichment Workflow |
| STAR-0003 | record deduplication |
| STAR-0004 | log aggregation |
| STAR-0005 | audit log reconciliation |
| STAR-0006 | batch ingestion job |

**t_transformation_starts_at_started_at_time**

| id | started_at_time |
| --- | --- |
| STAR-0001 | 2024-03-15T09:15:22Z |
| STAR-0002 | 2024-03-15T11:45:10Z |
| STAR-0003 | 2024-03-15T16:30:00Z |
| STAR-0004 | 2024-03-15T10:00:00Z |
| STAR-0005 | 2024-03-15T15:55:42Z |
| STAR-0006 | 2024-03-15T11:45:10Z |

**t_transformation_subclass**

| id | transformation | uses_entity | phase | status |
| --- | --- | --- | --- | --- |
| TRAN-0001 | feature extraction | REST API Response Bodies | review | failed |
| TRAN-0002 | anomaly detection | Reagent Batch Alpha | execution | complete |
| TRAN-0003 | Checksum Integrity Validation | PCAP Archive Files | execution | pending |
| TRAN-0004 | Feature Vector Normalization | PostgreSQL Schema Definitions | execution | complete |

**t_transformation_with_input_dataset**

| id | transformation | input_dataset | duration_seconds | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | data archival batch | patient vitals | 7022.59 | 337 |
| DATA-0002 | calibration procedure | network traffic capture | 3575.88 | 418 |
| DATA-0003 | ETL pipeline run | financial trade records | 722.03 | 276 |
| DATA-0004 | Checksum Integrity Validation | genomic sequencing reads | 6380.45 | 352 |
| DATA-0005 | Log Pattern Extraction | raw sensor logs | 5901.31 | 65 |
| DATA-0006 | data normalization pass | genomic sequencing reads | 1979.98 | 431 |
| DATA-0007 | Checksum Integrity Validation | field survey records | 6357.24 | 452 |

The temporal dimension of any transformation is captured through a junction association that links a transformation to its start time with a specific role assignment. In this model, the transformation identifier acts as the subject of the relationship, the start-time identifier serves as the target, and the role column—taking values such as `owner`, `reviewer`, or `observer`—designates the capacity in which the transformation is invoked relative to that moment. For instance, the transformation `STAR-0002` is associated with start time `STAR-0001` under the role of `reviewer`, while the same transformation appears again against start time `STAR-0005` with the role of `observer`, indicating that a single transformation may participate in multiple temporal contexts, each governed by a distinct accountability posture. This subject-to-target linkage, mediated by role, ensures that every invocation carries its own governance context rather than a single monolithic attribution.

**t_transformation_starts_at__started_at_time**

| id | transformation_id | started_at_time_id | role |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0006 | STAR-0005 | owner |
| STAR-0002 | STAR-0002 | STAR-0001 | reviewer |
| STAR-0003 | STAR-0002 | STAR-0005 | observer |
| STAR-0004 | STAR-0002 | STAR-0004 | observer |
| STAR-0005 | STAR-0001 | STAR-0003 | contributor |
| STAR-0006 | STAR-0001 | STAR-0006 | observer |
| STAR-0007 | STAR-0006 | STAR-0003 | reviewer |
| STAR-0008 | STAR-0002 | STAR-0005 | reviewer |

The lifecycle of a transformation subclass is tracked through two orthogonal dimensions: phase and status. Phase distinguishes between stages of the operational workflow—`review` and `execution` being the observed categories—while status records the terminal or current disposition of the activity, with values such as `complete`, `pending`, and `failed` providing the outcome signal. A transformation like "Checksum Integrity Validation" may reside in the `execution` phase with a `pending` status, signaling an in-progress operation awaiting resolution, whereas "anomaly detection" under the same phase but with `complete` status indicates a finished run. The phase column thus describes where the transformation sits within the procedural sequence, and status communicates whether that position has been successfully occupied, left unoccupied, or abandoned.

Execution performance and resilience are quantified through duration and retry metrics attached to dataset-bound transformation records. The `duration_seconds` column captures the elapsed wall-clock time for each run, with values ranging from 722.03 seconds for an "ETL pipeline run" processing financial trade records to 7222.59 seconds for a "data archival batch" handling patient vitals, reflecting the wide variance in computational intensity across transformation types. The `retry_count` column records how many times the system attempted to re-execute a failed or interrupted run—values of 276, 337, 352, and 418 are observed across the dataset—providing a direct measure of operational fragility. A calibration procedure that consumed 3575.88 seconds and required 418 retries presents a markedly different reliability profile than a Checksum Integrity Validation that completed in 6380.45 seconds after 352 retries, even though both exceeded an hour of cumulative execution time. Together, these metrics enable governance bodies to establish service-level expectations, identify transformations that warrant architectural intervention, and maintain an auditable record of system resilience across the full spectrum of data operations.