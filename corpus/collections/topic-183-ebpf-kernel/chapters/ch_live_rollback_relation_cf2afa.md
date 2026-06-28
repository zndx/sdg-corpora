---
chapter_id: ch_live_rollback_relation_cf2afa
topic_id: 183
family: 07_long_tail
cited_terms: ['rollback_relation', 'safety_planning_process', 'salary_requirement']
model: engine-refine
---

The architecture for tracking operational rollback events relies on a normalized attribute-value pattern that separates entity definitions from their typed measurements. At the core sits the rollback relation, which records which operational change—such as `release-tag-v3.2` or `telemetry-archive-oct`—reverts to a prior state like `batch-processing-halt` or `telemetry-ingest-pause`. Each relation carries a unique identifier, for instance `RELA-0001`, that serves as the anchor for all subsequent attribute data. Rather than embedding attribute definitions directly into the relation table, the system maintains a parallel attribute catalog where each attribute carries a name and a declared type. The `confidence` attribute, for example, is typed as `xsd:decimal`, while `dimension_kind` and `method` are `xsd:string`, and `recorded_at` is `xsd:dateTime`. This separation allows the schema to evolve without altering the core relation structure, and it enables type-safe validation of stored values.

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | batch-processing-halt |
| RELA-0002 | telemetry-archive-oct | dataset-v111-stable |
| RELA-0003 | nightly-sync-rollback | telemetry-ingest-pause |
| RELA-0004 | config-deploy-fail | telemetry-archive-oct |
| RELA-0005 | model-checkpoint-88 | dataset-v111-stable |
| RELA-0006 | batch-processing-halt | model-checkpoint-88 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

Attribute values are materialized in dedicated value tables keyed by the relation identifier, the entity being measured, and the attribute being recorded. Decimal attributes such as `confidence` and `dimension_kind` are stored in a decimal value table, where entries like `0.023` and `0.999` represent low and high confidence scores respectively, while `717.59` and `918.13` might correspond to dimensional magnitudes. String-valued attributes populate a varchar table with values such as `Dimension Kind 01`, `Encoding 02`, `pre-release note`, and the two-character code `de`. Timestamp attributes are persisted in a separate datetime table, capturing precise moments like `2024-05-22T12:01:29` and `2025-05-09T21:44:43`. The entity column in each value table references the relation identifier, creating a many-to-many bridge that allows a single attribute definition to be applied across multiple relations and a single relation to carry multiple attribute instances.

In the safety planning domain, a parallel structure captures the relationships between intervention processes, the survivors they serve, and the crisis methods they employ. The safety planning process table enumerates distinct protocols—`SAFEPLAN-RED`, `VICTIM-ADVOC-12`, `SHIELD-PROTOCOL`, and `COMMUNITY-SAFE`—each identified by a code such as `PROC-0001`. These processes target specific domestic violence survivors, recorded in a targets table with identifiers like `CLIENT-7734`, `WITNESS-119`, `SURV-2024-X`, and `REFUGEE-771`. The many-to-many relationship between processes and survivors is mediated by a junction table that assigns a role to each pairing, designating whether a survivor acts as `owner` or `observer` in the context of a given process. This role column is critical for governance, as it clarifies accountability and access rights within multi-stakeholder safety plans.

**t_safety_planning_process**

| id | safety_planning_process |
| --- | --- |
| PROC-0001 | SAFEPLAN-RED |
| PROC-0002 | VICTIM-ADVOC-12 |
| PROC-0003 | SHIELD-PROTOCOL |
| PROC-0004 | COMMUNITY-SAFE |
| PROC-0005 | CIRCULAR-RED |
| PROC-0006 | CIRCULAR-RED |

**t_safety_planning_process_targets**

| id | targets |
| --- | --- |
| PROC-0001 | CLIENT-7734 |
| PROC-0002 | WITNESS-119 |
| PROC-0003 | SURV-2024-X |
| PROC-0004 | REFUGEE-771 |
| PROC-0005 | NOMINEE-338 |
| PROC-0006 | CASE-991-A |
| PROC-0007 | NOMINEE-338 |

**t_safety_planning_process__targets**

| id | safety_id | targets_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0001 | owner |
| PROC-0002 | PROC-0001 | PROC-0001 | observer |
| PROC-0003 | PROC-0004 | PROC-0007 | reviewer |
| PROC-0004 | PROC-0002 | PROC-0005 | owner |
| PROC-0005 | PROC-0006 | PROC-0007 | owner |
| PROC-0006 | PROC-0003 | PROC-0006 | observer |
| PROC-0007 | PROC-0006 | PROC-0006 | observer |
| PROC-0008 | PROC-0003 | PROC-0007 | reviewer |

**t_safety_planning_process_employs**

| id | employs |
| --- | --- |
| PROC-0001 | HOTLINE-TRIAGE |
| PROC-0002 | LEGAL-ADVOCACY |
| PROC-0003 | SAFE-ROOM-SET |
| PROC-0004 | DOCUMENT-GATHER |
| PROC-0005 | HOTLINE-TRIAGE |
| PROC-0006 | DOCUMENT-GATHER |
| PROC-0007 | ESCAPE-BAG-PREP |
| PROC-0008 | SHELTER-NAVIGATE |

**t_safety_planning_process__employs**

| id | safety_id | employs_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | reviewer | Cardinality Note 01 |
| PROC-0002 | PROC-0004 | PROC-0002 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0005 | PROC-0003 | owner | Cardinality Note 04 |
| PROC-0005 | PROC-0005 | PROC-0002 | owner | Cardinality Note 05 |
| PROC-0006 | PROC-0001 | PROC-0006 | contributor | Cardinality Note 06 |
| PROC-0007 | PROC-0001 | PROC-0008 | observer | Cardinality Note 07 |
| PROC-0008 | PROC-0006 | PROC-0002 | owner | Cardinality Note 08 |

Similarly, the methods used within safety planning—`HOTLINE-TRIAGE`, `LEGAL-ADVOCACY`, `SAFE-ROOM-SET`, and `DOCUMENT-GATHER`—are linked to processes through a second junction table that carries both a role and a cardinality note. A process might engage a method with the role of `reviewer` or `owner`, and the cardinality note (e.g., `Cardinality Note 01` through `Cardinality Note 04`) documents constraints on how many times or under what conditions that method may be applied. This dual-layer of role and cardinality metadata transforms a simple association into a governed relationship, ensuring that operational rules about method usage are captured alongside the data itself.

The salary domain demonstrates how confidence and uncertainty metrics attach to dimensional facts. The fact table records monetary values—`3.89`, `226.77`, `851.90`, `876.17`—alongside a confidence score ranging from `0.077` to `0.982` and an uncertainty magnitude spanning from `60.14` to `883.10`. These confidence values quantify the reliability of each measurement, while the uncertainty column captures the absolute deviation. The dimension table provides categorical context, assigning each salary record a label such as `Salary Label 01` and a category like `Salary Category 01`. Together, the fact and dimension tables form a star schema where the identifier serves as the primary key, the salary key links facts to their dimensional attributes, and the confidence and uncertainty columns enable downstream filtering and risk assessment.

**fact_salary**

| id | salary_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | 0.077 | 60.14 | 3.89 |
| REQU-0002 | REQU-0007 | 0.644 | 75.00 | 226.77 |
| REQU-0003 | REQU-0004 | 0.791 | 883.10 | 851.90 |
| REQU-0004 | REQU-0005 | 0.982 | 701.98 | 876.17 |

**dim_salary**

| id | salary_label | salary_category |
| --- | --- | --- |
| REQU-0001 | Salary Label 01 | Salary Category 01 |
| REQU-0002 | Salary Label 02 | Salary Category 02 |
| REQU-0003 | Salary Label 03 | Salary Category 03 |
| REQU-0004 | Salary Label 04 | Salary Category 04 |
| REQU-0005 | Salary Label 05 | Salary Category 05 |
| REQU-0006 | Salary Label 06 | Salary Category 06 |
| REQU-0007 | Salary Label 07 | Salary Category 07 |