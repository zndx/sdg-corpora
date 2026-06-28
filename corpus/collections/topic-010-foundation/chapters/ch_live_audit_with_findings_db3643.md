---
chapter_id: ch_live_audit_with_findings_db3643
topic_id: 10
family: 03_directive_governance
cited_terms: ['audit_with_findings', 'ebpfprogram_not_unloaded', 'belief_interval_only_unit_range']
model: engine-refine
---

The primary indexing mechanism relies upon the unique `identifier` to anchor discrete operational records, establishing a deterministic reference frame for subsequent attribute resolution and cross-referencing. Within this architecture, the `entity` designation functions as the central pivot, binding specific attribute instances to their parent objects through explicit foreign-key relationships. For instance, the identifier `FIND-0001` serves as the primary key for a HIPAA Security Assessment, while `UNLO-0001` anchors a record concerning the `flow_dissector` eBPF program. These identifiers are not merely nominal; they dictate the scope of the `entity` relationships, ensuring that every associated data point—whether a temporal measurement or a categorical classification—can be traced back to its originating source with absolute precision.

**t_ebpfprogram_not_unloaded**

| id | ebpfprogram | ebpfprogram_2 |
| --- | --- | --- |
| UNLO-0001 | flow_dissector | tracepoint_sched_switch |
| UNLO-0002 | cgroup_device | perf_event_open |
| UNLO-0003 | socket_cookie | xdp_router |
| UNLO-0004 | kretprobe_mmap | cgroup_device |
| UNLO-0005 | netns_attach | flow_dissector |
| UNLO-0006 | cgroup_skb_ingress | cgroup_device |

**t_ebpfprogram_not_unloaded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0002 | 2025-04-28 |
| UNLO-0002 | UNLO-0002 | UNLO-0002 | 2025-01-07 |
| UNLO-0003 | UNLO-0003 | UNLO-0002 | 2025-02-14 |
| UNLO-0004 | UNLO-0004 | UNLO-0002 | 2025-06-17 |
| UNLO-0005 | UNLO-0005 | UNLO-0002 | 2025-05-28 |
| UNLO-0006 | UNLO-0006 | UNLO-0002 | 2023-03-06 |

**t_ebpfprogram_not_unloaded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0006 | 186 |
| UNLO-0002 | UNLO-0001 | UNLO-0008 | 5 |
| UNLO-0003 | UNLO-0002 | UNLO-0006 | 206 |
| UNLO-0004 | UNLO-0002 | UNLO-0008 | 3 |
| UNLO-0005 | UNLO-0003 | UNLO-0006 | 203 |
| UNLO-0006 | UNLO-0003 | UNLO-0008 | 2 |
| UNLO-0007 | UNLO-0004 | UNLO-0006 | 499 |
| UNLO-0008 | UNLO-0004 | UNLO-0008 | 1 |

**t_ebpfprogram_not_unloaded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0001 | 9d2b7a16 |
| UNLO-0002 | UNLO-0001 | UNLO-0003 | oid:1.3.6.1 |
| UNLO-0003 | UNLO-0001 | UNLO-0004 | MPL-2.0 |
| UNLO-0004 | UNLO-0001 | UNLO-0009 | us-east-1 |
| UNLO-0005 | UNLO-0001 | UNLO-0005 | application/json |
| UNLO-0006 | UNLO-0001 | UNLO-0010 | Name 06 |
| UNLO-0007 | UNLO-0001 | UNLO-0011 | analytics |
| UNLO-0008 | UNLO-0001 | UNLO-0012 | Tags 08 |

Attribute definitions are rigorously constrained by the `attr_type` schema, which enforces strict data typing across heterogeneous value sets to guarantee structural integrity. The `attr` column specifies the semantic meaning of a property, while its corresponding `attr_type` dictates the permissible format, ranging from `xsd:string` for alphanumeric identifiers like `9d2b7a16` to `xsd:decimal` for quantitative metrics such as the `0.727` confidence value. This typed attribute framework accommodates diverse data modalities, including `xsd:date` for temporal markers like `2025-04-28` and `xsd:dateTime` for precise timestamps such as `2025-06-14T16:53:04`. By decoupling the attribute name from its value, the system allows for dynamic schema evolution without compromising the underlying relational consistency.

**t_ebpfprogram_not_unloaded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNLO-0001 | checksum | xsd:string |
| UNLO-0002 | created_date | xsd:date |
| UNLO-0003 | identifier | cco:DesignativeICE |
| UNLO-0004 | license | xsd:string |
| UNLO-0005 | mime_type | xsd:string |
| UNLO-0006 | size_bytes | xsd:long |
| UNLO-0007 | uri | xsd:string |
| UNLO-0008 | version | xsd:integer |

Operational context is further enriched by temporal and spatial metadata, specifically the `duration_seconds` and `hostname` fields, which localize events within the infrastructure topology. The `duration_seconds` metric quantifies the elapsed time of a specific process or assessment, capturing granular measurements such as `5564.74` seconds for a comprehensive SOC 2 Type II Review or `1140.43` seconds for a Data Lake Governance Review. Concurrently, the `hostname` field pinpoints the exact computational node responsible for the activity, distinguishing between environments such as `worker-07`, `node-a01`, and `edge-03`. Together, these fields provide a forensic-level audit trail, enabling administrators to correlate specific attribute values with their precise execution environment and temporal footprint.

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | RANG-0006 | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | RANG-0006 | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | RANG-0006 | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | RANG-0006 | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | RANG-0002 | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | RANG-0005 | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | RANG-0003 | 5489.56 | ingest-21 |

The interplay between these core fields establishes a comprehensive governance framework capable of supporting complex regulatory and technical requirements. By linking the `identifier` to the `entity`, and subsequently mapping typed `attr` values to specific `hostname` and `duration_seconds` contexts, the system ensures that every data point is fully contextualized. Whether tracking the `license` attribute of an eBPF program or the `belief_lower_bound` of a throughput projection, the relational structure guarantees that all metadata remains immutable, traceable, and strictly typed. This architectural approach mitigates data ambiguity, ensuring that operational decisions are grounded in a verifiable and mathematically precise data model.

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | FIND-0001 |
| RANG-0002 | throughput projection | FIND-0003 |
| RANG-0003 | packet loss guarantee | FIND-0001 |
| RANG-0004 | noise floor estimate | FIND-0001 |
| RANG-0005 | thermal drift assertion | FIND-0006 |
| RANG-0006 | packet loss guarantee | FIND-0006 |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |