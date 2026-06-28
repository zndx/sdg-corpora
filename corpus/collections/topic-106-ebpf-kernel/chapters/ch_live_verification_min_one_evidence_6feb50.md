---
chapter_id: ch_live_verification_min_one_evidence_6feb50
topic_id: 106
family: 03_directive_governance
cited_terms: ['verification_min_one_evidence', 'profiling_with_method', 'syscall_max_one_return']
model: engine-refine
---

Verification evidence in governed operational environments is not a single artifact but a composable record whose integrity depends on stable identifiers, typed observations, and explicit linkage to the entities those observations describe. Each verification activity—whether an ISO27001 Compliance Audit, a Data Lineage Trace, a Cryptographic Signature Check, or a Schema Migration Validation—generates a durable evidence object keyed by an identifier such as EVID-0001 through EVID-0004, and that key becomes the anchor for every subsequent assertion about what was measured, when it concluded, and under what conditions the run terminated. The identifier therefore functions as the non-negotiable primary reference in audit reconstruction: without it, duration readings, exit semantics, and host attribution cannot be joined reliably across storage partitions, retry cycles, or downstream reconciliation workflows.

**t_verification_min_one_evidence**

| id | verification | produces_evidence |
| --- | --- | --- |
| EVID-0001 | ISO27001 Compliance Audit | Calibration Certificate |
| EVID-0002 | Data Lineage Trace | Calibration Certificate |
| EVID-0003 | Cryptographic Signature Check | Calibration Certificate |
| EVID-0004 | Schema Migration Validation | Reconciliation Ledger |
| EVID-0005 | Data Lineage Trace | SHA256 Manifest |
| EVID-0006 | Schema Migration Validation | Health Check CSV |

**t_verification_min_one_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | duration_seconds | xsd:decimal |
| EVID-0002 | end_time | xsd:dateTime |
| EVID-0003 | exit_code | xsd:integer |
| EVID-0004 | host_name | xsd:string |
| EVID-0005 | log_level | xsd:string |
| EVID-0006 | phase | xsd:string |
| EVID-0007 | retry_count | xsd:integer |
| EVID-0008 | scheduled_at | xsd:dateTime |

Attributes supply the measurable vocabulary through which evidence instances acquire operational meaning, and each attribute carries both a semantic name and a declared type that constrains how values may be stored and compared. A duration_seconds observation is typed as xsd:decimal and may register 2280.75 seconds on one entity while a sibling run records 5144.39; end_time arrives as xsd:dateTime with values such as 2023-07-04T07:08:55 or 2025-03-23T07:51:24; exit_code is constrained to xsd:integer and may encode terminal states including 414 or 492; and host_name, as xsd:string, binds execution to concrete infrastructure identifiers like node-a01. The attr and attr_type pairing is what permits validators to reject incoherent mixtures—decimal durations cannot be substituted for datetime boundaries, and integer exit codes cannot be silently coerced into free-text misc fields—so that evidentiary payloads remain machine-checkable under schema enforcement and human review alike.

**t_verification_min_one_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | 2023-07-04T07:08:55 |
| EVID-0002 | EVID-0001 | EVID-0008 | 2025-01-31T12:45:17 |
| EVID-0003 | EVID-0001 | EVID-0009 | 2025-03-23T07:51:24 |
| EVID-0004 | EVID-0002 | EVID-0002 | 2023-01-29T08:52:43 |
| EVID-0005 | EVID-0002 | EVID-0008 | 2025-02-10T17:00:11 |
| EVID-0006 | EVID-0002 | EVID-0009 | 2023-01-05T10:52:26 |
| EVID-0007 | EVID-0003 | EVID-0002 | 2023-12-08T22:39:20 |
| EVID-0008 | EVID-0003 | EVID-0008 | 2023-06-23T05:07:56 |

**t_verification_min_one_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 2280.75 |
| EVID-0002 | EVID-0002 | EVID-0001 | 2844.65 |
| EVID-0003 | EVID-0003 | EVID-0001 | 2804.04 |
| EVID-0004 | EVID-0004 | EVID-0001 | 5144.39 |
| EVID-0005 | EVID-0005 | EVID-0001 | 1607.16 |
| EVID-0006 | EVID-0006 | EVID-0001 | 959.65 |

**t_verification_min_one_evidence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0003 | 414 |
| EVID-0002 | EVID-0001 | EVID-0007 | 360 |
| EVID-0003 | EVID-0002 | EVID-0003 | 47 |
| EVID-0004 | EVID-0002 | EVID-0007 | 492 |
| EVID-0005 | EVID-0003 | EVID-0003 | 443 |
| EVID-0006 | EVID-0003 | EVID-0007 | 122 |
| EVID-0007 | EVID-0004 | EVID-0003 | 839 |
| EVID-0008 | EVID-0004 | EVID-0007 | 199 |

The entity dimension resolves the question of what, precisely, a given attribute value describes, because values are never floating observations but are always scoped to an entity_id that ties each measurement back to a specific evidence instance or operational subject. When EVID-0001 carries both a decimal duration and a varchar misc value of review, those readings inherit their authority from their entity binding rather than from the isolated magnitude or label; conversely, when the same attribute_id appears against EVID-0002, auditors must interpret the figure in that entity’s context alone. This entity-centric discipline prevents category collapse in compliance reporting, where aggregate statistics might otherwise mask per-run failure modes such as a recorded misc value of failed on an otherwise nominally complete verification pass.

**t_verification_min_one_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | node-a01 |
| EVID-0002 | EVID-0001 | EVID-0005 | Log Level 02 |
| EVID-0003 | EVID-0001 | EVID-0006 | review |
| EVID-0004 | EVID-0001 | EVID-0010 | failed |
| EVID-0005 | EVID-0001 | EVID-0011 | Triggered By 05 |
| EVID-0006 | EVID-0002 | EVID-0004 | edge-03 |
| EVID-0007 | EVID-0002 | EVID-0005 | Log Level 07 |
| EVID-0008 | EVID-0002 | EVID-0006 | closeout |

Applies-method profiling extends the same evidentiary discipline to the execution methods themselves, recording how control procedures behave in production rather than merely what artifacts they emit. Fact profiling rows keyed by identifiers METH-0001 through METH-0004 capture duration_seconds at granular resolution—6716.87, 1113.38, 2546.61, 2074.93—and pair those timings with exit codes 725, 809, 348, and 827 together with retry_count values of 209, 186, 303, and 264, thereby exposing stability characteristics that a single successful certificate cannot convey. Dimension tables classify each applies_method_label within a category_name hierarchy spanning Category Name 01 through Category Name 04, while category_id references such as METH-0006 and METH-0003 position individual methods inside broader Applies Method Category taxonomies; the category field thus governs how profiling results roll up into control-family reporting without erasing method-level specificity.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

Role and subject complete the governance model by stating who or what participates in typed relationships rather than leaving those participations implicit in procedural narrative. In syscall return-type associations, a subject identifier—exemplified by syscall_id values RETU-0005, RETU-0001, RETU-0004, and RETU-0008—denotes the originating system call context for a return_type such as process_id, error_code, pointer_addr, or memory_size, while role assignments including observer, contributor, owner, and reviewer specify the capacity in which each party or component bears responsibility for that linkage. A socket invocation mapped under observer role carries different evidential weight than an fstat association recorded under reviewer role, because the role encodes accountability boundaries that auditors later use to determine whether a return-type assertion was witnessed, authored, or merely attested.

**t_syscall_max_one_return**

| id | syscall |
| --- | --- |
| RETU-0001 | socket |
| RETU-0002 | write |
| RETU-0003 | read |
| RETU-0004 | fstat |
| RETU-0005 | execve |
| RETU-0006 | execve |
| RETU-0007 | read |
| RETU-0008 | execve |

**t_syscall_max_one_return_return_type**

| id | return_type |
| --- | --- |
| RETU-0001 | process_id |
| RETU-0002 | error_code |
| RETU-0003 | pointer_addr |
| RETU-0004 | memory_size |
| RETU-0005 | pointer_addr |
| RETU-0006 | stat_struct |
| RETU-0007 | process_id |

**t_syscall_max_one_return__return_type**

| id | syscall_id | return_type_id | role |
| --- | --- | --- | --- |
| RETU-0001 | RETU-0005 | RETU-0003 | observer |
| RETU-0002 | RETU-0001 | RETU-0007 | contributor |
| RETU-0003 | RETU-0004 | RETU-0004 | owner |
| RETU-0004 | RETU-0008 | RETU-0006 | reviewer |
| RETU-0005 | RETU-0006 | RETU-0007 | owner |
| RETU-0006 | RETU-0006 | RETU-0007 | owner |
| RETU-0007 | RETU-0007 | RETU-0002 | contributor |
| RETU-0008 | RETU-0003 | RETU-0005 | reviewer |

Taken together, identifier, entity, attr, attr_type, misc, duration_seconds, exit, retry_count, applies_method, category, role, and subject constitute a closed loop from method execution through typed measurement to categorized reporting and accountable association. A Schema Migration Validation that produces a Reconciliation Ledger rather than a Calibration Certificate still participates in the same framework: its end_time and exit_code remain comparable across entities, its applies_method profile remains classifiable within category dimensions, and its syscall-level subject-role bindings remain inspectable when downstream controls require proof that measurement, classification, and responsibility were recorded concurrently rather than reconstructed after the fact. That concurrency of structure is precisely why these fields matter in practice—they transform heterogeneous operational telemetry into evidence that withstands both automated validation and formal compliance scrutiny.

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |