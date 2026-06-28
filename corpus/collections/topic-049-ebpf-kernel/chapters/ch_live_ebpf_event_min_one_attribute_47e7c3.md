---
chapter_id: ch_live_ebpf_event_min_one_attribute_47e7c3
topic_id: 49
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'column_value_distribution', 'ebpfprogram_with_license']
model: engine-refine
---

The architecture of attribute-value storage in eBPF event telemetry relies on a disciplined separation between entity identification, attribute definition, and value instantiation. Each event is anchored by a unique identifier—ATTR-0001 through ATTR-0004 in the observed corpus—which serves as the primary key across all related tables. These identifiers do not merely label rows; they function as the connective tissue binding event types such as lsm_bpf, xdp_rx_drop, tcp_congestion_control, and iter_task_stat to their dimensional properties. The attribute schema itself is decoupled from values: attribute names like duration_seconds, end_time, exit_code, and host_name are declared alongside their semantic types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string—creating a type registry that governs how values are validated and interpreted downstream. This separation ensures that schema evolution can proceed independently of data capture, a critical property for systems processing continuous kernel-level event streams.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | lsm_bpf |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tcp_congestion_control |
| ATTR-0004 | iter_task_stat |
| ATTR-0005 | lsm_bpf_attach |
| ATTR-0006 | kprobe_do_sys_open |

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

Value storage is partitioned by type, with dedicated tables for datetime, decimal, integer, and variable-length string attributes. An entity identified as ATTR-0001 may carry a duration_seconds value of 2938.76 in the decimal store, an end_time of 2024-05-05T15:51:23 in the datetime store, an exit_code of 465 in the integer store, and a host_name of node-b14 in the varchar store—all referencing the same entity through the entity_id column. This multi-table value distribution is not redundancy but type safety: each value table enforces its domain constraint at the storage layer, preventing type coercion errors that would corrupt analytical queries. The attr_id column in each value table resolves to the attribute definition registry, ensuring that every stored value maps to a declared attribute name and type. An entity such as ATTR-0001 can thus accumulate a heterogeneous set of properties—decimal, datetime, integer, and string—each stored in its appropriate type-specific table, while the identifier column in each value table provides a secondary key for deduplication and audit trails.

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

The relationship model extends beyond single-entity attributes to multi-entity associations governed by subject-target-role triples. In the license attribution table, eBPF programs such as lsm_bpf and xdp_rx_drop are linked to license identifiers including MPL-2.0, EUPL-1.2, Unlicense, and ISC through a junction table that records not only which program carries which license but the role each party plays in that association. A single program like xdp_rx_drop may appear with multiple roles—contributor, reviewer, observer—against different license entities, reflecting the multi-party provenance common in open-source kernel modules. The subject column identifies the originating entity (the eBPF program), the target column identifies the referenced entity (the license), and the role column captures the semantic relationship between them. This triple structure generalizes the attribute model: just as an entity has attributes with typed values, an entity participates in relationships with roles that qualify the nature of the association.

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | lsm_bpf |
| LICE-0002 | xdp_rx_drop |
| LICE-0003 | tracepoint_sched_switch |
| LICE-0004 | iter_task |
| LICE-0005 | perf_event_sample |
| LICE-0006 | xdp_rx_drop |

**t_ebpfprogram_with_license_license**

| id | license |
| --- | --- |
| LICE-0001 | MPL-2.0 |
| LICE-0002 | EUPL-1.2 |
| LICE-0003 | Unlicense |
| LICE-0004 | ISC |
| LICE-0005 | Apache-2.0 |
| LICE-0006 | LGPL-2.1 |
| LICE-0007 | Zlib |

**t_ebpfprogram_with_license__license**

| id | ebpfprogram_id | license_id | role |
| --- | --- | --- | --- |
| LICE-0001 | LICE-0002 | LICE-0004 | contributor |
| LICE-0002 | LICE-0006 | LICE-0002 | reviewer |
| LICE-0003 | LICE-0002 | LICE-0001 | observer |
| LICE-0004 | LICE-0002 | LICE-0006 | contributor |
| LICE-0005 | LICE-0003 | LICE-0004 | reviewer |
| LICE-0006 | LICE-0005 | LICE-0003 | contributor |
| LICE-0007 | LICE-0005 | LICE-0005 | reviewer |
| LICE-0008 | LICE-0006 | LICE-0003 | contributor |

A parallel structure governs value distribution metadata, where column identifiers such as request_count, patient_bmi, and device_serial are associated with statistical distribution profiles—pareto_shape, binomial_profile, uniform_range, poisson_profile—through the same subject-target-role pattern. The column request_count, for instance, appears with the role contributor against a poisson_profile distribution, indicating that this column's value distribution is modeled as Poisson and that the record serves a contributory function in the distribution taxonomy. The role field here distinguishes between contributor, reviewer, and observer positions, enabling governance workflows where distribution assumptions are proposed, validated, and archived with clear accountability. This pattern—subject, target, role—repeats across both the license and distribution domains, establishing a unified relationship model that treats attribute associations and metadata associations as instances of the same triple structure.

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

The practical implication of this design is that queries must traverse multiple join paths to reconstruct a complete entity profile. Retrieving all properties of event ATTR-0001 requires joining the attribute definition table to four separate value tables, each filtered by the appropriate attr_id and entity_id. Similarly, determining the full license provenance of program xdp_rx_drop requires joining the program table to the license junction table and then to the license definition table, with the role column providing the contextual qualifier for each association. The identifier columns—whether they label events, attributes, programs, or distributions—serve as the universal addressing scheme that makes these multi-table traversals possible. Without this consistent identification layer, the type-specific value tables and role-qualified relationship tables would be disconnected fragments with no mechanism for reconstruction.