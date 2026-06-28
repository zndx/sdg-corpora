---
chapter_id: ch_live_lineage_edge_with_provenance_484695
topic_id: 67
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_provenance', 'labrun_min_one_sample', 'control_observed_via']
model: engine-refine
---

In a governed data ecosystem, the integrity of an audit trail begins with the precise definition of an identifier, which serves as the immutable anchor for every entity, attribute, and relationship within the system. An entity represents a distinct operational object or sample, such as `SAMP-0001`, which corresponds to the `RNA-POOL-22` input sample processed during the `SEQ-EXP-99` laboratory run. To describe the characteristics of these entities, the framework employs attributes, formally defined by an `attr_name` and a strict `attr_type`. For instance, the attribute `duration_seconds` is bound to the `xsd:decimal` type, ensuring that numerical precision is maintained, while temporal metadata like `end_time` is strictly typed as `xsd:dateTime`. This structural rigor prevents type ambiguity and guarantees that every attribute—whether it be `exit_code` or `host_name`—adheres to a standardized schema before any values are assigned.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

Once the schema is established, the system populates these attributes with concrete values, categorized under the `misc` designation to reflect their diverse nature across decimal, integer, datetime, and string formats. For the entity `SAMP-0001`, the `duration_seconds` attribute holds a decimal value of `2021.10`, whereas the `exit_code` is recorded as the integer `230`, and the `host_name` is stored as the string `edge-03`. Temporal precision is equally critical; the `end_time` for `SAMP-0001` is captured as `2024-08-01T16:02:07`, providing an exact timestamp for compliance auditing. Beyond the values themselves, the system enforces rigorous `encoding` standards to ensure data portability and integrity across different provenance edges. Whether a lineage edge, such as `log-rotation-archival`, utilizes `utf8` or `unicode` encoding, or a financial reconciliation run relies on `ascii`, the encoding specification guarantees that character sets are correctly interpreted by downstream systems like the `Audit-Trail-Service` or `Edge-Gateway-Router`.

To bridge the gap between machine-readable identifiers and human comprehension, the framework utilizes `labeltext` to provide descriptive context for complex lineage edges and operational processes. A lineage edge identified as `PROV-0001`, which tracks the `log-rotation-archival` process managed by the `Audit-Trail-Service`, is annotated with the label `nightly summary`, allowing auditors to quickly grasp the nature of the data flow. Similarly, the `sensor-calibration-pipeline` associated with `PROV-0003` is labeled as a `calibration record`, clarifying its purpose within the broader data architecture. These labels are not merely cosmetic; they are integral to the governance framework, ensuring that every provenance edge—whether it involves `climate-model-updates` or a `financial-reconciliation-run`—is accompanied by a clear, human-readable description that supports transparent operational oversight.

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

The ultimate objective of this structured data model is to enforce governance through explicit control relationships, defined by the interplay of subject, target, and role. In this context, a `subject` represents a specific control mechanism, such as the `Quality Gate Checkpoint` or the `Validation Workflow Definition`, while the `target` denotes the operational pipeline or aggregator being monitored, such as the `Audit Log Aggregator` or the `Quality Check Pipeline`. The relationship between the subject and the target is mediated by a `role`, which dictates the nature of the oversight. For example, a `Quality Gate Checkpoint` (subject `VIA-0001`) may be observed via the `Audit Log Aggregator` (target `VIA-0004`) by an entity acting in the `reviewer` role, whereas another control might assign an `owner` role to ensure accountability. This tripartite structure—linking the subject to the target through a specific role—creates a verifiable chain of custody, ensuring that every control, from `VIA-0001` to `VIA-0004`, is actively monitored and compliant with organizational standards.

**t_control_observed_via**

| id | control |
| --- | --- |
| VIA-0001 | Quality Gate Checkpoint |
| VIA-0002 | Validation Workflow Definition |
| VIA-0003 | Quality Gate Checkpoint |
| VIA-0004 | Quality Gate Checkpoint |
| VIA-0005 | Reference Monitoring Threshold |
| VIA-0006 | Baseline Calibration Protocol |

**t_control_observed_via_observed_via**

| id | observed_via |
| --- | --- |
| VIA-0001 | Audit Log Aggregator |
| VIA-0002 | Quality Check Pipeline |
| VIA-0003 | Audit Log Aggregator |
| VIA-0004 | Audit Log Aggregator |
| VIA-0005 | Reference Monitor Service |
| VIA-0006 | Trace Collector Daemon |

**t_control_observed_via__observed_via**

| id | control_id | observed_via_id | role |
| --- | --- | --- | --- |
| VIA-0001 | VIA-0001 | VIA-0004 | observer |
| VIA-0002 | VIA-0004 | VIA-0004 | reviewer |
| VIA-0003 | VIA-0006 | VIA-0005 | owner |
| VIA-0004 | VIA-0005 | VIA-0003 | reviewer |
| VIA-0005 | VIA-0005 | VIA-0006 | reviewer |
| VIA-0006 | VIA-0005 | VIA-0002 | owner |
| VIA-0007 | VIA-0003 | VIA-0003 | contributor |
| VIA-0008 | VIA-0004 | VIA-0003 | contributor |