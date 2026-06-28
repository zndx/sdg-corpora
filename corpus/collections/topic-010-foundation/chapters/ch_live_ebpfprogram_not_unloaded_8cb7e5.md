---
chapter_id: ch_live_ebpfprogram_not_unloaded_8cb7e5
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_not_unloaded', 'outlier_claim_with_attribute_set', 'video_surveillance_activity']
model: engine-refine
---

**E-BPF PROGRAM INVENTORY AND ATTRIBUTE REGISTRY**

The eBPF program registry establishes a controlled inventory of kernel-level programs designated as non-removable, each assigned a persistent identifier within the UNLO series. Programs catalogued under this designation include the `flow_dissector` for packet classification, the `cgroup_device` controller for cgroup-based device access enforcement, the `socket_cookie` tracer for connection tracking, and the `kretprobe_mmap` hook for memory mapping audit. Each primary program is cross-referenced to a secondary program—such as `tracepoint_sched_switch`, `perf_event_open`, `xdp_router`, or a duplicate reference to `cgroup_device`—forming a bidirectional linkage that captures dependency or co-deployment relationships. The identifier scheme (UNLO-0001 through UNLO-0004) provides a stable key across all attribute and value tables, ensuring referential integrity throughout the registry.

**t_ebpfprogram_not_unloaded**

| id | ebpfprogram | ebpfprogram_2 |
| --- | --- | --- |
| UNLO-0001 | flow_dissector | tracepoint_sched_switch |
| UNLO-0002 | cgroup_device | perf_event_open |
| UNLO-0003 | socket_cookie | xdp_router |
| UNLO-0004 | kretprobe_mmap | cgroup_device |
| UNLO-0005 | netns_attach | flow_dissector |
| UNLO-0006 | cgroup_skb_ingress | cgroup_device |

Attribute definitions for these programs are formalized through a typed attribute schema that distinguishes between string-valued metadata, date-stamped provenance, and designative identifiers conforming to the `cco:DesignativeICE` namespace. Attributes such as `checksum`, `created_date`, `identifier`, and `license` are each bound to an XML Schema or ontology type—`xsd:string`, `xsd:date`, or `cco:DesignativeICE`—enabling type-safe validation at query time. Value assignments are materialized across three separate value tables partitioned by data type: date values record creation or revision timestamps (e.g., 2025-04-28, 2025-01-07, 2025-02-14, 2025-06-17), integer values capture numeric parameters (186, 5, 206, 3), and varchar values store free-form identifiers including a hash (`9d2b7a16`), an OID (`oid:1.3.6.1`), a license designation (`MPL-2.0`), and a geographic region (`us-east-1`). The entity column in each value table references the program identifier, while the attribute column points to the defining attribute, creating a normalized entity-attribute-value model that supports arbitrary attribute expansion without schema migration.

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

**OUTLIER CLAIM AND ATTRIBUTE SET GOVERNANCE**

A parallel registry governs outlier claims—discrete fault or anomaly designations such as `checksum_mismatch`, `pipeline_stall`, `log_flooding`, and `latency_spike`—each associated with one or more attribute sets that define the measurement context for the claim. Attribute sets include `tolerance_ranges`, `baseline_values`, and `calibration_constants`, which collectively specify the thresholds and reference conditions against which an outlier is evaluated. The relationship between outlier claims and attribute sets is mediated by a junction table that encodes both the directional linkage (outlier to attribute set) and the semantic role of that linkage—designated as `contributor` or `owner`. For instance, the claim `log_flooding` (SET-0003) is linked to attribute set SET-0005 in a contributor role, while `checksum_mismatch` (SET-0001) is linked to SET-0004 as owner, indicating that the attribute set defines the authoritative measurement framework for that claim. This role-based association permits a single attribute set to serve multiple claims in different capacities, and a single claim to draw on multiple attribute sets with distinct responsibilities.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

**VIDEO SURVEILLANCE ACTIVITY AND DEVICE ASSIGNMENT**

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |

The video surveillance activity registry documents operational monitoring engagements, each identified by a location or zone designation and associated with a specific surveillance environment and device. Activities include `AdminOffice`, `EastWing_Patrol`, `Gymnasium`, and `ParkingLotA`, each mapped to a monitored environment such as `Courtyard`, `MainEntrance_Day`, `Gymnasium`, or `ParkingLot_Dusk_Rec`, and to an employed device including `Fixed_Lens_Camera`, `IP_Overwatch_Node`, `Multi_Sensor_Array`, and `Thermal_Array_Sensor`. The three-column structure—activity, monitored environment, and employed device—captures the operational triad of what is being monitored, where the monitoring occurs, and which hardware is deployed. This separation of concerns allows the same device type to be reassigned across different activities and environments without data duplication, and supports audit trails that trace any given surveillance outcome back to its originating activity, location, and sensor configuration.