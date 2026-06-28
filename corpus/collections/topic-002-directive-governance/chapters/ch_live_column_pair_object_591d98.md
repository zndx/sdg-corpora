---
chapter_id: ch_live_column_pair_object_591d98
topic_id: 2
family: 07_long_tail
cited_terms: ['column_pair_object', 'constraint_evaluated_during', 'attestation_at_period']
model: engine-refine
---

In governance and compliance architectures, the integrity of any assessment rests upon the precise linkage of identifiers to their corresponding entities, attributes, and measured values. Each record is anchored by a unique identifier—such as OBJE-0001 or DURI-0001—that serves as the immutable reference point across all relational joins. These identifiers do not merely label rows; they establish the referential backbone that allows an entity, whether a constraint evaluated during a quarterly review or an object column under scrutiny, to be traced through every layer of metadata, attribute assignment, and value storage. The entity column, appearing consistently across value tables, binds a specific identifier to its attribute and measured value, ensuring that a date like 2024-01-04 or a boolean flag of true can be unambiguously attributed to the correct entity within the constraint evaluation lifecycle.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | Q4 2025 Review |
| DURI-0002 | Data Retention Policy | Q3 2023 Period |
| DURI-0003 | Audit Log Requirement | Pipeline Execution |
| DURI-0004 | Null Value Limit | Data Export |
| DURI-0005 | Data Retention Policy | Pipeline Execution |
| DURI-0006 | Data Retention Policy | System Startup |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |

Attributes and their types form the semantic layer that governs how data is interpreted and validated. An attribute name—effective_date, enforcement, mandatory, priority—carries a declared type such as xsd:date, xsd:string, xsd:boolean, or xsd:integer, which dictates both storage semantics and validation rules. This type declaration is not decorative; it enforces structural discipline across heterogeneous value stores. Boolean attributes like mandatory are stored in dedicated boolean value tables where entries such as false or true record compliance posture, while integer attributes like priority accommodate numeric severity levels ranging from 2 to 590. String attributes capture enforcement descriptors like "Encoding 01" or "pre-release note," and date attributes anchor evaluations to specific points in time, including 2025-03-02 and 2023-10-02. The separation of values by type ensures that each attribute's data contract is preserved without cross-contamination.

Confidence and uncertainty metrics provide the quantitative assessment of data quality and measurement reliability. Within the fact_column table, each identifier is associated with a confidence score—0.164, 0.068, 0.107, 0.354—and a corresponding uncertainty value of 560.21, 744.10, 984.09, or 404.01. These paired measures allow auditors and analysts to weight evidence appropriately: a confidence of 0.354 paired with an uncertainty of 404.01 signals a substantially more reliable observation than one registering 0.068 confidence against 744.10 uncertainty. The misc column, holding values such as 257.80, 571.55, 140.18, and 131.27, captures supplementary measurements that do not fit the primary attribute taxonomy but remain relevant for contextual analysis.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

Object columns are classified and labeled through a dimension table that assigns each identifier a human-readable label and a categorical classification. Object Column Label 01 through 04 map to their respective categories—Object Column Category 01 through 04—providing the organizational taxonomy necessary for grouping, filtering, and reporting. This categorization is not merely administrative; it determines how object columns participate in constraint evaluations and attestation workflows, ensuring that items sharing a category are subject to consistent governance rules and review procedures.

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

**t_attestation_at_period**

| id | attestation |
| --- | --- |
| PERI-0001 | HIPAA Compliance Review |
| PERI-0002 | Vendor Risk Assessment |
| PERI-0003 | Quarterly Internal Audit |
| PERI-0004 | Data Lineage Review |
| PERI-0005 | SOC2 Type II Audit |
| PERI-0006 | Quarterly Internal Audit |

**t_attestation_at_period_at_attestation_period**

| id | at_attestation_period |
| --- | --- |
| PERI-0001 | User Authentication |
| PERI-0002 | Network Transmission |
| PERI-0003 | Q3 2024 Period |
| PERI-0004 | Quality Check Phase |
| PERI-0005 | Data Ingestion |
| PERI-0006 | Data Export |

The attestation framework introduces the concepts of subject, target, and role to model the relationships between compliance reviews and the periods or phases during which they are conducted. An attestation such as HIPAA Compliance Review or Vendor Risk Assessment serves as the subject of evaluation, while the target identifies the specific period or phase—User Authentication, Network Transmission, Q3 2024 Period, Quality Check Phase—under review. The role column assigns each participant a function within the attestation, designating individuals as reviewer or observer, which establishes accountability and delineates authority. This triad of subject, target, and role transforms static compliance records into a dynamic governance model where every assessment is traceable to a responsible party, a defined scope, and a documented period of evaluation.

**t_attestation_at_period__at_attestation_period**

| id | attestation_id | at_attestation_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0002 | PERI-0004 | reviewer |
| PERI-0002 | PERI-0001 | PERI-0002 | observer |
| PERI-0003 | PERI-0001 | PERI-0001 | observer |
| PERI-0004 | PERI-0003 | PERI-0002 | reviewer |
| PERI-0005 | PERI-0005 | PERI-0004 | contributor |
| PERI-0006 | PERI-0001 | PERI-0004 | observer |
| PERI-0007 | PERI-0003 | PERI-0002 | observer |
| PERI-0008 | PERI-0003 | PERI-0005 | owner |