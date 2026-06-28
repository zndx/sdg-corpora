---
chapter_id: ch_live_histogram_metric_subclass_5b06bb
topic_id: 10
family: 07_long_tail
cited_terms: ['histogram_metric_subclass', 'ebpfmap_basic', 'trace_with_attributes']
model: engine-refine
---

In observability and kernel-telemetry governance, stable identifiers anchor every auditable fact to a durable surrogate key that survives relabeling, schema drift, and cross-system federation. Identifiers such as METR-0001 through METR-0004 for histogram facts, EBPF-0001 through EBPF-0004 for eBPF map inventory rows, and ATTR-0001 through ATTR-0004 for trace-bearing entities establish referential integrity across fact and dimension relations without binding operational records to volatile display strings. The identifier therefore functions not merely as a primary key but as the contractual handle through which compliance queries, retention policies, and lineage reports resolve the same logical object regardless of when a measurement was captured or which ingestion pipeline produced it.

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

Metric kind classifies histogram observations according to the semantic family of the underlying signal, and its governance significance lies in separating what is being measured from how much storage it consumes and which revision of the collection contract applied at capture time. Dimension records keyed METR-0001–METR-0004 carry human-readable labels—Metric Kind Label 01 through Metric Kind Label 04—and categorical placement within Metric Kind Category 01 through Metric Kind Category 04, while fact rows METR-0001–METR-0004 bind each histogram instance to a metric_kind_key, a size_bytes footprint, and a version stamp. Three of the four histogram facts reference METR-0005 as metric_kind_key, indicating that multiple physical histograms may share a single kind definition while differing in materialized size—239999637, 652318299, and 823666310 bytes respectively—and in version lineage (3, 9, and 5), whereas METR-0004 associates with METR-0003 at 194252236 bytes under version 3. Size bytes and version jointly encode the operational envelope: size_bytes quantifies on-disk or in-memory pressure attributable to a given artifact, and version records the schema or snapshot generation under which that footprint was observed, enabling auditors to distinguish stale aggregates from current ones and to trigger reclamation when byte counts exceed policy thresholds.

The ebpfmap construct names kernel eBPF map instances whose lifecycle, capacity, and categorical role must be inventoried with the same rigor applied to user-space metrics. Dimension entries EBPF-0001–EBPF-0004 pair ebpfmap labels (Ebpfmap Label 01–04) with ebpfmap categories (Ebpfmap Category 01–04), furnishing the controlled vocabulary in which security and platform teams classify map purpose. Fact records EBPF-0001–EBPF-0004 then materialize concrete map observations: EBPF-0001 references ebpfmap_key EBPF-0002 at 208979093 bytes and version 3, EBPF-0002 references EBPF-0005 at 156714508 bytes and version 6, EBPF-0003 references EBPF-0003 at 31105012 bytes and version 12, and EBPF-0004 references EBPF-0001 at 354373995 bytes and version 5. The deliberate mismatch between fact id and ebpfmap_key—each row’s foreign key points to a dimension identifier distinct from its own surrogate—mirrors common operational practice in which a telemetry row denotes a measurement event while the key resolves the canonical map definition, so that relabeling Ebpfmap Label 02 does not orphan historical byte totals.

Category and misc fields partition the descriptive plane from the quantitative plane. Category assigns each dimension member to a policy bucket—Metric Kind Category 03 for METR-0003, Ebpfmap Category 04 for EBPF-0004—so that roll-up reports, access controls, and retention schedules can operate on equivalence classes rather than on individual identifiers. Misc accommodates values that are neither keys nor typed measures: metric_kind_label and ebpfmap_label supply audit-facing prose, while in the trace-attribute subsystem misc holds the literal payload once entity and attr have fixed the binding context. This separation prevents category labels from being overloaded as data values and keeps misc from substituting for typed columns where comparability and validation rules depend on declared attr_type.

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Trace attributes instantiate the entity–attribute–value pattern that governs distributed execution evidence. An entity, identified as ATTR-0001 through ATTR-0004, denotes a trace context—batch-exec-094, session-gamma-9, gateway-span-55, or telemetry-flow-alpha—against which named attributes are asserted. Attribute definitions in attr declare the semantic slot (duration_seconds, end_time, exit_code, host_name), and attr_type fixes the validation contract in XSD terms: xsd:decimal for duration_seconds, xsd:dateTime for end_time, xsd:integer for exit_code, and xsd:string for host_name. Typed value relations then persist misc-encoded literals under entity_id and attr_id foreign keys, so that 1085.14 and 3252.57 attach as decimal duration_seconds on ATTR-0001 and ATTR-0002, exit_code values 445 and 567 attach as integers on ATTR-0001 and ATTR-0002, end_time stamps such as 2024-07-09T10:21:53 populate datetime slots, and host_name resolves to gw-12 alongside ancillary varchar misc values including Log Level 02, initiation, and superseded on the same entity ATTR-0001. Partitioning values by attr_type enforces type safety at rest, permits index strategies matched to comparison semantics, and allows compliance rules to reject, for example, a decimal in a datetime column before it contaminates downstream aggregates.

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

Taken together, identifier, metric kind, ebpfmap, category, attr, attr_type, entity, misc, size_bytes, and version constitute an interlocking governance fabric for telemetry inventory and trace evidentiary records. Identifiers and foreign keys weave histogram facts to metric kinds, eBPF map facts to map dimensions, and typed attribute values to trace entities and attribute schemas; category and misc supply the controlled language and literal content through which human operators interpret machine-captured facts; size_bytes and version quantify resource commitment and temporal contract for metrics and maps alike. Operational practice that honors this structure—recording version at every footprint observation, resolving ebpfmap_key to dimension before reporting labels, and never storing attr values without a matching attr_type—yields evidence chains sufficient for capacity attestation, kernel surface-area review, and trace-level forensic reconstruction without ambiguous coercion or schema silently outrunning the data it is meant to govern.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

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