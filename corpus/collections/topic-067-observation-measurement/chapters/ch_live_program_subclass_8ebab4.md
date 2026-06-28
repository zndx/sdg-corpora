---
chapter_id: ch_live_program_subclass_8ebab4
topic_id: 67
family: 01_foundation
cited_terms: ['program_subclass', 'labrun_uses_instrument', 'metric_with_aggregation']
model: engine-refine
---

Attributes, their types, and the entities to which they attach constitute the foundational vocabulary of data governance, enabling precise tracking of lineage, compliance, and operational state across heterogeneous systems. An attribute is a named property—duration_seconds, end_time, exit_code, host_name—that describes some observable characteristic of an entity, while the attribute type constrains the domain of permissible values to a well-defined schema such as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This type discipline is not merely declarative; it governs how values are stored, validated, and queried. In the lab-run instrumentation domain, for instance, the attribute duration_seconds carries an xsd:decimal type and holds values like 397.40, 2693.73, 4636.55, and 1173.52, each representing a measured interval in seconds. The attribute end_time, typed as xsd:dateTime, anchors events to an absolute temporal coordinate—2023-07-28T22:24:46, 2024-09-04T14:41:30, 2025-06-09T20:56:36, 2024-06-06T14:47:39—while exit_code, an xsd:integer, encodes discrete status signals such as 889, 321, 608, and 248. String-valued attributes like host_name accept free-form identifiers including ingest-21, Log Level 02, execution, and superseded, demonstrating how textual metadata coexists with numerically typed measures within the same entity-attribute framework.

Entities are the identifiable things to which attributes bind: a lab run, a metric aggregation, a program subclass. Each entity receives a stable, machine-readable identifier that serves as the primary key for all its associated attribute values. In the program-subclass registry, identifiers such as PROG-0001, PROG-0002, PROG-0003, and PROG-0004 uniquely designate distinct data-processing pipelines—MetadataHarvest, DataQualityScan, AnomalyDetectionPipeline—each of which is characterized by a suite of operational attributes. The entity concept extends across domains: lab runs identified as RUN-2024-A7, PROT-XRAY-03, CYTO-20241022, and GENOME-READ-04 are linked to instrument aggregations (AGGR-0001 through AGGR-0005) through a many-to-many association table, while metric aggregations such as memory_usage_gigabytes, log_error_rate_per_minute, cpu_utilization_percent, and api_response_time_p99 each carry their own set of typed attributes including checksum, created_date, identifier, and license. The entity-attribute-value pattern—where a single entity_id and attr_id pair resolves to a typed value—allows the schema to remain open-ended: new attributes can be introduced without schema migration, and values are stored in type-specific tables (val_datetime, val_decimal, val_int, val_varchar, val_date) that partition by semantic type while remaining addressable through a common foreign-key structure.

**t_metric_with_aggregation**

| id | metric | aggregation_temporality |
| --- | --- | --- |
| AGGR-0001 | memory_usage_gigabytes | INST-0001 |
| AGGR-0002 | log_error_rate_per_minute | INST-0006 |
| AGGR-0003 | cpu_utilization_percent | INST-0001 |
| AGGR-0004 | api_response_time_p99 | INST-0002 |
| AGGR-0005 | queue_depth_messages | INST-0001 |
| AGGR-0006 | database_connection_pool_active | INST-0005 |
| AGGR-0007 | http_request_latency_ms | INST-0005 |
| AGGR-0008 | api_response_time_p99 | INST-0006 |

**t_metric_with_aggregation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | checksum | xsd:string |
| AGGR-0002 | created_date | xsd:date |
| AGGR-0003 | identifier | cco:DesignativeICE |
| AGGR-0004 | license | xsd:string |
| AGGR-0005 | mime_type | xsd:string |
| AGGR-0006 | size_bytes | xsd:long |
| AGGR-0007 | uri | xsd:string |
| AGGR-0008 | version | xsd:integer |

**t_metric_with_aggregation_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | 2025-01-26 |
| AGGR-0002 | AGGR-0002 | AGGR-0002 | 2024-12-19 |
| AGGR-0003 | AGGR-0003 | AGGR-0002 | 2025-05-29 |
| AGGR-0004 | AGGR-0004 | AGGR-0002 | 2024-03-19 |
| AGGR-0005 | AGGR-0005 | AGGR-0002 | 2023-09-16 |
| AGGR-0006 | AGGR-0006 | AGGR-0002 | 2023-04-28 |
| AGGR-0007 | AGGR-0007 | AGGR-0002 | 2024-03-10 |
| AGGR-0008 | AGGR-0008 | AGGR-0002 | 2024-10-06 |

**t_metric_with_aggregation_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0006 | 105 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | 11 |
| AGGR-0003 | AGGR-0002 | AGGR-0006 | 324 |
| AGGR-0004 | AGGR-0002 | AGGR-0008 | 2 |
| AGGR-0005 | AGGR-0003 | AGGR-0006 | 334 |
| AGGR-0006 | AGGR-0003 | AGGR-0008 | 9 |
| AGGR-0007 | AGGR-0004 | AGGR-0006 | 424 |
| AGGR-0008 | AGGR-0004 | AGGR-0008 | 12 |

**t_metric_with_aggregation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 1a4b6c2d |
| AGGR-0002 | AGGR-0001 | AGGR-0003 | ref-8842 |
| AGGR-0003 | AGGR-0001 | AGGR-0004 | Apache-2.0 |
| AGGR-0004 | AGGR-0001 | AGGR-0009 | zone-b |
| AGGR-0005 | AGGR-0001 | AGGR-0005 | text/plain |
| AGGR-0006 | AGGR-0001 | AGGR-0010 | Name 06 |
| AGGR-0007 | AGGR-0001 | AGGR-0011 | data-engineering |
| AGGR-0008 | AGGR-0001 | AGGR-0012 | Tags 08 |

Licenses and locations are first-class attributes that carry legal and infrastructural significance. A program subclass's license attribute records the governing terms under which the pipeline may be deployed or redistributed: GPL-3.0 for MetadataHarvest (PROG-0001), proprietary for DataQualityScan (PROG-0002), Apache-2.0 for the second MetadataHarvest instance (PROG-0003), and MIT for the AnomalyDetectionPipeline (PROG-0004). These are not decorative labels; they determine compliance obligations, redistribution rights, and audit requirements. Similarly, the location attribute captures the physical or logical deployment target of a pipeline—rack-7, us-east-1, ap-south-2—providing the operational context needed for capacity planning, data-residency verification, and incident response. In the metric-aggregation domain, the license attribute appears again as a varchar-typed property, with values such as Apache-2.0 recorded alongside identifiers like 1a4b6c2d and ref-8842, and zone-b, demonstrating that licensing metadata is not confined to a single entity class but recurs wherever software components are tracked.

**t_program_subclass**

| id | program | input | license | location |
| --- | --- | --- | --- | --- |
| PROG-0001 | MetadataHarvest | PostgreSQLSnapshot | GPL-3.0 | rack-7 |
| PROG-0002 | DataQualityScan | RESTApiPayload | proprietary | us-east-1 |
| PROG-0003 | MetadataHarvest | OracleStagingView | Apache-2.0 | ap-south-2 |
| PROG-0004 | AnomalyDetectionPipeline | CSVExportDump | MIT | us-east-1 |
| PROG-0005 | LogAggregationJob | ParquetPartition | BSD-3-Clause | us-east-1 |
| PROG-0006 | DataQualityScan | JSONTelemetryBatch | GPL-3.0 | us-east-1 |
| PROG-0007 | PatientCohortExtract | CSVExportDump | CC-BY-4.0 | us-east-1 |
| PROG-0008 | NightlyDataSync | ParquetPartition | GPL-3.0 | rack-7 |

The relationship between entities and their attributes is mediated by a type registry that defines each attribute's name and XSD or custom type, and by value tables that store the actual data. The attribute definition table t_labrun_uses_instrument_attr declares that INST-0001 corresponds to duration_seconds (xsd:decimal), INST-0002 to end_time (xsd:dateTime), INST-0003 to exit_code (xsd:integer), and INST-0004 to host_name (xsd:string). Corresponding value tables—t_labrun_uses_instrument_val_decimal, t_labrun_uses_instrument_val_datetime, t_labrun_uses_instrument_val_int, and t_labrun_uses_instrument_val_varchar—each hold rows keyed by a surrogate id, an entity_id that references the entity to which the attribute belongs, an attr_id that resolves to the attribute definition, and a value column typed to match the attribute's schema. This separation of attribute metadata from value storage enables type-safe queries without requiring a wide, sparse table: a query for all duration_seconds values joins through attr_id INST-0001 to the decimal value table, while a query for end_time values routes to the datetime table. The same pattern applies to metric aggregations, where attributes like checksum (xsd:string), created_date (xsd:date), identifier (cco:DesignativeICE), and license (xsd:string) are defined in t_metric_with_aggregation_attr and their values stored in t_metric_with_aggregation_val_varchar, t_metric_with_aggregation_val_date, and t_metric_with_aggregation_val_int.

**t_labrun_uses_instrument**

| id | labrun | uses |
| --- | --- | --- |
| INST-0001 | RUN-2024-A7 | AGGR-0004 |
| INST-0002 | PROT-XRAY-03 | AGGR-0001 |
| INST-0003 | CYTO-20241022 | AGGR-0001 |
| INST-0004 | GENOME-READ-04 | AGGR-0005 |
| INST-0005 | FIELD-MAP-09 | AGGR-0004 |
| INST-0006 | ASSAY-Q3-24 | AGGR-0005 |

**t_labrun_uses_instrument_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INST-0001 | duration_seconds | xsd:decimal |
| INST-0002 | end_time | xsd:dateTime |
| INST-0003 | exit_code | xsd:integer |
| INST-0004 | host_name | xsd:string |
| INST-0005 | log_level | xsd:string |
| INST-0006 | phase | xsd:string |
| INST-0007 | retry_count | xsd:integer |
| INST-0008 | scheduled_at | xsd:dateTime |

**t_labrun_uses_instrument_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0002 | 2023-07-28T22:24:46 |
| INST-0002 | INST-0001 | INST-0008 | 2024-09-04T14:41:30 |
| INST-0003 | INST-0001 | INST-0009 | 2025-06-09T20:56:36 |
| INST-0004 | INST-0002 | INST-0002 | 2024-06-06T14:47:39 |
| INST-0005 | INST-0002 | INST-0008 | 2025-04-06T19:57:44 |
| INST-0006 | INST-0002 | INST-0009 | 2023-06-18T12:50:38 |
| INST-0007 | INST-0003 | INST-0002 | 2023-05-25T22:41:33 |
| INST-0008 | INST-0003 | INST-0008 | 2023-09-07T05:37:31 |

**t_labrun_uses_instrument_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0001 | 397.40 |
| INST-0002 | INST-0002 | INST-0001 | 2693.73 |
| INST-0003 | INST-0003 | INST-0001 | 4636.55 |
| INST-0004 | INST-0004 | INST-0001 | 1173.52 |
| INST-0005 | INST-0005 | INST-0001 | 1814.21 |
| INST-0006 | INST-0006 | INST-0001 | 5265.62 |

**t_labrun_uses_instrument_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0003 | 889 |
| INST-0002 | INST-0001 | INST-0007 | 321 |
| INST-0003 | INST-0002 | INST-0003 | 608 |
| INST-0004 | INST-0002 | INST-0007 | 248 |
| INST-0005 | INST-0003 | INST-0003 | 589 |
| INST-0006 | INST-0003 | INST-0007 | 121 |
| INST-0007 | INST-0004 | INST-0003 | 16 |
| INST-0008 | INST-0004 | INST-0007 | 442 |

**t_labrun_uses_instrument_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0004 | ingest-21 |
| INST-0002 | INST-0001 | INST-0005 | Log Level 02 |
| INST-0003 | INST-0001 | INST-0006 | execution |
| INST-0004 | INST-0001 | INST-0010 | superseded |
| INST-0005 | INST-0001 | INST-0011 | Triggered By 05 |
| INST-0006 | INST-0002 | INST-0004 | worker-07 |
| INST-0007 | INST-0002 | INST-0005 | Log Level 07 |
| INST-0008 | INST-0002 | INST-0006 | review |

Identifier conventions and cross-entity relationships provide the connective tissue that turns isolated attribute-value pairs into a coherent data model. The instrument-aggregation association table t_labrun_uses_instrument maps lab runs to their constituent metric aggregations: RUN-2024-A7 uses AGGR-0004, PROT-XRAY-03 uses AGGR-0001, CYTO-20241022 uses AGGR-0001, and GENOME-READ-04 uses AGGR-0005. This many-to-many relationship allows a single lab run to draw on multiple metric sources and a single metric aggregation to serve multiple runs. The aggregation_temporality column in t_metric_with_aggregation further qualifies each metric by referencing an instrument identifier (INST-0001, INST-0006, INST-0002), linking the metric's temporal semantics back to the instrumentation infrastructure. Meanwhile, the program-subclass table t_program_subclass ties each pipeline identifier to its input source—PostgreSQLSnapshot, RESTApiPayload, OracleStagingView, CSVExportDump—creating a lineage chain from raw data source through processing pipeline to deployment location. Together, these relationships form a graph in which entities are nodes, attributes are typed edges, and values are the leaf data that can be audited, queried, and traced back to their origin.