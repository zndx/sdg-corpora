---
chapter_id: ch_live_constraint_evaluated_during_d1b4ad
topic_id: 2
family: 03_directive_governance
cited_terms: ['constraint_evaluated_during', 'constraint_min_one_check', 'constraint_only_constrains']
model: engine-refine
---

In a rigorous governance framework, the integrity of compliance enforcement begins with the precise instantiation of identifiers and their associated entities. Each constraint—whether designated as a "PII Masking Rule" or a "Max Retention Period"—is anchored by a unique identifier, such as `DURI-0001` or `CONS-0001`, which serves as the immutable primary key for the entity. These identifiers do not merely label records; they establish a hierarchical lineage where an entity acts as the focal point for attribute assignment and value resolution. For instance, the entity `DURI-0001` is not an isolated datum but a structural node that aggregates specific attribute definitions, ensuring that every subsequent evaluation, from boolean flags to integer thresholds, is traceable back to a singular, authoritative source of truth.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | PII Masking Rule | CONS-0006 |
| DURI-0002 | Schema Validation Check | CONS-0004 |
| DURI-0003 | access_control_matrix | CONS-0002 |
| DURI-0004 | Primary Key Rule | CONS-0006 |
| DURI-0005 | retry_backoff_limit | CONS-0001 |
| DURI-0006 | Latency Limit | CONS-0001 |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | Max Retention Period | DURI-0002 |
| CONS-0002 | precision_tolerance | DURI-0004 |
| CONS-0003 | Rate Limit Policy | DURI-0001 |
| CONS-0004 | Rate Limit Policy | DURI-0001 |
| CONS-0005 | Data Retention Policy | DURI-0003 |
| CONS-0006 | schema_validation_rule | DURI-0001 |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

The operational behavior of these entities is governed by a strictly typed attribute schema, where the distinction between `attr` and `attr type` is paramount for data integrity. Attributes such as `effective_date`, `enforcement`, `mandatory`, and `priority` define the semantic properties of a constraint, while their corresponding `attr type`—ranging from `xsd:date` and `xsd:string` to `xsd:boolean` and `xsd:integer`—enforces rigid validation rules. This separation of name and type prevents semantic drift; for example, the attribute `mandatory` is strictly bound to the `xsd:boolean` type, ensuring that its evaluation yields only definitive logical states, while `priority` is constrained to `xsd:integer`, allowing for precise numerical ranking of enforcement severity across the system.

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

Temporal validity is a critical dimension of compliance, managed through the `effectivedate` field which dictates the precise window during which a constraint remains active. A policy such as the "Data Retention Policy" or "Schema Validation Check" is not static; its applicability is bound to specific calendar dates, such as `2023-05-21` or `2025-03-18`, which serve as the activation thresholds for associated checks. This temporal anchoring ensures that governance rules are applied with chronological precision, allowing an entity like `CHEC-0001` to trigger evaluations only when the current operational timeline intersects with its designated effective period, thereby preventing the premature or delayed enforcement of regulatory requirements.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Data Retention Policy | CONS-0004 | 2023-05-21 | team |
| CHEC-0002 | telemetry_sampling_rate | CONS-0002 | 2023-05-17 | team |
| CHEC-0003 | Mandatory Field | CONS-0003 | 2025-03-18 | local |
| CHEC-0004 | Non-Null Requirement | CONS-0001 | 2023-05-11 | regional |

Beyond temporal boundaries, the enforcement of constraints is modulated by `scope`, which defines the jurisdictional reach of a specific compliance check. The scope parameter delineates whether a rule applies at the `team` level, within a `local` environment, or across a `regional` infrastructure, effectively creating a matrix of authority. For example, a check identified as `CHEC-0003` may operate under a `local` scope, restricting its evaluative power to a specific subset of the architecture, whereas a `regional` scope would imply a broader, cross-domain applicability. This granular control ensures that compliance mechanisms are neither over-applied, causing operational friction, nor under-applied, leaving critical gaps in the security posture.

Finally, the framework accommodates complex operational requirements through `misc` values, which store the granular metadata necessary for nuanced enforcement. These miscellaneous fields capture heterogeneous data types, including boolean outcomes like `false` or `true` for mandatory flags, integer thresholds such as `590` or `996` for priority weighting, and string-based descriptors like `Encoding 01` or `pre-release note`. By decoupling these varied data points from the core schema, the system allows for the dynamic attachment of operational context—such as the `enforcement` string `Enforcement 02` or the language code `ja`—ensuring that every constraint entity is fully equipped with the detailed parameters required for accurate, real-time compliance evaluation.