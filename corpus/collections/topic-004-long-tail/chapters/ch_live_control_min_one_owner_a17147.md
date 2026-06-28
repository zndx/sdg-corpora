---
chapter_id: ch_live_control_min_one_owner_a17147
topic_id: 4
family: 03_directive_governance
cited_terms: ['control_min_one_owner', 'artifact_min_one_id', 'observation_records_state']
model: engine-refine
---

Attributes and their types form the backbone of structured metadata, enabling systems to describe entities with precision and type safety. An attribute defines a particular dimension of an entity—such as `effective_date`, `enforcement`, `mandatory`, or `priority`—while its type constrains the shape and semantics of the value it carries. Types drawn from the XML Schema Definition namespace, including `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`, ensure that attribute values are not only human-readable but machine-enforceable. This type discipline prevents data corruption at the schema level: a boolean attribute will reject a date, and a decimal field will not accept a string. In practice, this means that an observation such as a "Network latency spike" can be enriched with a `duration_seconds` attribute typed as `xsd:decimal` (yielding values like `4243.13` or `1567.00`), while a `host_name` attribute typed as `xsd:string` carries values like `worker-07` without ambiguity.

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

Entities are the concrete instances to which attributes are bound, each identified by a unique key that serves as the anchor for all relational lookups. An identifier such as `OWNE-0001` or `STAT-0001` is not merely a label; it is the foreign key that connects an entity to its attributes, its attribute values, and any controlling policies. The entity-attribute-value (EAV) pattern, as manifested in the value tables, decouples the definition of an attribute from its instantiation on a specific entity. For example, the attribute `mandatory` (identified as `OWNE-0003`) is a boolean type that can be assigned to multiple entities—`OWNE-0001` through `OWNE-0004`—with each entity receiving its own value (`false`, `false`, `true`, `false`). This separation of definition from assignment allows the same attribute schema to be reused across diverse entities without duplication, while the entity_id column in each value table establishes the precise linkage.

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |

Licenses and locations provide the governance and operational context that sit alongside technical metadata. A license designation—such as `CC-BY-4.0`, `proprietary`, or `MIT`—encodes the legal and compliance posture of an artifact, determining what downstream parties may do with it. An artifact like `manifest-v1` may appear multiple times across different contexts, each time carrying a distinct license: `proprietary` in one instance and `CC-BY-4.0` in another, reflecting that licensing is an attribute of the artifact-entity at a specific point in its lifecycle. Similarly, a location field such as `us-east-1`, `eu-west-3`, `rack-7`, or `ap-south-2` grounds the artifact in a physical or logical deployment zone, which is critical for data residency compliance, latency-aware routing, and incident response. Together, license and location transform a bare identifier into a governed, traceable asset.

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |

The misc. category captures the heterogeneous value types that do not fit into the standard numeric or date buckets, primarily free-form strings and coded enumerations. Varchar values such as `audit excerpt`, `Encoding 01`, `Enforcement 02`, or `pending` carry operational state, human-readable annotations, or domain-specific codes that resist rigid typing. In the observation domain, a `records` field might hold `Event log manifest` or `Sensor data packet`, while an `exit_code` typed as `xsd:integer` carries a numeric status like `958` or `517`. The distinction between a typed integer and a misc. varchar is not merely syntactic: an `exit_code` of `958` can be compared, aggregated, and thresholded programmatically, whereas a varchar value like `pending` signals a human-readable state that may change meaning across contexts. This duality—rigid types for computable quantities and flexible strings for narrative or coded state—ensures that the metadata model is both precise and expressive.

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

Control policies tie these concepts together by imposing constraints on entities through attribute-based rules. A control such as "Rate Limit Threshold" or "Encryption At Rest" is itself an entity with its own identifier (`OWNE-0001`, `OWNE-0002`) and a set of defining attributes. The `effective_date` attribute, typed as `xsd:date`, anchors a control to a point in time—values like `2023-12-25` or `2025-01-07` indicate when a control becomes active—while the `priority` attribute, typed as `xsd:integer`, assigns a numeric weight (values such as `5`, `245`, `1`, or `705`) that governs resolution order when controls conflict. The `enforcement` attribute, typed as `xsd:string`, carries descriptive text like `Enforcement 02`, and the `mandatory` attribute, typed as `xsd:boolean`, flags whether compliance is non-negotiable. By linking controls to entities through the EAV value tables, the system achieves a flexible policy engine: any entity can be evaluated against any control, and the result is determined by the intersection of the entity's attributes with the control's requirements.

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |