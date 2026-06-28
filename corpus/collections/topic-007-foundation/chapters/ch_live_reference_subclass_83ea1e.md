---
chapter_id: ch_live_reference_subclass_83ea1e
topic_id: 7
family: 01_foundation
cited_terms: ['reference_subclass', 'subclass_to_process', 'ebpfmap_exactly_one_type']
model: engine-refine
---

The governance of distributed systems depends upon a disciplined separation between the identification of entities, the definition of their attributes, and the assignment of roles across relationships. Each entity—whether a process such as incident response, data validation, telemetry aggregation, or batch ingestion, or an eBPF map such as cgroup_sock_map, tcp_conn_map, perf_event_array, or dns_query_cache—is assigned a stable identifier, typically formatted as a prefix paired with a zero-padded sequence number (REFE-0001, PROC-0001, TYPE-0001). These identifiers serve as the primary keys through which all downstream relationships are resolved, ensuring that attribute bindings, value assignments, and role delegations can be traced back to a single authoritative source. The identifier convention itself encodes provenance: the prefix distinguishes entity class, while the numeric suffix preserves insertion order and enables deterministic iteration across large registries.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | cgroup_sock_map |
| TYPE-0002 | tcp_conn_map |
| TYPE-0003 | perf_event_array |
| TYPE-0004 | dns_query_cache |
| TYPE-0005 | tcp_conn_map |
| TYPE-0006 | skb_drop_reason_map |
| TYPE-0007 | skb_drop_reason_map |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | queue |
| TYPE-0002 | devmap |
| TYPE-0003 | hash |
| TYPE-0004 | ringbuf |
| TYPE-0005 | queue |
| TYPE-0006 | cgroup_storage |
| TYPE-0007 | lru_hash |
| TYPE-0008 | cpumap |

Attributes are declared independently of any particular entity instance, each carrying a name and an XML Schema-defined type that constrains the shape of permissible values. The attribute registry captures descriptors such as duration_seconds, end_time, exit_code, and host_name, each annotated with a type from the xsd namespace—xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This type-level discipline ensures that value tables remain homogeneous: decimal values like 5106.96, 6532.76, 6219.83, and 2715.88 are stored exclusively in the decimal value table, datetime values such as 2024-02-25T00:58:35 and 2025-01-11T16:52:13 in the datetime table, integer values including 684, 195, 63, and 361 in the integer table, and string values like worker-07, Log Level 02, closeout, and pending in the varchar table. The separation of value storage by type eliminates ambiguity at query time and enforces schema-level integrity without requiring application-layer validation.

The entity-attribute-value model extends this separation by decoupling the definition of what an attribute is from the assignment of what value it holds for a given entity. Each value row carries an entity_id that references the entity to which the value applies, an attr_id that references the attribute definition, and a value column whose semantics are determined by the attribute's declared type. For example, entity PROC-0001 may simultaneously hold a decimal value of 5106.96 for attribute PROC-0001, a datetime value of 2024-02-25T00:58:35 for attribute PROC-0002, and a string value of worker-07 for attribute PROC-0004. This tripartite structure—entity, attribute, value—forms a sparse matrix that can represent arbitrarily many attributes per entity without schema migration, while the type-specific value tables guarantee that each value conforms to its declared schema type.

Relationships between entities are mediated through a role-based association model that distinguishes the subject from the target and assigns a role to the connection. In the eBPF map type registry, for instance, the relationship table links an ebpfmap entity (such as TYPE-0007 or TYPE-0002) to a map_type entity (such as TYPE-0007 or TYPE-0005) through a role column that takes values from a controlled vocabulary: observer, owner, contributor, or reviewer. This triad of subject, target, and role generalizes beyond the eBPF domain to any context where entities must be related with semantic precision—the role encodes the nature of the association, while the subject and target columns preserve directional semantics that are essential for traversal, audit, and access-control logic.

**t_ebpfmap_exactly_one_type__map_type**

| id | ebpfmap_id | map_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0007 | observer |
| TYPE-0002 | TYPE-0002 | TYPE-0005 | owner |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | contributor |
| TYPE-0004 | TYPE-0001 | TYPE-0005 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0008 | reviewer |
| TYPE-0006 | TYPE-0006 | TYPE-0005 | contributor |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0005 | TYPE-0005 | contributor |

Reference records provide an additional layer of governance by anchoring entities to external standards, internal policies, or upstream specifications. Each reference carries its own identifier (REFE-0001 through REFE-0004), a human-readable label (Reference 01 through Reference 04), a points_to field that indicates the target of the reference, an issued_date that records when the reference was established (ranging from 2023-09-26 to 2025-05-30), and a namespace that classifies the reference domain as provenance, lineage, or governance. The issued_date field is critical for temporal reasoning: it enables the reconstruction of reference states at any point in time, supports compliance audits that require evidence of when a particular reference was active, and allows the system to distinguish between current and superseded references within the same namespace.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | Points To 01 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | Points To 02 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | Points To 03 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | Points To 04 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | Points To 05 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | Points To 06 | 2023-04-21 | catalog |