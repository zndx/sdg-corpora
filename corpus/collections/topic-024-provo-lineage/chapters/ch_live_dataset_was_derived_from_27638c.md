---
chapter_id: ch_live_dataset_was_derived_from_27638c
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_derived_from', 'policy_classification_tier', 'directive_union_constraint_or_policy']
model: engine-refine
---

In data governance architectures, the distinction between an entity and its attributes forms the bedrock of traceable, auditable information management. An entity represents a discrete, identifiable object within the domain—a dataset, a policy, or a directive—each assigned a unique identifier such as `FROM-0001` or `POLI-0001`. These identifiers are not arbitrary; they follow a structured convention (`FROM-`, `TIER-`, `POLI-`) that encodes the entity's category and enables unambiguous cross-referencing across the system. The entity itself carries descriptive properties—its `dataset` might be `iot_edge_logs` or `patient_demographics_clean`, its `policy` might be `Lab Assay Protocol` or `Cloud Security Baseline`—but the identifier is the anchor that permits these properties to be resolved, related, and versioned independently of their textual content.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Lab Assay Protocol |
| TIER-0002 | Cloud Security Baseline |
| TIER-0003 | Temperature Threshold Rule |
| TIER-0004 | Error Rate Threshold |
| TIER-0005 | Refresh Cycle Rule |
| TIER-0006 | Validation Check |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

Attributes extend this model by decoupling property definitions from their values. The `attr` column stores the name of a property—`effective_date`, `enforcement`, `mandatory`, `priority`—while the `attr_type` column specifies its semantic domain using standard type notation: `xsd:date` for temporal values, `xsd:string` for free text, `xsd:boolean` for binary flags, and `xsd:integer` for numeric measures. This separation of schema from instance data means that the attribute definition exists once, while its values are stored in dedicated value tables keyed by `attr_id` and `entity_id`. A single directive such as `Financial SEC Reporting Rule` (`POLI-0001`) may carry an `effective_date` of `2024-10-31`, a `mandatory` flag of `true`, and a `priority` of `3`, each value residing in its appropriately typed store. The `entity_id` column in each value table binds the value back to its owner, ensuring that attribute-value pairs are never orphaned from the entity they describe.

The `subject` and `target` columns, paired with a `role`, model the relational fabric that connects entities to one another. Rather than embedding relationships as denormalized columns, the architecture uses junction tables where `subject` identifies the originating entity, `target` identifies the recipient, and `role` characterizes the nature of the connection. In dataset lineage, for instance, the dataset `patient_demographics_clean` (`FROM-0002`) is linked to its source `archival_tape_restore` (`FROM-0004`) with the role `contributor`, while `iot_edge_logs` (`FROM-0001`) traces back to `raw_sensor_stream` (`FROM-0001`) as both `contributor` and `owner`. The same role vocabulary—`owner`, `contributor`, `observer`, `reviewer`—appears across relationship types, providing a consistent semantic layer: a policy such as `Cloud Security Baseline` (`TIER-0002`) may be `owner` of its classification `Restricted Access` (`TIER-0002`) while simultaneously serving as `observer` of `Level 2 Sensitive` (`TIER-0003`). This role-based relationship model allows a single entity to occupy multiple relational positions simultaneously, each with a distinct governance implication.

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

The `misc` column, appearing as the value store in typed attribute tables, captures the actual data payloads—`true`, `false`, `2024-11-24`, `3`, `Encoding 01`, `change rationale`—in a format that matches the declared `attr_type`. This type-aware value partitioning ensures that boolean constraints, date validations, and integer ranges are enforced at the storage layer, while the `attr_name` and `attr_type` definitions in the attribute schema provide the human-readable and machine-parsable metadata needed for downstream tooling. The result is a system where every piece of information—whether it is the `Sensor Calibration Directive` linked to `Error Rate Threshold` under a `directive_union_constraint_or_policy` construct, or the `Temperature Threshold Rule` classified at `Level 2 Sensitive` with a `reviewer` role—can be traced from its identifier through its attributes, its values, and its relationships to every other entity in the governance graph.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Financial SEC Reporting Rule | Error Rate Threshold | Refresh Cycle Rule |
| POLI-0002 | Employee Code of Conduct | Financial SEC Reporting Rule | Access Control Policy |
| POLI-0003 | Temperature Threshold Rule | Encryption Standard | Open Source License Policy |
| POLI-0004 | Medical Privacy Directive | Sensor Calibration Directive | Error Rate Threshold |
| POLI-0005 | GDPR Compliance Directive | Validation Check | Cleanup Schedule |
| POLI-0006 | Data Quality Standard | Audit Log Requirement | Retention Duration Rule |
| POLI-0007 | Provenance Tracking Mandate | GDPR Compliance Directive | Batch Size Constraint |

**t_directive_union_constraint_or_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |