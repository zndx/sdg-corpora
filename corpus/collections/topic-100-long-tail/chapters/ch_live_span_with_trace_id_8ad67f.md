---
chapter_id: ch_live_span_with_trace_id_8ad67f
topic_id: 100
family: 07_long_tail
cited_terms: ['span_with_trace_id', 'schemaorg_creativework_date', 'alert_governed_by_runbook']
model: engine-refine
---

Distributed observability and governance frameworks rely on a disciplined separation between structural definitions and their runtime instantiations, a pattern that becomes evident when examining how spans, alerts, and schema.org creative works are modeled. Each operational entity receives a unique identifier—TRAC-0001 through TRAC-0004 for trace spans, RUNB-0001 through RUNB-0004 for alert-runbook associations, and DATE-0001 through DATE-0004 for creative work dates—serving as the immutable anchor across all subsequent attribute-value bindings. These identifiers do not merely label; they enable the decomposition of complex entities into a schema layer that declares what properties exist and in what data types, and a value layer that populates those properties with concrete measurements. A span identified as TRAC-0001, for instance, carries the operational label config_fetch and belongs to the trace 7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d, yet its substantive characteristics—duration, timestamps, host assignment, exit status—are not embedded inline but resolved through foreign-key references to typed value tables.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | 7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d |
| TRAC-0002 | email_send | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0003 | payment_process | e9f8a7b6c5d4e3f2a1b0c9d8e7f6a5b4 |
| TRAC-0004 | queue_consume | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0005 | payment_process | f0e1d2c3b4a5968778695a4b3c2d1e0f |
| TRAC-0006 | queue_consume | 550e8400e29b41d4a716446655440000 |

**t_span_with_trace_id_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_span_with_trace_id_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2024-07-23T07:53:43 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-01-04T12:30:01 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2024-06-08T06:16:51 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2024-09-04T10:45:36 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2024-03-10T17:10:26 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2024-08-27T18:50:31 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2024-05-28T07:14:21 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-12-31T18:14:37 |

**t_span_with_trace_id_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 5004.94 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 6293.97 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 683.54 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 6162.04 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 7049.18 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 6047.18 |

**t_span_with_trace_id_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 485 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 203 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 446 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 417 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 481 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 210 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 137 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 453 |

**t_span_with_trace_id_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | gw-12 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | running |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | gw-12 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

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

The attribute schema layer establishes a type-safe vocabulary that governs what values are admissible for each property. Within the span domain, attributes such as duration_seconds, end_time, exit_code, and host_name are declared with their corresponding XML Schema datatypes: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This type declaration is not cosmetic; it dictates which value table an attribute's data must inhabit. The decimal attribute TRAC-0001 (duration_seconds) resolves to values like 5004.94, 6293.97, 683.54, and 6162.04 stored in the decimal value table, while the dateTime attribute TRAC-0002 (end_time) resolves to ISO 8601 timestamps such as 2024-07-23T07:53:43 and 2024-01-04T12:30:01 in the datetime table. The integer attribute TRAC-0003 (exit_code) holds values 485 and 446, and the string attribute TRAC-0004 (host_name) carries identifiers like gw-12. This type-dispatched value storage ensures that queries can be routed to the appropriate physical table without runtime type coercion, and that schema evolution can introduce new attribute types without restructuring existing value tables.

The value tables themselves implement an entity-attribute-value (EAV) pattern constrained by foreign keys to both the entity and the attribute definition. Each row in a value table binds a specific entity to a specific attribute and carries a single scalar value in the misc column, typed according to the attribute's declared attr_type. For the span domain, entity TRAC-0001 is associated with attribute TRAC-0001 (duration_seconds) yielding 5004.94, and with attribute TRAC-0002 (end_time) yielding 2024-07-23T07:53:43. The same entity TRAC-0001 also carries string values such as initiation and running for attributes TRAC-0006 and TRAC-0010, and the integer value 203 for attribute TRAC-0007. This design permits any entity to have a variable number of attributes without requiring schema migrations; new attributes are simply added to the attribute definition table, and their values populate the corresponding typed value table. The alert-runbook domain follows an identical pattern: attributes like effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer) are declared once, and their values—2023-06-14, false, true, 3, 802, 702, Encoding 01, Enforcement 02, pre-release note, en—are stored in their respective typed value tables, each row referencing the entity (RUNB-0001 through RUNB-0004) and the attribute definition.

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

Beyond the entity-attribute-value triad, the framework introduces a relationship layer that binds subjects to targets through named roles, enabling rich semantic associations without embedding relationship metadata within the entity or attribute definitions. The schema.org creative work domain illustrates this through the date_published relationship: creative works such as Quantum Error Correction, Human Genome Release, and OAuth 2.0 Guidelines are linked to publication dates (2024-05-11, 2022-11-05, 2023-12-01, 2023-04-12) via a junction table that carries a role column. The same subject DATE-0006 relates to date DATE-0004 with the role owner and to date DATE-0001 with the role contributor, while subject DATE-0005 relates to DATE-0001 as contributor and to DATE-0002 as observer. This role-typed relationship model allows a single subject-target pair to participate in multiple semantic associations simultaneously, each distinguished by its role label. The role column thus serves as the semantic predicate in a subject-predicate-object triple, generalizing the relationship model beyond binary associations and enabling the same underlying join infrastructure to express ownership, contribution, observation, and any other governance-relevant relationship type.

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

The practical consequence of this architecture is a uniform query surface across heterogeneous domains. Whether retrieving the duration of a config_fetch span (TRAC-0001 → TRAC-0001 → 5004.94), the enforcement status of a Data Pipeline Stalled alert (RUNB-0001 → RUNB-0003 → false), or the publication date of Quantum Error Correction (DATE-0001 → DATE-0001 → 2024-05-11), the traversal pattern remains identical: identifier to entity, entity to attribute, attribute to typed value, or subject to role to target. This uniformity simplifies access control policies, audit logging, and data lineage tracking, as every piece of structured information passes through the same foreign-key gates. The attr_type column, far from being a mere schema annotation, functions as a routing directive that determines which of the five value tables—datetime, decimal, integer, varchar, or boolean—must be consulted, ensuring type safety at query time while preserving the flexibility of a schema-on-read value layer.