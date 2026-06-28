---
chapter_id: ch_live_ebpfprogram_union_kprobe_or_xdp_82fcf6
topic_id: 94
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_union_kprobe_or_xdp', 'belief_interval_at_confidence_level', 'artifact_governed_by_policy']
model: engine-refine
---

The identifier serves as the primary key across all registries, anchoring every record to a stable, human-readable token. In the eBPF program registry, identifiers such as XDP-0001 through XDP-0004 uniquely distinguish individual programs like seccomp_profile_loader, network_policy_enforcer, xdp_packet_dropper, and credential_validation_probe, each of which may be associated with secondary probes—ptrace_attach_monitor, network_interface_stat, memory_pressure_observer, security_file_open_hook—and further with monitoring hooks such as tcp_state_monitor or perf_cpu_clock_sampler. The belief-interval registry employs a parallel scheme: identifiers LEVE-0001 through LEVE-0004 label calibration-drift readings, query result sets, schema-migration statuses, and sensor-telemetry snapshots, while policy identifiers POLI-0001 through POLI-0004 govern artifacts ranging from ml_training_dataset to batch_ingestion_job. This uniform identification strategy ensures that every entity, attribute, and value can be referenced unambiguously across the system.

An entity represents a discrete, observable thing whose state is captured through a set of named attributes. In the belief-interval domain, each entity—LEVE-0001, for instance—carries a constellation of attribute values: a confidence level of 0.649, a dimension kind labeled "Dimension Kind 01," an encoding designation "Encoding 02," and a recorded-at timestamp of 2023-02-13T08:09:52. The attribute registry itself, defined in the attribute-type table, enumerates these properties—confidence, dimension_kind, method, recorded_at—alongside their corresponding data types: xsd:decimal for numeric confidence scores, xsd:string for categorical labels such as "audit excerpt" or the language code "en," and xsd:dateTime for temporal markers. This separation of attribute definition from attribute value enables the system to store heterogeneous data in type-specialized value tables while preserving a single, coherent schema for attribute metadata.

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | POLI-0002 |
| LEVE-0002 | Query result set | POLI-0005 |
| LEVE-0003 | Schema migration status | POLI-0003 |
| LEVE-0004 | Sensor telemetry snapshot | POLI-0004 |
| LEVE-0005 | Data lineage trace | POLI-0002 |
| LEVE-0006 | Pipeline throughput metric | POLI-0005 |
| LEVE-0007 | Schema migration status | POLI-0004 |
| LEVE-0008 | Lab assay concentration | POLI-0002 |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |

The attr_type classification is not merely a technical convenience; it dictates how values are stored, validated, and queried. Decimal attributes such as confidence (0.649, 0.339) and derived metrics (174.38, 717.12) reside in the decimal value table, where precision matters for statistical aggregation. String attributes—dimension kinds, encoding identifiers, free-text excerpts—are routed to the varchar value table. Datetime attributes, capturing the moment of observation (2023-02-11T13:24:10, 2025-01-26T05:24:46, 2025-05-13T04:15:37), occupy their own table, ensuring that temporal comparisons and range queries operate on properly typed columns. The attr table thus functions as a type registry, mapping each attr_name to its xsd type and enabling the value tables to remain narrow, indexable, and type-safe.

Mimetype, sizebytes, and version constitute the artifact metadata layer, describing the physical and logical properties of stored objects. The eBPF program table assigns mime types—application/xml, application/parquet, application/octet-stream, text/csv—to programs, indicating the serialization format of their payloads or configuration files. Size bytes quantify the storage footprint of these programs, ranging from 79,215,808 bytes for xdp_packet_dropper to 757,467,115 bytes for network_policy_enforcer, and similarly of governed artifacts such as the 750,925,585-byte api_gateway_config and the 765,223,054-byte batch_ingestion_job. Version numbers—9, 8, 10, 3—track revisions of governed artifacts, enabling rollback, audit, and dependency resolution. Together, these three fields form a lightweight provenance record: what the artifact is (mimetype), how large it is (sizebytes), and which revision is in use (version).

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |
| POLI-0005 | sensor_telemetry_stream | 484219008 | 3 |
| POLI-0006 | data_landing_zone_schema | 251798984 | 10 |

The misc column in the value tables holds the actual attribute values, typed and contextualized by their parent entity and attribute. A single entity such as LEVE-0001 may carry multiple misc values across different type tables: a decimal confidence of 0.649, a string dimension kind of "Dimension Kind 01," and a datetime recorded_at of 2023-02-13T08:09:52. The entity_id foreign key ties each misc value back to its owner, while the attr_id foreign key resolves to the attribute definition in the attr table, which in turn specifies the attr_type. This three-way join—entity, attribute, value—forms the core query pattern of the system, allowing analysts to reconstruct the full state of any entity by aggregating its scattered misc values. The design trades denormalization for type safety, accepting the complexity of multiple value tables in exchange for the ability to enforce schema constraints at insert time and to optimize storage per data type.