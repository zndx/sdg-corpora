---
chapter_id: ch_live_ebpf_event_at_hook_ec6dcb
topic_id: 102
family: 02_observation_measurement
cited_terms: ['ebpf_event_at_hook', 'frame_coarsening', 'outlier_claim_subclass']
model: engine-refine
---

The data model organizes observable phenomena through a disciplined separation of identity, definition, and value. Every entity—whether an eBPF event hook such as `oom_kill_recorder` or `kprobe__do_fork`, or a frame coarsening tier like `temporal observation scope` and `processing pipeline tier`—is anchored by a stable identifier: `HOOK-0001`, `COAR-0001`, `CLAI-0001`. These identifiers serve as the primary keys across all tables, ensuring that each row can be unambiguously referenced regardless of whether it describes a structural definition or a runtime measurement. The identifier space is partitioned by prefix to signal provenance—`HOOK-` for eBPF event hooks, `COAR-` for frame coarsening definitions, and `CLAI-` for outlier claim subclasses—yet the same identifier may appear in multiple contexts, functioning simultaneously as a row key and as a foreign key in value tables.

**t_ebpf_event_at_hook**

| id | ebpf | at_hook |
| --- | --- | --- |
| HOOK-0001 | oom_kill_recorder | COAR-0001 |
| HOOK-0002 | tcp_connect_monitor | COAR-0004 |
| HOOK-0003 | socket_bind_observer | COAR-0001 |
| HOOK-0004 | kprobe__do_fork | COAR-0004 |
| HOOK-0005 | xdp_drop_counter | COAR-0003 |
| HOOK-0006 | disk_io_latency | COAR-0004 |
| HOOK-0007 | xdp_drop_counter | COAR-0002 |
| HOOK-0008 | tcp_connect_monitor | COAR-0001 |

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | CLAI-0005 |
| COAR-0002 | raw sensor tick | CLAI-0006 |
| COAR-0003 | raw sensor tick | CLAI-0002 |
| COAR-0004 | processing pipeline tier | CLAI-0004 |
| COAR-0005 | metadata catalog level | CLAI-0004 |
| COAR-0006 | hourly sensor grid | CLAI-0005 |

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

Attribute definitions are decoupled from their values through a two-tier schema. The attribute metadata tables—`t_ebpf_event_at_hook_attr` and `t_frame_coarsening_attr`—declare what can be measured: `duration_seconds`, `end_time`, `exit_code`, `host_name` for eBPF hooks; `confidence`, `dimension_kind`, `method`, `recorded_at` for frame coarsening. Each attribute carries a type annotation drawn from the XSD vocabulary—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`—which determines which value table receives the corresponding data. This type-driven dispatch means that a single attribute identifier such as `HOOK-0001` resolves to a decimal value of `289.81` in `t_ebpf_event_at_hook_val_decimal`, while `HOOK-0002` resolves to a datetime value of `2025-04-15T06:28:34` in `t_ebpf_event_at_hook_val_datetime`. The separation of attribute schema from value storage enables type-safe queries without sacrificing the flexibility to attach heterogeneous measurements to the same entity.

**t_ebpf_event_at_hook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HOOK-0001 | duration_seconds | xsd:decimal |
| HOOK-0002 | end_time | xsd:dateTime |
| HOOK-0003 | exit_code | xsd:integer |
| HOOK-0004 | host_name | xsd:string |
| HOOK-0005 | log_level | xsd:string |
| HOOK-0006 | phase | xsd:string |
| HOOK-0007 | retry_count | xsd:integer |
| HOOK-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_at_hook_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0002 | 2025-04-15T06:28:34 |
| HOOK-0002 | HOOK-0001 | HOOK-0008 | 2023-07-01T04:43:47 |
| HOOK-0003 | HOOK-0001 | HOOK-0009 | 2024-07-23T09:28:11 |
| HOOK-0004 | HOOK-0002 | HOOK-0002 | 2024-10-19T19:53:20 |
| HOOK-0005 | HOOK-0002 | HOOK-0008 | 2024-09-07T20:44:31 |
| HOOK-0006 | HOOK-0002 | HOOK-0009 | 2024-01-06T00:55:45 |
| HOOK-0007 | HOOK-0003 | HOOK-0002 | 2023-07-31T02:59:19 |
| HOOK-0008 | HOOK-0003 | HOOK-0008 | 2024-12-05T20:30:51 |

**t_ebpf_event_at_hook_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0001 | 289.81 |
| HOOK-0002 | HOOK-0002 | HOOK-0001 | 3531.53 |
| HOOK-0003 | HOOK-0003 | HOOK-0001 | 3907.51 |
| HOOK-0004 | HOOK-0004 | HOOK-0001 | 3791.90 |
| HOOK-0005 | HOOK-0005 | HOOK-0001 | 2276.70 |
| HOOK-0006 | HOOK-0006 | HOOK-0001 | 4707.83 |
| HOOK-0007 | HOOK-0007 | HOOK-0001 | 5960.02 |
| HOOK-0008 | HOOK-0008 | HOOK-0001 | 1500.90 |

**t_ebpf_event_at_hook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0003 | 245 |
| HOOK-0002 | HOOK-0001 | HOOK-0007 | 83 |
| HOOK-0003 | HOOK-0002 | HOOK-0003 | 157 |
| HOOK-0004 | HOOK-0002 | HOOK-0007 | 346 |
| HOOK-0005 | HOOK-0003 | HOOK-0003 | 820 |
| HOOK-0006 | HOOK-0003 | HOOK-0007 | 382 |
| HOOK-0007 | HOOK-0004 | HOOK-0003 | 364 |
| HOOK-0008 | HOOK-0004 | HOOK-0007 | 482 |

**t_ebpf_event_at_hook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0001 | HOOK-0004 | gw-12 |
| HOOK-0002 | HOOK-0001 | HOOK-0005 | Log Level 02 |
| HOOK-0003 | HOOK-0001 | HOOK-0006 | closeout |
| HOOK-0004 | HOOK-0001 | HOOK-0010 | running |
| HOOK-0005 | HOOK-0001 | HOOK-0011 | Triggered By 05 |
| HOOK-0006 | HOOK-0002 | HOOK-0004 | node-b14 |
| HOOK-0007 | HOOK-0002 | HOOK-0005 | Log Level 07 |
| HOOK-0008 | HOOK-0002 | HOOK-0006 | initiation |

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |

Entity instances are materialized through value tables that bind an `entity_id` to an `attr_id` and a concrete `value`. The entity here is the row in the definition table—the eBPF hook or the frame coarsening tier—and the value tables collectively form an entity-attribute-value (EAV) structure. For example, entity `HOOK-0001` carries a decimal value of `289.81` for attribute `HOOK-0001`, a datetime value of `2025-04-15T06:28:34` for attribute `HOOK-0002`, an integer value of `245` for attribute `HOOK-0003`, and a varchar value of `gw-12` for attribute `HOOK-0004`. The same entity may appear multiple times within a single value table, as `HOOK-0001` does in `t_ebpf_event_at_hook_val_datetime` with three distinct attribute bindings. This design permits any entity to carry an arbitrary set of typed attributes without schema migration, at the cost of requiring joins across multiple value tables to reconstruct a complete entity profile.

The outlier claim subsystem introduces a relational layer that connects claims to anomaly contexts through a junction table with an explicit role dimension. The table `t_outlier_claim_subclass__explains_anomaly_in` links a `subject` (an outlier identifier such as `CLAI-0005` or `CLAI-0001`) to a `target` (an anomaly context such as `CLAI-0002` or `CLAI-0006`) while recording the `role` of the subject within that relationship: `reviewer`, `owner`, or `observer`. This role column transforms what would otherwise be a simple many-to-many link into a semantically rich association. The same subject `CLAI-0001` appears with role `reviewer` when explaining anomaly `CLAI-0005` and with role `observer` when explaining anomaly `CLAI-0006`, indicating that the nature of the relationship is context-dependent rather than intrinsic to the pair. The underlying outlier definitions—`Network_Bandwidth_Spike`, `Patient_Vital_Anomaly`, `Log_Flood_Event`—and their associated anomaly contexts—`Automotive_Test_Drive`, `Power_Grid_Substation`, `Financial_Trading_Queue`—provide the domain semantics that the role-annotated links operate upon.

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

Cross-table relationships form a coherent chain from raw observation to analytical claim. An eBPF event hook identified by `HOOK-0001` is associated with a frame coarsening tier `COAR-0001` through the `at_hook` column; that frame coarsening tier, in turn, coarsens an outlier claim subclass `CLAI-0005` through the `coarsens_frame` column; and that outlier claim subclass assumes the role of `reviewer` in explaining anomaly context `CLAI-0002`. The foreign keys—`at_hook` referencing frame coarsening, `coarsens_frame` referencing outlier claim subclass, and the dual foreign keys `outlier_id` and `explains_anomaly_in_id` in the junction table—create a navigable graph where identifiers serve as the universal currency. Values flow through this graph as typed measurements attached to entities at each node, enabling queries that traverse from a specific eBPF program like `tcp_connect_monitor` through its coarsening tier to the outlier claims it helps explain, with all attribute values—whether the decimal `0.517` confidence score on frame `COAR-0001` or the integer `346` exit code on hook `HOOK-0002`—remaining accessible through the same EAV mechanism.