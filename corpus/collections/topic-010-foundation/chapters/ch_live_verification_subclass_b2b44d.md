---
chapter_id: ch_live_verification_subclass_b2b44d
topic_id: 10
family: 03_directive_governance
cited_terms: ['verification_subclass', 'metric_emission_subclass', 'ebpfmap_basic']
model: engine-refine
---

In compliance and observability governance, stable identifiers anchor every auditable fact to a durable referent that survives schema evolution, subsystem renames, and cross-domain joins. An identifier such as VERI-0001 denotes a concrete verification instance—here, a compliance renewal verification—while EMIS-0003 names a metric-emission subclass tied to memory_utilization and EBPF-0004 labels a kernel map record in the ebpfmap dimension. Because identifiers are typed by prefix and reused as foreign keys (entity_id, attr_id, ebpfmap_key), they function as the contract layer between operational telemetry, procedural attestations, and infrastructure inventory: the same VERI-0001 that identifies a verification run also appears as entity_id when recording that run’s duration_seconds (5469.69), exit_code (616), and host_name (node-a01), and again as emits_metric when garbage_collection_pause and bytes_transferred metrics are attributed to verifications. This indirection is deliberate; it prevents conflation of “what was measured” with “how it was stored” or “which control activity produced it.”

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_metric_emission_subclass**

| id | metric | emits_metric |
| --- | --- | --- |
| EMIS-0001 | garbage_collection_pause | VERI-0003 |
| EMIS-0002 | api_throughput | VERI-0007 |
| EMIS-0003 | memory_utilization | VERI-0001 |
| EMIS-0004 | bytes_transferred | VERI-0001 |
| EMIS-0005 | active_connections | VERI-0002 |
| EMIS-0006 | memory_utilization | VERI-0001 |
| EMIS-0007 | disk_io_wait | VERI-0002 |

**t_metric_emission_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EMIS-0001 | duration_seconds | xsd:decimal |
| EMIS-0002 | end_time | xsd:dateTime |
| EMIS-0003 | exit_code | xsd:integer |
| EMIS-0004 | host_name | xsd:string |
| EMIS-0005 | log_level | xsd:string |
| EMIS-0006 | phase | xsd:string |
| EMIS-0007 | retry_count | xsd:integer |
| EMIS-0008 | scheduled_at | xsd:dateTime |

**t_metric_emission_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0003 | 204 |
| EMIS-0002 | EMIS-0001 | EMIS-0007 | 449 |
| EMIS-0003 | EMIS-0002 | EMIS-0003 | 526 |
| EMIS-0004 | EMIS-0002 | EMIS-0007 | 447 |
| EMIS-0005 | EMIS-0003 | EMIS-0003 | 729 |
| EMIS-0006 | EMIS-0003 | EMIS-0007 | 20 |
| EMIS-0007 | EMIS-0004 | EMIS-0003 | 636 |
| EMIS-0008 | EMIS-0004 | EMIS-0007 | 481 |

An entity is the governed object or event whose state is materialized through attributes. In verification workflows, entities are verification subclasses (Compliance renewal verification, GDPR data flow review, Security posture assessment); in the metrics plane, they are emission subclasses (garbage_collection_pause, api_throughput, memory_utilization, bytes_transferred). Each entity accumulates a multiset of observations keyed by attr_id, so a single VERI-0001 entity may simultaneously carry a decimal duration, integer exit codes on distinct attr slots (VERI-0003 yielding 616, VERI-0007 yielding 105), datetime boundaries spanning 2024-02-27T03:56:28 through 2024-10-31T01:53:25, and varchar miscellany including host identity, log level, review phase, and runtime status (running). The entity–attribute binding is many-to-many in practice: EMIS-0001 records four varchar misc values under one entity_id while datetime and decimal facts for the same emission attach through different attr_id references (EMIS-0002 for end_time, EMIS-0001 for duration_seconds), demonstrating that entities are containers and attributes are typed slots.

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

**t_metric_emission_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0002 | 2023-10-31T14:37:44 |
| EMIS-0002 | EMIS-0001 | EMIS-0008 | 2024-08-14T22:51:22 |
| EMIS-0003 | EMIS-0001 | EMIS-0009 | 2023-09-21T19:46:28 |
| EMIS-0004 | EMIS-0002 | EMIS-0002 | 2024-10-02T07:51:18 |
| EMIS-0005 | EMIS-0002 | EMIS-0008 | 2023-02-02T08:38:58 |
| EMIS-0006 | EMIS-0002 | EMIS-0009 | 2024-11-30T14:13:18 |
| EMIS-0007 | EMIS-0003 | EMIS-0002 | 2023-11-21T22:47:51 |
| EMIS-0008 | EMIS-0003 | EMIS-0008 | 2023-01-18T00:53:02 |

