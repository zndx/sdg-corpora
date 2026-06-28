---
chapter_id: ch_live_dataset_was_derived_from_fda9bb
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_derived_from', 'subclass_not_basic', 'ebpf_event_at_hook']
model: engine-refine
---

In governed data environments, stable identifiers are the non-negotiable substrate on which lineage, attribution, and audit rest: every record that must be cited across time, jurisdiction, or transformation chain requires a durable key that survives renaming, repartitioning, and downstream republication. Identifiers such as FROM-0001 and HOOK-0001 function not as display labels but as join anchors—pointers that allow a compliance officer, data steward, or automated policy engine to retrieve the same logical object whether it appears in a derivation registry, an eBPF instrumentation catalog, or a typed attribute store. Their importance is procedural as much as technical: without them, assertions about provenance (“this dataset came from that source”) or observability (“this hook emitted that measurement”) collapse into anecdote. In practice, identifiers are assigned early, propagated unchanged through association tables, and treated as authoritative even when human-readable names (`iot_edge_logs`, `oom_kill_recorder`) repeat or drift; the duplicate appearance of `patient_demographics_clean` under distinct FROM keys is precisely the condition identifiers are meant to disambiguate.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

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

Entity denotes the thing being described—the unit to which attributes accrue and against which values are validated—while attr names the definitional facet applied to that unit and attr_type fixes the interpretive contract under which any recorded misc value must be read. An entity is not merely a row label; it is the operational object under measurement or governance, such as the hook installation pairing `tcp_connect_monitor` with attachment point `xdp`, referenced uniformly as HOOK-0002 across decimal, datetime, integer, and varchar value relations. Attributes (`duration_seconds`, `end_time`, `exit_code`, `host_name`) declare what may be said about entities; attr_types (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`) declare how it may be said, routing each assertion to the storage and validation machinery appropriate to its semantics. The misc column—despite its humble name—carries the evidentiary payload itself: `289.81` as a duration, `2025-04-15T06:28:34` as an end timestamp, `245` as an exit code, `gw-12` as a host designation. Typed partitioning is not cosmetic; it prevents category errors at ingestion and at query time, so that a datetime such as `2024-10-19T19:53:20` cannot silently masquerade as a numeric threshold, and a string state like `running` cannot be aggregated as though it were cardinal.

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

Subject and target articulate directed relationships between identified participants, supplying the grammatical spine of lineage graphs and responsibility maps. In derivation governance, the subject (`dataset_id`) names the derived or governed dataset node—`FROM-0002` for `patient_demographics_clean`, `FROM-0005` for a record implicated in a separate chain—while the target (`was_derived_from_id`) names the upstream source node, whether `raw_sensor_stream`, `warehouse_staging_area`, `regulatory_filing_pdf`, or `archival_tape_restore`. The pairing is intentionally asymmetric: compliance questions are posed from downstream to upstream (“what inputs explain this published dataset?”), and reversal would obscure causality. Role qualifies that directed edge without redefining its endpoints, distinguishing how a source participated—most edges in the sample carry `contributor`, marking inputs that informed composition, whereas `owner` on the association linking `FROM-0001` to `FROM-0002` signals custodial or authoritative responsibility rather than mere material contribution. That distinction matters in practice when obligations attach to ownership (retention, access control, attestation) while contributors may be cited for transparency without inheriting the full liability surface.

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Identifier stability, entity-centric attribute modeling, typed misc values, and subject–target–role triples converge most visibly in operational traceability scenarios where telemetry and dataset provenance must be defended under scrutiny. Consider `oom_kill_recorder` observed at `sk_skb`: the same entity identifier HOOK-0001 supports heterogeneous misc assertions—decimal duration, integer exit code, varchar host name—each validated through its attr_type and bound to the correct attr definition, producing a coherent evidentiary bundle rather than a flat, untyped log line. Parallel lineage records show `iot_edge_logs` anchored to `raw_sensor_stream` as contributor input, while other derivations reach back through staging areas, regulatory filings, and restored archival media; the heterogeneity of targets underscores why subject–target edges are stored explicitly rather than inferred from naming conventions alone. Subclass and exclusion constructs—illustrated by NOT-0001 through NOT-0004 and their paired negation labels—further show how identifier discipline extends to constraint vocabularies that govern what entities may not be classified as, preventing silent widening of categories during automated mapping.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

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

Taken together, these constructs implement a separation of concerns that mature governance frameworks depend on: identifiers enable correlation, entities supply the object of discourse, attr and attr_type jointly define permissible statements, misc holds the statements themselves, and subject, target, and role encode directed, qualified relationships among identified participants. Practitioners should treat attr_type as enforceable policy, not documentation—values belong only in the misc channel sanctioned for their type—and should record role at the edge where accountability differs from composition. When `patient_demographics_clean` appears more than once, or when a single hook entity accumulates measurements across multiple attr_ids, the architecture’s durability is tested: joins on identifier, validation on attr_type, and interpretation through role prevent merged identities and mixed evidentiary standards. That is the operational payoff—dense, evidence-anchored records that remain legible to humans and machine auditors alike long after the pipelines that produced them have been redeployed or retired.