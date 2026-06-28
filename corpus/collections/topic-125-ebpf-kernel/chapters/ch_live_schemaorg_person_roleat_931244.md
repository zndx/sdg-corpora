---
chapter_id: ch_live_schemaorg_person_roleat_931244
topic_id: 125
family: 07_long_tail
cited_terms: ['schemaorg_person_roleat', 'soc2_trust_criterion', 'observation_records_state']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the structural backbone of any system designed to capture heterogeneous data without imposing a rigid schema. An entity represents a distinct real-world object or concept—such as a person's role at an organization, a SOC 2 trust criterion, or an observation record—and is assigned a unique identifier that serves as its anchor across the system. The identifier `ROLE-0001` designates a person's role at the SANS Institute, while `CRIT-0001` identifies a trust criterion for CyberShield Ltd, and `STAT-0001` corresponds to a network latency spike observation. These identifiers are not arbitrary; they encode the entity class and sequence, enabling unambiguous resolution and cross-referencing. The entity tables themselves establish the primary relationships: `t_schemaorg_person_roleat` links person roles to their affiliated organizations and states, `t_soc2_trust_criterion` maps compliance criteria to the entities subject to them, and `t_observation_records_state` connects observations to the records and states they pertain to.

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | STAT-0002 |
| ROLE-0002 | WHO Cyber Health | STAT-0004 |
| ROLE-0003 | NASA Ames Research | STAT-0003 |
| ROLE-0004 | DARPA InfoTech | STAT-0004 |
| ROLE-0005 | Red Hat OpenShift | STAT-0002 |
| ROLE-0006 | IEEE Standards | STAT-0005 |
| ROLE-0007 | DARPA InfoTech | STAT-0001 |

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | STAT-0005 |
| CRIT-0002 | DataVault Inc | STAT-0004 |
| CRIT-0003 | CloudScale Services | STAT-0006 |
| CRIT-0004 | HealthSys Networks | STAT-0003 |
| CRIT-0005 | RetailChain Partners | STAT-0006 |
| CRIT-0006 | FinTech Global | STAT-0002 |

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | ROLE-0004 |
| STAT-0002 | Water quality anomaly | ROLE-0003 |
| STAT-0003 | Reactor pressure threshold | ROLE-0001 |
| STAT-0004 | Reactor pressure threshold | ROLE-0007 |
| STAT-0005 | Network latency spike | ROLE-0004 |
| STAT-0006 | pH deviation alert | ROLE-0007 |

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

Attribute types define the shape and semantics of the data that can be attached to any entity. Rather than embedding column definitions within entity tables, the system declares attributes in dedicated schema tables—`t_schemaorg_person_roleat_attr`, `t_soc2_trust_criterion_attr`, and `t_observation_records_state_attr`—each specifying an attribute name and its type. For instance, the attribute `created_date` is typed as `xsd:date`, the attribute `mandatory` as `xsd:boolean`, and `duration_seconds` as `xsd:decimal`. This separation of attribute metadata from attribute values enables dynamic extensibility: new attributes can be introduced without altering the entity schema, and type enforcement is centralized. The types themselves span the familiar XML Schema and custom namespaces—`xsd:string`, `xsd:date`, `xsd:boolean`, `xsd:integer`, `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `cco:DesignativeICE`—ensuring that values are semantically constrained at the point of declaration.

Attribute values are stored in type-specific value tables, each keyed by a composite of the entity and attribute identifiers. The varchar value table holds string-valued attributes such as the checksum `c0ffee42`, the license `CC-BY-4.0`, the host name `worker-07`, and the enforcement label `Encoding 01`. The date value table records timestamps like `2025-01-23` for a role's creation and `2025-04-05` for a trust criterion's effective date, while the datetime value table captures precise moments such as `2023-08-02T17:44:58` and `2025-03-10T03:55:42`. Integer and decimal value tables store numeric data—`325` and `7` for role attributes, `2` and `749` for criterion priorities, and `4243.13` and `5274.11` for observation durations in seconds. The boolean value table encodes binary flags, with `true` and `false` values indicating whether a criterion is mandatory. This type-disaggregated storage ensures that each value is stored in the most appropriate column type, preserving precision and enabling efficient querying.

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

The foreign-key relationships between these tables create a graph of interdependent data. The `role_at` column in `t_schemaorg_person_roleat` references the `id` column in `t_observation_records_state`, establishing that a person's role at an organization is associated with a particular state—`ROLE-0001` at the SANS Institute maps to `STAT-0002`, which describes a network latency spike. Similarly, the `soc2_trust_criterion` column in `t_soc2_trust_criterion` references the same state table, so that `CRIT-0001` for CyberShield Ltd is linked to `STAT-0005`. The `records` column in `t_observation_records_state` in turn references the person role identifiers, forming a chain from observation to record to role to organization. These relationships mean that querying a single identifier—say, `ROLE-0003` for NASA Ames Research—resolves not only to its attributes and values but also to the observation records it is associated with and the states that describe them.

This architecture—entities identified by stable keys, attributes declared with typed metadata, values stored in type-appropriate tables, and relationships expressed through foreign keys—provides a flexible yet rigorous foundation for data governance. It supports the kind of heterogeneous, evolving data encountered in compliance frameworks, operational monitoring, and organizational role management. The identifiers `ROLE-0001` through `ROLE-0004`, `CRIT-0001` through `CRIT-0004`, and `STAT-0001` through `STAT-0004` are not merely labels; they are the nodes in a relational graph that can be traversed, queried, and audited with precision. The attribute types ensure that every value is semantically valid, and the type-disaggregated value tables guarantee that data integrity is maintained at the storage layer.