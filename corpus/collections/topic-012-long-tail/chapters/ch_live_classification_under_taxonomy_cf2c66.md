---
chapter_id: ch_live_classification_under_taxonomy_cf2c66
topic_id: 12
family: 03_directive_governance
cited_terms: ['classification_under_taxonomy', 'dataset_was_derived_from', 'artifact_governed_by_policy']
model: engine-refine
---

The classification taxonomy establishes a hierarchical indexing mechanism wherein each entry is assigned a unique identifier—TAXO-0001 through TAXO-0004, for instance—and mapped to a descriptive classification such as Lab Sample Category, Anomaly Detection Model, Experiment Phase Code, or Telemetry Stream Type, all nested under a parent taxonomy node identified by codes like POLI-0001, POLI-0002, POLI-0003, and POLI-0006. This two-level structure permits granular categorization of data assets while preserving an auditable lineage to broader taxonomic groupings. The identifier column serves as the immutable primary key across all related tables, ensuring referential integrity when attributes, values, and policy bindings are resolved against a given classification.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | POLI-0001 |
| TAXO-0002 | Anomaly Detection Model | POLI-0002 |
| TAXO-0003 | Experiment Phase Code | POLI-0003 |
| TAXO-0004 | Telemetry Stream Type | POLI-0006 |
| TAXO-0005 | Compliance Framework Set | POLI-0006 |
| TAXO-0006 | Experiment Phase Code | POLI-0004 |
| TAXO-0007 | Metadata Schema Version | POLI-0001 |
| TAXO-0008 | Experiment Phase Code | POLI-0003 |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

Attributes are defined independently of their values in a dedicated schema that pairs each attribute name—duration_seconds, end_time, exit_code, host_name—with a corresponding XSD type: xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string. This separation of attribute metadata from value storage enables type-safe validation at ingestion time and permits the same attribute definition to be reused across multiple entities without duplication. The attr_type column thus functions as a contract, guaranteeing that every value inserted into the value tables conforms to its declared schema.

Actual attribute values are materialized in four distinct value tables, each typed to its attr_type counterpart. Decimal-valued attributes such as size_bytes are stored in the decimal value table with entries like 4845.29, 4012.23, 5805.70, and 852.80, each linked to an entity via entity_id and to its attribute definition via attr_id. Datetime attributes—end_time, for example—appear in the datetime value table with ISO 8601 timestamps such as 2024-03-16T10:40:44, 2023-03-15T13:57:05, 2024-10-13T12:06:31, and 2023-01-11T10:30:50. Integer attributes like exit_code hold values 123, 306, 682, and 349, while string-valued attributes such as host_name and misc fields carry values including worker-07, Log Level 02, initiation, and superseded. The entity_id column in each value table anchors the observation to a specific entity, and the attr_id column resolves the attribute definition, together forming a composite foreign key that enforces referential integrity across the attribute-value relationship.

Data provenance is captured through a tripartite derivation model. A dataset—identified by codes such as FROM-0001 through FROM-0004 and named iot_edge_logs, patient_demographics_clean, market_index_history, or patient_demographics_clean—is linked to its source via a was_derived_from relationship that references upstream datasets like raw_sensor_stream, warehouse_staging_area, regulatory_filing_pdf, and archival_tape_restore. The join table mediates this many-to-many relationship with three columns: dataset_id (the subject), was_derived_from_id (the target), and role, which classifies the provenance relationship as contributor or owner. This role column is critical for governance, as it distinguishes between datasets that merely contributed data to a derived artifact and those that served as the primary source.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Policy governance over data artifacts is recorded in a separate table that binds each artifact—ml_training_dataset, api_gateway_config, payment_transaction_log, batch_ingestion_job—to a governing policy identified by POLI-0001 through POLI-0004. Two additional columns, size_bytes and version, provide operational metadata: artifact sizes range from 14,439,485 bytes for payment_transaction_log to 765,223,054 bytes for batch_ingestion_job, and version numbers span from 3 to 10, enabling change tracking and compliance auditing. The size_bytes column is particularly relevant for capacity planning and cost allocation, while version supports rollback procedures and regulatory reporting requirements.

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |
| POLI-0005 | sensor_telemetry_stream | 484219008 | 3 |
| POLI-0006 | data_landing_zone_schema | 251798984 | 10 |