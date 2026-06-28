---
chapter_id: ch_live_primary_key_designation_4a1314
topic_id: 186
family: 07_long_tail
cited_terms: ['primary_key_designation', 'constraint_only_constrains', 'program_subclass']
model: engine-refine
---

Identifier schemes form the backbone of any governed data ecosystem, providing stable, unambiguous references that persist across system boundaries and time. Within the primary key designation framework, identifiers such as DESI-0001 through DESI-0004 serve as stable handles for domain objects ranging from clinical trial cohorts and laboratory specimens to telemetry identifiers and sensor calibrations. Each identifier anchors a specific primary key—hardware serial numbers, laboratory specimen records, manufacturing batch records, or asset inventory entries—ensuring that the same entity can be referenced consistently whether it appears in a procurement system, a quality management database, or a regulatory filing. Similarly, constraint identifiers like CONS-0001 through CONS-0004 provide stable references for governance rules, mapping constraints such as log level filters, checksum algorithms, and data retention policies to the systems they govern, whether that be a query engine, a network interface, or telemetry streams.

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | clinical_trial_cohort |
| DESI-0002 | lab_specimens | lab_specimens |
| DESI-0003 | manufacturing_batches | telemetry_id |
| DESI-0004 | asset_inventory | sensor_calibrations |
| DESI-0005 | network_traffic_db | hardware_sn |
| DESI-0006 | manufacturing_batches | manufacturing_batches |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

Attributes and their types define the semantic structure of these entities, establishing what properties can be measured, recorded, or enforced. The attribute registry assigns names like confidence, dimension kind, method, and recorded_at to conceptual properties, each bound to a precise data type from the XML Schema Definition namespace—xsd:decimal for numerical precision, xsd:string for categorical labels, and xsd:dateTime for temporal markers. This type discipline is not merely decorative; it governs how values are stored, validated, and compared across the system. For instance, a confidence score of 0.354 or 0.186 is stored as a decimal, while a dimension kind such as "Dimension Kind 01" or an encoding label like "Encoding 02" is stored as a string, and a timestamp like 2024-07-25T13:27:19 is stored as an ISO 8601 datetime. The same pattern applies to constraint attributes, where mandatory enforcement is captured as a boolean, priority as an integer, and effective dates as xsd:date values such as 2023-09-12 or 2025-06-06.

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

Entity instances materialize these abstract attribute definitions through typed value assignments, each row binding a specific entity to a specific attribute and producing a concrete value. An entity identified as DESI-0001 might carry a confidence decimal of 0.354, a dimension kind string of "Dimension Kind 01," and a recorded_at timestamp of 2024-07-25T13:27:19, while entity DESI-0002 might hold a confidence of 0.186 and a recorded_at of 2023-02-27T13:30:12. The value tables are partitioned by type—decimal, datetime, and varchar stores—so that the system can enforce schema-level constraints at query time without runtime type coercion. For constraints, entity CONS-0001 might have an effective date of 2023-09-12, a mandatory boolean of true, a priority integer of 4, and an enforcement string of "Enforcement 02," while entity CONS-0002 might carry the same constraint structure but with mandatory set to false and priority reduced to 1.

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

Licenses and locations ground these abstract entities in the operational and legal realities of the organizations that produce and consume them. A program subclass such as MetadataHarvest, which ingests data from a PostgreSQL snapshot and runs on rack-7, may be distributed under the GPL-3.0 license, while an AnomalyDetectionPipeline consuming CSV exports and deployed to us-east-1 carries an MIT license. The license field is not merely metadata; it determines redistribution rights, derivative work permissions, and compliance obligations for any downstream consumer of the software or data pipeline. Location fields—whether physical rack assignments like rack-7, cloud regions like us-east-1 and ap-south-2, or deployment targets—serve as routing hints for data residency compliance, latency optimization, and disaster recovery planning. A DataQualityScan running on a REST API payload under a proprietary license in us-east-1 carries different legal and operational implications than the same scan deployed to ap-south-2 under Apache-2.0, even though the underlying entity structure and attribute schema remain identical.

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