---
chapter_id: ch_live_soc2_processing_integrity_f55fb4
topic_id: 26
family: 07_long_tail
cited_terms: ['soc2_processing_integrity', 'cardinality_max_one_generic', 'trace_basic']
model: engine-refine
---

In compliance and audit frameworks, every observable phenomenon must be anchored to a stable identifier so that evidence can be referenced, correlated, and traced across systems. Identifiers serve as the immutable keys that bind together disparate records describing the same real-world entity. Processing integrity controls, for instance, are distinguished by identifiers such as INTE-0001 through INTE-0004, each tied to a specific organization—Quantum Retail Group, GlobalPay Systems, Pinnacle SaaS Platform, and Nexus Cloud Services respectively. Similarly, trace records carry identifiers like TRAC-0001 and GENE-0001, ensuring that a load-balancer-routing observation or a mandatory_one cardinality constraint can be unambiguously referenced in downstream queries, reports, and audit trails. Without such identifiers, the relational integrity of the entire evidence model collapses, as there would be no reliable mechanism to join related records or to distinguish between otherwise identical observations.

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | INTE-0001 |
| TRAC-0002 | frontend-render-loop | INTE-0001 |
| TRAC-0003 | message-broker-poll | INTE-0002 |
| TRAC-0004 | worker-task-execution | INTE-0003 |
| TRAC-0005 | cache-hit-miss-run | INTE-0004 |
| TRAC-0006 | message-broker-poll | INTE-0005 |

Attributes and attribute types form the schema layer that gives structure to what is being measured. An attribute defines a named property of interest—duration_seconds, end_time, exit_code, host_name—while its type constrains the shape and semantics of the values that attribute may carry. The attribute type registry maps each property to an XML Schema definition: xsd:decimal for numeric measurements, xsd:dateTime for temporal markers, xsd:integer for whole-number counts, and xsd:string for free-form text. This separation of attribute definition from attribute value is critical in compliance contexts, because it allows auditors to validate that a reported duration_seconds value conforms to xsd:decimal, or that an end_time conforms to xsd:dateTime, without conflating schema validation with data entry. The type system thus acts as a gatekeeper, ensuring that the evidence collected is structurally sound before it enters the analytical pipeline.

Entity records represent the concrete instances to which attribute values are attached. An entity is the thing being observed or measured—the trace record, the processing control, the cardinality constraint—and it is identified by its own unique key. Attribute values are then stored in dedicated value tables, each specialized for a particular type, and linked back to their entity through an entity_id foreign key. For example, the decimal value 1505.64 is attached to entity TRAC-0001 via attribute TRAC-0001 (duration_seconds), while the datetime value 2023-04-16T02:44:01 is attached to the same entity via attribute TRAC-0002 (end_time). This value-per-type table design avoids the pitfalls of wide, sparse tables and enables type-safe storage: decimal values reside in t_trace_basic_val_decimal, integer values in t_trace_basic_val_int, datetime values in t_trace_basic_val_datetime, and string values in t_trace_basic_val_varchar. The misc column in each value table holds the actual data, and its meaning is fully determined by the attr_id that points to the attribute definition and the entity_id that identifies the subject of the measurement.

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

Subject, target, and role describe the relationships between entities, capturing who is responsible for what and how different compliance controls interact. In the relationship table linking processing integrity controls to SOC2 domains, the soc_id column functions as the subject—the entity that holds or exercises a responsibility—while for_s_o_c2_domain_id serves as the target—the entity that is the object of that responsibility. The role column then qualifies the nature of the relationship, assigning values such as owner, reviewer, or observer. For example, subject INTE-0006 bears the role of owner against target INTE-0005, while subject INTE-0003 holds the role of reviewer against target INTE-0006. This triad of subject, target, and role enables fine-grained accountability mapping: auditors can trace which organization owns a particular processing integrity control, which domain it serves, and who is responsible for reviewing it. The same pattern generalizes across the framework, allowing any pair of entities to be connected through a typed relationship that encodes both directionality and responsibility.

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |