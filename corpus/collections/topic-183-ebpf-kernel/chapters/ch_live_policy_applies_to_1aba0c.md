---
chapter_id: ch_live_policy_applies_to_1aba0c
topic_id: 183
family: 01_foundation
cited_terms: ['policy_applies_to', 'requirement_basic', 'requirement_subclass']
model: engine-refine
---

In governance frameworks, requirements are not monolithic declarations but structured entities enriched with typed attributes that govern their behavior, applicability, and lifecycle. An attribute—whether it is an effective date, an enforcement level, a mandatory flag, or a priority score—provides a dimension of control over a requirement. These attributes are themselves defined with explicit data types: dates conform to `xsd:date`, strings to `xsd:string`, booleans to `xsd:boolean`, and integers to `xsd:integer`. This type discipline ensures that a priority value such as `5` or `962` is never confused with a boolean `true` or a date like `2025-06-11`, and that each attribute value is stored in the appropriate typed value table, preserving semantic integrity across the framework.

The effective date anchors a requirement or policy application in time, establishing when it becomes operative. A policy such as the Cloud Security Baseline takes effect on `2025-01-11`, while the Zero Trust Architecture Guideline was activated earlier, on `2023-03-13`. Similarly, individual requirements carry their own effective dates—`2024-12-28` for one requirement, `2023-09-17` for another—allowing the framework to track temporal evolution and audit compliance against the correct version of a rule at any given point. This temporal dimension is critical for regulatory frameworks where obligations shift, and retroactive or prospective application must be defensible.

Every attribute value is tied to an entity, which is the requirement instance to which the attribute applies. The entity identifier—`REQU-0001`, `REQU-0002`, and so on—serves as the foreign key linking typed value tables back to the requirement definition. A single requirement may carry multiple attributes: the same entity `REQU-0001` might have an effective date of `2025-06-11`, a mandatory flag set to `true`, and a priority of `5`, each stored in its respective typed value table but all attributable to the same entity. This design decouples attribute definitions from their values, enabling requirements to be extended with new attributes without schema migration.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | REQU-0006 | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | REQU-0007 | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | REQU-0004 | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | REQU-0005 | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | REQU-0001 | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | REQU-0003 | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | REQU-0003 | 2024-07-03 | nightly summary |

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

Identifiers provide the unique keys that hold the entire structure together. Policy applications are identified as `APPL-0001` through `APPL-0004`, requirements as `REQU-0001` through `REQU-0004`, and these identifiers form the backbone of foreign-key relationships across tables. A policy application like `APPL-0001` references a requirement such as `REQU-0006`, while a requirement subclass like `REQU-0001` specifies a policy application `APPL-0007`. The identifier space is consistent and machine-readable, supporting programmatic queries, cross-referencing, and audit trails without ambiguity.

Label text and language provide human-readable context alongside machine-readable identifiers. A policy application may carry a label such as "audit excerpt" or "pre-release note," giving auditors and operators a quick semantic cue about the nature of the mapping. Language codes—`de`, `es`, `fr`, `ja`—indicate the linguistic context of requirement subclasses, ensuring that a Data Retention Policy defined in Spanish (`es`) or a Metadata Tagging Mandate in Japanese (`ja`) is associated with the correct localization. These fields do not replace identifiers but complement them, bridging the gap between system records and human interpretation.

**t_requirement_subclass**

| id | requirement | specifies | scope | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | Event Deduplication Protocol | APPL-0007 | local | de |
| REQU-0002 | Data Retention Policy | APPL-0002 | team | es |
| REQU-0003 | Data Retention Policy | APPL-0004 | local | fr |
| REQU-0004 | Metadata Tagging Mandate | APPL-0005 | global | ja |

Scope determines the boundary within which a requirement subclass is intended to operate. A requirement may be scoped to `local`, applying within a single system or team; `team`, spanning a collaborative unit; or `global`, enforcing organization-wide applicability. The Event Deduplication Protocol is scoped to `local`, while the Data Retention Policy carries a `team` scope, and the Metadata Tagging Mandate is `global`. This hierarchy of scope enables governance frameworks to enforce different levels of control—some rules apply narrowly, others universally—without duplicating definitions or creating conflicting obligations.