---
chapter_id: ch_live_profiling_only_targets_datasets_48a6b5
topic_id: 67
family: 02_observation_measurement
cited_terms: ['profiling_only_targets_datasets', 'transformation_governed_by', 'labrun_min_one_sample']
model: engine-refine
---

In governed data environments, every measurable object must be addressable through a stable identifier that survives schema evolution, pipeline rewrites, and cross-system reconciliation. Identifiers such as DATA-0001 and SAMP-0001 function as durable handles: they bind profiling obligations to concrete targets, anchor attribute definitions, and tie observed values back to the entity that produced them. Without that continuity, a duration of 30.48 seconds recorded against DATA-0001 could not be distinguished from 6189.13 seconds on DATA-0002, nor could an auditor trace whether a datetime stamp of 2024-10-18T20:19:23 belongs to the same operational episode as exit code 255. The identifier therefore precedes measurement; it establishes the subject of compliance before any quality rule or transformation is applied.

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

An entity is the governed unit to which attributes attach and from which typed observations are collected. Entity references appear wherever values are stored in a normalized, attribute-oriented pattern: multiple rows may share entity_id DATA-0001 while differing in attr_id, reflecting that a single dataset or lab run simultaneously exhibits duration, temporal boundary, exit status, and host provenance. The lab-run domain illustrates the same structure at SAMP-0001, where decimal readings (2021.10), integer codes (230, 435), varchar tokens (edge-03, Log Level 02, closeout), and datetime boundaries (2024-08-01T16:02:07) all coalesce under one entity rather than one wide denormalized record. Entity-centric modeling matters because governance rules, profiling scope, and transformation applicability are evaluated per object, not per column in a flat export.

Attributes name what is being measured, and attr_type declares the semantic contract under which values must be interpreted and validated. The recurring attribute vocabulary—duration_seconds, end_time, exit_code, host_name—signals a cross-domain operational telemetry profile applied alike to profiling-only dataset targets and lab-run samples. Typing via xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string enforces partition of storage and validation: decimals such as 4326.04 and 5150.87 cannot be coerced into datetime slots, while strings like gw-12 and failed carry categorical or diagnostic meaning that integer exit codes (67, 59, 129) encode numerically. Attr and attr_type jointly prevent silent type drift; they are the vocabulary and grammar through which misc—here, the concrete stored value—acquires auditable meaning rather than remaining an opaque literal.

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

The misc designation captures payload fields whose role is contextual rather than structural: observed measurements, human-readable labels, and categorical descriptors that complete a governance record without themselves serving as join keys. A misc value of closeout on DATA-0001 contrasts with failed on DATA-0004, turning an otherwise homogeneous varchar channel into evidence of process outcome; similarly, Transformation Label 03 and Transformation Category 03 in the transformation dimension supply interpretive metadata that fact rows reference but do not redundantly restate. Category, in this framework, classifies transformations into reviewable groupings—Transformation Category 01 through Transformation Category 04—so that policy owners can scope controls, reporting, and escalation paths by lineage class rather than by isolated procedure name. Category thus mediates between abstract governance taxonomy and the operational facts that consume it.

Transformation governance links executable or definitional change—keyed references such as GOVE-0004 and GOVE-0006—to cadence and precedence through priority and review_cycle_days. Priority 2 assigned uniformly across GOVE-0001 through GOVE-0004 establishes a consistent tier within the control queue, signaling that these transformations share equivalent scheduling weight even when their review intervals diverge sharply: 89 days for one obligation versus 727, 888, or 407 days for others tied to the same transformation_key GOVE-0006. Review cycle days operationalize the compliance calendar; they convert policy language about periodic reassessment into countable elapsed time between attestations. Longer cycles (888 days) imply lower-touch surveillance or stable, low-risk procedures; shorter cycles (89 days) demand nearer-term revalidation—distinctions that auditors expect to see encoded numerically, not inferred from narrative procedure documents alone.

In practice, these constructs interlock across profiling and laboratory execution contexts. Profiling assignments—null rate analysis, cardinality profiling, data lineage sweep, hash integrity check—attach to dataset identifiers DATA-0001 through DATA-0004, while lab runs identified as SEQ-EXP-99, PROTOCOL-V3, and CEL-SEQR-112 ingest samples from RNA-POOL-22 through REACTANT-SOL-4 under the same attribute and typing discipline. Transformations registered in the dimensional layer supply labels and categories; fact records bind them to priorities and review horizons. An operator tracing host_name edge-03 on SAMP-0001, duration_seconds 4636.52 on DATA-0004, and a transformation due for review in 407 days is traversing one coherent model: identifier fixes the object, entity scopes the observation, attr and attr_type govern the measurement, misc carries the evidence, category and transformation organize change, and priority with review_cycle_days time-bound oversight. That integration is why these fields matter—they convert fragmented operational telemetry into a governable, reviewable, and comparable compliance surface.

**fact_transformation**

| id | transformation_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0004 | 2 | 89 |
| GOVE-0002 | GOVE-0006 | 2 | 727 |
| GOVE-0003 | GOVE-0006 | 2 | 888 |
| GOVE-0004 | GOVE-0006 | 2 | 407 |
| GOVE-0005 | GOVE-0002 | 1 | 356 |
| GOVE-0006 | GOVE-0002 | 1 | 410 |
| GOVE-0007 | GOVE-0004 | 3 | 230 |

**dim_transformation**

| id | transformation_label | transformation_category |
| --- | --- | --- |
| GOVE-0001 | Transformation Label 01 | Transformation Category 01 |
| GOVE-0002 | Transformation Label 02 | Transformation Category 02 |
| GOVE-0003 | Transformation Label 03 | Transformation Category 03 |
| GOVE-0004 | Transformation Label 04 | Transformation Category 04 |
| GOVE-0005 | Transformation Label 05 | Transformation Category 05 |
| GOVE-0006 | Transformation Label 06 | Transformation Category 06 |

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