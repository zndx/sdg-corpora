---
chapter_id: ch_live_ebpf_event_min_one_attribute_a5db6c
topic_id: 46
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'schemaorg_person_named', 'ebpf_event_observed_pid']
model: engine-refine
---

In observability and knowledge-graph governance, a stable identifier is the non-negotiable anchor that lets heterogeneous records refer to the same thing without ambiguity. Identifiers such as ATTR-0001, NAME-0003, and PID-0002 are not display labels; they persist across attribute registries, typed value stores, and association tables so that a duration measurement, a Schema.org person record, and an eBPF program observation can each be joined, audited, and reconciled under one canonical key. Without that discipline, compliance evidence fragments: the same logical event might appear under different spellings, and lineage from probe to attribute to value cannot be reconstructed.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | network_latency_monitor |
| ATTR-0002 | tc_ingress_filter |
| ATTR-0003 | tracepoint_sched_switch |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | uprobe_libc_malloc |
| ATTR-0006 | syscall_trace |

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

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | tc_ingress_filter |
| PID-0002 | kernel_stack_sampler |
| PID-0003 | socket_accept_tracer |
| PID-0004 | kernel_stack_sampler |
| PID-0005 | tcp_connect_probe |
| PID-0006 | syscall_trace |

An attribute names what is being asserted about an entity—the measurable or descriptive facet—while attr type declares how that assertion must be interpreted and where it may legally reside. In the eBPF event domain, duration_seconds carries xsd:decimal, end_time carries xsd:dateTime, exit_code carries xsd:integer, and host_name carries xsd:string; that typing is not cosmetic, because it routes each fact into the correct physical store and governs validation, comparison, and retention policy. A decimal duration of 2938.76 seconds and an integer exit code of 465 are therefore not interchangeable misc values even when they share the same entity context; attr type is the contract that prevents silent coercion across audit boundaries.

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

The entity is the object of description—the record to which attributes attach—distinct from the attribute definition and from the identifier of any single observation row. Entity identifiers such as ATTR-0001 and ATTR-0002 recur across datetime, decimal, integer, and varchar value tables, showing that one logical eBPF-related entity may simultaneously hold an end_time of 2024-05-05T15:51:23, a host_name of node-b14, and a duration_seconds reading, each bound through attr_id to the appropriate attribute key. Misc, in this framing, is the carried payload: the literal value field whose semantics are fully determined only by the pairing of entity, attr, and attr_type. Treating misc as untyped text would collapse the separation of concerns that the typed partitions enforce.

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

Relationship semantics extend the same identifier discipline from facts to roles between subjects and targets. A subject is the originating or owning node in a directed association; a target is the node acted upon or referenced. In person naming, schemaorg_id NAME-0003 as subject may link to full_name_id NAME-0002 as target under role reviewer, while NAME-0004 links to the same target under role owner—so identical endpoints can carry different governance meaning. The role qualifier is what makes the edge auditable: owner, observer, reviewer, and contributor are not decorative tags but operational labels that determine authority, visibility, and accountability in downstream policy engines.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

The eBPF process-observation pattern applies the same subject–target–role model to runtime telemetry. Programs identified as tc_ingress_filter, kernel_stack_sampler, and socket_accept_tracer stand as subjects; observed process identifiers such as 11024 and 7743 stand as targets; and the bridging table records that PID-0002 observes PID-0004 with role observer while another pairing assigns role reviewer. That structure separates what is being watched from who watches it and under what capacity, which matters when attributing kernel-level evidence to a specific probe deployment or when restricting contributor versus owner privileges in change control.

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

Taken together, identifier, attr, attr_type, entity, misc, role, subject, and target form a layered reference architecture rather than a flat event log. Identifiers stabilize identity; attrs and attr_types define the vocabulary and typing contract; entities and misc instantiate assertions; and subject–target edges annotated with role encode governed relationships among people, programs, and observed processes. Operational guides that adopt this decomposition can require, for example, that every misc value cite a resolvable entity and typed attr, and that every cross-domain link declare role explicitly—so that evidence from network_latency_monitor or tracepoint_sched_switch telemetry, Schema.org person/tim_berners_lee alignment, and PID-level observation chains remain independently verifiable yet composable under a single compliance narrative.