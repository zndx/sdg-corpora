---
chapter_id: ch_live_ebpf_event_min_one_attribute_4396e4
topic_id: 106
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'ebpf_event_observed_pid', 'ebpf_event_subclass']
model: engine-refine
---

The attribute-value paradigm underpins the observability data model, wherein each attribute carries a precisely typed definition and a set of measured values distributed across type-specialized storage. An attribute such as `duration_seconds` is declared with the type `xsd:decimal`, `end_time` with `xsd:dateTime`, `exit_code` with `xsd:integer`, and `host_name` with `xsd:string`; these type annotations govern both validation and the physical table into which a value is routed. The value tables—`t_ebpf_event_min_one_attribute_val_decimal`, `t_ebpf_event_min_one_attribute_val_datetime`, `t_ebpf_event_min_one_attribute_val_int`, and `t_ebpf_event_min_one_attribute_val_varchar`—each hold a composite key of `id`, `entity_id`, `attr_id`, and `value`, ensuring that every measurement is traceable to the attribute it satisfies and the entity that owns it. A decimal measurement of `2938.76` for attribute `ATTR-0001` on entity `ATTR-0001` is stored alongside a datetime value of `2024-05-05T15:51:23` for attribute `ATTR-0002` on the same entity, and an integer value of `465` for attribute `ATTR-0003`—all referencing the same entity but partitioned by type, a design that eliminates null columns while preserving type safety.

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

The `entity` column in each value table serves as the foreign key linking a concrete measurement to the attribute definition it instantiates, while the `attr_id` column points back to the attribute's own identifier. This bidirectional linkage means that the attribute catalog—maintained in `t_ebpf_event_min_one_attribute_attr` with columns `id`, `attr_name`, and `attr_type`—acts as the schema registry against which all values are validated. An attribute identified as `ATTR-0001` with name `duration_seconds` and type `xsd:decimal` can accumulate multiple value rows across different entities: `2938.76` on entity `ATTR-0001`, `3337.03` on entity `ATTR-0002`, `6550.82` on entity `ATTR-0003`, and `5328.03` on entity `ATTR-0004`. The entity identifier thus functions as a namespace boundary, allowing the same attribute definition to be measured independently across distinct eBPF events such as `iter_task_stat`, `fentry_bpf_prog_load`, `socket_accept_tracer`, and `kernel_stack_sampler`, each of which is registered in the parent attribute table `t_ebpf_event_min_one_attribute` with its own `id` and `ebpf` column.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | iter_task_stat |
| ATTR-0002 | fentry_bpf_prog_load |
| ATTR-0003 | socket_accept_tracer |
| ATTR-0004 | kernel_stack_sampler |
| ATTR-0005 | vfs_read |
| ATTR-0006 | xdp_rx_drop |

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

**t_ebpf_event_subclass_attr**

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

The `identifier` column, present in every table, provides a stable, human-readable primary key that remains invariant across the lifecycle of the data. Identifiers follow a structured naming convention—`ATTR-0001` through `ATTR-0004` for attributes, `PID-0001` through `PID-0004` for observed process identifiers, and `EVEN-0001` through `EVEN-0004` for event subclasses—enabling unambiguous cross-referencing without reliance on surrogate integers. The `t_ebpf_event_subclass` table, for instance, maps identifiers like `EVEN-0001` to the eBPF event `tracepoint_sched_switch` captured by `Pixie-Cloud`, while `EVEN-0002` maps to `vfs_read` captured by `Datadog-Host`; these identifiers then propagate into the subclass value tables, where `EVEN-0001` appears as both the primary key and the `entity_id` for its associated measurements, including a decimal value of `2720.22` and a datetime value of `2023-12-16T10:45:28`.

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

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | sock_create |
| PID-0002 | netfilter_ingress_hook |
| PID-0003 | security_audit_filter |
| PID-0004 | netfilter_ingress_hook |
| PID-0005 | xdp_rx_drop |
| PID-0006 | perf_event_sample |

**t_ebpf_event_subclass**

| id | ebpf | captured_by |
| --- | --- | --- |
| EVEN-0001 | tracepoint_sched_switch | Pixie-Cloud |
| EVEN-0002 | vfs_read | Datadog-Host |
| EVEN-0003 | softirq_entry | Falco-Agent |
| EVEN-0004 | cpu_profile_sampler | Cilium-Hubble |
| EVEN-0005 | netfilter_ingress_hook | Falco-Agent |
| EVEN-0006 | file_open_hook | Pixie-Agent |

**t_ebpf_event_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2023-12-16T10:45:28 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2024-10-14T13:06:33 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2023-04-24T00:44:09 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-02-16T07:35:15 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2025-04-20T08:07:57 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2024-07-28T17:18:43 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2023-11-26T07:43:04 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-06-08T03:25:45 |

**t_ebpf_event_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2720.22 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 5609.93 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2196.86 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 3453.77 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 849.28 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 5507.03 |

**t_ebpf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 850 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 82 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 274 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 150 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 331 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 359 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 62 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 407 |

**t_ebpf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | ingest-21 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | closeout |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | superseded |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | gw-12 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | initiation |

The `role` column in the junction table `t_ebpf_event_observed_pid__observes_pid` introduces a semantic layer to the relationship between eBPF events and observed process identifiers, transforming a simple many-to-many mapping into a typed association. An entry with identifier `PID-0001` establishes that eBPF event `PID-0002` (the `subject`, stored in `ebpf_id`) assumes the role of `contributor` toward observed PID `PID-0006` (the `target`, stored in `observes_pid_id`); similarly, `PID-0003` records that `PID-0003` acts as `owner` toward `PID-0002`, and `PID-0004` records that `PID-0002` acts as `reviewer` toward `PID-0002`. The roles `contributor`, `observer`, `owner`, and `reviewer` encode governance semantics—distinguishing which events generate data about a process, which merely monitor it, which are responsible for its lifecycle, and which audit its behavior—thereby enabling access control, lineage tracking, and accountability without altering the underlying relational structure.

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

The `misc` column, used as the value column name across all four value tables, is a deliberate abstraction that accommodates heterogeneous data types within a uniform schema. Whether the value is the decimal `5328.03`, the datetime `2023-10-25T19:35:09`, the integer `938`, or the string `node-b14`, the column name remains `value` in the value tables and `misc` in the conceptual model, signaling that the column's semantics are determined by the `attr_type` of the referenced attribute rather than by the column's own type. This design permits the attribute-value model to scale to new data types without schema migration: adding a new attribute with type `xsd:boolean` would require only a new value table, while existing queries against the attribute catalog and entity linkage remain unchanged. The `misc` designation also clarifies that these columns are not general-purpose metadata stores but strictly typed value containers, each governed by the foreign key constraints on `entity_id` and `attr_id` that bind them to their respective definitions.