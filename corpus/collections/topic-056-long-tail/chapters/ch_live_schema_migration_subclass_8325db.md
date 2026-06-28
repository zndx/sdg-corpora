---
chapter_id: ch_live_schema_migration_subclass_8325db
topic_id: 56
family: 07_long_tail
cited_terms: ['schema_migration_subclass', 'dempster_combinant_second', 'program_with_entry_exactly_one']
model: engine-refine
---

In enterprise data governance, the integrity of a schema migration pipeline depends on a disciplined separation between the migration itself, its target platform, and the relationship that binds them. A migration such as MIGR-0001, which governs the compliance_audit schema, does not merely point to a destination; it participates in a structured relationship where the source schema assumes a subject position and the target platform occupies a target position, with the intervening role—owner, observer, or reviewer—explicitly declared. MIGR-0004, for instance, migrates the transaction_ledger schema and carries the owner role against MIGR-0001 (PostgreSQL_14) and the observer role against MIGR-0007 (ClickHouse_v20), while MIGR-0002, governing inventory_snapshot, similarly assumes the observer role against MIGR-0004 (DeltaLake_v1). This tripartite construction—subject, target, role—ensures that every schema-to-platform mapping carries an auditable provenance trail, a requirement that becomes non-negotiable when regulated entities must demonstrate data lineage across heterogeneous storage backends.

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

Attributes and their types form the second structural layer, providing a typed vocabulary through which entity properties are declared and validated. Within the Dempster-Shafer combinant framework, each entity—SECO-0001 through SECO-0004—carries a set of named attributes whose semantic categories are captured by an attr_type column referencing XML Schema datatypes: xsd:decimal for numerical measures, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. The attribute named confidence, for example, is typed as xsd:decimal and holds values such as 0.328 and 0.558, while dimension_kind and method are xsd:string attributes carrying values like Dimension Kind 01 and Encoding 02. The recorded_at attribute, typed as xsd:dateTime, anchors each entity to a precise moment—2024-10-02T15:13:46 for SECO-0001, 2023-03-27T03:16:31 for SECO-0004—enabling temporal reasoning over evidence fusion events. This type discipline is not decorative; it guarantees that downstream consumers of the combinant data can parse, compare, and aggregate values without runtime coercion errors.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | SourceMetadataRegistry |
| SECO-0002 | AnomalyFusionEngine | GPSPositionLog |
| SECO-0003 | LabDataCombinerNode | BaselineTelemetryTrace |
| SECO-0004 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0005 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0006 | GovernanceEvidenceModel | SpectralAnalysisOutput |
| SECO-0007 | CrossDomainEvidenceRule | PressureSensorArray |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

The value tables themselves embody a deliberate normalization strategy: rather than storing heterogeneous data in a single wide column, the architecture partitions values by type into t_dempster_combinant_second_val_datetime, t_dempster_combinant_second_val_decimal, and t_dempster_combinant_second_val_varchar, each linking back to its entity through an entity_id foreign key and to its attribute definition through an attr_id foreign key. This design means that the decimal value 597.98 and the string value nightly summary both belong to entity SECO-0001, yet they reside in separate tables, each enforcing its own type constraint at the storage layer. The attr_id column in these value tables references the attr column in the attribute definition table, creating a chain from concrete value → attribute definition → attribute type that is both traceable and type-safe.

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

Versioning and identification complete the governance picture. Programs such as inventory_sync and nightly_etl are assigned stable identifiers—ARN:res/41 for the inventory_sync program across versions 12 and 3, and ref-8842 for the health_check program at version 11—each paired with an entry_point that specifies how the program is invoked: api_gateway, main.py, or cron_trigger. The version column, holding integer values like 12, 3, 8, and 11, provides a monotonically increasing or semantically meaningful revision marker that allows operators to determine whether a given program instance is current or requires migration. In the schema migration domain, the identifier column (MIGR-0001 through MIGR-0004) serves the same purpose: it is the immutable key that ties together the migration subclass, its source schema, its target platform, and its role-labeled relationships, ensuring that every piece of the migration graph can be queried, audited, and, when necessary, rolled back with precision.

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