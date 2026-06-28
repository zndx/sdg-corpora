---
chapter_id: ch_live_ebpf_event_basic_d20ab5
topic_id: 195
family: 02_observation_measurement
cited_terms: ['ebpf_event_basic', 'uretprobe_subclass', 'constraint_only_constrains']
model: engine-refine
---

In governed telemetry and compliance registries, the five roles—identifier, entity, attr, attr_type, and misc—form the minimal contract by which heterogeneous observability artifacts remain auditable, joinable, and enforceable across policy lifecycles. An identifier is not merely a surrogate key but a durable, namespace-qualified handle that survives ingestion, reclassification, and downstream constraint application: EVEN-0001 names a basic eBPF event whose probe class is network_drop_tracker, URET-0003 names a uretprobe subclass bound to qt_delete_ret, and CONS-0003 names a data_retention_policy that constrains telemetry_streams. Because identifiers propagate as foreign keys—uretprobe records attach to return hooks via EVEN-0004 and EVEN-0002, while constraint rows reference query_engine and network_interface as constrained targets—the registry can reconstruct lineage without collapsing distinct semantic classes into a single undifferentiated record type. Stability of identifier assignment is therefore a governance prerequisite: once EVEN-0002 is cited as the hook for pthread_create_ret or as the entity carrying end_time observations, retroactive reassignment would fracture audit trails and invalidate cross-table joins that operators rely upon for incident reconstruction.

**t_ebpf_event_basic**

| id | ebpf |
| --- | --- |
| EVEN-0001 | network_drop_tracker |
| EVEN-0002 | dns_query_log |
| EVEN-0003 | netsec_monitor |
| EVEN-0004 | disk_iops_counter |
| EVEN-0005 | memory_leak_detector |
| EVEN-0006 | process_spawn_alert |
| EVEN-0007 | syscall_tracer |
| EVEN-0008 | network_drop_tracker |

**t_ebpf_event_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2024-02-22T10:41:40 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2025-04-20T21:58:53 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2024-07-05T03:32:46 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-01-15T01:37:56 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2024-11-30T06:10:00 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2023-10-12T13:43:33 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2025-05-19T17:11:08 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-12-23T02:27:40 |

**t_ebpf_event_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2084.55 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 3586.50 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2389.78 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 1708.37 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 4904.40 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 2045.89 |
| EVEN-0007 | EVEN-0007 | EVEN-0001 | 4164.85 |
| EVEN-0008 | EVEN-0008 | EVEN-0001 | 4492.01 |

**t_ebpf_event_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 615 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 227 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 918 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 103 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 872 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 453 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 370 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 219 |

**t_ebpf_event_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | gw-12 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | execution |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | failed |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | edge-03 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | review |

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | EVEN-0004 |
| URET-0002 | pthread_create_ret | EVEN-0002 |
| URET-0003 | qt_delete_ret | EVEN-0001 |
| URET-0004 | ssl_read_ret | EVEN-0006 |
| URET-0005 | libc_malloc_ret | EVEN-0001 |
| URET-0006 | pthread_create_ret | EVEN-0003 |
| URET-0007 | pthread_create_ret | EVEN-0006 |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

Entity denotes the subject of assertion: the record—or logical instance—about which attribute values are stated. In value-bearing stores, entity_id carries this role explicitly, anchoring each misc entry to the correct observability or policy object irrespective of how many attributes that object accumulates over time. A single entity may therefore sponsor multiple concurrent attribute bindings, as when EVEN-0001 simultaneously carries duration_seconds as 2084.55, end_time as 2024-02-22T10:41:40, exit_code as 615, and host_name as gw-12, or when URET-0001 aggregates checksum 9d2b7a16, created_date 2024-10-13, and license CC-BY-4.0 under one uretprobe identity. The entity abstraction decouples “what is being described” from “how it is typed and stored,” which matters operationally when subclasses proliferate—dns_query_log, netsec_monitor, disk_iops_counter each remain distinct entities even when they share attribute vocabularies—and when constraints such as log_level_filter or checksum_algorithm must be evaluated against specific instrumented surfaces rather than against global defaults.

Attr names the governed property itself: the semantic slot into which evidence is placed. Attribute definitions live apart from values so that duration_seconds, end_time, exit_code, and host_name can be declared once for the basic event family, while checksum, created_date, identifier, and license govern the uretprobe subclass family, and effective_date, enforcement, mandatory, and priority articulate constraint semantics. Referencing attributes by identifier—attr_id EVEN-0001 for decimal durations, EVEN-0002 for datetimes, CONS-0003 for mandatory flags—permits schema evolution without rewriting historical misc rows: new attributes can be registered, deprecated attributes can be retired from active enforcement, and reporting layers can project stable business names onto versioned internal codes. In practice, attr is the hinge between domain language and storage: operators reason in terms of exit_code and enforcement, while the registry guarantees that those terms resolve unambiguously to typed columns and validation rules.

Attr_type supplies the interpretive and compliance contract for each attr, specifying which lexical forms are admissible and which physical store may receive them. Standard XML Schema datatypes—xsd:decimal for durations such as 3586.50 and 1708.37, xsd:dateTime for sub-minute telemetry timestamps including 2025-04-20T21:58:53, xsd:integer for exit_code 918 and priority 40, xsd:string for host_name gw-12 and enforcement labels such as Enforcement 02, xsd:date for policy effective boundaries like 2023-06-09, xsd:boolean for mandatory true/false—establish interoperable parsing, comparison, and aggregation. Extension types such as cco:DesignativeICE signal identifiers that are not plain strings but designative codes requiring specialized validation, as with ARN:res/41. Type discipline prevents category errors that would otherwise corrupt analytics: a datetime must not be coerced into a decimal table, a boolean mandatory flag must not share a varchar codec with free-text intake form, and cross-entity joins must respect the typed partition that routes integers to t_ebpf_event_basic_val_int while routing checksums and regions us-east-1 to varchar stores. For auditors, attr_type is the machine-readable statement of evidentiary admissibility; for engineers, it is the compile-time guardrail that keeps heterogeneous probes and policy objects commensurable.

Misc, realized as the value field in type-specialized valuation relations, is the instantiated evidence or configuration datum—the only layer that changes at operational frequency while identifiers, entities, attributes, and types remain comparatively stable. Misc is deliberately miscellaneous only in the sense of payload diversity, not in the sense of semantic laxity: each value is misc strictly within the envelope fixed by its attr and attr_type pairing. Thus 227 and 103 appear as integers tied to attr_id EVEN-0007, 2389.78 appears as decimal under EVEN-0001, failed and execution appear as varchar tokens under EVEN-0010 and EVEN-0006, and constraint enforcement stores ja alongside Encoding 01 under distinct attribute codes. This separation yields a normalized EAV architecture that scales to sparse, wide instrument surfaces—uretprobe rows need not allocate columns for license until populated—while still supporting dense event bundles where one entity_id accumulates many contemporaneous readings. Retrieval pipelines aggregate misc by traversing entity_id and attr_id, rehydrating typed literals into unified logical records suitable for dashboards, retention engines, and checksum validation workflows.

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

Taken together, the five roles implement a reference pattern for compliance-grade observability registries: identifiers knit classes and hooks across tables; entities localize assertions; attrs define the governed vocabulary; attr_types enforce admissible representation; misc carries the factual substrate on which constraints operate. When data_retention_policy with effective_date 2024-12-03 and mandatory true constrains telemetry_streams, or when ssl_read_ret attaches to EVEN-0006, enforcement is not an ad hoc script but the outcome of traversing a typed graph whose edges are identifier-aligned and whose leaves are misc values validated at ingest. Mature operations treat attr catalogs as controlled interfaces subject to change management, treat attr_type assignments as security-relevant metadata, and treat misc ingestion as evidentiary capture—because downstream attestation, SLA measurement, and regulatory response all presuppose that what was observed, under which attribute name, with which datatype, and on behalf of which entity, can be reproduced exactly from the registry without interpretive ambiguity.