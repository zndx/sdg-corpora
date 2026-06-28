---
chapter_id: ch_live_allocation_with_run_status_0c467d
topic_id: 183
family: 05_provo_lineage
cited_terms: ['allocation_with_run_status', 'outlier_detection_uses_explainer', 'control_at_severity']
model: engine-refine
---

In operational data models, the identifier serves as the immutable anchor for every entity, whether it is an allocation, a run status, a control, or an outlier event. Allocation records carry identifiers such as `STAT-0001` through `STAT-0004`, each bound to a resource type like `kafka-consumer-group`, `vault-secret-rotate`, or `gpu-cluster-alpha`. Run statuses are independently identified—`STAT-0001` might correspond to `succeeded-final`, while `STAT-0003` and `STAT-0004` both resolve to `Critical`. The same identifier space can overlap across tables because each table owns its own namespace; the meaning of `STAT-0001` shifts depending on whether it appears in the allocation table or the run-status table. This separation of concerns prevents naming collisions and allows statuses to be reused across many allocations without duplication.

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
| STAT-0001 | succeeded-final |
| STAT-0002 | Severe |
| STAT-0003 | Critical |
| STAT-0004 | Critical |
| STAT-0005 | Critical |
| STAT-0006 | Low Risk |

The relationship between allocations and run statuses is materialized through a junction table that records which allocation experienced which status, annotated with a role that describes the entity's function in that pairing. In this schema, the junction table carries columns named `allocation_id` (the subject), `run_status_id` (the target), and `role`. A single allocation can appear multiple times—for instance, `STAT-0001` is linked to `STAT-0006` with the role `reviewer` and to `STAT-0005` with the role `contributor`—while a single status can be the target of multiple subjects, as `STAT-0004` is associated with `STAT-0006` under the role `observer`. This many-to-many structure captures the full history of allocation-status pairings and preserves the contextual role each entity played, enabling downstream queries that distinguish, say, which allocations were reviewed versus which were merely observed.

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

Outlier events are tracked in a fact table that measures the operational impact of anomalous runs. Each outlier carries an identifier such as `EXPL-0001` through `EXPL-0004` and is linked to a use case via the `uses_key` column, which references the dimension table of uses. The fact table records three quantitative dimensions: `duration_seconds`, `exit_code`, and `retry_count`. Outlier `EXPL-0002` ran for `6466.78` seconds, exited with code `4`, and was retried `225` times, whereas `EXPL-0004` completed in `1182.39` seconds with exit code `124` after `308` retries. The `uses_key` column creates a foreign-key relationship to the dimension table, where each use is further described by a `uses_label` (stored as `misc`) and a `uses_category`. For example, `EXPL-0003` references `EXPL-0003` as its use key, which maps to the label `Uses Label 03` and category `Uses Category 03`. This star-schema arrangement keeps the measurable event data separate from the categorical metadata, allowing analysts to slice outlier durations and retry counts by category without conflating dimensions.

**fact_outlier**

| id | uses_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| EXPL-0001 | EXPL-0003 | 3360.34 | 760 | 293 |
| EXPL-0002 | EXPL-0003 | 6466.78 | 4 | 225 |
| EXPL-0003 | EXPL-0002 | 5282.09 | 490 | 101 |
| EXPL-0004 | EXPL-0005 | 1182.39 | 124 | 308 |
| EXPL-0005 | EXPL-0002 | 3041.72 | 808 | 59 |
| EXPL-0006 | EXPL-0004 | 3852.38 | 619 | 489 |
| EXPL-0007 | EXPL-0002 | 1453.07 | 682 | 1 |

**dim_uses**

| id | uses_label | uses_category |
| --- | --- | --- |
| EXPL-0001 | Uses Label 01 | Uses Category 01 |
| EXPL-0002 | Uses Label 02 | Uses Category 02 |
| EXPL-0003 | Uses Label 03 | Uses Category 03 |
| EXPL-0004 | Uses Label 04 | Uses Category 04 |
| EXPL-0005 | Uses Label 05 | Uses Category 05 |
| EXPL-0006 | Uses Label 06 | Uses Category 06 |

Governance controls are recorded in a table that ties each control to a severity level, an encoding, and a language. The control column holds descriptive policies such as `Log retention 90 days`, `Rate limiting API`, `Access review quarterly`, and `Network segmentation east-west`. Each control is associated with an `at_severity` value—`High Impact` for the first two controls, `failed-oom` for the access review, and `Low` for network segmentation—indicating the risk tier at which the control is evaluated. The `encoding` column specifies the character encoding of the control's text representation, with values including `latin1`, `unicode`, and `utf8`. The `language` column records the locale of the control documentation, predominantly `de` (German) with one entry in `ja` (Japanese). Together, these attributes ensure that compliance artifacts are traceable to their severity context, their technical encoding, and their linguistic origin, which is essential for multi-region deployments where controls must be localized and validated against regional regulatory requirements.

**t_control_at_severity**

| id | control | at_severity | encoding | language |
| --- | --- | --- | --- | --- |
| SEVE-0001 | Log retention 90 days | High Impact | latin1 | de |
| SEVE-0002 | Rate limiting API | High Impact | unicode | ja |
| SEVE-0003 | Access review quarterly | failed-oom | unicode | de |
| SEVE-0004 | Network segmentation east-west | Low | utf8 | de |
| SEVE-0005 | Network segmentation east-west | High | latin1 | fr |
| SEVE-0006 | Backup verification daily | failed-oom | latin1 | en |
| SEVE-0007 | PII masking pipeline | Negligible | unicode | ja |
| SEVE-0008 | Backup verification daily | timeout-expired | unicode | de |