**t_metric_emission_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0001 | 1381.85 |
| EMIS-0002 | EMIS-0002 | EMIS-0001 | 954.50 |
| EMIS-0003 | EMIS-0003 | EMIS-0001 | 5476.70 |
| EMIS-0004 | EMIS-0004 | EMIS-0001 | 3136.71 |
| EMIS-0005 | EMIS-0005 | EMIS-0001 | 6003.14 |
| EMIS-0006 | EMIS-0006 | EMIS-0001 | 3720.68 |
| EMIS-0007 | EMIS-0007 | EMIS-0001 | 2471.19 |

**t_metric_emission_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EMIS-0001 | EMIS-0001 | EMIS-0004 | node-a01 |
| EMIS-0002 | EMIS-0001 | EMIS-0005 | Log Level 02 |
| EMIS-0003 | EMIS-0001 | EMIS-0006 | execution |
| EMIS-0004 | EMIS-0001 | EMIS-0010 | complete |
| EMIS-0005 | EMIS-0001 | EMIS-0011 | Triggered By 05 |
| EMIS-0006 | EMIS-0002 | EMIS-0004 | worker-07 |
| EMIS-0007 | EMIS-0002 | EMIS-0005 | Log Level 07 |
| EMIS-0008 | EMIS-0002 | EMIS-0006 | execution |

Attributes (attr) name the measurable or reportable facets attached to entities, and attr_type declares the logical datatype that governs persistence and validation. The canonical attribute vocabulary—duration_seconds, end_time, exit_code, host_name—is shared across verification and metric-emission subclasses, with attr_type expressed in XSD terms: xsd:decimal for durations (821.61 s on VERI-0002; 954.50 s on EMIS-0002), xsd:dateTime for temporal misc values (2024-10-23T14:58:17; 2023-09-21T19:46:28), xsd:integer for discrete outcomes (exit_code 713 on VERI-0003; 526 on EMIS-0003), and xsd:string for symbolic misc (execution, complete, Log Level 02). Type discipline routes each observation to a type-homogeneous store rather than a single wide table, which preserves index efficiency, enforces parseability at ingest, and allows compliance reviewers to reason about comparability: decimal durations across VERI-0001–VERI-0004 (5469.69, 821.61, 4016.93, 4484.04) are summable and thresholdable in ways that varchar misc such as review or running are not.

The misc designation marks payload fields whose semantics are context-dependent yet audit-relevant: concrete values, human-readable labels, or categorical tags that complete an evidence chain without meriting a dedicated dimensional role. Datetime misc values bound verification and emission intervals; varchar misc disambiguates execution phase (execution versus complete) and environmental context (node-a01); dimension-side misc on ebpfmap records supplies ebpfmap_label strings (Ebpfmap Label 01 through Ebpfmap Label 04) alongside category assignment. Misc fields are where governance language meets raw instrumentation—exit_code 29 on VERI-0002 and 447 on EMIS-0002 are integers by attr_type but operational misc in the sense that their meaning (success, partial failure, policy gate) is interpreted through procedure, not through the storage column name alone.

Category partitions ebpfmap inventory into governance-relevant groupings that mediate policy scope and capacity planning. Each dim_ebpfmap row couples an identifier to an ebpfmap_category (Ebpfmap Category 01–04) and a descriptive ebpfmap_label, while fact_ebpfmap rows quantify physical footprint through size_bytes and lineage through version. The fact table’s ebpfmap_key linkage (e.g., EBPF-0001 keyed to EBPF-0002 with size_bytes 156714508 and version 6; EBPF-0004 keyed to EBPF-0001 at 354373995 bytes, version 5) expresses that measurable kernel-map state is not identical to its catalog identity—keys may point across rows when maps are snapshotted, promoted, or superseded. Size_bytes therefore functions as a compliance-critical scalar: 31105012 bytes versus 208979093 bytes distinguishes modest control-plane maps from hundred-megabyte telemetry surfaces that implicate retention, privacy minimization, and performance risk under GDPR data flow review (VERI-0002, VERI-0003) or security posture assessment (VERI-0004).

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

Version on ebpfmap facts records generational state of map definitions or backing layouts, orthogonal to category labels yet essential for reproducibility. Versions 3, 6, 12, and 5 coexisting across EBPF-0001–EBPF-0004 signal heterogeneous rollout: auditors can demand that a verification’s emitted metrics (bytes_transferred and garbage_collection_pause both emitting from VERI-0001; memory_utilization from VERI-0007) be traceable to the map generation that produced them. Taken together, identifier, entity, attr, attr_type, misc, category, ebpfmap, size_bytes, and version implement a layered evidence model—subclass identity, typed measurements, kernel artifact inventory, and cross-links from EMIS-0001→VERI-0001—wherein procedural compliance and runtime observability remain joinable under common keys without collapsing distinct semantic roles into a single undifferentiated field.

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |