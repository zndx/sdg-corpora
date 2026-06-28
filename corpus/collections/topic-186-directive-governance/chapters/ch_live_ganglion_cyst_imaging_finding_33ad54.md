---
chapter_id: ch_live_ganglion_cyst_imaging_finding_33ad54
topic_id: 186
family: 08_derived
cited_terms: ['ganglion_cyst_imaging_finding', 'profile_has_cardinality', 'ebpf_event_at_hook']
model: engine-refine
---

Within a unified data governance framework, every observable phenomenon is captured through a structured attribute model that separates definition from value. An attribute serves as the named property of an entity—such as `duration_seconds`, `end_time`, `exit_code`, or `host_name`—each declared with a precise type constraint like `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, or `xsd:string`. These type declarations enforce schema discipline at the point of ingestion, ensuring that downstream consumers can reason about data semantics without inspecting raw payloads. The attribute definition is decoupled from its runtime values, which are stored in type-specific value tables keyed by the attribute identifier and the entity to which the measurement belongs. This separation allows the system to accommodate heterogeneous data sources—ranging from kernel-level eBPF probes monitoring events at hooks such as `sk_skb`, `xdp`, `sockops`, and `tracepoint`, to clinical imaging records documenting ganglion cyst findings—under a single extensible model.

**t_ebpf_event_at_hook**

| id | ebpf | at_hook |
| --- | --- | --- |
| HOOK-0001 | oom_kill_recorder | sk_skb |
| HOOK-0002 | tcp_connect_monitor | xdp |
| HOOK-0003 | socket_bind_observer | sockops |
| HOOK-0004 | kprobe__do_fork | tracepoint |
| HOOK-0005 | xdp_drop_counter | kretprobe |
| HOOK-0006 | disk_io_latency | tc_ingress |
| HOOK-0007 | xdp_drop_counter | xdp |
| HOOK-0008 | tcp_connect_monitor | tc_ingress |

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

The entity concept anchors every recorded observation to a distinct, identifiable instance. Each entity carries a unique identifier, whether formatted as `FIND-0001` for an imaging finding or `HOOK-0001` for an eBPF event at a kernel attachment point. The entity's attributes are then populated with typed values: a decimal measurement like `289.81` for `duration_seconds`, a timestamp such as `2025-04-15T06:28:34` for `end_time`, an integer like `245` for `exit_code`, or a string value including `gw-12` or `running`. This entity-attribute-value pattern scales across domains because the schema does not prescribe which attributes an entity must carry; instead, it provides the type system and the storage mechanism, leaving the actual attribute composition to the domain model.

In the medical imaging domain, the framework captures ganglion cyst observations with rich contextual metadata. Each finding—such as a lesion at the dorsal right ankle, the left medial malleolus, the bilateral distal radius, or the right dorsal metatarsal—is associated with the magnetic resonance imaging modality used to visualize it, whether that be MIP reconstruction, sagittal PD FS, gadolinium-enhanced T1, or T2-weighted fat saturation. The encoding of the finding record, drawn from `ascii`, `latin1`, or `unicode`, and the language of the documentation, such as `ja` or `en`, are stored as first-class attributes, enabling multi-lingual clinical data to coexist within the same schema without ambiguity.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

Cardinality, category, confidence, and uncertainty form the quality and classification layer of the framework. Cardinality labels—`Cardinality Label 01` through `Cardinality Label 04`—are organized into corresponding categories (`Cardinality Category 01` through `Cardinality Category 04`), providing a structured taxonomy for grouping and filtering observations. Each cardinality fact carries a confidence score, ranging from `0.226` to `0.994`, and an uncertainty value measured on a continuous scale from `284.36` to `622.09`. These metrics allow downstream analytics to weight or filter observations by reliability, ensuring that decisions based on the data account for measurement quality. The misc column captures supplementary numeric values—such as `728.94`, `380.57`, `607.36`, or `448.09`—that do not fit neatly into the structured confidence or uncertainty fields but remain essential for audit trails and domain-specific calculations.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |