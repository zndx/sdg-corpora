---
chapter_id: ch_live_telemetry_span_observes_syscall_8722cc
topic_id: 24
family: 07_long_tail
cited_terms: ['telemetry_span_observes_syscall', 'kernelhook_with_hook_kind', 'dataset_revision_of']
model: engine-refine
---

Within distributed observability architectures, the identification of telemetry spans and their associated attributes demands a disciplined separation between declarative metadata and instance-level values. Each span is assigned a unique identifier—SYSC-0001 through SYSC-0004, for instance—that anchors it to a specific telemetry backend such as Prometheus, SignalFx Stream Processor, or Dynatrace OneAgent. The attributes that annotate these spans are themselves catalogued with precise type information: a field named `checksum_algo` carries the type `xsd:string`, while `issued_date` is typed as `xsd:date`, and `code` and `format` likewise resolve to `xsd:string`. This type discipline is not merely cosmetic; it governs how values are stored, validated, and queried across the system. Attribute values are partitioned into two value tables according to their declared type—date-valued attributes such as `issued_date` are persisted in a dedicated date store with concrete values like 2024-08-07, 2023-04-29, 2024-09-27, and 2023-06-07—while string-valued attributes such as `checksum_algo`, `code`, and `format` reside in a varchar store, holding entries like "Checksum Algo 01", "D-33", "Encoding 03", and "E.164". The entity column in each value table establishes the linkage between a span and its attribute-value pairs, ensuring that the attribute identified by SYSC-0001, for example, resolves to the string "Checksum Algo 01" for the entity SYSC-0001.

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

The kernel hook subsystem follows a parallel but distinct modelling pattern, where hook kinds are classified along two orthogonal dimensions: a human-readable label and a categorical grouping. The dimension table `dim_hook_kind` assigns each hook kind an identifier—KIND-0001 through KIND-0004—alongside a label such as "Hook Kind Label 01" and a category such as "Hook Kind Category 01". These categorical groupings provide a mechanism for aggregating and filtering hook instances by functional class, while the labels serve as display-friendly identifiers in operational dashboards and audit reports. The fact table `fact_kernelhook` materialises individual hook instances, each identified by its own key (KIND-0001 through KIND-0004) and linked to a hook kind through the `hook_kind_key` column, which references the dimension table. A single hook kind may thus be observed across multiple fact rows, and the dimension ensures that all instances sharing the same `hook_kind_key` inherit the same label and category.

**dim_hook_kind**

| id | hook_kind_label | hook_kind_category |
| --- | --- | --- |
| KIND-0001 | Hook Kind Label 01 | Hook Kind Category 01 |
| KIND-0002 | Hook Kind Label 02 | Hook Kind Category 02 |
| KIND-0003 | Hook Kind Label 03 | Hook Kind Category 03 |
| KIND-0004 | Hook Kind Label 04 | Hook Kind Category 04 |
| KIND-0005 | Hook Kind Label 05 | Hook Kind Category 05 |
| KIND-0006 | Hook Kind Label 06 | Hook Kind Category 06 |
| KIND-0007 | Hook Kind Label 07 | Hook Kind Category 07 |

Beyond classification, each kernel hook fact record carries quantitative metadata in the form of `size_bytes` and `version`. The size field captures the byte footprint of the hook binary or payload, with values ranging from approximately 27 million bytes (272,822,846 bytes for KIND-0004) to over 560 million bytes (560,962,979 bytes for KIND-0002), reflecting the substantial variance in hook complexity and capability. The version column encodes a semantic version number—values of 1, 3, and 10 appear in the observed data—enabling operators to track which revision of a hook is deployed and to enforce upgrade policies or rollback procedures. Together, size and version form a lightweight provenance record that, when joined to the hook kind dimension, yields a complete picture of what hook is deployed, what category it belongs to, how large it is, and which version is in use.

**fact_kernelhook**

| id | hook_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| KIND-0001 | KIND-0002 | 36342735 | 3 |
| KIND-0002 | KIND-0004 | 560962979 | 1 |
| KIND-0003 | KIND-0007 | 456299832 | 10 |
| KIND-0004 | KIND-0004 | 272822846 | 1 |

Dataset revision tracking introduces a third modelling domain, one concerned with lineage, format, and ownership rather than observability or kernel instrumentation. The table `t_dataset_revision_of` records that a given dataset—such as `sensor-fusion-calibration`, `customer-churn-features`, `satellite-telemetry-v2`, or `genomics-raw-reads-q3`—is a revision of a prior dataset, with the `was_revision_of` column establishing the parent-child lineage. A revision of `grid-load-forecast-base` might carry the MIME type `application/xml`, while a revision of `proteomics-mass-spec-v1` uses `application/octet-stream`, and a revision of `baseline-genomics-q2` is stored as `application/parquet`. The MIME type thus serves as a format contract, signalling to downstream consumers how the data should be parsed and interpreted. Ownership is tracked through the `owner` column, which in the observed data assigns datasets to either the `ml-infra` or `governance` team, providing a clear accountability boundary for data stewardship, access control, and compliance auditing.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |