---
chapter_id: ch_live_alert_governed_by_runbook_8c4c51
topic_id: 67
family: 07_long_tail
cited_terms: ['alert_governed_by_runbook', 'labrun_basic', 'labrun_subclass']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the foundational vocabulary of any governed data architecture, and their proper structuring determines whether an organization can trace, audit, and enforce policy across heterogeneous operational domains. An entity represents a discrete, addressable object within the system—whether it is an alert requiring a runbook response, identified by codes such as RUNB-0001 through RUNB-0004 and carrying descriptive labels like Data Pipeline Stalled, API Gateway Timeout, CPU Utilization Critical, or TLS Certificate Expiry; or a laboratory execution, identified by codes such as LABR-0001 through LABR-0004 and carrying descriptive labels like Microplate_Scan_9A, MassSpec_Triplicate, ELISA_Screen_4B, and PCR_Amplification. The identifier serves as the immutable primary key, a stable handle that persists across all attribute-value associations and enables referential integrity across the entire data model.

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

The attribute definition layer decouples what properties exist from what values they hold, establishing a schema that is itself data. Within the alert governance domain, attributes such as effective_date, enforcement, mandatory, and priority are declared with their corresponding XML Schema types—xsd:date, xsd:string, xsd:boolean, and xsd:integer—ensuring that every value assigned to these properties conforms to a known datatype contract. Similarly, laboratory execution attributes including duration_seconds, end_time, exit_code, and host_name are defined with types xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string, respectively. This separation of attribute metadata from attribute values permits the system to evolve its property set without schema migrations, since new attributes can be registered and immediately populated without altering the underlying storage structure.

Value storage is partitioned by type, with dedicated tables for boolean, date, integer, decimal, datetime, and varchar values, each linking an entity to an attribute through a foreign-keyed relationship. For alert governance entities, the mandatory attribute (typed as xsd:boolean) takes values of false for entities RUNB-0001 and RUNB-0002, and true for RUNB-0003 and RUNB-0004, establishing a clear enforcement posture across the alert portfolio. The effective_date attribute (xsd:date) carries values such as 2023-06-14, 2023-01-20, 2025-03-21, and 2025-02-03, anchoring each alert to a temporal governance window. Integer-valued attributes record quantitative metadata—values of 3 and 802 for one entity, 2 and 702 for another—while varchar attributes capture free-form descriptors including Encoding 01, Enforcement 02, pre-release note, and en, each tied to its entity through the same foreign-keyed join pattern.

Laboratory execution entities follow an identical structural pattern but carry domain-specific values that reflect the operational reality of scientific workflows. Duration measurements stored as decimals include 1438.98, 6523.97, 7176.32, and 6375.34 seconds, while exit codes recorded as integers reach values of 918, 57, 674, and 220, indicating varying execution outcomes. Datetime values such as 2025-01-01T00:58:28, 2023-02-28T02:17:46, 2024-11-14T14:13:50, and 2025-05-09T16:03:58 mark execution endpoints, and host identifiers like edge-03 locate processing resources. The varchar value tables further record log levels (Log Level 02), execution states (execution, complete), and procedural annotations (closeout, pending), each bound to its parent entity through the same relational mechanism.

The subclass layer extends this model by introducing a hierarchical relationship between laboratory executions and their governing runbooks, enabling a many-to-one mapping where a single runbook can govern multiple execution instances. The subclass entity table records labrun identifiers such as CellCulture-Exp12, FlowCyt-Panel9, ELISA-Plate88, and PCR-Run-Alpha7, each linked to an input_sample that references a runbook entity—RUNB-0004, RUNB-0001, and RUNB-0005 appearing as governing references. This subclass retains the same attribute-value architecture, with duration_seconds, end_time, exit_code, and host_name defined identically to the basic layer, but populated with distinct values: decimal durations of 7187.70, 5360.85, 3249.87, and 649.77; integer exit codes of 241, 320, 688, and 479; datetime endpoints including 2023-06-03T03:48:13, 2024-12-03T15:21:58, 2023-08-16T05:52:21, and 2024-08-31T23:33:13; and varchar descriptors such as node-b14, Log Level 02, closeout, and pending. The foreign-key from input_sample to the runbook entity establishes the governance chain, ensuring that every subclass execution can be traced back to its authoritative runbook and, by extension, to the alert that triggered it.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | RUNB-0004 |
| LABR-0002 | FlowCyt-Panel9 | RUNB-0001 |
| LABR-0003 | ELISA-Plate88 | RUNB-0005 |
| LABR-0004 | PCR-Run-Alpha7 | RUNB-0005 |
| LABR-0005 | MassSpec-MS19 | RUNB-0006 |
| LABR-0006 | NMR-Stand-04A | RUNB-0004 |
| LABR-0007 | FlowCyt-Panel9 | RUNB-0002 |
| LABR-0008 | RNASeq-Lib15 | RUNB-0006 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |