---
chapter_id: ch_live_program_subclass_4d606f
topic_id: 46
family: 01_foundation
cited_terms: ['program_subclass', 'lineage_edge_with_provenance', 'schemaorg_event_endtime']
model: engine-refine
---

Effective data governance relies on a consistent identifier scheme that anchors every asset, lineage edge, and lifecycle event to a single source of truth. Across the metadata registry, program subclasses are assigned sequential identifiers such as PROG-0001 and PROG-0002, while provenance edges tracking data flow between services use PROV-0001 through PROV-0004. Event lifecycle records follow a parallel convention with ENDT-0001 and similar tokens, ensuring that every operational artifact can be unambiguously referenced regardless of its origin. These identifiers serve as the primary keys that bind disparate tracking tables together, allowing auditors and platform engineers to trace a single pipeline from its initial classification through its execution edges and final state transitions without ambiguity.

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

Compliance and infrastructure planning demand precise tracking of where assets reside and under what terms they operate. The license dimension captures the legal framework governing each pipeline component, ranging from permissive open-source agreements like Apache-2.0 and MIT to restrictive proprietary licenses and copyleft mandates such as GPL-3.0. This classification directly informs risk assessments, audit trails, and dependency management, particularly when components interact across organizational boundaries. Coupled with geographic and infrastructural location metadata—such as deployments anchored to rack-7, us-east-1, or ap-south-2—these fields enable capacity planners and security teams to enforce data residency policies, optimize latency, and maintain clear boundaries for regulatory compliance across distributed environments.

Interoperability and operational clarity depend heavily on standardized encoding and descriptive labeltext within the lineage graph. As data traverses between systems, character encoding specifications such as utf8, unicode, and ascii dictate how byte sequences are interpreted across heterogeneous services, preventing corruption during transit between components like the Audit-Trail-Service and Edge-Gateway-Router. Alongside these technical specifications, human-readable labeltext provides immediate context for monitoring dashboards and incident response workflows. Entries ranging from nightly summary to calibration record allow engineers to quickly distinguish between routine batch aggregations and precision-critical sensor updates, ensuring that provenance edges carry both machine-parseable structure and semantic meaning for downstream consumers.

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

Lifecycle management and resource allocation are governed through event end time tracking, version control, and size bytes, structured around a deliberate foreign-key relationship between the dimension and fact tables. The event end time dimension categorizes terminal states for pipeline runs, assigning each to a structured category such as Event End Time Category 01 through 04, while auxiliary misc labels provide supplementary context for reporting interfaces. These categorical markers are cross-referenced via event end time keys that function as foreign keys linking back to the central fact table, where version numbers and size metrics quantify the exact state of each execution. Payload sizes fluctuate significantly across runs—recordings span from approximately 114 megabytes to nearly 1 gigabyte—while version identifiers increment from 3 to 8, reflecting iterative schema evolution. Together, this relational mapping enables capacity forecasting, storage tiering decisions, and precise rollback procedures when downstream consumers require specific historical states.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |