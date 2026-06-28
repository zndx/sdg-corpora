---
chapter_id: ch_live_requirement_has_priority_2ea5d0
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_has_priority', 'constraint_check_subclass', 'ebpfmap_only_one_value_type']
model: engine-refine
---

Requirement prioritization in governance frameworks operates through a structured attribute-value architecture where each requirement—such as a latency threshold, backup interval, throughput minimum, or audit log frequency—is assigned a priority classification ranging from trivial through critical. The priority dimension itself is not a monolithic label but a composite construct, decomposed into discrete typed attributes that capture the operational semantics of enforcement. An effective date, expressed as an xsd:date value, anchors when a priority takes effect; an enforcement descriptor, stored as xsd:string, records the mechanism of application; a mandatory flag, typed as xsd:boolean, signals whether compliance is non-negotiable; and a numeric priority score, typed as xsd:integer, provides a quantifiable ordering. These attributes are not abstract—they materialize as concrete values: mandatory flags set to false across multiple requirement entities, effective dates spanning from April 2023 through August 2024, and integer priority scores ranging from 2 to 806, reflecting the granular calibration required in production environments.

The enforcement of these priorities is mediated through constraint checks that themselves carry mandatory and priority designations. A null field rejection check, for instance, may be marked mandatory with a priority of 1, while an anomaly detection threshold check, also mandatory, carries a priority of 4. A header presence check, implemented via an audit log parser, may be non-mandatory yet retain a priority of 1, indicating that its enforcement is advisory but its detection importance remains high. These constraints are evaluated by specific validators—Great Expectations validators, schema registry linters, and audit log parsers—each providing a distinct mechanism for verifying compliance against the priority-defined requirements. The mandatory flag on constraints operates independently of the priority score, allowing for scenarios where a check is optional in enforcement but critical in detection value.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | Great Expectations validator | true | 1 |
| CHEC-0002 | Null field rejection | Schema registry linter | true | 5 |
| CHEC-0003 | Anomaly detection threshold | Great Expectations validator | true | 4 |
| CHEC-0004 | Header presence check | Audit log parser | false | 1 |
| CHEC-0005 | Batch size limit | Prometheus alertmanager | false | 4 |

At the infrastructure layer, type mappings provide the categorical scaffolding that organizes these requirements and constraints into coherent domains. A value type map dimension assigns categorical labels—Value Type Map Category 01 through 04—to type map keys, each associated with a descriptive label such as Value Type Map Label 01. These mappings are instantiated in fact tables where eBPF map records carry a type map key reference, a size in bytes ranging from approximately 31 million to 354 million, and a version number spanning from 3 to 12. The size_bytes column captures the memory footprint of each map instance, a critical metric for resource planning and capacity management, while the version field tracks evolutionary changes to the map structure over time. The type map key serves as the foreign key linking these factual records to their categorical definitions, ensuring that every instantiated map can be traced back to its governing category and label.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

The entity-attribute-value pattern underlying this architecture enables flexible, schema-evolvable governance without requiring structural changes to the underlying tables. When a new attribute type is introduced—whether a date, boolean, integer, or string value—no table alteration is necessary; instead, a new row is added to the attribute definition table, and corresponding value rows populate the appropriate typed value table. This design supports the coexistence of heterogeneous attribute types within a single requirement entity: the same requirement may carry an effective date of 2023-09-07, a mandatory flag of false, a priority integer of 3, and a varchar enforcement descriptor such as "Encoding 01" or "intake form." The identifier columns—PRIO-0001 through PRIO-0004 for requirements, CHEC-0001 through CHEC-0004 for constraints, and TYPE-0001 through TYPE-0004 for type maps—serve as the stable keys that bind these distributed value rows into coherent entities, enabling referential integrity across the attribute-value tables and the fact tables that consume them.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | Trivial |
| PRIO-0002 | Backup interval | Medium |
| PRIO-0003 | Throughput minimum | Critical |
| PRIO-0004 | Audit log frequency | Critical |
| PRIO-0005 | Throughput minimum | Minor |
| PRIO-0006 | Encryption standard | Trivial |
| PRIO-0007 | Throughput minimum | Major |
| PRIO-0008 | Fault tolerance level | Essential |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |