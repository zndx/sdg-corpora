---
chapter_id: ch_live_allocation_with_run_status_266205
topic_id: 94
family: 05_provo_lineage
cited_terms: ['allocation_with_run_status', 'annotation_with_confidence', 'labrun_has_operator']
model: engine-refine
---

Operational telemetry and resource allocation are tracked through a layered schema in which identifiers serve as the primary anchoring mechanism across fact and dimension tables. Every entity—whether an allocation, an annotation, or a laboratory run—carries a stable identifier such as STAT-0001, OPER-0001, or CONF-0001, and these keys propagate through foreign-key relationships to maintain referential integrity. The fact table `fact_labrun` records execution events keyed by `id` and linked to a dimension operator via `operator_key`, while the allocation tables `t_allocation_with_run_status` and its companion `t_annotation_with_confidence` each establish their own identifier namespaces, STAT- and CONF-prefixed respectively, to distinguish allocation lifecycles from annotation confidence records.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

The operator dimension table `dim_operator` classifies each operator into a categorical grouping and assigns a human-readable label. An operator identified as OPER-0001 carries the misc label "Operator Label 01" and belongs to category "Operator Category 01"; similarly, OPER-0002, OPER-0003, and OPER-0004 follow the same pattern with their respective labels and categories. In the fact table, the operator_key column references these dimension entries—for instance, OPER-0007 and OPER-0005 appear as operator keys in `fact_labrun`, pointing back to their dimension records. This separation of categorical metadata from execution facts enables aggregation by operator category without duplicating descriptive strings across every row.

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

Execution metrics within `fact_labrun` capture the temporal and outcome characteristics of each laboratory run. The `duration_seconds` column records elapsed time in floating-point seconds, with observed values ranging from 4308.22 to 5155.73, reflecting the variance in run lengths across different operators and conditions. The `exit_code` column—mapped to the concept of exit—stores integer codes such as 122, 691, 566, and 3, each signaling a distinct termination state for the run. Complementing these are the `retry_count` values of 265, 244, 106, and 12, which quantify how many times a run was retried before reaching its final state. Together, duration, exit code, and retry count form a triad of outcome indicators that allow operators and categories to be evaluated for reliability and efficiency.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

The allocation and annotation subsystems employ a three-table pattern in which a junction table mediates many-to-many relationships between two entity types and a role attribute. In `t_allocation_with_run_status__run_status`, the `allocation_id` column functions as the subject and the `run_status_id` column as the target, linking allocations such as STAT-0001 and STAT-0004 to run statuses like STAT-0006 and STAT-0002. The `role` column on this junction—taking values of reviewer, observer, or contributor—describes the nature of the relationship between the subject and target entities. The same structural pattern appears in `t_annotation_with_confidence__confidence`, where annotation_id serves as subject, confidence_id as target, and role again distinguishes whether the association is that of a contributor, observer, or reviewer.

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

Run statuses themselves are stored in a dedicated table that decouples status definitions from their assignments. The `t_allocation_with_run_status_run_status` table holds status identifiers and their corresponding labels, with observed values including timeout-expired, disconnected-drift, and succeeded-final. An allocation identified as STAT-0001 maps to the timeout-expired status, while STAT-0002 and STAT-0003 both carry the succeeded-final status, and STAT-0004 carries disconnected-drift. This indirection allows the same status definition to be referenced by multiple allocations through the junction table without redundancy.

Confidence levels for annotations follow an analogous structure. The `t_annotation_with_confidence_confidence` table enumerates confidence designations such as 95 Percent Confidence, Cross Referenced, Ensemble Agreement, and Expert Verified, each with its own identifier. Annotations like "Telemetry Stream US East" and "Lab Assay Plate 12B" are recorded in the parent annotation table, and the junction table `t_annotation_with_confidence__confidence` links them to confidence records via the subject and target columns, with role again specifying the relationship type. This three-table arrangement ensures that confidence metadata remains reusable across annotations and that the provenance of each confidence assignment is explicitly captured.

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |