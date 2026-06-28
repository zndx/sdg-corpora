---
chapter_id: ch_live_lift_subclass_f2e7c9
topic_id: 186
family: 02_observation_measurement
cited_terms: ['lift_subclass', 'ebpfprogram_union_kprobe_or_xdp', 'control_basic']
model: engine-refine
---

Unique identifiers serve as the immutable anchor for every asset, configuration record, and policy rule within the system, enabling precise traceability across heterogeneous operational domains. An identifier functions as the primary reference key that binds all downstream telemetry, metadata, and compliance flags to a specific physical or logical entity. Whether tracking a mechanical lift controller or a software-defined eBPF network policy, each component receives a distinct identifier such as `LIFT-0001` or `XDP-0001`, which then becomes the foundational link for all attribute assignments and audit queries. The entity relationship ensures that every measured value, configuration parameter, or enforcement rule is explicitly scoped to the correct asset, preventing cross-contamination of operational data and supporting granular, asset-level accountability.

**t_lift_subclass**

| id | lift | of_attribute_set |
| --- | --- | --- |
| LIFT-0001 | Elevator-Controller-22 | XDP-0001 |
| LIFT-0002 | Data-Migration-7B | XDP-0002 |
| LIFT-0003 | Sample-Handler-14 | XDP-0006 |
| LIFT-0004 | Conveyor-Lift-42 | XDP-0001 |
| LIFT-0005 | Telemetry-Relay-8F | XDP-0003 |
| LIFT-0006 | Elevator-Controller-22 | XDP-0005 |

**t_lift_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

**t_lift_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2023-07-08T17:11:17 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-09-30T16:47:04 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-05-04T22:26:39 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2023-07-25T13:54:30 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-12T01:02:41 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2024-03-06T23:43:02 |

**t_lift_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.387 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 587.63 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 57.65 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.879 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 736.98 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 707.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.901 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 70.32 |

**t_lift_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | intake form |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | en |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |
| XDP-0006 | security_file_open_hook | ptrace_attach_monitor | disk_io_latency_probe | application/xml | 924754977 |

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

Attributes define the measurable or configurable properties of an entity, while attribute types enforce schema discipline and guarantee data integrity at ingestion. Rather than storing unstructured payloads, the framework separates attribute definitions from their runtime values, allowing the system to validate inputs against strict type constraints. A property like `confidence` is registered as `xsd:decimal`, ensuring numerical precision for threshold calculations and statistical aggregation, while `recorded_at` is typed as `xsd:dateTime` to guarantee chronological sorting and time-series compatibility. This separation of definition and instantiation allows the same attribute schema to be reused across disparate asset classes, from industrial conveyors to kernel-level packet filters, while maintaining type-safe query execution.

The actual data payload, stored under the `misc` designation, is materialized in dedicated value repositories that mirror the declared attribute types. Decimal measurements such as `0.387` or `587.63` reside in numeric stores, timestamped observations like `2024-09-30T16:47:04` are persisted in datetime repositories, and categorical descriptors including `Dimension Kind 01` or `en` are held in string containers. This type-dispatched storage model eliminates runtime casting overhead, enforces domain-specific validation at write time, and allows analytical engines to optimize scans based on the underlying data representation. By isolating values according to their semantic format, the system prevents type coercion errors and ensures that downstream reporting pipelines receive consistently formatted inputs.

When assets carry attached payloads, configuration bundles, or compiled binaries, the framework captures resource metadata to govern ingestion, transfer, and storage allocation. The MIME type declares the semantic format of the attached content—whether it is `application/octet-stream` for opaque binaries, `application/parquet` for columnar analytics datasets, or `text/csv` for tabular exports—enabling downstream processors to route the payload to the appropriate parser or sandbox. Concurrently, the size in bytes, such as `613043965` or `79215808`, establishes hard limits for network egress, disk provisioning, and memory mapping. Together, these fields prevent buffer overflows, enforce quota policies, and ensure that large-scale telemetry archives or kernel module payloads are handled within defined operational constraints.

Compliance and operational policies are not static; they are versioned, time-bound, and enforced according to regulatory or organizational mandates. The effective date marks the precise moment a control becomes active, ensuring that audit windows, retention periods, and detection thresholds align with fiscal or calendar cycles. A rule such as the `Data retention mandate` might be scheduled to activate on `2024-12-05`, while an `Anomaly detection limit` could take effect on `2025-05-27`. Coupled with the mandatory flag, which explicitly dictates whether a control is strictly enforced (`true`) or advisory (`false`), these fields create an auditable governance layer. This structure allows organizations to phase in new standards, maintain backward compatibility during transitions, and demonstrate regulatory compliance through deterministic, time-aware policy application.