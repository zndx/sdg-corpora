---
chapter_id: ch_live_directive_not_superseded_cd604a
topic_id: 195
family: 07_long_tail
cited_terms: ['directive_not_superseded', 'program_subclass', 'profiling_basic']
model: engine-refine
---

Compliance frameworks require that every directive be anchored to a stable identifier and cross-referenced to its governing authority. Within the non-superseded directive registry, identifiers such as SUPE-0001 through SUPE-0004 serve as the immutable keys by which regulatory instruments are tracked across their lifecycle. Each directive carries a human-readable designation—WHO Manufacturing Guide, EPA Emission Standard, OSHA Lockout Protocol—and is linked to a secondary standard or order, whether ISO Quality Management, ISO Information Standard, or CISA Operational Order. This dual-reference structure ensures that auditors can trace a single compliance obligation back through multiple regulatory layers without ambiguity, a requirement that becomes critical when directives span jurisdictional boundaries or when supersession chains must be reconstructed after policy revisions.

**t_directive_not_superseded**

| id | directive | directive_2 |
| --- | --- | --- |
| SUPE-0001 | WHO Manufacturing Guide | ISO Quality Management |
| SUPE-0002 | WHO Manufacturing Guide | ISO Information Standard |
| SUPE-0003 | EPA Emission Standard | ISO Information Standard |
| SUPE-0004 | OSHA Lockout Protocol | CISA Operational Order |
| SUPE-0005 | GLP Laboratory Practice | CISA Operational Order |
| SUPE-0006 | FDA Electronic Records | SOC Audit Standard |

Attributes and their types form the granular layer through which directives acquire operational meaning. The attribute registry defines properties such as effective_date, enforcement, mandatory, and priority, each bound to a strict type—xsd:date, xsd:string, xsd:boolean, xsd:integer—that governs validation and comparison semantics. Values are materialized in type-specific fact tables, where an entity identifier and an attribute identifier jointly resolve to a concrete value. A boolean attribute may resolve to true or false depending on the entity; a date attribute yields a value like 2023-02-05 or 2025-04-26; an integer attribute carries a magnitude such as 434 or 471; and a varchar attribute stores free-form text including Encoding 01, Enforcement 02, pre-release note, or ja. This separation of attribute schema from value storage permits type-safe querying while allowing the same attribute definition to be reused across hundreds of entities without schema drift.

**t_directive_not_superseded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUPE-0001 | effective_date | xsd:date |
| SUPE-0002 | enforcement | xsd:string |
| SUPE-0003 | mandatory | xsd:boolean |
| SUPE-0004 | priority | xsd:integer |
| SUPE-0005 | review_cycle_days | xsd:integer |
| SUPE-0006 | scope | xsd:string |
| SUPE-0007 | encoding | xsd:string |
| SUPE-0008 | label_text | xsd:string |

**t_directive_not_superseded_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0003 | false |
| SUPE-0002 | SUPE-0002 | SUPE-0003 | true |
| SUPE-0003 | SUPE-0003 | SUPE-0003 | false |
| SUPE-0004 | SUPE-0004 | SUPE-0003 | false |
| SUPE-0005 | SUPE-0005 | SUPE-0003 | true |
| SUPE-0006 | SUPE-0006 | SUPE-0003 | true |

**t_directive_not_superseded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0001 | 2023-02-05 |
| SUPE-0002 | SUPE-0002 | SUPE-0001 | 2025-04-26 |
| SUPE-0003 | SUPE-0003 | SUPE-0001 | 2023-02-14 |
| SUPE-0004 | SUPE-0004 | SUPE-0001 | 2025-06-15 |
| SUPE-0005 | SUPE-0005 | SUPE-0001 | 2023-09-27 |
| SUPE-0006 | SUPE-0006 | SUPE-0001 | 2024-06-22 |

**t_directive_not_superseded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0004 | 4 |
| SUPE-0002 | SUPE-0001 | SUPE-0005 | 434 |
| SUPE-0003 | SUPE-0002 | SUPE-0004 | 3 |
| SUPE-0004 | SUPE-0002 | SUPE-0005 | 471 |
| SUPE-0005 | SUPE-0003 | SUPE-0004 | 4 |
| SUPE-0006 | SUPE-0003 | SUPE-0005 | 762 |
| SUPE-0007 | SUPE-0004 | SUPE-0004 | 3 |
| SUPE-0008 | SUPE-0004 | SUPE-0005 | 766 |

**t_directive_not_superseded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0007 | Encoding 01 |
| SUPE-0002 | SUPE-0001 | SUPE-0002 | Enforcement 02 |
| SUPE-0003 | SUPE-0001 | SUPE-0008 | pre-release note |
| SUPE-0004 | SUPE-0001 | SUPE-0009 | ja |
| SUPE-0005 | SUPE-0001 | SUPE-0006 | Scope 05 |
| SUPE-0006 | SUPE-0002 | SUPE-0007 | Encoding 06 |
| SUPE-0007 | SUPE-0002 | SUPE-0002 | Enforcement 07 |
| SUPE-0008 | SUPE-0002 | SUPE-0008 | change rationale |

Program subclassifications introduce a second axis of governance, where each program is identified by a code such as PROG-0001 through PROG-0004 and classified by its operational role—MetadataHarvest, DataQualityScan, AnomalyDetectionPipeline. The input source, whether a PostgreSQLSnapshot, RESTApiPayload, OracleStagingView, or CSVExportDump, determines the ingestion contract and validation rules. Licensing terms—GPL-3.0, proprietary, Apache-2.0, MIT—govern redistribution and modification rights, while deployment location, ranging from rack-7 to us-east-1 to ap-south-2, anchors the program to a physical or virtual infrastructure domain. Together, these fields establish a compliance posture that is traceable from code license through data lineage to geographic residency.

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

Profiling metrics capture the runtime behavior of compliance checks and data quality assessments. The profiling dimension assigns a label and a category to each measurement, with category identifiers such as PROF-0008, PROF-0001, PROF-0007, and PROF-0005 grouping related assessments under shared taxonomies. The fact table records the duration in seconds—6716.87, 1113.38, 2546.61, 2074.93—alongside an exit code (725, 809, 348, 827) that signals the termination reason, and a retry count (209, 186, 303, 264) that quantifies how many times the system attempted recovery before finalizing the result. These three numeric fields, combined with the profiling key that links back to the dimension, enable root-cause analysis: a high retry count paired with a non-zero exit code and an elevated duration points to a systemic bottleneck, whereas a low retry count with a clean exit suggests transient noise. The category association then allows these anomalies to be aggregated across programs, locations, and licenses, producing the executive summaries that governance boards require.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |