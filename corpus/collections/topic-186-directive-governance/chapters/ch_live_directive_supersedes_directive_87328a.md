---
chapter_id: ch_live_directive_supersedes_directive_87328a
topic_id: 186
family: 03_directive_governance
cited_terms: ['directive_supersedes_directive', 'rollback_relation', 'state_transitions_from']
model: engine-refine
---

In any structured governance or compliance framework, every directive, rollback procedure, and state transition must be anchored to a stable identifier—a unique key that serves as the system's primary reference point. Identifiers such as DIRE-0001, RELA-0001, and FROM-0001 provide this anchor, enabling unambiguous cross-referencing across the entire data model. An identifier is not merely a label; it is the connective tissue that allows attributes, values, and relationships to be resolved to a single, traceable entity. Whether tracking which version of PCI DSS v4.0 supersedes another, recording the rollback from release-tag-v3.2 back to FROM-0004, or capturing the transition from StagingDataset into a MaintenanceWindow state, the identifier ensures that every piece of metadata can be traced back to its source without ambiguity.

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | PCI DSS v4.0 |
| DIRE-0002 | PCI DSS v4.0 |
| DIRE-0003 | NERC CIP-003 |
| DIRE-0004 | PCI DSS v4.0 |
| DIRE-0005 | NIST SP 800-53 |
| DIRE-0006 | NERC CIP-003 |
| DIRE-0007 | FedRAMP Moderate |
| DIRE-0008 | NERC CIP-003 |

**t_directive_supersedes_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | FROM-0004 |
| RELA-0002 | telemetry-archive-oct | FROM-0007 |
| RELA-0003 | nightly-sync-rollback | FROM-0002 |
| RELA-0004 | config-deploy-fail | FROM-0001 |
| RELA-0005 | model-checkpoint-88 | FROM-0007 |
| RELA-0006 | batch-processing-halt | FROM-0001 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

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

Attributes and their types form the descriptive layer atop these identifiers. An attribute—such as effective_date, enforcement, mandatory, priority, confidence, dimension_kind, method, or recorded_at—captures a specific characteristic of the entity it describes. Each attribute is paired with an attr type that enforces data integrity: xsd:date for effective_date values like 2024-04-11 or 2024-01-18, xsd:boolean for mandatory flags that resolve to true or false, xsd:integer for priority levels such as 2 or 3, xsd:decimal for confidence scores like 0.023 or 0.999, and xsd:string for free-form descriptors including audit excerpts, pre-release notes, or dimension kind codes like Dimension Kind 01. This typed attribute schema ensures that every piece of metadata carries both semantic meaning and structural constraints, preventing the kind of data corruption that undermines compliance audits.

The entity column bridges the gap between attribute definitions and their concrete values. When a value table stores a misc datum—whether it is the boolean true for mandatory, the date 2023-05-24 for effective_date, the integer 436 for priority, or the string audit excerpt—the entity_id field explicitly ties that value back to the identifier it describes. This design allows a single directive like DIRE-0001 to carry multiple attributes simultaneously: an effective_date of 2024-04-11, a mandatory flag of true, and a priority of 2, each stored in its own typed value table but unified under the same entity reference. The separation of value storage by type (boolean, date, integer, varchar, decimal) is not an artifact of schema design alone; it is a deliberate enforcement of type safety that ensures queries against compliance metadata return results consistent with their declared semantics.

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

Beyond attributes, the framework models relationships between entities through subject, target, and role. A subject is the entity that initiates or is affected by a transition; a target is the entity toward which that transition is directed; and a role defines the nature of the relationship between them. In the state transition model, for instance, FROM-0007 acts as a subject transitioning through FROM-0006 with the role of contributor, while FROM-0002 serves as both a subject and a target in different contexts, assuming the role of reviewer. These triads—subject, target, role—encode organizational semantics: who is responsible, who is accountable, and what capacity in which they act. The same pattern appears in rollback relations, where release-tag-v3.2 rolls back to FROM-0004, and in directive supersession, where one PCI DSS v4.0 directive (DIRE-0001) supersedes another (DIRE-0002), each relationship carrying its own set of typed attributes such as confidence (0.023) and recorded_at timestamps (2024-05-22T12:01:29) that capture the provenance and reliability of the relationship itself.

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