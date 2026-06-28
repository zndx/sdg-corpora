---
chapter_id: ch_live_ebpf_event_observed_pid_35ad9d
topic_id: 123
family: 02_observation_measurement
cited_terms: ['ebpf_event_observed_pid', 'observation_governed_by_policy', 'dataset_snapshot_subclass']
model: engine-refine
---

Observations in this framework are anchored to policy identifiers—POLI-0001 through POLI-0004—that enumerate discrete monitoring events such as a north vent temperature spike, an ingestion pipeline backpressure, a core switch packet loss, or an edge gateway heartbeat timeout. Each observation carries a set of typed attributes that describe its measurable properties: duration_seconds, end_time, exit_code, and host_name, among others. The attribute definitions themselves are catalogued with their corresponding XSD types—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—ensuring that every value bound to an attribute is semantically constrained at the schema level. This separation of attribute metadata from attribute values permits heterogeneous value storage: decimal measures such as 2405.99, 5333.00, 2745.86, and 5236.87 reside in one store; integer exit codes like 46, 468, 386, and 493 in another; timestamped end times such as 2023-03-21T06:17:05 and 2024-08-23T18:14:17 in a third; and free-form strings including gw-12, Log Level 02, execution, and complete in a fourth. The entity column in each value table ties the datum back to its governing observation, while the attr_id column resolves the specific attribute to which the value belongs, forming a normalized star-like structure where the observation is the fact and the typed attributes are the dimensions.

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

The snapshot dimension introduces a hierarchical layer of provenance and versioning. Each snapshot carries an identifier—SNAP-0001 through SNAP-0004—and a snapshot_of_key that references another snapshot, establishing a chain of derivation or aggregation. SNAP-0001 points to SNAP-0004, SNAP-0002 to SNAP-0003, SNAP-0003 to SNAP-0002, and SNAP-0004 to SNAP-0003, forming interlinked lineage paths. The size_bytes column records the byte footprint of each snapshot—350,697,080 for SNAP-0001, 501,391,865 for SNAP-0002, 31,504,133 for SNAP-0003, and 676,110,880 for SNAP-0004—while the version column assigns a monotonically increasing integer (2, 5, 5, 10) that tracks revision state. A companion dimension table, dim_snapshot_of, supplies human-readable labels and categorical groupings—Snapshot Of Label 01 through 04 and Snapshot Of Category 01 through 04—providing the semantic context that the raw identifiers alone cannot convey.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

Subject and target columns operationalize the relationship model that underpins the eBPF event observation layer. In the junction table linking eBPF events to observed processes, the ebpf_id column designates the subject—the active observer—and the observes_pid_id column designates the target—the process being monitored. The role column further qualifies the nature of the relationship, taking values such as contributor, observer, owner, and reviewer, which encode the functional capacity in which the subject engages with the target. For instance, PID-0002 acts as a contributor to PID-0006, PID-0003 serves as an owner of PID-0002, and PID-0004 functions as a reviewer of PID-0002. This triad of subject, target, and role generalizes the observation pattern beyond eBPF events to any domain where one entity acts upon or monitors another under a defined capacity.

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

The identifier column appears consistently across every table as the primary key, providing a stable, opaque handle that decouples logical identity from human-readable labels. In the eBPF event table, identifiers PID-0001 through PID-0004 map to event types including syscall_trace, disk_io_tracker, and tcp_connect_probe; in the policy observation table, POLI-0001 through POLI-0004 map to the four named monitoring events; and in the snapshot tables, SNAP-0001 through SNAP-0004 map to the versioned data artifacts. This uniform identification scheme ensures referential integrity across the fact and dimension tables: the entity_id in the value tables resolves to an observation identifier, the attr_id resolves to an attribute definition, and the snapshot_of_key in the fact dataset resolves to another snapshot's identifier. The misc column, appearing in the value tables as the value carrier and in the snapshot dimension as the label and category fields, serves as the generic container for domain-specific data that does not fit the structured attribute taxonomy.

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

Size bytes and version together constitute the material provenance of each snapshot, enabling capacity planning, change tracking, and auditability. A snapshot of 676,110,880 bytes at version 5 represents a materially different artifact from one of 31,504,133 bytes at the same version number, underscoring that version alone is insufficient to distinguish state—size provides the orthogonal dimension of magnitude. The snapshot_of_key creates a directed graph of snapshot relationships that can be traversed to reconstruct lineage: starting from any leaf snapshot, one follows the snapshot_of_key chain backward to its ancestors, each step annotated with size and version, yielding a complete provenance trail. This design mirrors the attribute-value separation in the observation layer, where the attribute definition (attr_name and attr_type) is decoupled from the actual value (misc), and the entity_id provides the join key—ensuring that both the structural metadata and the runtime data remain independently extensible without schema migration.