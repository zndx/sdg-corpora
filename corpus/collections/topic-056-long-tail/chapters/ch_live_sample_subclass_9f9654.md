---
chapter_id: ch_live_sample_subclass_9f9654
topic_id: 56
family: 01_foundation
cited_terms: ['sample_subclass', 'schema_evolution_under_directive', 'schema_migration_subclass']
model: engine-refine
---

In operational governance, the integrity of any audit trail begins with the precise anchoring of assets through unique identifiers and their corresponding physical or logical locations. Within the sample tracking framework, distinct identifiers such as `SAMP-0001` and `SAMP-0002` serve as the primary keys for data artifacts, directly correlating to specific environmental or telemetry samples like `ENV-WATER-7B` and `TELEMETRY-PKG-9`. These samples are systematically collected from defined sources, predominantly `Data-Pipeline-Alpha` or specialized hardware like `Sensor-Array-7`, and their provenance is further cemented by external registry links such as `gid://svc/77` or `doi:10.1109/x`. Crucially, the location attribute dictates the jurisdictional and infrastructural context of the data; a sample might reside in a cloud region like `us-east-1` or `ap-south-2`, or it may be physically bound to an on-premises environment such as `rack-7` or `on-prem-dc1`, a distinction that is paramount for compliance and data sovereignty.

**t_sample_subclass**

| id | sample | collected_from | identifier | location |
| --- | --- | --- | --- | --- |
| SAMP-0001 | ENV-WATER-7B | Data-Pipeline-Alpha | gid://svc/77 | us-east-1 |
| SAMP-0002 | TELEMETRY-PKG-9 | Data-Pipeline-Alpha | gid://svc/77 | rack-7 |
| SAMP-0003 | TRACE-CACHE-5 | Sensor-Array-7 | ref-8842 | on-prem-dc1 |
| SAMP-0004 | SEDIMENT-LAKE-9 | Data-Pipeline-Alpha | doi:10.1109/x | ap-south-2 |
| SAMP-0005 | TELEMETRY-PKG-9 | Well-42 | ref-8842 | on-prem-dc1 |

The classification of data relies heavily on a robust schema taxonomy, where every data element is assigned a schema label and a broader schema category to ensure uniformity across the enterprise. Dimensional tables, such as those defining schema metadata, assign specific labels like `Schema Label 01` or `Schema Label 02` to distinct data structures, while simultaneously grouping them under overarching schema categories such as `Schema Category 01` or `Schema Category 02`. This hierarchical categorization allows governance frameworks to apply consistent policies across disparate data types, ensuring that a schema is not merely a structural definition but a governed entity with a clearly defined category.

**dim_schema**

| id | schema_label | schema_category |
| --- | --- | --- |
| DIRE-0001 | Schema Label 01 | Schema Category 01 |
| DIRE-0002 | Schema Label 02 | Schema Category 02 |
| DIRE-0003 | Schema Label 03 | Schema Category 03 |
| DIRE-0004 | Schema Label 04 | Schema Category 04 |
| DIRE-0005 | Schema Label 05 | Schema Category 05 |
| DIRE-0006 | Schema Label 06 | Schema Category 06 |
| DIRE-0007 | Schema Label 07 | Schema Category 07 |

Beyond structural classification, the reliability of schema-based data is quantified through rigorous metrics of confidence and uncertainty, which are essential for risk assessment and decision-making. Fact tables capture these probabilistic measures, recording confidence scores that can range significantly—for example, a confidence of `0.346` versus a higher assurance level of `0.559`—indicating the degree of certainty an analyst can place in the record. Concurrently, the uncertainty metric provides a quantitative bound on this ambiguity, with values such as `496.72` or `36.42` reflecting the variance inherent in the measurement. These metrics are intrinsically linked to the misc value, or the actual observed measurement, which might register at `934.63` or `722.91`, allowing auditors to weigh the raw data against its associated confidence and uncertainty bounds.

**fact_schema**

| id | schema_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DIRE-0001 | DIRE-0007 | 0.346 | 496.72 | 934.63 |
| DIRE-0002 | DIRE-0004 | 0.128 | 36.42 | 722.91 |
| DIRE-0003 | DIRE-0007 | 0.279 | 132.28 | 890.32 |
| DIRE-0004 | DIRE-0007 | 0.559 | 435.16 | 628.85 |
| DIRE-0005 | DIRE-0002 | 0.314 | 996.56 | 660.34 |
| DIRE-0006 | DIRE-0003 | 0.661 | 71.96 | 765.11 |
| DIRE-0007 | DIRE-0005 | 0.981 | 108.29 | 904.01 |

Operational continuity often necessitates schema migrations, where data structures are transitioned from one state or platform to another, requiring strict oversight of the subject and target entities involved. A migration event, identified by an ID such as `MIGR-0001` or `MIGR-0002`, orchestrates the transition of specific schema types—such as `compliance_audit`, `inventory_snapshot`, or `sensor_telemetry`—into target environments like `PostgreSQL_14`, `ClickHouse_v20`, or `BigQuery_warehouse`. To maintain accountability during these complex transitions, the framework assigns specific roles to the participants; an entity may act as the `owner` of the migration, an `observer` monitoring the process, or a `reviewer` validating the outcome. This tripartite relationship between the subject, the target, and the assigned role ensures that every schema migration is traceable, authorized, and subject to appropriate governance controls.

**t_schema_migration_subclass**

| id | schema |
| --- | --- |
| MIGR-0001 | compliance_audit |
| MIGR-0002 | inventory_snapshot |
| MIGR-0003 | sensor_telemetry |
| MIGR-0004 | transaction_ledger |
| MIGR-0005 | compliance_audit |
| MIGR-0006 | inventory_snapshot |

**t_schema_migration_subclass_migrates_schema_to**

| id | migrates_schema_to |
| --- | --- |
| MIGR-0001 | PostgreSQL_14 |
| MIGR-0002 | ClickHouse_v20 |
| MIGR-0003 | DeltaLake_v1 |
| MIGR-0004 | BigQuery_warehouse |
| MIGR-0005 | Avro_registry |
| MIGR-0006 | GraphQL_resolvers |
| MIGR-0007 | Kafka_schemas |
| MIGR-0008 | Kafka_schemas |

**t_schema_migration_subclass__migrates_schema_to**

| id | schema_id | migrates_schema_to_id | role |
| --- | --- | --- | --- |
| MIGR-0001 | MIGR-0004 | MIGR-0001 | owner |
| MIGR-0002 | MIGR-0004 | MIGR-0007 | observer |
| MIGR-0003 | MIGR-0004 | MIGR-0007 | reviewer |
| MIGR-0004 | MIGR-0002 | MIGR-0004 | observer |
| MIGR-0005 | MIGR-0001 | MIGR-0001 | reviewer |
| MIGR-0006 | MIGR-0001 | MIGR-0008 | owner |
| MIGR-0007 | MIGR-0004 | MIGR-0002 | contributor |
| MIGR-0008 | MIGR-0001 | MIGR-0002 | owner |