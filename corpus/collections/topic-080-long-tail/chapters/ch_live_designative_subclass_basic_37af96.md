---
chapter_id: ch_live_designative_subclass_basic_37af96
topic_id: 80
family: 01_foundation
cited_terms: ['designative_subclass_basic', 'lineage_edge_describes_column_flow', 'kernel_event_with_tid']
model: engine-refine
---

Every operational record begins with a stable identifier that anchors its lifecycle across distributed systems, functioning as the immutable reference point for all downstream joins and audit trails. These identifiers, formatted as sequential tokens such as DESI-0001 or TID-0001, are paired with categorical classifications that segment records into standardized taxonomies, ensuring that heterogeneous data streams can be routed to appropriate processing pipelines. Localization is similarly explicit; language codes like fr and es are attached at the designative layer, allowing downstream consumers to resolve semantic variants without ambiguity. When an entity is instantiated, it inherits this structured metadata envelope, which guarantees that every subsequent attribute assignment or value injection can be traced back to a single, verifiable origin point.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

The separation of attribute definitions from their concrete values enforces strict type discipline across the data fabric. Each attr is registered with a precise attr type—xsd:decimal for continuous measurements, xsd:dateTime for temporal boundaries, xsd:integer for discrete counters, and xsd:string for unstructured labels—before any payload is committed. This typed architecture routes heterogeneous payloads into dedicated storage segments, where the misc column accommodates the actual measured values: a duration_seconds metric might resolve to 5060.73, an exit_code registers as 883, and a host_name materializes as gw-12. By decoupling the schema registry from the value repository, the system accommodates sparse attribute sets without penalizing storage efficiency, while simultaneously guaranteeing that type coercion never occurs at query time.

Data lineage and quality assurance are embedded directly into the fact layer through confidence and uncertainty metrics that quantify the reliability of each recorded observation. A confidence score of 0.779 indicates a high-fidelity derivation, whereas a reading of 0.071 signals a heavily interpolated or low-trust measurement, immediately flagging the record for manual review or algorithmic down-weighting. These probabilistic assessments are paired with absolute uncertainty bounds—ranging from 76.69 to 708.23—that establish the acceptable deviation envelope for downstream analytics. The lineage chain itself is governed by a describes column flow hierarchy, where each flow key maps to a categorical label and a standardized processing category, creating an auditable pipeline that documents exactly how raw signals were transformed, aggregated, or filtered before reaching the analytical layer.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

In practice, this relational architecture functions as a governance-ready data fabric, where every value injection is simultaneously typed, localized, and quality-scored. When a kernel event from ZFS on Linux or Darwin 22.4.0 is captured, its thread identifier, temporal markers, and performance counters are resolved through foreign-key joins that respect the underlying type constraints. The system does not merely store data; it preserves the provenance context required for regulatory compliance, enabling auditors to reconstruct the exact transformation path from raw telemetry to final metric. By embedding confidence thresholds, uncertainty bounds, and categorical classifications into the query plane, operators can enforce data quality SLAs programmatically, ensuring that only validated, traceable observations influence critical decision workflows.

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | 11475 |
| TID-0002 | Darwin 22.4.0 | 15634 |
| TID-0003 | FreeBSD 13.2 | 9001 |
| TID-0004 | Linux 5.15.0 | 9001 |
| TID-0005 | ZFS on Linux | 15634 |
| TID-0006 | Red Hat 4.18 | 3320 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |