---
chapter_id: ch_live_yager_combination_4177ca
topic_id: 46
family: 07_long_tail
cited_terms: ['yager_combination', 'program_subclass', 'subclass_to_process']
model: engine-refine
---

In enterprise data governance, every asset must be uniquely identifiable and richly described to support auditability, compliance, and operational traceability. Identifiers serve as the immutable anchor for each entity in the system—whether that entity is a fusion component such as `COMB-0001` (associated with the `FusionGateway-Nine` yager) or a program subclass like `PROG-0001` (the `MetadataHarvest` pipeline). These identifiers are not arbitrary; they follow structured naming conventions that encode lineage and enable deterministic joins across the data model. The yager combination domain, for instance, tracks fusion components like `FusionNode-Alpha` and `ProvenanceEngine-Three`, each uniquely keyed so that downstream relationships can be resolved without ambiguity.

**t_yager_combination**

| id | yager |
| --- | --- |
| COMB-0001 | FusionGateway-Nine |
| COMB-0002 | FusionNode-Alpha |
| COMB-0003 | FusionGateway-Nine |
| COMB-0004 | ProvenanceEngine-Three |
| COMB-0005 | FusionNode-Alpha |
| COMB-0006 | TelemetryOrchestrator |

**t_yager_combination_yager_combines**

| id | yager_combines |
| --- | --- |
| COMB-0001 | RadarPulse-Data |
| COMB-0002 | SpectralData-Set |
| COMB-0003 | VibrationSensor-Nine |
| COMB-0004 | RadarPulse-Data |
| COMB-0005 | LidarScan-2023 |
| COMB-0006 | TelemetryStream-Alpha |
| COMB-0007 | AcousticArray-Alpha |

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

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

The attributes and attribute types layer provides the schema for describing entities in a type-safe manner. Rather than hardcoding columns for every possible property, the model defines attributes as first-class descriptors—`duration_seconds`, `end_time`, `exit_code`, and `host_name`—each bound to an XML Schema type such as `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, or `xsd:string`. This separation of attribute definition from attribute value enables flexible, extensible metadata management. A process like `incident response` (identified as `PROC-0001`) can carry a duration of `5106.96` seconds, an exit code of `684`, and a hostname of `worker-07`, all referencing the same attribute definitions but stored in type-specific value tables. The type discipline ensures that `2024-02-25T00:58:35` is always treated as a datetime, never as a string, preserving data integrity across queries and reports.

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

Entity-attribute-value relationships are materialized through typed value tables that link an entity to an attribute and store the actual value. The `entity_id` column points to the entity being described, the `attr_id` column references the attribute definition, and the `value` column holds the misc data—whether it is a decimal like `6532.76`, an integer like `195`, a datetime like `2025-01-11T16:52:13`, or a varchar like `pending`. This design allows a single entity such as `PROC-0001` to accumulate heterogeneous properties across multiple value tables without schema changes. The same attribute, `exit_code`, might hold the value `684` for one entity and `63` for another, while `host_name` might resolve to `worker-07` in one context and `Log Level 02` in another, demonstrating how the model supports diverse operational telemetry within a uniform structure.

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

Licensing and location metadata provide the regulatory and infrastructural context for each program subclass. A program like `DataQualityScan` carries a `proprietary` license, signaling restricted usage, while `MetadataHarvest` is governed by `GPL-3.0` and `AnomalyDetectionPipeline` by `MIT`, each imposing distinct compliance obligations on operators. Location data—`rack-7` for on-premises hardware, `us-east-1` and `ap-south-2` for cloud regions—anchors programs to their deployment topology, enabling cost allocation, data residency checks, and incident response routing. The input source, whether a `PostgreSQLSnapshot`, `RESTApiPayload`, `OracleStagingView`, or `CSVExportDump`, further contextualizes the data lineage, ensuring that auditors can trace a program's outputs back to their provenance.

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

Relationships between entities are expressed through subject-target-role triples, which capture not just connectivity but the nature of the connection. In the yager combination domain, the junction table links a subject—such as `COMB-0003`—to a target like `COMB-0006` under a specific role: `observer`, `contributor`, or `owner`. These roles are semantically significant; a `contributor` actively participates in the combination, while an `observer` monitors it, and an `owner` holds stewardship. The same pattern appears in the combination-to-combine mapping, where `COMB-0001` combines `RadarPulse-Data` and `COMB-0004` combines `VibrationSensor-Nine`, establishing a directed graph of dependencies that can be traversed for impact analysis or dependency resolution.

**t_yager_combination__yager_combines**

| id | yager_id | yager_combines_id | role |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0003 | COMB-0006 | observer |
| COMB-0002 | COMB-0006 | COMB-0004 | contributor |
| COMB-0003 | COMB-0006 | COMB-0007 | contributor |
| COMB-0004 | COMB-0001 | COMB-0003 | owner |
| COMB-0005 | COMB-0002 | COMB-0002 | reviewer |
| COMB-0006 | COMB-0006 | COMB-0005 | observer |
| COMB-0007 | COMB-0002 | COMB-0004 | contributor |
| COMB-0008 | COMB-0004 | COMB-0005 | observer |

Together, these constructs form a cohesive governance fabric: identifiers provide uniqueness, attributes and their types define the descriptive vocabulary, entity-attribute-value tables store the actual data, licensing and location supply compliance context, and subject-target-role triples encode the relational topology. This architecture supports both rigid compliance requirements—such as verifying that a `GPL-3.0` program is not deployed in a restricted region—and operational flexibility, allowing new attributes and relationships to be added without schema migrations. The result is a system where every asset is discoverable, every property is typed and auditable, and every relationship is explicit and role-aware.