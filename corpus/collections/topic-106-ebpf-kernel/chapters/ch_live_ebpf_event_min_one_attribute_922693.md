---
chapter_id: ch_live_ebpf_event_min_one_attribute_922693
topic_id: 106
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'process_min_one_output', 'cardinality_exactly_one_generic']
model: engine-refine
---

Attributes, in the context of event-driven observability and process telemetry, constitute a normalized schema for describing heterogeneous properties of system entities without embedding type-specific columns directly into entity records. An attribute identifier—such as ATTR-0001 through ATTR-0004 in the event attribute registry—serves as a stable, domain-unique key that decouples the definition of a property from its instantiation. Each attribute is classified by a semantic name and an XML Schema Definition type: duration_seconds maps to xsd:decimal, end_time to xsd:dateTime, exit_code to xsd:integer, and host_name to xsd:string. This separation of definition from value enables a single entity to carry an arbitrary set of typed properties, and it permits the same attribute definition to be referenced across multiple entity types without schema drift. The ebpf event attribute table anchors this structure by associating each attribute identifier with an event classification—perf_event_sample, xdp_rx_drop, tc_ingress_filter—thereby grounding abstract property definitions in concrete kernel-level observability domains.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

The value tables implement a vertical partitioning strategy in which each attribute type is stored in its own dedicated table, keyed by a surrogate identifier, an entity reference, and the attribute reference. For ebpf events, the decimal value table records measurements such as 2938.76, 3337.03, 6550.82, and 5328.03, each tied to entity ATTR-0001 through ATTR-0004 and attribute ATTR-0001 (duration_seconds). The integer value table captures exit codes and numeric indicators—465, 59, 938, 81—linked to attributes ATTR-0003 and ATTR-0007 across entities ATTR-0001 and ATTR-0002. Datetime values such as 2024-05-05T15:51:23, 2023-02-23T16:05:24, and 2023-10-25T19:35:09 populate the datetime table, referencing attributes ATTR-0002, ATTR-0008, and ATTR-0009 against entity ATTR-0001. String values including node-b14, Log Level 02, initiation, and pending reside in the varchar table, associated with attributes ATTR-0004, ATTR-0005, ATTR-0006, and ATTR-0010. This type-segregated layout ensures that each value table enforces a single SQL type at the storage level, eliminating the need for nullable columns or type-coercion logic in query paths.

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

The same attribute-value pattern is replicated for process outputs, demonstrating that the schema is entity-agnostic and designed for reuse across operational domains. The process output attribute table defines identifiers OUTP-0001 through OUTP-0004, each linked to a process descriptor—feature extraction pipeline, pipeline rollback procedure, model training run—and an output reference such as ATTR-0004 or ATTR-0002. The corresponding value tables mirror the ebpf structure: decimal values of 1575.12, 3915.42, 6819.95, and 6826.25 for duration_seconds; integer values of 695, 449, 903, and 474 for exit codes; datetime stamps including 2023-04-19T05:25:34, 2023-03-27T21:29:05, and 2025-05-24T00:18:25; and varchar entries such as ingest-21, Log Level 02, closeout, and complete. The parallelism between the ebpf and process output schemas is structural rather than semantic—the attribute definitions and value tables are independent per entity family, yet the pattern of id, entity_id, attr_id, and value is invariant, enabling uniform query templates and programmatic attribute resolution.

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | ATTR-0004 |
| OUTP-0002 | pipeline rollback procedure | ATTR-0004 |
| OUTP-0003 | feature extraction pipeline | ATTR-0002 |
| OUTP-0004 | model training run | ATTR-0006 |
| OUTP-0005 | data validation cycle | ATTR-0004 |
| OUTP-0006 | model training run | ATTR-0006 |
| OUTP-0007 | anomaly detection sweep | ATTR-0006 |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

Cardinality constraints govern the relationships between entities and their parent or owning contexts, ensuring referential integrity at the architectural level. The generic cardinality table encodes rules such as ExclusiveOwner and StrictParent, applied to entities like CoreService, SingleSource, DesignatedOwner, and SourceSystem. These constraints operate orthogonally to the attribute-value system: while attributes describe what an entity is or has measured, cardinality rules describe how an entity relates to other entities in the system hierarchy. An ExclusiveOwner relationship asserts that a given entity has a single, unambiguous owner, whereas a StrictParent relationship enforces a one-to-many parent-child linkage with no orphaning permitted. Together, the attribute-value tables and the cardinality table form a complete metadata substrate: attributes capture the observable state of entities, cardinality captures their structural position, and the identifier space—spanning ATTR- and OUTP-prefixed keys—provides a consistent addressing scheme across both dimensions.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |