---
chapter_id: ch_live_kernelhook_basic_969d2e
topic_id: 61
family: 04_ebpf_kernel
cited_terms: ['kernelhook_basic', 'trace_with_attributes', 'trace_with_root_span']
model: engine-refine
---

Kernel observability and distributed tracing both depend on a disciplined separation between what a record *is*, what can be said *about* it, and the typed facts that substantiate governance claims. An **identifier** is the durable handle that survives re-indexing, federation, and audit replay: KERN-0001 through KERN-0004 name distinct hook implementations (Tracepoint-block-io, BPF-co-re-syscall, Kprobes-schedule, Fentry-kernel-init), while ATTR-0001 through ATTR-0004 anchor trace envelopes such as batch-exec-094 and gateway-span-55, and SPAN-0001 through SPAN-0004 key root-span facts in the analytical layer. Without such designators, cross-table joins, retention policies, and evidentiary chains collapse into ambiguous text; with them, every downstream assertion—license posture, creation date, exit code, host identity—can be attributed to exactly one governed object.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

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

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

An **entity** is the subject of description, not the description itself. Registry rows name hooks and traces, but attribute values are always scoped by **entity_id**, so the same logical field (for example created_date, keyed as KERN-0002 in the attribute dictionary) can be asserted independently per hook: 2023-02-05 for KERN-0001, 2024-05-21 for KERN-0002, 2024-01-08 for KERN-0003, and 2025-01-30 for KERN-0004. The pattern repeats in telemetry: duration_seconds, end_time, and exit_code attach to ATTR-0001 and ATTR-0002 without conflating batch-exec-094 with session-gamma-9. Entity-centric modeling is what makes partial updates, differential compliance review, and per-artifact versioning legally and operationally legible; it prevents a global “miscellaneous” blob from becoming the system of record.

An **attr** names the semantic slot; **attr_type** constrains how the slot may be populated and validated. Checksum and license are both carried as xsd:string, yet they answer different control questions—integrity evidence versus distribution rights—while created_date demands xsd:date and trace timing fields require xsd:dateTime, as when end_time records 2024-07-09T10:21:53 for ATTR-0001 or 2023-03-03T12:52:58 for ATTR-0002. Specialized types such as cco:DesignativeICE for identifier signal that some attributes participate in identity schemes beyond primitive literals. Typed value stores (integer, decimal, varchar, date, datetime) exist because governance is enforced at validation time: exit_code 445 and 106 remain integers, duration_seconds 1085.14 and 3252.57 remain decimals, and host_name values like gw-12 remain strings—mixing representations would break thresholds, SLAs, and automated policy engines that reason on magnitude and chronology rather than on display text.

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

The catch-all **misc** column is not an invitation to unstructured chaos; in practice it holds the residual payload that is still material to operations yet ill-suited to a dedicated typed column—Apache-2.0 on a license attribute, gid://svc/77 on a service identifier, Log Level 02 on a diagnostic facet, or superseded on a lifecycle marker. Likewise, **category** classifies entities for rollup reporting and control selection: root_span_category values Root Span Category 01 through Root Span Category 04 partition root spans so that size and version statistics can be compared within a class rather than across incomparable workloads. Misc and category together answer the auditor’s question of *what kind of thing this is* and *what human-readable fact attaches to it* when the formal type system has deliberately narrow boundaries.

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

**Root span** is the anchoring node from which a trace hierarchy is interpreted for storage accounting and release management. In the fact layer, root_span_key ties measurable artifacts to SPAN-0002, SPAN-0004, or SPAN-0005—note that two fact rows may legitimately reference the same root span key when distinct payloads (SPAN-0003 and SPAN-0004 both at SPAN-0005) represent separate ingested bundles under one logical root. Dimension labels (Root Span Label 01 through Root Span Label 04) provide interpretive context without overloading the key. **Size_bytes** quantifies the retained footprint—475324433 versus 941223628 versus 70626790 versus 953122943—so capacity planning, cost allocation, and deletion prioritization can be evidence-based rather than nominal. **Version** (12, 8, 12, 4 in the sample) records the schema or ingestion generation under which the span was materialized, which matters when replaying historical traces after a breaking change: a version mismatch is not a cosmetic label but a warning that attribute semantics, unit scales, or mandatory fields may differ from the current control baseline.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

Eventually, every compliance narrative reduces to whether identifiers resolve, entities carry the right typed attrs, categories scope the right populations, and root-span facts reconcile size and version with the operational story told by the attributes themselves—checksum a3f9c21e on KERN-0001, integer counters 323 and 12 on the same entity, decimal latencies in the thousands of seconds on ATTR-0001 through ATTR-0004, and varchar host and status tokens that tie telemetry back to named infrastructure. That is why these primitives are not catalog columns to be memorized but contractual joints: they are how an organization proves, long after the original engineer has moved on, that a kernel hook was licensed, dated, measured, and retained under a known root span at a known byte cost and a known version—dense, checkable, and fit for audit.