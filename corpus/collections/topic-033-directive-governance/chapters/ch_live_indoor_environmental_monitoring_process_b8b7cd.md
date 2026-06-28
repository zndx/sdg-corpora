---
chapter_id: ch_live_indoor_environmental_monitoring_process_b8b7cd
topic_id: 33
family: 08_derived
cited_terms: ['indoor_environmental_monitoring_process', 'labrun_min_one_sample', 'verification_traces_requirement']
model: engine-refine
---

An identifier serves as the immutable primary key for every record in the system, following a structured prefix convention that signals provenance: PROC-0001 through PROC-0004 for monitoring processes, SAMP-0001 through SAMP-0004 for laboratory run samples, and REQU-0001 through REQU-0004 for verification trace requirements. Each identifier anchors an entity—a discrete operational object whose properties are captured through an entity-attribute-value pattern. Rather than embedding attributes as fixed columns, the model defers property definitions to a schema table where each attribute receives a human-readable name such as duration_seconds, end_time, exit_code, or host_name, paired with a typed declaration from the attribute type registry. The attribute type column carries XML Schema datatype annotations—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—ensuring that downstream consumers can parse values without schema discovery. This separation of structure from instance data permits heterogeneous attribute sets across entity categories while preserving type safety at query time.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

The indoor environmental monitoring domain illustrates how entities relate to one another through explicit foreign-key links. An indoor environmental monitoring process—Library Climate Calibration, Office Floor CO2 Mapping, Server Hall Alpha, or Cafeteria Zone C—functions as the central node in a tripartite relationship: it monitors a specific indoor environment and consumes a defined monitoring protocol. The indoor environment column references physical spaces under surveillance, including Server Hall Alpha, West Wing HVAC Survey, ICU Wing South, and Dormitory Radon Campaign. The monitoring protocol column identifies the standardized procedure applied, such as Chemical Storage Vault, Cafeteria Ventilation Test, Cleanroom Particulate Sweep, or Office Floor CO2 Mapping. A single process may therefore be understood as the intersection of a location, a method, and an operational intent, with the identifier PROC-0001 providing the stable reference point for audit trails and cross-referencing.

**t_indoor_environmental_monitoring_process**

| id | indoor_environmental_monitoring_process | monitors_indoor_environment | uses_monitoring_protocol |
| --- | --- | --- | --- |
| PROC-0001 | Library Climate Calibration | Server Hall Alpha | Chemical Storage Vault |
| PROC-0002 | Office Floor CO2 Mapping | West Wing HVAC Survey | Cafeteria Ventilation Test |
| PROC-0003 | Server Hall Alpha | ICU Wing South | Cleanroom Particulate Sweep |
| PROC-0004 | Cafeteria Zone C | Dormitory Radon Campaign | Office Floor CO2 Mapping |

Attribute definitions are declared once per entity category and then instantiated across individual records through value tables partitioned by type. For laboratory run samples, the attribute schema records that duration_seconds carries an xsd:decimal type, end_time an xsd:dateTime type, exit_code an xsd:integer type, and host_name an xsd:string type. The actual values materialize in four parallel tables, each keyed by a composite of entity identifier and attribute identifier. A decimal value table stores measurements such as 2021.10, 4946.17, 5150.87, and 3275.26 against entity SAMP-0001 through SAMP-0004. A datetime table records timestamps like 2024-08-01T16:02:07, 2024-02-12T19:03:44, 2023-01-19T08:28:14, and 2024-05-12T21:48:01. An integer table holds exit codes and counters such as 230, 435, 670, and 129. A varchar table captures free-form strings including edge-03, Log Level 02, closeout, and complete. This type-partitioned value store eliminates null columns and enforces type discipline without requiring DDL changes when new attributes are introduced.

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

The same architectural pattern extends to verification trace requirements, where the entity category shifts from laboratory samples to compliance artifacts. A verification requirement—Functional Safety Assessment, Type Certification Review, ISO 9001 Compliance Audit, or FAT Factory Acceptance—receives its own attribute schema with identical type declarations: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. Value instantiation follows the same four-table structure. Decimal values for verification entities include 5386.82, 3098.08, 4624.20, and 6273.82. Datetime entries span 2025-01-18T10:03:30, 2023-06-09T08:44:28, 2025-02-02T23:23:29, and 2024-03-08T07:44:16. Integer exit codes reach 954, 329, 641, and 129. String attributes record gw-12, Log Level 02, execution, and complete. The uniformity of attribute names and types across entity categories enables generic reporting and cross-domain aggregation while the identifier namespace—REQU- prefixed for verification, SAMP- prefixed for samples—maintains clear provenance boundaries.