---
chapter_id: ch_live_audit_basic_386210
topic_id: 31
family: 03_directive_governance
cited_terms: ['audit_basic', 'audit_conducted_by', 'audit_for_period']
model: engine-refine
---

The foundational architecture of the audit registry rests upon a disciplined separation between entity identification, attribute definition, and value storage. Each audit record carries a unique identifier—AUDI-0001 through AUDI-0004 for the basic audit set, COND-0001 through COND-0004 for conducted-by records, and PERI-0001 through PERI-0004 for period-bound audits—anchoring entries such as "Legacy Migration Check," "Q3 Data Privacy Audit," and "Q3-2024" to immutable keys. Attribute definitions are catalogued independently in dedicated schema tables, where each attribute receives a name and an XML Schema datatype: duration_seconds maps to xsd:decimal, end_time to xsd:dateTime, exit_code to xsd:integer, and host_name to xsd:string. This separation ensures that the structural contract governing what properties an entity may carry is decoupled from the actual values those properties hold, a design choice that permits type-safe storage and schema evolution without altering the entity layer.

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Legacy Migration Check |
| AUDI-0002 | Backup Recovery Test |
| AUDI-0003 | GDPR Compliance Review |
| AUDI-0004 | SOC2 Type II |
| AUDI-0005 | Pipeline Latency Review |
| AUDI-0006 | Encryption Standards Audit |

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Q3 Data Privacy Audit |
| COND-0002 | FINRA Rule 4511 Examination |
| COND-0003 | Oct-2023 |
| COND-0004 | Supply Chain Traceability |
| COND-0005 | FY2023-Q1 |
| COND-0006 | Data Quality Audit |

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Q3-2024 |
| PERI-0002 | Q3-2024 |
| PERI-0003 | Telemetry Integrity Check |
| PERI-0004 | Annual-2022 |
| PERI-0005 | Model Drift Validation |
| PERI-0006 | Legacy Migration Check |
| PERI-0007 | Model Drift Validation |
| PERI-0008 | Q4-2023 |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | Data Retention Policy |
| PERI-0002 | Q3 Data Privacy Audit |
| PERI-0003 | Jan-Mar-2023 |
| PERI-0004 | Q3-2024 |
| PERI-0005 | Jan-Mar-2023 |
| PERI-0006 | Annual-2022 |

Values are materialized across type-specific value tables, each keyed by a composite of entity reference, attribute reference, and a surrogate identifier. The entity_id column in these value tables establishes the foreign-key link back to the originating audit record, while attr_id resolves to the corresponding attribute definition. For the basic audit set, the decimal value table records durations such as 2391.38 and 1955.36 against attribute AUDI-0001; the integer value table captures exit codes of 765 and 217 against AUDI-0003; the datetime value table stores timestamps including 2024-05-14T01:27:39 and 2023-07-30T11:39:04 against attributes AUDI-0002 and AUDI-0009; and the varchar value table holds string values such as "node-a01," "Log Level 02," "initiation," and "pending" against attributes AUDI-0004 through AUDI-0010. The conducted-by audit set mirrors this structure with its own value tables, recording decimal values like 6184.62 and 5867.45, integer values of 558 and 143, datetime values such as 2025-06-08T04:54:48 and 2023-02-14T08:05:22, and varchar values including "review" and "superseded." The misc designation applied to the value column reflects its polymorphic nature—each row's semantic meaning is determined entirely by the intersection of its entity_id and attr_id, not by the column itself.

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

The relationship between audits and audit periods is mediated through a junction table that introduces role as a first-class dimension of the association. The table t_audit_for_period__for_audit_period links an audit_id to a for_audit_period_id and assigns each pairing a role of either "observer" or "reviewer." In practice, PERI-0001 appears as the audit_id with role "observer" when linked to PERI-0003, while PERI-0002 assumes role "reviewer" against the same period target; PERI-0005 is assigned role "reviewer" against PERI-0003. The subject column identifies the audit entity initiating the relationship, and the target column identifies the period entity receiving it. This role-bearing linkage transforms a simple many-to-many mapping into a semantically rich association: an audit does not merely belong to a period, it participates in that period under a defined capacity. The for_audit_period column in the companion table t_audit_for_period_for_audit_period provides human-readable labels—"Data Retention Policy," "Q3 Data Privacy Audit," "Jan-Mar-2023," "Q3-2024"—that contextualize the period identifiers without duplicating the structural relationship.

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

This architecture, in which identifiers anchor entities, attributes define the property vocabulary, type-specific value tables materialize data, and role-bearing junction tables express relational semantics, constitutes a general-purpose entity-attribute-value pattern extended with explicit role metadata. The pattern supports heterogeneous audit types—compliance reviews, data privacy examinations, telemetry integrity checks, supply chain traceability assessments—without requiring schema changes per audit category. Each audit type carries its own attribute definitions and value tables, yet the underlying relational mechanics remain uniform: entity_id resolves to a record, attr_id resolves to a property definition, and the value column holds data whose interpretation is governed by the attr_type declared in the attribute schema. The result is a registry that scales across audit domains while preserving type safety, referential integrity, and the capacity to express nuanced relationships through role.