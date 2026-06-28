---
chapter_id: ch_live_ebpf_event_min_one_attribute_237021
topic_id: 19
family: 02_observation_measurement
cited_terms: ['ebpf_event_min_one_attribute', 'universal_generic', 'state_basic']
model: engine-refine
---

The attribute-value model organizes observational data around a typed schema in which each attribute carries a formal type designation that governs interpretation of its values. An attribute identifier such as ATTR-0001 maps to a semantic name—duration_seconds, end_time, exit_code, host_name—and a corresponding type from the XSD vocabulary, including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This separation of metadata from value ensures that heterogeneous data types remain distinguishable and that downstream consumers can apply the correct parsing and validation logic without ambiguity. The ebpf event layer anchors these attributes to concrete system events: perf_event_sample, xdp_rx_drop, and tc_ingress_filter, each of which may carry a distinct set of attribute measurements depending on the event's nature and the instrumentation configuration.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

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

Values are stored in type-specific tables keyed by the attribute identifier and an entity reference that identifies the subject of the observation. Decimal-valued attributes such as duration_seconds hold measurements like 2938.76, 3337.03, 6550.82, and 5328.03, while integer-valued attributes capture exit codes and counters in the range of 59 to 938. Temporal attributes record timestamps in ISO 8601 format, for example 2024-05-05T15:51:23 and 2023-02-23T16:05:24, and string-valued attributes carry free-form labels such as node-b14, Log Level 02, initiation, and pending. The entity identifier in each value row establishes the provenance of the measurement, enabling queries that reconstruct the complete attribute profile for a given entity across all observed dimensions.

The state dimension provides a categorical framework for interpreting and classifying observations within a broader governance structure. Each state key is associated with a human-readable label—State Label 01 through State Label 04—and a category designation—State Category 01 through State Category 04—that situates the state within an organizational taxonomy. This categorical layer supports aggregation and reporting by grouping states into meaningful classes, while the labels provide an interface suitable for operational dashboards and audit documentation. The universal generic table extends this taxonomy by mapping identifiers such as GENE-0001 through GENE-0004 to conceptual nodes including Governance Framework, Taxonomy Node, Event Category, and Validation Pattern, each linked to a related format or stream such as CSV Stream, Parquet Format, Binary Blob, or YAML Config.

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | CSV Stream |
| GENE-0002 | Taxonomy Node | Parquet Format |
| GENE-0003 | Event Category | Binary Blob |
| GENE-0004 | Validation Pattern | YAML Config |
| GENE-0005 | Compliance Rule | MessagePack |
| GENE-0006 | Taxonomy Node | XML Document |
| GENE-0007 | Compliance Rule | Parquet Format |
| GENE-0008 | Data Standard | JSON Schema |

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

Confidence and uncertainty quantify the reliability of state observations and form an essential component of any governance framework that must account for measurement imprecision. Each state fact carries a confidence score ranging from 0.012 to 0.523, indicating the degree of certainty assigned to the recorded value, and an uncertainty magnitude ranging from 366.30 to 951.90, representing the estimated error bound. A state with confidence 0.523 and uncertainty 366.30 conveys substantially more assurance than one with confidence 0.012 and uncertainty 416.12, even when the underlying measured values—195.86, 143.04, 237.15, 619.50—fall within overlapping ranges. These paired metrics enable downstream systems to weight observations appropriately, suppress low-confidence readings, and flag states that require manual review before being incorporated into compliance reports or operational decisions.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |