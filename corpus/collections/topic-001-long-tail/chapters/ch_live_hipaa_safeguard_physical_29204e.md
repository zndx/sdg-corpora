---
chapter_id: ch_live_hipaa_safeguard_physical_29204e
topic_id: 1
family: 07_long_tail
cited_terms: ['hipaa_safeguard_physical', 'belief_interval_basic', 'audit_conducted_by']
model: engine-refine
---

In compliance and governance frameworks, the integrity of audit trails and safeguard documentation depends on a disciplined separation between what an entity is, what properties it carries, and how it relates to other entities. An entity represents a discrete object of governance interest—a physical safeguard such as a Cabinet Lockdown Procedure or CCTV Monitoring, a belief interval capturing a state like Model confidence elevated or Data integrity compromised, or an audit such as a Cloud Infrastructure Review or SOC2 Compliance Review. Each entity is assigned a unique identifier, a string token such as PHYS-0001, INTE-0001, or COND-0001, that serves as the stable anchor for all downstream references. These identifiers are not merely labels; they are the foreign keys that bind attributes to entities, values to attributes, and subjects to targets in relationship tables, ensuring that every datum can be traced back to its source without ambiguity.

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |

**t_belief_interval_basic**

| id | belief |
| --- | --- |
| INTE-0001 | Model confidence elevated |
| INTE-0002 | Data integrity compromised |
| INTE-0003 | Sensor drift confirmed |
| INTE-0004 | Risk threshold exceeded |
| INTE-0005 | Model confidence elevated |
| INTE-0006 | Inference reliability moderate |

**t_belief_interval_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0004 | 2024-02-01T15:25:49 |
| INTE-0002 | INTE-0002 | INTE-0004 | 2023-01-18T17:21:37 |
| INTE-0003 | INTE-0003 | INTE-0004 | 2023-02-06T04:43:18 |
| INTE-0004 | INTE-0004 | INTE-0004 | 2024-05-21T20:07:12 |
| INTE-0005 | INTE-0005 | INTE-0004 | 2023-06-22T00:22:40 |
| INTE-0006 | INTE-0006 | INTE-0004 | 2023-05-13T22:41:07 |

**t_belief_interval_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0001 | 0.436 |
| INTE-0002 | INTE-0001 | INTE-0005 | 621.02 |
| INTE-0003 | INTE-0001 | INTE-0007 | 821.31 |
| INTE-0004 | INTE-0002 | INTE-0001 | 0.913 |
| INTE-0005 | INTE-0002 | INTE-0005 | 437.48 |
| INTE-0006 | INTE-0002 | INTE-0007 | 190.62 |
| INTE-0007 | INTE-0003 | INTE-0001 | 0.640 |
| INTE-0008 | INTE-0003 | INTE-0005 | 909.96 |

**t_belief_interval_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0002 | Dimension Kind 01 |
| INTE-0002 | INTE-0001 | INTE-0008 | Encoding 02 |
| INTE-0003 | INTE-0001 | INTE-0009 | intake form |
| INTE-0004 | INTE-0001 | INTE-0010 | es |
| INTE-0005 | INTE-0001 | INTE-0003 | hybrid |
| INTE-0006 | INTE-0001 | INTE-0006 | mg/L |
| INTE-0007 | INTE-0002 | INTE-0002 | Dimension Kind 07 |
| INTE-0008 | INTE-0002 | INTE-0008 | Encoding 08 |

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

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

Attributes and their types form the schema layer that gives entities their descriptive richness. An attribute—recorded as attr_name in the type registry—is a named property such as confidence, duration_seconds, end_time, or host_name. The attr_type column declares the XML Schema datatype of that property, constraining values to xsd:decimal for numeric measures like 0.436 or 1980.42, xsd:string for categorical labels such as Dimension Kind 01 or Log Level 02, xsd:dateTime for temporal markers like 2024-02-01T15:25:49, and xsd:integer for whole-number counts including 395 and 293. This type registry decouples the definition of an attribute from its actual values, allowing the same attribute to be referenced across multiple entities and enabling type-safe validation at query time. The separation is deliberate: it permits an entity to carry zero, one, or many attributes without requiring schema migrations, and it supports heterogeneous value storage where decimal, string, datetime, and integer values reside in distinct value tables rather than a single untyped column.

Values themselves are stored in a multi-table value store, one table per attr_type, each keyed by a surrogate id and linked through two foreign keys: entity_id, which points back to the entity that owns the value, and attr_id, which identifies the attribute to which the value belongs. This design means that the value 0.913 for entity INTE-0001 and attribute INTE-0001, the value 621.02 for entity INTE-0001 and attribute INTE-0005, and the value es for entity INTE-0001 and attribute INTE-0010 are all retrievable through a uniform join pattern, regardless of their datatype. The entity_id column in each value table is the subject of the relationship, and the attr_id column is the target, establishing a directed link from the entity that possesses a property to the attribute that defines it. In the audit domain, this pattern yields values such as 1980.42 seconds for the duration of a Lab Safety Inspection, the timestamp 2025-06-08T04:54:48 for its end_time, and the host_name node-a01 where the review was executed.

Relationships between entities are captured through a tripartite join table that assigns a role to each subject-target pairing. The subject column (hipaa_id) references one entity, the target column (hipaa_safeguard_id) references another, and the role column classifies the nature of the association—owner, reviewer, or observer. For instance, entity PHYS-0006 is the owner of PHYS-0002, entity PHYS-0004 is the reviewer of PHYS-0005, and entity PHYS-0002 is the observer of PHYS-0008. This role-based relationship model is essential for compliance workflows where accountability must be explicit: an owner bears primary responsibility for a safeguard, a reviewer attests to its adequacy, and an observer maintains awareness without decision authority. The join table's own identifier (PHYS-0001, PHYS-0002, etc.) provides a stable reference to the relationship instance itself, enabling audit trails that record not only who is responsible for what but also when and under what conditions the assignment was made.

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

The practical consequence of this architecture is that compliance data becomes queryable across dimensions that would otherwise be siloed. One can retrieve all attributes of a belief interval whose belief value is Risk threshold exceeded, then join to the value tables to extract the confidence score of 0.436 and the recorded_at timestamp of 2024-02-01T15:25:49, and finally traverse the relationship table to identify which safeguards are owned or reviewed by the entity responsible for that belief state. Similarly, an auditor can enumerate all attributes of a SOC2 Compliance Review—its duration of 6184.62 seconds, its exit_code of 558, its host_name and log_level—and cross-reference those findings against the physical safeguards (Alarm Siren System, Access Control Log) that the review was designed to validate. The identifier-attr-attr_type-entity-value-role-subject-target chain is not an academic exercise in normalization; it is the operational substrate that makes compliance evidence retrievable, auditable, and defensible.

**t_belief_interval_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INTE-0001 | confidence | xsd:decimal |
| INTE-0002 | dimension_kind | xsd:string |
| INTE-0003 | method | xsd:string |
| INTE-0004 | recorded_at | xsd:dateTime |
| INTE-0005 | uncertainty | xsd:decimal |
| INTE-0006 | unit | xsd:string |
| INTE-0007 | value | xsd:decimal |
| INTE-0008 | encoding | xsd:string |

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