---
chapter_id: ch_live_control_with_classification_tier_7b6fc9
topic_id: 186
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'outlier_detection_uses_explainer', 'state_transitions_from']
model: engine-refine
---

In governance frameworks that classify controls by tier, each control receives a unique identifier—such as TIER-0001 through TIER-0004—to anchor a set of security requirements including input sanitization, role-based access, encryption at rest, and session expiration. These identifiers serve as the primary key for the control catalog and as the reference point for all downstream attribute assignments. A control does not exist in isolation; it carries metadata in the form of attributes, each with a name and a typed schema. The attribute layer distinguishes between properties like effective_date, enforcement, mandatory, and priority, and enforces their data types through an XSD vocabulary—xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type discipline ensures that when a boolean attribute records whether a control is mandatory, the value is either true or false; when a date attribute captures when a control takes effect, the value conforms to a calendar date such as 2023-02-10 or 2024-01-29; and when an integer attribute stores a numeric priority, the value is an unambiguous whole number like 715 or 86.

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

The entity-attribute-value pattern extends this structure by decoupling the attribute definition from its concrete assignment. An entity—identified by the same tier identifier that names the control—receives specific attribute values through typed value tables. A single entity such as TIER-0001 can carry a boolean value of false for one attribute and a date value of 2023-09-02 for another, with each value routed to the appropriate typed store based on the attribute's declared type. String-valued attributes follow the same routing, landing in a varchar store with values like "Enforcement 02", "audit excerpt", or "Encoding 01". This separation of concerns means that the schema for attribute definitions remains stable while the set of entities and their assigned values can grow independently, supporting scenarios where new controls are onboarded or existing controls receive updated metadata without schema migration.

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

In operational monitoring, the same relational discipline applies to outlier detection and incident tracking. Each outlier record carries an identifier—EXPL-0001 through EXPL-0004—and references a dimension entity through a foreign key, linking the outlier to a labeled category such as "Uses Label 03" classified under "Uses Category 03". The outlier's behavioral signature is captured through three quantitative fields: duration_seconds, which measures the elapsed time of the anomalous event in seconds (values ranging from 1182.39 to 6466.78); exit_code, which records the termination status of the process (values such as 760, 490, 124, and 4); and retry_count, which tallies how many times the system attempted recovery before the outlier was logged (values from 101 to 308). Together, these fields form a compact incident profile that enables downstream analysis of failure modes, mean time to detection, and the effectiveness of retry policies.

**fact_outlier**

| id | uses_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| EXPL-0001 | EXPL-0003 | 3360.34 | 760 | 293 |
| EXPL-0002 | EXPL-0003 | 6466.78 | 4 | 225 |
| EXPL-0003 | EXPL-0002 | 5282.09 | 490 | 101 |
| EXPL-0004 | EXPL-0005 | 1182.39 | 124 | 308 |
| EXPL-0005 | EXPL-0002 | 3041.72 | 808 | 59 |
| EXPL-0006 | EXPL-0004 | 3852.38 | 619 | 489 |
| EXPL-0007 | EXPL-0002 | 1453.07 | 682 | 1 |

**dim_uses**

| id | uses_label | uses_category |
| --- | --- | --- |
| EXPL-0001 | Uses Label 01 | Uses Category 01 |
| EXPL-0002 | Uses Label 02 | Uses Category 02 |
| EXPL-0003 | Uses Label 03 | Uses Category 03 |
| EXPL-0004 | Uses Label 04 | Uses Category 04 |
| EXPL-0005 | Uses Label 05 | Uses Category 05 |
| EXPL-0006 | Uses Label 06 | Uses Category 06 |

State transition modeling introduces a third relational pattern, one that captures the directional relationships between system states and the roles that govern them. A state—such as MaintenanceWindow, DrainingEndpoint, or SynchronizedState—is defined independently from the transitions that lead into it, such as StagingDataset, ValidationQueue, ArchiveBucket, or BackupSnapshot. The junction table that links states to transitions carries a role field that specifies the function of the participant in that transition: contributor, reviewer, or observer. The subject of the relationship is the state identifier (e.g., FROM-0007), and the target is the transitions_from identifier (e.g., FROM-0006), establishing a directed edge that encodes both the structural flow of the system and the organizational accountability attached to each edge. This tripartite structure—subject, target, role—mirrors the subject-permission-object model used in access control, ensuring that every state change is traceable to both a technical trigger and a human or system actor.

**t_state_transitions_from**

| id | state |
| --- | --- |
| FROM-0001 | MaintenanceWindow |
| FROM-0002 | DrainingEndpoint |
| FROM-0003 | MaintenanceWindow |
| FROM-0004 | SynchronizedState |
| FROM-0005 | DrainingEndpoint |
| FROM-0006 | ReplicationGap |
| FROM-0007 | CorruptionDetected |

**t_state_transitions_from_transitions_from**

| id | transitions_from |
| --- | --- |
| FROM-0001 | StagingDataset |
| FROM-0002 | ValidationQueue |
| FROM-0003 | ArchiveBucket |
| FROM-0004 | BackupSnapshot |
| FROM-0005 | ProductionMirror |
| FROM-0006 | LegacyWarehouse |
| FROM-0007 | LegacyWarehouse |

**t_state_transitions_from__transitions_from**

| id | state_id | transitions_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0007 | FROM-0006 | contributor |
| FROM-0002 | FROM-0005 | FROM-0004 | reviewer |
| FROM-0003 | FROM-0006 | FROM-0001 | observer |
| FROM-0004 | FROM-0002 | FROM-0006 | reviewer |
| FROM-0005 | FROM-0007 | FROM-0004 | reviewer |
| FROM-0006 | FROM-0006 | FROM-0005 | observer |
| FROM-0007 | FROM-0003 | FROM-0002 | owner |
| FROM-0008 | FROM-0003 | FROM-0006 | observer |