---
chapter_id: ch_live_process_with_participant_4f90a4
topic_id: 0
family: 01_foundation
cited_terms: ['process_with_participant', 'schemaorg_place_latitude', 'subclass_to_process']
model: engine-refine
---

Operational metadata is anchored by a disciplined hierarchy of identifiers, attributes, and typed values that together enforce schema stability across heterogeneous process registries. Each participant or subclass is assigned a unique identifier—such as PART-0001 or PROC-0001—that serves as the immutable reference point for all downstream telemetry. Attributes (attr) like duration_seconds, end_time, exit_code, and host_name define the measurable dimensions of these processes, while their corresponding attr_type declarations (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string) impose strict serialization boundaries. This separation of schema definition from value storage ensures that temporal markers, such as 2024-06-12T21:46:50, and numeric thresholds, like 565.34 or 231, are persisted in type-isolated stores, eliminating ambiguity during cross-system reconciliation.

**t_process_with_participant**

| id | process | related |
| --- | --- | --- |
| PART-0001 | access review | validation suite |
| PART-0002 | network synchronization | scheduler service |
| PART-0003 | compliance audit | training cluster |
| PART-0004 | compliance audit | ingestion pipeline |
| PART-0005 | network synchronization | ingestion pipeline |
| PART-0006 | schema migration | scheduler service |
| PART-0007 | schema migration | compliance dataset |
| PART-0008 | quality assurance | validation suite |

**t_process_with_participant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PART-0001 | duration_seconds | xsd:decimal |
| PART-0002 | end_time | xsd:dateTime |
| PART-0003 | exit_code | xsd:integer |
| PART-0004 | host_name | xsd:string |
| PART-0005 | log_level | xsd:string |
| PART-0006 | phase | xsd:string |
| PART-0007 | retry_count | xsd:integer |
| PART-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

The entity column functions as the primary foreign-key bridge, binding each misc value back to its originating process or participant record. Rather than collapsing heterogeneous data into a single denormalized column, the architecture distributes values across dedicated repositories: datetime entries resolve to ISO-8601 timestamps, decimal fields capture fractional measurements, integer columns store discrete counts, and varchar stores retain categorical strings such as gw-12, Log Level 02, or failed. This partitioned value model preserves type fidelity while allowing the registry to scale horizontally; new attribute definitions can be introduced without restructuring existing value tables, and historical telemetry remains queryable through deterministic entity_id and attr_id joins.

**t_process_with_participant_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0002 | 2024-06-12T21:46:50 |
| PART-0002 | PART-0001 | PART-0008 | 2024-08-24T17:43:03 |
| PART-0003 | PART-0001 | PART-0009 | 2024-02-26T12:31:34 |
| PART-0004 | PART-0002 | PART-0002 | 2023-09-13T23:16:55 |
| PART-0005 | PART-0002 | PART-0008 | 2023-09-18T01:53:27 |
| PART-0006 | PART-0002 | PART-0009 | 2023-12-19T06:07:05 |
| PART-0007 | PART-0003 | PART-0002 | 2025-02-28T12:35:26 |
| PART-0008 | PART-0003 | PART-0008 | 2023-01-21T19:46:12 |

**t_process_with_participant_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0001 | 565.34 |
| PART-0002 | PART-0002 | PART-0001 | 6522.24 |
| PART-0003 | PART-0003 | PART-0001 | 236.49 |
| PART-0004 | PART-0004 | PART-0001 | 5070.41 |
| PART-0005 | PART-0005 | PART-0001 | 5946.70 |
| PART-0006 | PART-0006 | PART-0001 | 6238.25 |
| PART-0007 | PART-0007 | PART-0001 | 1191.07 |
| PART-0008 | PART-0008 | PART-0001 | 3672.98 |

**t_process_with_participant_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0003 | 231 |
| PART-0002 | PART-0001 | PART-0007 | 324 |
| PART-0003 | PART-0002 | PART-0003 | 759 |
| PART-0004 | PART-0002 | PART-0007 | 24 |
| PART-0005 | PART-0003 | PART-0003 | 283 |
| PART-0006 | PART-0003 | PART-0007 | 408 |
| PART-0007 | PART-0004 | PART-0003 | 247 |
| PART-0008 | PART-0004 | PART-0007 | 74 |

**t_process_with_participant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0004 | gw-12 |
| PART-0002 | PART-0001 | PART-0005 | Log Level 02 |
| PART-0003 | PART-0001 | PART-0006 | review |
| PART-0004 | PART-0001 | PART-0010 | failed |
| PART-0005 | PART-0001 | PART-0011 | Triggered By 05 |
| PART-0006 | PART-0002 | PART-0004 | node-b14 |
| PART-0007 | PART-0002 | PART-0005 | Log Level 07 |
| PART-0008 | PART-0002 | PART-0006 | execution |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

Classification and dimensional indexing are managed through a parallel lattice of category and latitude constructs. Latitude identifiers (LATI-0001 through LATI-0005) act as stable anchors for data assets, while latitude_label fields provide human-readable descriptors and latitude_category fields enforce hierarchical grouping. The latitude_key column establishes referential links between the dimensional registry and the operational fact tables, enabling assets to be tagged, filtered, and aggregated by categorical boundaries such as Latitude Category 01 or Latitude Category 03. This dual-layer taxonomy supports both granular asset tracking and broad compliance partitioning, ensuring that metadata remains navigable regardless of scale.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

Lifecycle governance is further reinforced by quantitative and temporal markers: size_bytes and version. The size_bytes column records the exact byte footprint of associated data assets, with observed values ranging from 114301972 to 998785819, providing immediate visibility into storage consumption and transfer overhead. Version numbers, incrementing from 3 through 8 across the registry, track schema evolution and asset revisions, allowing auditors to reconstruct historical states and verify compliance baselines. Together, these metrics transform static metadata into a living inventory, where every process, attribute, and classified asset carries an auditable trail of its operational and structural history.

In practice, this architecture yields a governance framework that is both rigid in its type constraints and flexible in its extensibility. By decoupling attribute definitions from their typed values, linking them through deterministic entity references, and overlaying categorical latitude classifications with quantitative lifecycle metrics, the system supports continuous auditability without sacrificing query performance. Process registries can evolve independently of their underlying telemetry stores, while versioned, size-tracked assets remain fully traceable across compliance boundaries. The result is a metadata substrate that scales with operational complexity while maintaining strict referential integrity and type safety.