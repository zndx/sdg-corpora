---
chapter_id: ch_live_requirement_applies_to_system_f3b26c
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_applies_to_system', 'control_min_one_owner', 'perf_event_subclass']
model: engine-refine
---

In compliance and governance frameworks, entities serve as the fundamental units of accountability—each representing a discrete obligation, control, or operational event that must be tracked, measured, and enforced. An entity is identified by a stable, machine-readable identifier such as `SYST-0001` for a latency requirement, `OWNE-0001` for a rate-limiting control, or `EVEN-0001` for a thread-contention performance event. These identifiers anchor the entity to its descriptive definition: a system requirement like "latency under 50ms," a control directive such as "Encryption At Rest," or a performance metric like "disk_io_ops." The identifier is the primary key that enables relational integrity across the entire data model, ensuring that every attribute assignment and value record can be traced back to the entity it qualifies.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

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

Attributes provide the dimensional structure through which entities are characterized and evaluated. Each attribute carries a name—`effective_date`, `enforcement`, `mandatory`, `priority`, `checksum`, `license`—and a type that constrains the shape of permissible values. The type system distinguishes between `xsd:date` for temporal constraints like `2025-05-21` or `2023-12-25`, `xsd:boolean` for binary flags such as `true` or `false`, `xsd:integer` for numeric thresholds like `391` or `705`, and `xsd:string` for free-form or coded text including `audit excerpt`, `Encoding 01`, or `MPL-2.0`. A custom type namespace, `cco:DesignativeICE`, appears for identifiers with organizational semantics, exemplified by the value `oid:1.3.6.1`. This type discipline ensures that validation, indexing, and query semantics are consistent across all entities that share an attribute definition.

The value storage architecture separates attribute metadata from actual data, routing each value to a type-specific table keyed by both the entity and the attribute. A boolean attribute like `mandatory` resolves to the boolean value table, where `entity_id` `SYST-0001` paired with `attr_id` `SYST-0003` yields `false`, while `SYST-0002` under the same attribute yields `true`. Date attributes such as `effective_date` are stored in the date value table, with `OWNE-0001` recording `2023-12-25` and `OWNE-0004` recording `2025-01-07`. Integer attributes like `priority` are stored in the integer value table, where `OWNE-0001` carries a value of `5` and `OWNE-0002` carries `705`. Varchar attributes capture everything from regional codes like `fr` and `de` to descriptive strings like `audit excerpt` and `Enforcement 02`. This normalization by type enables efficient storage, type-safe retrieval, and schema evolution without altering the core entity-attribute relationship.

Foreign-key relationships bind the model together across entity types. The `entity_id` column in every value table references the `id` of the entity it qualifies, while `attr_id` references the `id` of the attribute definition, forming a composite key that uniquely identifies each attribute assignment. Cross-entity links appear in tables like `t_perf_event_subclass`, where the `perf_event_config` column references a system identifier (`SYST-0001`, `SYST-0003`, `SYST-0004`), establishing that a performance event such as `thread_contention` or `network_bytes` is governed by a specific system requirement. This relational fabric ensures that compliance data is not siloed by entity category but forms a unified graph of obligations, controls, and measurable outcomes.

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

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

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | SYST-0004 |
| EVEN-0002 | disk_io_ops | SYST-0001 |
| EVEN-0003 | disk_io_ops | SYST-0003 |
| EVEN-0004 | network_bytes | SYST-0004 |
| EVEN-0005 | network_bytes | SYST-0004 |
| EVEN-0006 | jvm_heap_used | SYST-0003 |

**t_perf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | checksum | xsd:string |
| EVEN-0002 | created_date | xsd:date |
| EVEN-0003 | identifier | cco:DesignativeICE |
| EVEN-0004 | license | xsd:string |
| EVEN-0005 | mime_type | xsd:string |
| EVEN-0006 | size_bytes | xsd:long |
| EVEN-0007 | uri | xsd:string |
| EVEN-0008 | version | xsd:integer |

**t_perf_event_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-03-08 |
| EVEN-0002 | EVEN-0002 | EVEN-0002 | 2023-08-29 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | 2025-04-08 |
| EVEN-0004 | EVEN-0004 | EVEN-0002 | 2024-10-09 |
| EVEN-0005 | EVEN-0005 | EVEN-0002 | 2024-06-29 |
| EVEN-0006 | EVEN-0006 | EVEN-0002 | 2025-04-11 |

**t_perf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0006 | 193 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 8 |
| EVEN-0003 | EVEN-0002 | EVEN-0006 | 332 |
| EVEN-0004 | EVEN-0002 | EVEN-0008 | 11 |
| EVEN-0005 | EVEN-0003 | EVEN-0006 | 351 |
| EVEN-0006 | EVEN-0003 | EVEN-0008 | 10 |
| EVEN-0007 | EVEN-0004 | EVEN-0006 | 314 |
| EVEN-0008 | EVEN-0004 | EVEN-0008 | 12 |

**t_perf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 9d2b7a16 |
| EVEN-0002 | EVEN-0001 | EVEN-0003 | oid:1.3.6.1 |
| EVEN-0003 | EVEN-0001 | EVEN-0004 | MPL-2.0 |
| EVEN-0004 | EVEN-0001 | EVEN-0009 | ap-south-2 |
| EVEN-0005 | EVEN-0001 | EVEN-0005 | application/json |
| EVEN-0006 | EVEN-0001 | EVEN-0010 | Name 06 |
| EVEN-0007 | EVEN-0001 | EVEN-0011 | data-engineering |
| EVEN-0008 | EVEN-0001 | EVEN-0012 | Tags 08 |

The practical significance of this structure lies in its ability to support heterogeneous compliance domains under a single data model. A system requirement for "backup frequency daily" and a control directive for "RBAC Assignment Policy" share the same attribute vocabulary—`effective_date`, `enforcement`, `mandatory`, `priority`—yet each entity can carry a distinct combination of values. The same attribute name can mean different things in different contexts because the attribute definition is scoped to its entity type, and the value tables enforce type constraints independently. This design allows governance teams to define, audit, and report on requirements, controls, and performance events using a consistent query interface, while preserving the semantic distinctions that matter for regulatory compliance.