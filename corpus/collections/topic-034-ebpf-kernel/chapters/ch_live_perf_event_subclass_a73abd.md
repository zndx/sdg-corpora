---
chapter_id: ch_live_perf_event_subclass_a73abd
topic_id: 34
family: 07_long_tail
cited_terms: ['perf_event_subclass', 'ebpfprogram_union_kprobe_or_xdp', 'cardinality_max_one_generic']
model: engine-refine
---

Identifiers serve as the immutable keys that anchor every record in a performance-event taxonomy, ensuring that each event subclass can be referenced unambiguously across systems. An identifier such as EVEN-0001 or EVEN-0002 uniquely names a performance event subclass—whether that event captures thread contention, disk I/O operations, or network bytes transferred—and ties it to a specific configuration profile like hardware counter selection, CPU affinity filtering, or a sampling interval set to ten milliseconds. In the eBPF program registry, identifiers follow a parallel convention, with entries like XDP-0001 through XDP-0004 naming programs such as the seccomp profile loader, network policy enforcer, and credential validation probe. Cardinality constraints further govern how these identifiers relate to one another: a cardinality of mandatory_one or strict_unique enforces that a given entity maps to exactly one related record, while singular_ref and first_match permit looser associations to downstream systems like device metrics, asset registries, or audit logs.

**t_perf_event_subclass**

| id | perf | perf_event_config |
| --- | --- | --- |
| EVEN-0001 | thread_contention | hardware_counter_select |
| EVEN-0002 | disk_io_ops | cpu_affinity_filter |
| EVEN-0003 | disk_io_ops | cpu_affinity_filter |
| EVEN-0004 | network_bytes | sampling_interval_10ms |
| EVEN-0005 | network_bytes | 4gb_memory_pool |
| EVEN-0006 | jvm_heap_used | drop_in_place_policy |

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

Attributes define the properties that can be measured, stored, or queried against each entity, and their types enforce data integrity at the schema level. An attribute such as checksum, created_date, identifier, or license is declared with a precise type—xsd:string for free-form text, xsd:date for calendar dates, or cco:DesignativeICE for designative identifiers—ensuring that every value assigned to that attribute conforms to an expected format. This type discipline is critical in environments where performance event metadata must be validated before ingestion, because a mis-typed date or an incorrectly formatted license string can cascade into downstream analytics failures. The attribute model is deliberately decoupled from the values themselves, allowing the same set of attribute definitions to be reused across multiple event subclasses without duplication.

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

Entity records represent the concrete instances to which attribute values are bound, and the value tables store those bindings in a normalized, type-partitioned structure. Each entity—identified by a key such as EVEN-0001 or EVEN-0002—can carry multiple attributes, with the actual values distributed across three specialized value tables depending on their data type. Date values like 2024-03-08 or 2025-04-08 reside in the date value table, integer values such as 193, 8, 332, or 11 in the integer value table, and string values including the hash 9d2b7a16, the OID oid:1.3.6.1, the license MPL-2.0, and the region ap-south-2 in the varchar value table. This partitioning by type eliminates the need for nullable columns and allows each value table to be optimized for its specific data shape, which matters when querying large volumes of performance telemetry.

Mimetype and sizebytes provide metadata about the content format and storage footprint of associated artifacts, such as eBPF program binaries or their configuration payloads. An eBPF program may be serialized as application/xml, application/parquet, application/octet-stream, or text/csv, each mimetype signaling a different encoding that downstream consumers must handle appropriately—whether parsing structured XML, reading columnar Parquet data, or interpreting raw binary streams. The corresponding size_bytes field records the byte count of the artifact, ranging from roughly 79 megabytes for a credential validation probe serialized as CSV to over 757 megabytes for a network policy enforcer stored in Parquet. These two fields together enable capacity planning, transfer optimization, and format-aware processing pipelines that must adapt their deserialization logic based on the declared mimetype while respecting size constraints imposed by network bandwidth or storage quotas.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |