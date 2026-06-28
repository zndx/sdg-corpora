---
chapter_id: ch_live_observation_records_state_fb2e74
topic_id: 186
family: 02_observation_measurement
cited_terms: ['observation_records_state', 'control_with_classification_tier', 'constraint_with_severity_classification']
model: engine-refine
---

An effective compliance and governance framework requires a disciplined separation between the definition of what is being measured and the actual values recorded at any given moment. Observations such as "Network latency spike," "Water quality anomaly," and "Reactor pressure threshold" serve as the primary entities under scrutiny, each tied to a specific record type—whether an event log manifest, a sensor data packet, or a diagnostic trace file. These observations are uniquely identified by stable identifiers like STAT-0001 through STAT-0004, which anchor every downstream attribute and value to a single, traceable point of reference. The same pattern applies to control classifications, where measures such as "Input sanitization," "Role based access," "Encryption at rest," and "Session expiration" are tracked under identifiers like TIER-0001 through TIER-0004, ensuring that every compliance action can be audited back to its originating control.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | Event log manifest |
| STAT-0002 | Water quality anomaly | Event log manifest |
| STAT-0003 | Reactor pressure threshold | Sensor data packet |
| STAT-0004 | Reactor pressure threshold | Diagnostic trace file |
| STAT-0005 | Network latency spike | Observation index cache |
| STAT-0006 | pH deviation alert | Sensor data packet |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

Attributes define the dimensions along which each observation or control is evaluated, and their types enforce data integrity at the schema level. For instance, an attribute named duration_seconds is declared as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, establishing a strict contract between the semantic meaning of the property and the format of its stored value. Control attributes follow a parallel discipline: effective_date is typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This type-level discipline prevents type mismatches at ingestion time and ensures that downstream queries and reports operate on consistently formatted data. The separation of attribute definitions from their values means that schema evolution—adding a new attribute or changing a type—can be managed without restructuring the value storage layer.

Values are stored in type-specific tables, each keyed by a unique identifier and linked to an entity and an attribute through foreign keys. Decimal values such as 4243.13, 4365.77, 5274.11, and 1567.00 reside in the decimal value store, while datetime values like 2023-08-02T17:44:58, 2025-03-10T03:55:42, and 2024-08-16T12:27:34 are held in the datetime store. Integer values including 958, 456, 517, and 41 populate the integer table, and string values such as worker-07, Log Level 02, execution, and pending are stored in the varchar table. Boolean values—false for one control's mandatory flag and true for others—occupy their own boolean store, and date values like 2023-02-10, 2023-09-02, 2024-01-29, and 2024-02-25 are kept in the date table. This normalization by type eliminates redundant type metadata, simplifies indexing strategies, and allows each value table to be optimized for its specific data format.

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

Priority and language serve as cross-cutting classification dimensions that govern how constraints and controls are interpreted and acted upon. In the constraint classification layer, items such as "Access control policy," "PII encryption mandate," "Sensor calibration interval," and "Log retention period" are each assigned a severity level—ranging from "Low exposure" to "Warning threshold" to "Tolerable variance"—alongside a numeric priority score, with values of 3 and 5 appearing across the dataset. Language codes such as es, en, and fr indicate the locale in which each constraint is defined or communicated, enabling multilingual compliance documentation without duplicating the underlying constraint logic. Together, severity, priority, and language form a triage mechanism: a constraint with a higher priority number and a critical severity designation will surface earlier in incident response workflows, while its language tag ensures that the appropriate regional team receives the notification in the correct locale.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | Low exposure | 3 | es |
| CLAS-0002 | PII encryption mandate | Warning threshold | 5 | en |
| CLAS-0003 | Sensor calibration interval | Tolerable variance | 3 | es |
| CLAS-0004 | Log retention period | Warning threshold | 3 | fr |
| CLAS-0005 | Lab containment level | Tolerable variance | 3 | ja |
| CLAS-0006 | Lab containment level | Standard baseline | 2 | fr |