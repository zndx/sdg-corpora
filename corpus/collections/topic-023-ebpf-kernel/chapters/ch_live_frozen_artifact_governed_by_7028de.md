---
chapter_id: ch_live_frozen_artifact_governed_by_7028de
topic_id: 23
family: 07_long_tail
cited_terms: ['frozen_artifact_governed_by', 'transformation_with_output_dataset', 'universal_combined_with_existential']
model: engine-refine
---

Governance artifacts are anchored to immutable identifiers and classified by their regulatory status through a pair of tightly coupled tables. The primary table, `t_frozen_artifact_governed_by`, associates each identifier—such as `GOVE-0001` through `GOVE-0004`—with a frozen artifact designation, yielding values like `Log-Archive-23Q4`, `Model-Prod-v4`, `Q3-2023-Snapshot`, and `Compliance-09`. These designations represent discrete, versioned snapshots of regulated entities, and the `frozen` column serves as the authoritative label by which auditors and automated systems reference them. The secondary table, `t_frozen_artifact_governed_by_attr`, enriches this foundation by declaring the attribute schema applicable to each artifact: attribute names such as `effective_date`, `enforcement`, `mandatory`, and `priority` are paired with their corresponding XML Schema types (`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`), establishing a typed contract that governs how downstream value tables must store and validate their content.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

Value storage is normalized across four distinct tables, each dedicated to a single attribute type, thereby enforcing type safety at the storage layer while preserving referential integrity through shared foreign keys. The `entity_id` column in each value table points back to the governing artifact, and the `attr_id` column resolves to the attribute definition, creating a three-way join that reconstructs the complete attribute-value pair for any given entity. Boolean attributes are persisted in `t_frozen_artifact_governed_by_val_boolean`, where values such as `false` and `true` are recorded against `attr_id` references like `GOVE-0003`; date attributes reside in `t_frozen_artifact_governed_by_val_date`, carrying concrete timestamps including `2025-04-28`, `2024-02-08`, `2024-10-20`, and `2024-01-16`; integer-valued attributes such as `priority` are stored in `t_frozen_artifact_governed_by_val_int` with magnitudes ranging from `1` to `718`; and free-form string attributes are captured in `t_frozen_artifact_governed_by_val_varchar`, holding entries like `Encoding 01`, `Enforcement 02`, `calibration record`, and `es`. This type-disaggregated design ensures that each value table can apply its own constraints and indexing strategies without cross-type interference.

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

The transformation tracking domain operates on a parallel dimensional model, where `fact_transformation` records the execution characteristics of data processing jobs. Each transformation is identified by a key such as `DATA-0001` through `DATA-0004` and is linked to its destination via the `output_dataset_key` foreign column, which references the primary key of `dim_output_dataset`. The fact table captures three quantitative dimensions of execution: `duration_seconds`, which spans from a brief `150.01` seconds to an extended `5474.59` seconds; `exit_code`, a non-zero integer indicator of job termination status with observed values including `354`, `220`, `471`, and `302`; and `retry_count`, reflecting the number of recovery attempts made before final termination, with recorded values of `25`, `357`, `150`, and `85`. The `dim_output_dataset` dimension table provides the human-readable `output_dataset_label` (e.g., `Output Dataset Label 01` through `Output Dataset Label 04`) and the `output_dataset_category` classification, enabling aggregation and filtering of transformation metrics by business domain.

**fact_transformation**

| id | output_dataset_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0004 | 2399.22 | 354 | 25 |
| DATA-0002 | DATA-0004 | 5474.59 | 220 | 357 |
| DATA-0003 | DATA-0005 | 150.01 | 471 | 150 |
| DATA-0004 | DATA-0004 | 5248.45 | 302 | 85 |
| DATA-0005 | DATA-0006 | 6668.88 | 184 | 484 |
| DATA-0006 | DATA-0004 | 777.01 | 996 | 445 |
| DATA-0007 | DATA-0005 | 6572.74 | 634 | 341 |

**dim_output_dataset**

| id | output_dataset_label | output_dataset_category |
| --- | --- | --- |
| DATA-0001 | Output Dataset Label 01 | Output Dataset Category 01 |
| DATA-0002 | Output Dataset Label 02 | Output Dataset Category 02 |
| DATA-0003 | Output Dataset Label 03 | Output Dataset Category 03 |
| DATA-0004 | Output Dataset Label 04 | Output Dataset Category 04 |
| DATA-0005 | Output Dataset Label 05 | Output Dataset Category 05 |
| DATA-0006 | Output Dataset Label 06 | Output Dataset Category 06 |

Cross-domain relationships are expressed through the `t_universal_combined_with_existential` table, which encodes universal-existential dependencies between abstract governance concepts and their concrete instantiations. The `universal` column holds high-level entity types such as `Lab_Centrifuge_Rotor`, `Supply_Chain_Shipment`, `GDPR_Consent_Record`, and `Database_Backup_Volume`, while the `related` column identifies the specific instances or data classes to which they bind—`Atmospheric_Moisture`, `Personal_Information`, `Tissue_Sample`, and `Personal_Information` respectively. This table operates independently of the governance artifact and transformation fact structures but provides the semantic bridge by which abstract regulatory requirements are mapped to the physical data assets and operational processes that must comply with them.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |