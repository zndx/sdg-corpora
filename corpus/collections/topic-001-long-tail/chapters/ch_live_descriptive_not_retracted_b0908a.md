---
chapter_id: ch_live_descriptive_not_retracted_b0908a
topic_id: 1
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'hipaa_safeguard_admin', 'column_distinctness']
model: engine-refine
---

Attributes, their types, entities, and identifiers constitute the foundational scaffolding of any attribute-value data model, enabling heterogeneous metadata to be stored, queried, and governed without rigid schema constraints. An entity serves as the primary anchor—a discrete record or observation unit identified by a stable key such as RETR-0001, ADMI-0001, or DIST-0001—while attributes define the dimensions along which that entity is characterized. The attribute name, whether confidence, dimension_kind, method, effective_date, enforcement, mandatory, or priority, establishes the semantic meaning of the measurement, and the attribute type—xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, xsd:integer—enforces type discipline at the schema level. This separation of entity, attribute definition, and attribute value into distinct tables is not merely an organizational convenience; it is a structural necessity for supporting polymorphic value storage, where a single entity like RETR-0001 may carry a decimal value of 0.736 for confidence, a varchar value of Dimension Kind 01 for dimension_kind, and a datetime value of 2024-02-12T07:34:36 for recorded_at, each persisted in its own typed value table.

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

The typed value tables—val_datetime, val_decimal, val_varchar, val_boolean, val_date, val_int—form the value layer of the model, each dedicated to a single XML Schema datatype. This design ensures that type coercion never occurs at query time and that indexing strategies can be optimized per datatype. Consider the HIPAA safeguard administration domain: the attribute mandatory (ADMI-0003) of type xsd:boolean stores values true and false across entities ADMI-0001 through ADMI-0004, while the attribute effective_date (ADMI-0001) of type xsd:date records dates ranging from 2023-01-18 to 2025-04-08, and the attribute priority (ADMI-0004) of type xsd:integer holds integer values such as 1 and 309. Each value row carries an entity_id that references the entity table and an attr_id that references the attribute definition, creating a three-way join path that reconstructs the full attribute-value pair. The identifier column in each value table (e.g., ADMI-0001, DIST-0001) serves as a surrogate primary key for the value record itself, independent of the entity or attribute it describes.

**t_hipaa_safeguard_admin**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| ADMI-0001 | Privacy Rule | Audit Controls |
| ADMI-0002 | Security Rule | Omnibus Modification |
| ADMI-0003 | Transactions Rule | e-Signature Rule |
| ADMI-0004 | Contingency Plan | Security Policy |
| ADMI-0005 | Audit Controls | Access Control |
| ADMI-0006 | Unique ID Rule | Unique ID Rule |
| ADMI-0007 | HITECH Amendment | Incident Response |

**t_hipaa_safeguard_admin_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ADMI-0001 | effective_date | xsd:date |
| ADMI-0002 | enforcement | xsd:string |
| ADMI-0003 | mandatory | xsd:boolean |
| ADMI-0004 | priority | xsd:integer |
| ADMI-0005 | review_cycle_days | xsd:integer |
| ADMI-0006 | scope | xsd:string |
| ADMI-0007 | encoding | xsd:string |
| ADMI-0008 | label_text | xsd:string |

**t_hipaa_safeguard_admin_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0003 | true |
| ADMI-0002 | ADMI-0002 | ADMI-0003 | false |
| ADMI-0003 | ADMI-0003 | ADMI-0003 | true |
| ADMI-0004 | ADMI-0004 | ADMI-0003 | false |
| ADMI-0005 | ADMI-0005 | ADMI-0003 | true |
| ADMI-0006 | ADMI-0006 | ADMI-0003 | false |
| ADMI-0007 | ADMI-0007 | ADMI-0003 | false |

**t_hipaa_safeguard_admin_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0001 | 2024-01-07 |
| ADMI-0002 | ADMI-0002 | ADMI-0001 | 2023-01-18 |
| ADMI-0003 | ADMI-0003 | ADMI-0001 | 2025-04-08 |
| ADMI-0004 | ADMI-0004 | ADMI-0001 | 2024-08-23 |
| ADMI-0005 | ADMI-0005 | ADMI-0001 | 2023-10-19 |
| ADMI-0006 | ADMI-0006 | ADMI-0001 | 2024-11-12 |
| ADMI-0007 | ADMI-0007 | ADMI-0001 | 2023-08-20 |

**t_hipaa_safeguard_admin_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0004 | 1 |
| ADMI-0002 | ADMI-0001 | ADMI-0005 | 309 |
| ADMI-0003 | ADMI-0002 | ADMI-0004 | 1 |
| ADMI-0004 | ADMI-0002 | ADMI-0005 | 623 |
| ADMI-0005 | ADMI-0003 | ADMI-0004 | 3 |
| ADMI-0006 | ADMI-0003 | ADMI-0005 | 849 |
| ADMI-0007 | ADMI-0004 | ADMI-0004 | 5 |
| ADMI-0008 | ADMI-0004 | ADMI-0005 | 665 |

**t_hipaa_safeguard_admin_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ADMI-0001 | ADMI-0001 | ADMI-0007 | Encoding 01 |
| ADMI-0002 | ADMI-0001 | ADMI-0002 | Enforcement 02 |
| ADMI-0003 | ADMI-0001 | ADMI-0008 | change rationale |
| ADMI-0004 | ADMI-0001 | ADMI-0009 | fr |
| ADMI-0005 | ADMI-0001 | ADMI-0006 | Scope 05 |
| ADMI-0006 | ADMI-0002 | ADMI-0007 | Encoding 06 |
| ADMI-0007 | ADMI-0002 | ADMI-0002 | Enforcement 07 |
| ADMI-0008 | ADMI-0002 | ADMI-0008 | audit excerpt |

**t_column_distinctness_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

**t_column_distinctness_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-16T07:35:25 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2024-11-18T03:00:42 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-09-01T19:05:24 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2023-12-18T13:12:41 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2023-08-26T16:30:42 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-12-26T12:24:58 |
| DIST-0007 | DIST-0007 | DIST-0004 | 2024-03-15T16:54:27 |
| DIST-0008 | DIST-0008 | DIST-0004 | 2024-09-07T18:06:58 |

Identifiers follow a domain-specific prefix convention that encodes provenance at a glance: RETR- prefixed records belong to the descriptive-not-retracted domain, ADMI- to HIPAA safeguard administration, and DIST- to column distinctness metrics. Within each domain, the descriptive and descriptive_2 columns of the entity table provide human-readable labels—Sensor Drift Note, Anomaly Flag Sheet, Privacy Rule, Security Rule, sample_batch, device_serial—that serve as the operational vocabulary for analysts and auditors. The distinctness_ratio values in the column distinctness entity table, such as 0.452 for sample_batch and 0.999 for protocol_version and log_sequence, quantify the cardinality pressure on each column and inform indexing and partitioning decisions. A ratio near 1.0 indicates near-unique values and suggests that the column may serve as a natural key or partitioning dimension, while a ratio of 0.452 signals significant value repetition and potential for compression.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_column_distinctness**

| id | column | distinctness_ratio |
| --- | --- | --- |
| DIST-0001 | sample_batch | 0.452 |
| DIST-0002 | device_serial | 0.912 |
| DIST-0003 | protocol_version | 0.999 |
| DIST-0004 | log_sequence | 0.999 |
| DIST-0005 | specimen_code | 0.550 |
| DIST-0006 | telemetry_node | 0.667 |
| DIST-0007 | run_identifier | 0.667 |
| DIST-0008 | sample_batch | 0.103 |

The attr_type column, populated with XSD datatype URIs such as xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, and xsd:integer, provides a machine-readable contract between the attribute definition and its value tables. This contract is enforced by the schema: an attribute declared as xsd:decimal can only have rows in val_decimal, never in val_varchar or val_boolean. The attribute recorded_at, typed as xsd:dateTime, stores full timestamp values like 2024-02-12T07:34:36 and 2025-01-21T18:04:20, while effective_date, typed as xsd:date, stores date-only values like 2024-01-07 and 2024-08-23. The distinction matters for range queries, timezone handling, and compliance audit trails where temporal precision is a regulatory requirement. Similarly, the attribute mandatory, typed as xsd:boolean, stores only true or false, providing a clear signal for whether a safeguard control is enforced, while priority, typed as xsd:integer, stores ordinal values like 1, 309, and 623 that support sorting and escalation logic.

Entity-attribute-value modeling, when implemented with this degree of type discipline and identifier discipline, supports both the structured governance of regulatory frameworks—such as the HIPAA Privacy Rule, Security Rule, Transactions Rule, and Contingency Plan, each paired with safeguards like Audit Controls, Omnibus Modification, e-Signature Rule, and Security Policy—and the operational metadata of sensor networks, where records like Sensor Drift Note and Calibration Reference Sheet carry confidence scores, dimension kinds, and method codes. The misc column in each value table, which holds the actual value payload, is the only column whose schema varies across tables, and its variation is precisely what the attr_type column constrains. This architecture allows new attribute types to be introduced without schema migration: a new attribute declared as xsd:decimal simply requires rows in the existing val_decimal table, and a new attribute declared as xsd:string requires rows in val_varchar. The identifiers, the attribute definitions, and the typed value tables together form a self-describing data model that scales across domains without sacrificing type safety or query performance.

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**t_column_distinctness_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.415 |
| DIST-0002 | DIST-0001 | DIST-0005 | 195.19 |
| DIST-0003 | DIST-0001 | DIST-0007 | 910.18 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.481 |
| DIST-0005 | DIST-0002 | DIST-0005 | 493.27 |
| DIST-0006 | DIST-0002 | DIST-0007 | 836.73 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.447 |
| DIST-0008 | DIST-0003 | DIST-0005 | 842.78 |

**t_column_distinctness_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | intake form |
| DIST-0004 | DIST-0001 | DIST-0010 | ja |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | deg_C |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |