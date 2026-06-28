---
chapter_id: ch_live_program_subclass_b469a3
topic_id: 168
family: 01_foundation
cited_terms: ['program_subclass', 'program_with_entry_exactly_one', 'provenance_agent_signs_audit']
model: engine-refine
---

Program artifacts are classified and tracked through a dual-layer provenance model that separates categorical metadata from execution telemetry. Each provenance record carries a category designation—Provenance Category 01 through Provenance Category 04—and a human-readable label such as Provenance Label 01, which together provide the organizational taxonomy required for audit trails and compliance reporting. These categorical attributes are stored in a dimension table and joined to the fact table on a shared identifier, ensuring that every execution event can be traced back to its classification without duplicating descriptive text across rows. The provenance key itself, exemplified by values like AUDI-0003 and AUDI-0007, serves as the foreign key linking execution facts to their dimensional metadata, and may reference other provenance records to express parent-child lineage within a pipeline.

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

Execution telemetry is captured through three quantitative fields that together characterize the reliability and resource consumption of a run. Duration seconds records the wall-clock time elapsed, ranging from 2216.74 seconds for a short-lived task to 6949.35 seconds for a prolonged operation, providing the basis for SLA monitoring and capacity planning. The exit code—values such as 256, 728, 452, and 985—encodes the termination status, with non-zero values indicating failure conditions that trigger downstream alerting or remediation workflows. Retry count quantifies resilience behavior, with observed values spanning from 23 retries for a stable job to 410 retries for a flaky process, offering a direct signal of operational instability that can be correlated with duration and exit outcomes to identify systemic issues.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

Program identity and deployment attributes are tracked across two complementary registries that distinguish between logical program definitions and their concrete entry-point bindings. The program subclass table assigns each logical program a unique identifier such as PROG-0001 through PROG-0004, along with a descriptive name like MetadataHarvest, DataQualityScan, or AnomalyDetectionPipeline, an input format specification including PostgreSQLSnapshot, RESTApiPayload, OracleStagingView, and CSVExportDump, a license designation covering GPL-3.0, proprietary, Apache-2.0, and MIT, and a deployment location such as rack-7, us-east-1, or ap-south-2. These attributes establish the governance baseline: license terms determine redistribution rights, location data supports data-residency compliance, and input format declarations inform integration contracts.

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

The program-with-entry registry binds logical programs to their concrete execution endpoints, introducing a second identifier field that carries resource-qualified ARN values like ARN:res/41 or short-form references such as ref-8842. This registry also records the entry point—api_gateway, main.py, or cron_trigger—which specifies the invocation mechanism, and a version number ranging from 3 to 12 that tracks the deployed revision. Multiple entries may share the same program and identifier pair, as seen with inventory_sync appearing twice under ARN:res/41 with versions 12 and 3, reflecting the ability to maintain parallel deployments or staged rollouts of the same logical program. The version field, in conjunction with the entry-point binding, provides the traceability needed to correlate execution telemetry back to the exact binary or configuration that produced it.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |