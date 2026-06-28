---
chapter_id: ch_live_ebpf_event_subclass_e0cbeb
topic_id: 42
family: 02_observation_measurement
cited_terms: ['ebpf_event_subclass', 'functional_dependency_lhs', 'transformation_not_recoverable']
model: engine-refine
---

The attribute layer of the event-subclass model is defined by a pair of columns—`attr_name` and `attr_type`—that together establish a typed schema for every measurable property of an eBPF event. An attribute such as `duration_seconds` carries the type `xsd:decimal`, which constrains its stored values to the range of real numbers observed in the fact table, where decimal-valued attributes record figures like 2720.22, 5609.93, 2196.86, and 3453.77. By contrast, `end_time` is typed as `xsd:dateTime` and receives ISO-8601 literals such as 2023-12-16T10:45:28 and 2024-10-14T13:06:33; `exit_code` is typed as `xsd:integer` and receives whole numbers including 850, 82, 274, and 150; and `host_name` is typed as `xsd:string`, receiving free-form text like ingest-21 and closeout. The type discipline is enforced at the storage layer by four distinct value tables—`t_ebpf_event_subclass_val_datetime`, `t_ebpf_event_subclass_val_decimal`, `t_ebpf_event_subclass_val_int`, and `t_ebpf_event_subclass_val_varchar`—each keyed by a surrogate `id` and linked back to its attribute definition through the `attr_id` foreign key.

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

Every value row is anchored to an `entity`, which is the foreign-key column `entity_id` present in each of the four value tables. The entity column references the primary key of the event-subclass dimension, `t_ebpf_event_subclass`, whose own identifier column (`id`) carries values such as EVEN-0001, EVEN-0002, EVEN-0003, and EVEN-0004. An entity row in that dimension identifies a concrete eBPF event subclass—net_cls, sockops, tcp_sendmsg, or nginx_handle_request—and records which agent captured it, whether Pixie-Cloud, Datadog-Host, Falco-Agent, or Cilium-Hubble. The entity foreign key therefore binds every scalar observation to the event subclass that produced it, forming the backbone of the fact-to-dimension join that underpins all downstream analytics.

**t_ebpf_event_subclass**

| id | ebpf | captured_by |
| --- | --- | --- |
| EVEN-0001 | net_cls | Pixie-Cloud |
| EVEN-0002 | sockops | Datadog-Host |
| EVEN-0003 | tcp_sendmsg | Falco-Agent |
| EVEN-0004 | nginx_handle_request | Cilium-Hubble |
| EVEN-0005 | nginx_handle_request | Falco-Agent |
| EVEN-0006 | net_cls | Pixie-Agent |

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

The functional fact table, `fact_functional`, introduces a second class of identifiers and a second class of relationships. Its primary key is `id`, carrying values such as LHS-0001 through LHS-0004, while its foreign-key column `f_d_left_hand_side_key` points to the dimension table `dim_f_d_left_hand_side`. That dimension table supplies two descriptive columns—`f_d_left_hand_side_label` (for example, F D Left Hand Side Label 01) and `f_d_left_hand_side_category` (for example, F D Left Hand Side Category 01)—which classify each left-hand-side entity into a named category. The fact table's `f_d_left_hand_side_key` column does not always match its own `id`; LHS-0001 maps to LHS-0006, LHS-0002 maps to LHS-0002, LHS-0003 maps to LHS-0006, and LHS-0004 maps to LHS-0001—indicating that the fact table records a many-to-one or many-to-many relationship between functional observations and their categorical parent.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

Confidence and uncertainty are stored as numeric columns in `fact_functional` and serve as the model's explicit quantification of measurement reliability. Confidence values range from 0.117 to 0.950 across the four rows, with LHS-0004 attaining the highest confidence at 0.950 and LHS-0003 the lowest at 0.117. Uncertainty, expressed as an absolute magnitude, ranges from 187.13 to 994.01; the row with the lowest confidence (LHS-0003, confidence 0.117) also carries the highest uncertainty (994.01), while the row with the highest confidence (LHS-0004, confidence 0.950) carries the lowest uncertainty (187.13). A third numeric column, `value`, holds the measured quantity itself—163.64, 234.79, 139.46, and 896.76—and is the subject of whatever aggregation or inference the confidence and uncertainty columns are meant to qualify.

The transformation registry, `t_transformation_not_recoverable`, records irreversible data operations through a set of columns that parallel the event-subclass model in structure but differ in purpose. Each row is identified by `id` (RECO-0001 through RECO-0004) and describes a transformation—partition compaction, log rotation, batch compaction, or format conversion—alongside a secondary transformation such as checksum verification, index defragmentation, record purging, or index rebuild. The `scheduled_at` column stores the planned execution timestamp in ISO-8601 format, with values including 2023-05-27T08:30:46 and 2025-03-09T11:37:12, while the `triggered_by` column records the origin of the trigger as event, manual, schedule, or api. These columns together provide an auditable trail of when a non-recoverable transformation was scheduled, what initiated it, and what secondary operation accompanied it, completing the governance picture that the event-subclass and functional-fact tables alone cannot supply.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |