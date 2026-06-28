---
chapter_id: ch_live_schema_migration_subclass_46b55d
topic_id: 56
family: 07_long_tail
cited_terms: ['schema_migration_subclass', 'attribute_set_min_one', 'attestation_subclass']
model: engine-refine
---

In enterprise data governance, every measurable property must be anchored to a precise identifier and classified by type before it can participate in compliance workflows. An attribute—whether it is a duration measured in seconds, a timestamp marking an event, or a hostname string—is first defined by its schema, which establishes the attribute's type as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. The attribute catalog distinguishes between the attribute key, which serves as the operational handle, and the attribute label, a human-readable designation such as Attribute Label 01 through Attribute Label 04, each assigned to a category like Attribute Category 01 through Attribute Category 04. This categorical taxonomy enables downstream systems to group related properties for bulk validation, reporting, and audit trail generation. The confidence score attached to each attribute value quantifies the system's certainty in its accuracy: a measurement of 482.01 may carry a confidence of 0.926, while a value of 100.75 might register at only 0.123, reflecting the inherent variability in data provenance and measurement conditions.

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

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONE-0001 | ONE-0005 | 0.926 | 957.49 | 482.01 |
| ONE-0002 | ONE-0003 | 0.786 | 274.08 | 742.87 |
| ONE-0003 | ONE-0005 | 0.123 | 455.70 | 100.75 |
| ONE-0004 | ONE-0003 | 0.178 | 516.20 | 779.52 |

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| ONE-0001 | Attribute Label 01 | Attribute Category 01 |
| ONE-0002 | Attribute Label 02 | Attribute Category 02 |
| ONE-0003 | Attribute Label 03 | Attribute Category 03 |
| ONE-0004 | Attribute Label 04 | Attribute Category 04 |
| ONE-0005 | Attribute Label 05 | Attribute Category 05 |
| ONE-0006 | Attribute Label 06 | Attribute Category 06 |

The entity concept binds attributes to the specific objects or systems they describe, creating a structured relationship between what is measured and what is being measured. In the attestation framework, an entity such as ATTE-0001 may carry a decimal value of 1293.13 for a duration attribute, a datetime value of 2025-01-08T20:38:13 for an end time, an integer value of 806 for an exit code, and a varchar value of gw-12 for a host identifier—all within the same attestation record. This multi-typed attribute storage ensures that each property retains its native data type while remaining traceable to a single entity. The attestation itself, whether it is a SOC2-TypeII certification, a VulnerabilityScan-Q3 assessment, a SecureBoot-Enabled verification, or a TPM-Attestation record, serves as the container that groups these heterogeneous attribute values into a coherent compliance artifact.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

**t_attestation_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

Schema migration introduces a parallel layer of governance, where data structures themselves are tracked, versioned, and assigned to target platforms. A migration record identified as MIGR-0001 governs the compliance_audit schema and directs its transformation to a PostgreSQL_14 destination, while MIGR-0002 routes the inventory_snapshot schema to ClickHouse_v20, MIGR-0003 sends sensor_telemetry to DeltaLake_v1, and MIGR-0004 channels transaction_ledger to a BigQuery_warehouse. The migration relationship is not merely a one-to-one mapping; it is mediated through a junction table that assigns roles—owner, observer, reviewer—to the subject and target of each migration. For instance, the transaction_ledger schema (MIGR-0004) may appear as the subject in multiple migration records, targeting different destinations with different roles: one record designates it as owner of the migration to MIGR-0001, while another marks it as observer of the migration to MIGR-0007. This role-based assignment ensures that accountability is explicit at every stage of schema evolution.

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

Uncertainty provides the quantitative complement to confidence, capturing the absolute margin of error or variance associated with each attribute measurement. Where confidence expresses a relative probability—0.926 indicating high certainty, 0.178 indicating substantial doubt—uncertainty expresses an absolute magnitude: 957.49, 274.08, 455.70, 516.20. These values are not interchangeable; a measurement with low confidence may still carry low uncertainty if the measurement instrument is precise but poorly calibrated, while high confidence with high uncertainty suggests a well-calibrated instrument operating in a noisy environment. The governance framework treats both metrics as first-class attributes, requiring that every compliance assertion include not only the value itself but the full envelope of confidence and uncertainty that bounds its reliability. This dual-metric approach prevents the false precision that plagues many compliance reporting systems, where a single point estimate is presented without any indication of its statistical validity.

The misc column serves as the catch-all for attribute values that do not fit the structured decimal, integer, datetime, or varchar typology, capturing free-form metadata, notes, or exceptional values that must be preserved for audit completeness. In practice, this column holds values such as 482.01, 742.87, 100.75, and 779.52—numeric values stored as miscellaneous types when their semantic context is ambiguous or when they originate from systems that do not enforce strict typing. The presence of this column acknowledges that real-world data governance must accommodate the messiness of heterogeneous data sources without forcing premature classification. Every identifier in the system, from MIGR-0001 through MIGR-0004, from ATTE-0001 through ATTE-0004, from ONE-0001 through ONE-0005, serves as a stable anchor point that allows auditors, engineers, and compliance officers to trace any attribute value back to its source schema, its attestation container, and the role of the party responsible for its accuracy.