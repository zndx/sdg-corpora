---
chapter_id: ch_live_column_pair_subject_b38902
topic_id: 154
family: 07_long_tail
cited_terms: ['column_pair_subject', 'syscall_subclass', 'anonymous_demographic_information']
model: engine-refine
---

Within data governance frameworks, demographic information occupies a critical classification boundary, requiring explicit separation between anonymized aggregates and personally identifiable information. Records cataloging household_size, geographic_region, school_district_enrollment, and health_survey_responses as anonymous demographic information must be distinguished from entries that simultaneously reference home_address, full_legal_name, or passport_number as personally identifiable information. The same data element—such as health_survey_responses or geographic_region—may appear in both classifications depending on context and linkage potential, necessitating rigorous attribute-level controls. Age_brackets and household_size further illustrate how demographic constructs can be reclassified based on granularity and re-identification risk, with governance policies requiring explicit documentation of each classification decision.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

The attribute typing system enforces structural discipline across all information classes, assigning precise data types to metadata properties that describe the data itself. Confidence scores are typed as xsd:decimal values ranging from 0.167 to 939.39, providing quantifiable measures of data quality or classification certainty. Dimension identifiers such as Dimension Kind 01 and Encoding 02 are stored as xsd:string, while temporal provenance is captured through xsd:dateTime attributes recording when assessments were performed—2023-03-08T01:00:53, 2024-08-15T06:37:30, and 2025-01-28T08:00:28 among the observed timestamps. Method designations like Encoding 02 and audit excerpts in languages including Japanese (ja) and German (de) are similarly typed as xsd:string, ensuring that provenance metadata remains machine-readable and type-safe.

Syscall subsystem tracking provides a parallel dimensional model for operational telemetry, where each subsystem is assigned a categorical label and monitored through event count metrics. Subsystems labeled In Syscall Subsystem Label 01 through In Syscall Subsystem Label 04 are organized under corresponding categories ranging from In Syscall Subsystem Category 01 to In Syscall Subsystem Category 04, creating a two-level classification hierarchy. Event counts associated with these subsystems vary substantially—from 52 events in the lowest-activity subsystem to 382 in the highest—reflecting the heterogeneous nature of system call patterns across different kernel interfaces and operational workloads. These counts serve as quantitative indicators of subsystem utilization and can inform capacity planning, anomaly detection, and compliance auditing of system access patterns.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

The entity-attribute-value pattern underpins the relational architecture, linking identifiers to their descriptive properties through a normalized structure that separates entity identity from attribute definitions and their concrete values. Each entity—whether a demographic record identified as INFO-0001 or a syscall fact identified as SYSC-0001—maintains distinct attribute references that point to typed metadata definitions. Decimal values like 0.448 and 124.47 attach to specific attribute identifiers, datetime stamps anchor temporal attributes, and varchar values such as pre-release note and audit excerpt provide free-text annotations. Column pair mappings further establish relationships between operational columns and their subject counterparts, with log_level linking to asset_tag, batch_token also referencing asset_tag, transaction_id connecting to control_id, and timestamp_utc mapping to record_id—creating a traceable chain from raw data elements to their governed subjects.

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | asset_tag |
| SUBJ-0002 | batch_token | asset_tag |
| SUBJ-0003 | transaction_id | control_id |
| SUBJ-0004 | timestamp_utc | record_id |
| SUBJ-0005 | patient_id | dataset_uid |
| SUBJ-0006 | transaction_id | dataset_uid |
| SUBJ-0007 | batch_token | record_id |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |