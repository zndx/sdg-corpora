---
chapter_id: ch_live_directive_union_constraint_or_policy_7c3123
topic_id: 181
family: 03_directive_governance
cited_terms: ['directive_union_constraint_or_policy', 'patient_insurance_record', 'dengue_transmission_process']
model: engine-refine
---

Policy directives, constraints, and policies are captured through a normalized entity-attribute-value architecture that separates the definition of attributes from their type-specific storage. The central directive table assigns each policy a unique identifier—such as POLI-0001 through POLI-0004—and associates it with up to three directive classifications, for instance "Compliance Validation Spec" paired with "Retention Duration Rule" and "Sensor Calibration Directive." Attribute metadata is catalogued separately, where each attribute carries a name like `effective_date`, `enforcement`, `mandatory`, or `priority`, along with a corresponding XML Schema type: `xsd:date`, `xsd:string`, `xsd:boolean`, or `xsd:integer`. Because values are typed, the system distributes them across four dedicated value tables. Boolean attributes resolve to `true` or `false` entries in the boolean value table; date attributes store ISO-formatted dates such as 2024-10-31 or 2023-02-17; integer attributes hold numeric values ranging from small integers like 3 and 5 to larger figures such as 854; and string attributes accommodate free-form text including "Encoding 01," "Enforcement 02," and "change rationale." Each value row references both the entity (the policy identifier) and the attribute identifier, enabling any policy to carry any combination of typed attributes without schema modification.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

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

Patient insurance records follow a parallel normalization strategy, decomposing what might otherwise be a monolithic record into a header table, a data-element catalog, and a role-bearing association table. The header table, `t_patient_insurance_record`, assigns each record a unique identifier—RECO-0001 through RECO-0004—and stores a representative insurance record value such as "ENROLL-7742," "POL-8821-AX," "SSN-4821," or "DOB-19850312." The data-element catalog, `t_patient_insurance_record_contains_data_element`, enumerates the specific data elements contained within each record, including items like `coverage_start_date`, `provider_npi`, `deductible_limit`, and `premium_amount`. The junction table `t_patient_insurance_record__contains_data_element` then binds a patient record to a data element while simultaneously assigning a role that describes the relationship: `contributor`, `owner`, or `observer`. For example, patient RECO-0005 acts as a contributor to data element RECO-0003, while RECO-0008 assumes the owner role for RECO-0006. This three-table decomposition supports flexible data governance by making both the presence of data elements and the nature of each party's relationship to them first-class, queryable facts.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

The dengue surveillance domain employs a star-schema design centered on a fact table that records event counts alongside foreign keys to host and vector dimension tables. The fact table, `fact_dengue`, assigns each row a unique identifier—PROC-0001 through PROC-0004—and stores an `event_count` that quantifies observed dengue events, with values such as 251, 444, 56, and 167. Each fact row references a host through the `involves_host_key` column and a vector through the `involves_vector_key` column, both of which resolve to entries in their respective dimension tables. The host dimension, `dim_involves_host`, provides a human-readable label (e.g., "Involves Host Label 01") and a categorical classification (e.g., "Involves Host Category 01") for each host identifier. Similarly, the vector dimension, `dim_involves_vector`, supplies a label and category for each vector identifier. This separation allows the fact table to remain lean and numeric while all descriptive metadata about hosts and vectors is maintained in dedicated, reusable dimension tables.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |