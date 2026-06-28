---
chapter_id: ch_live_telemetry_span_observes_syscall_bc6c16
topic_id: 26
family: 07_long_tail
cited_terms: ['telemetry_span_observes_syscall', 'trace_min_one_span', 'xdp_action_drop']
model: engine-refine
---

Distributed tracing and kernel-level enforcement both depend on a shared vocabulary for naming what was observed, how long it took, whether it succeeded, and what contextual facts accompanied the event. **Spans** are the atomic units of that observability model: each represents a bounded operation whose identity is carried by a stable **identifier** (for example `SPAN-0001` through `SPAN-0004` in the span dimension) and whose human-readable role is captured in miscellaneous descriptive fields such as `Spans Label 01` paired with a **category** like `Spans Category 01` that groups spans for reporting, SLO bucketing, and policy scoping. In practice, analysts rarely reason about a span in isolation; they join span metadata to execution facts so that duration, termination, and resilience characteristics can be audited alongside classification. A span keyed as `SPAN-0002` may therefore appear both as a dimension record and as a foreign reference in trace facts, reflecting how operational telemetry chains parent–child or peer relationships without collapsing distinct observability concerns into a single flat record.

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

Execution facts attach quantitative compliance signals to those span keys. **Duration seconds** expresses elapsed wall-clock or service time for the observed work—values on the order of `1874.27`, `2092.44`, `3940.66`, and `3336.66` seconds indicate long-running or batch-adjacent operations whose latency profiles matter for capacity planning, incident timelines, and regulatory evidence of timely processing. **Exit** codes (here `491`, `900`, `420`, and `60`) encode how the operation terminated relative to an expected success baseline; non-zero or application-specific codes are first-class audit artifacts because they distinguish clean completion from degraded completion, policy refusal, or hard failure without requiring reviewers to reinterpret raw logs. **Retry count** further characterizes operational resilience: tallies such as `399`, `179`, `396`, and `459` suggest environments where automatic re-attempt is normal rather than exceptional, which is material when assessing whether a control failed once or persisted through sustained retry pressure—an important distinction for both reliability governance and fraud or abuse investigations.

Parallel to trace semantics, syscall and network-enforcement observations use an entity–attribute modeling pattern that keeps schemas extensible while preserving type discipline. An **entity** is the thing being described—`SYSC-0001` under telemetry syscall observation, or `DROP-0001` under an XDP drop action on `wlan0_monitor`—and each entity carries a set of named **attr**ibutes such as `checksum_algo`, `code`, `format`, and `issued_date` for syscall contexts, or `checksum`, `created_date`, `identifier`, and `license` for drop actions. Attributes are not free-form tags; each is governed by an **attr type** that declares the legal value domain. String facts (`xsd:string`) cover codes and formats (`D-33`, `E.164`, `1a4b6c2d`), dates (`xsd:date`) anchor temporal assertions (`2024-08-07`, `2025-02-22`), and specialized types such as `cco:DesignativeICE` signal identifiers intended for formal designation or interchange rather than casual display. Typed storage—varchar, date, and integer value relations—prevents silent coercion: a compliance reviewer can trust that `issued_date` instances are comparable as dates and that integer counters like `265` or `394` are not intermixed with lexical tokens.

**t_telemetry_span_observes_syscall_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | 2024-08-07 |
| SYSC-0002 | SYSC-0002 | SYSC-0004 | 2023-04-29 |
| SYSC-0003 | SYSC-0003 | SYSC-0004 | 2024-09-27 |
| SYSC-0004 | SYSC-0004 | SYSC-0004 | 2023-06-07 |
| SYSC-0005 | SYSC-0005 | SYSC-0004 | 2025-01-16 |
| SYSC-0006 | SYSC-0006 | SYSC-0004 | 2023-10-29 |

**t_telemetry_span_observes_syscall_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0001 | Checksum Algo 01 |
| SYSC-0002 | SYSC-0001 | SYSC-0002 | D-33 |
| SYSC-0003 | SYSC-0001 | SYSC-0006 | Encoding 03 |
| SYSC-0004 | SYSC-0001 | SYSC-0003 | E.164 |
| SYSC-0005 | SYSC-0001 | SYSC-0007 | nightly summary |
| SYSC-0006 | SYSC-0001 | SYSC-0008 | fr |
| SYSC-0007 | SYSC-0001 | SYSC-0005 | Namespace 07 |
| SYSC-0008 | SYSC-0002 | SYSC-0001 | Checksum Algo 08 |

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

The **misc** dimension in this framework is deliberately heterogeneous: it holds the concrete payload that satisfies an attribute declaration or supplies narrative context that does not warrant its own typed column. For syscall telemetry, miscellaneous values include algorithm labels (`Checksum Algo 01`), encoding descriptors (`Encoding 03`), and normalized formats (`E.164`), while span labels occupy the same conceptual slot at a higher layer of abstraction. For XDP enforcement, miscellaneous values become forensic primitives—`quarantine`, `conntrack_drop`, `acl_denied`, and `threat_block` classify the drop **action** taken on interfaces ranging from `veth1_filter` to `nfqueue_bridge`, and supporting misc fields carry license markers (`CC-BY-4.0`), regional hints (`us-east-1`), and durable identifiers (`urn:uuid:9f2a`). Treating misc as evidence-bearing rather than “leftover” data is essential: in audits, these values are often the only portable proof tying a telemetry export (Prometheus, SignalFx Stream Processor, Dynatrace OneAgent) to a specific configuration state at observation time.

**t_telemetry_span_observes_syscall**

| id | telemetry |
| --- | --- |
| SYSC-0001 | Prometheus |
| SYSC-0002 | SignalFx Stream Processor |
| SYSC-0003 | Dynatrace OneAgent |
| SYSC-0004 | Prometheus |
| SYSC-0005 | OpenTelemetry Collector |
| SYSC-0006 | Honeycomb Collector |

**t_telemetry_span_observes_syscall_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYSC-0001 | checksum_algo | xsd:string |
| SYSC-0002 | code | xsd:string |
| SYSC-0003 | format | xsd:string |
| SYSC-0004 | issued_date | xsd:date |
| SYSC-0005 | namespace | xsd:string |
| SYSC-0006 | encoding | xsd:string |
| SYSC-0007 | label_text | xsd:string |
| SYSC-0008 | language | xsd:string |

Identifiers thread the model together and are the linchpin for reproducible joins across telemetry planes. `SYSC-0004` may simultaneously identify a syscall observation, act as the entity receiving an `issued_date` value (`2023-06-07`), and participate in varchar-backed attribute bindings where `SYSC-0001` hosts multiple attrs (`checksum_algo`, `code`, and others keyed through distinct attr identifiers). Likewise, `DROP-0002` links a `created_date` across several enforcement records while sharing integer attributes (`DROP-0006`, `DROP-0008`) with sibling entities. This identifier-centric linking is why governance frameworks insist on immutable keys and stable referential integrity: when an exit code, retry storm, or drop action is questioned months later, investigators must reconstruct the same entity–attribute graph without ambiguity.

Taken together, spans and categories describe *what* was running and how it is grouped; duration seconds, exit, and retry count describe *how it behaved under load*; entities, attrs, attr types, and misc describe *what factual claims attach to each observed subject*; and identifiers make those claims navigable across tools and time. Mature operational practice uses all of these dimensions jointly—correlating a long-running span with elevated retries and a non-success exit, then tracing downward to syscall metadata and kernel drop actions—to determine whether an anomaly reflects benign retry policy, a misconfigured observer, or an enforcement control operating as designed. That compositional reading, not any single field in isolation, is what turns telemetry storage into a defensible compliance narrative.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |