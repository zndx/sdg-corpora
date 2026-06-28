---
chapter_id: ch_live_artifact_with_universal_b3d0a6
topic_id: 10
family: 01_foundation
cited_terms: ['artifact_with_universal', 'observation_records_state', 'ebpfprogram_not_unloaded']
model: engine-refine
---

The governance of distributed computing artifacts and their associated telemetry observations rests upon a disciplined separation of entity identity, attribute definition, and value storage—a pattern that ensures both schema flexibility and query efficiency across heterogeneous data types. At the core of this architecture, each artifact is assigned a stable identifier such as UNIV-0001 through UNIV-0004, anchoring records for components like Audit_Reporter, Feature_Vector_Store, Schema_Definition, and Container_Image_Release. These identifiers serve as the primary key through which all downstream relationships are resolved, whether the artifact is deployed to us-east-1 or on-prem-dc1, or whether it references a dependent entity such as GPU_Compute_Pool, Metadata_Registry, or Compliance_Audit_Log. The created_date field—2024-12-09 for the Audit_Reporter, 2024-11-04 for the Feature_Vector_Store, 2024-10-11 for the Schema_Definition, and 2024-10-15 for the Container_Image_Release—provides a temporal anchor essential for audit trails, compliance reporting, and lifecycle management.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | UNLO-0005 |
| STAT-0002 | Water quality anomaly | UNLO-0003 |
| STAT-0003 | Reactor pressure threshold | UNLO-0003 |
| STAT-0004 | Reactor pressure threshold | UNLO-0003 |
| STAT-0005 | Network latency spike | UNLO-0004 |
| STAT-0006 | pH deviation alert | UNLO-0003 |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_ebpfprogram_not_unloaded**

| id | ebpfprogram | ebpfprogram_2 |
| --- | --- | --- |
| UNLO-0001 | flow_dissector | tracepoint_sched_switch |
| UNLO-0002 | cgroup_device | perf_event_open |
| UNLO-0003 | socket_cookie | xdp_router |
| UNLO-0004 | kretprobe_mmap | cgroup_device |
| UNLO-0005 | netns_attach | flow_dissector |
| UNLO-0006 | cgroup_skb_ingress | cgroup_device |

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

Observation records extend this identity model into the domain of runtime and environmental monitoring, where entities such as Network latency spike, Water quality anomaly, and Reactor pressure threshold are catalogued under distinct identifiers (STAT-0001 through STAT-0004). These observations are not self-contained; they reference external records—UNLO-0005, UNLO-0003—linking the observation to the underlying eBPF programs that generated them, including flow_dissector, cgroup_device, socket_cookie, and kretprobe_mmap. The eBPF program registry itself carries supplementary metadata: license designations such as MPL-2.0, location tags like us-east-1, and identifiers including the OID 1.3.6.1, all of which are necessary for regulatory compliance and supply-chain traceability.

The attribute layer decouples the definition of observable properties from their concrete values, enabling a single entity to carry an arbitrary set of typed attributes without schema modification. For observation records, attribute names such as duration_seconds, end_time, exit_code, and host_name are declared alongside their corresponding types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—establishing a formal contract for data validation. Similarly, the eBPF program attributes include checksum, created_date, identifier, and license, each bound to types including xsd:string, xsd:date, and cco:DesignativeICE, a custom type indicating a designative identifier within the Cloudera ontology. This separation of attribute schema from value storage is the structural mechanism that permits heterogeneous data to coexist within a unified query surface.

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

Value storage is further partitioned by data type into dedicated tables—datetime, decimal, integer, and varchar—each linking an entity identifier to an attribute identifier and a concrete value. Within the observation record domain, the duration_seconds attribute (typed xsd:decimal) holds values ranging from 1567.00 to 5274.11 across entities STAT-0001 through STAT-0004, while the exit_code attribute (xsd:integer) records values such as 958, 456, 517, and 41. String-valued attributes capture host identifiers like worker-07, log levels such as Log Level 02, and status indicators including execution and pending. Datetime attributes record timestamps spanning from 2023-08-02T17:44:58 through 2025-03-10T03:55:42, providing a chronological record of observation endpoints and transitions.

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

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

For eBPF programs, the value tables follow the same partitioned pattern: date values for created_date range from 2025-01-07 to 2025-06-17, integer values for checksum fields include 186, 5, 206, and 3, and varchar values store the program's checksum hash 9d2b7a16 alongside its license and location metadata. The entity_id column in each value table serves as the foreign key back to the entity registry, while attr_id references the attribute definition, forming a normalized triple-store structure that supports both relational integrity and semantic flexibility. This design ensures that compliance auditors can reconstruct the complete provenance of any artifact—from its initial deployment in us-east-1 or on-prem-dc1, through its associated observations and attribute values, to the eBPF programs that monitored its runtime behavior—without sacrificing the performance guarantees of a relational database.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |