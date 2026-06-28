---
chapter_id: ch_live_ebpfprogram_union_kprobe_or_xdp_4fcc41
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_union_kprobe_or_xdp', 'lineage_edge_max_one_target', 'measurement_observed_at']
model: engine-refine
---

In governed operational environments, every durable fact must be addressable without ambiguity. An identifier is the stable handle that makes that possible: a compact, human-auditable token that survives renames, redeployments, and cross-system joins. Programs registered for kernel instrumentation carry identifiers such as XDP-0003, while lineage edges use TARG-0003 and observations use OBSE-0002. The identifier is not the thing itself; it is the contract that lets auditors, automation, and incident responders retrieve the same record from registries, policy stores, and evidence logs. Without that contract, a “packet loss” reading cannot be tied back to the probe that produced it, and a compliance review cannot prove which artifact version was in force at a given moment.

Entity completes the picture by naming what is being described rather than how it is keyed. In attribute-value designs, the entity is the observation, policy object, or lineage node whose properties are decomposed into named fields. A single measurement record—say, one capturing network latency—may own many attributes, each stored against the same entity reference while values land in type-appropriate stores. That separation keeps the core record lightweight (what was measured, when, and under which program) while allowing extensible metadata without schema churn. Governance teams care because entity boundaries define retention scope, access controls, and the unit of correction when a value is disputed.

Attributes and their types are the vocabulary and grammar of that metadata. An attr names the semantic slot—confidence, dimension_kind, method, recorded_at—while attr_type declares how consumers must parse and validate whatever occupies the slot. Declaring xsd:decimal for confidence and xsd:dateTime for recorded_at is not cosmetic typing; it routes writes to the correct validation path, enforces comparability in analytics, and prevents silent coercion that would invalidate audit trails. The misc field (or its physical realization in typed value tables) holds the actual payload: 0.528 as a decimal confidence, “Dimension Kind 01” as a categorical label, or 2024-08-27T19:17:19 as a timestamp. Splitting attr, attr_type, and misc keeps policy about shape separate from policy about content, which is essential when the same entity accrues heterogeneous evidence over its lifecycle.

Binary and serialized artifacts introduce a parallel governance dimension governed by mimetype and sizebytes. Mimetype states the interchange contract—application/xml for structured policy, application/parquet for columnar telemetry, application/octet-stream for opaque bytecode, text/csv for tabular exports—so ingestion pipelines, virus scanners, and retention engines can apply the right handling rules before bytes are interpreted. Sizebytes quantifies footprint and operational risk: an eBPF bundle at 757467115 bytes demands different transfer, backup, and integrity-check procedures than one at 79215808 bytes. Together, mimetype and sizebytes support capacity planning, integrity verification, and evidentiary chain-of-custody: reviewers can confirm not only what was deployed but that the received object matches expected format and mass.

Lineage and accountability rely on subject, target, and role to express directed relationships without collapsing them into flat ownership lists. The subject is the upstream producer or process anchor—here, a lineage node such as TARG-0006 feeding an edge—while the target is the downstream consumer or sink, whether that is a Compliance audit log, a Feature vector store, or an Executive dashboard. Role qualifies the nature of participation: owner implies accountability for correctness and change approval, contributor implies material input without sole authority. When Feature store refresh (TARG-0003) links to Feature vector store as owner, the registry encodes both data flow and responsibility, which regulators and internal risk committees require when tracing how calibrated sensor chains influence executive-facing metrics.

These primitives interlock in practice rather than living in isolation. Observations name a phenomenon—packet loss, wind shear—and bind it to the program context that observed it, as when multiple measurements reference XDP-0003, the xdp_packet_dropper deployment. Typed attributes hang off the observation entity, timestamps prove when evidence was recorded, and decimals quantify confidence or magnitude. Lineage edges explain why that evidence matters downstream: repeated Sensor calibration chain paths show shared provenance into audit and dashboard targets, while mixed roles reveal shared custody. A mature compliance handbook treats identifier, entity, attr, attr_type, misc, mimetype, sizebytes, subject, target, and role as interoperable controls—each answering a different question (what, how typed, how large, from whom, to whom, with what duty)—so that technical telemetry, policy artifacts, and human accountability read as one coherent system of record.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |
| XDP-0006 | security_file_open_hook | ptrace_attach_monitor | disk_io_latency_probe | application/xml | 924754977 |

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | XDP-0003 |
| OBSE-0002 | packet loss | XDP-0003 |
| OBSE-0003 | wind shear | XDP-0005 |
| OBSE-0004 | network latency | XDP-0003 |
| OBSE-0005 | pH level | XDP-0005 |
| OBSE-0006 | pH level | XDP-0006 |

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |