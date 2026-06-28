---
chapter_id: ch_live_process_min_one_input_a971b4
topic_id: 183
family: 07_long_tail
cited_terms: ['process_min_one_input', 'kernel_event_with_comm', 'ganglion_cyst_tissue_origin']
model: engine-refine
---

Process execution records are anchored by a unique identifier that serves as the primary key across all related tables, enabling traceability from high-level workflow descriptions down to granular attribute values. A process such as "Real-time stream processing" with input type "Parquet partition files" receives the identifier INPU-0001, while "Batch data ingestion" consuming "Labeled training datasets" is assigned INPU-0002. These identifiers propagate through the entire data model, appearing not only as the primary key of the process record itself but also as entity references in value tables and as foreign keys linking attributes to their concrete measurements. The identifier scheme follows a consistent prefix pattern—INPU for input processes, COMM for communication kernels, ORIG for tissue origins—providing an immediate semantic cue about the record's domain while maintaining referential integrity across the schema.

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | Parquet partition files |
| INPU-0002 | Batch data ingestion | Labeled training datasets |
| INPU-0003 | ETL transformation step | Labeled training datasets |
| INPU-0004 | Feature engineering workflow | Sensor telemetry packets |
| INPU-0005 | Real-time stream processing | System log archives |
| INPU-0006 | Audit trail generation | Labeled training datasets |

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

Attribute metadata is decoupled from value storage through a three-tier design that separates attribute definitions from their typed measurements. The attribute definition table assigns each attribute a name and an XSD type, such as duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This type information determines which value table receives the actual data: decimal values like 2164.83 and 7108.77 populate the decimal value store, integer values such as 682 and 357 reside in the integer value table, datetime values including 2023-04-22T11:20:36 and 2024-10-27T08:51:57 are stored in the datetime table, and string values like "ingest-21" and "complete" occupy the varchar table. Each value record carries both an entity_id pointing to the process or entity it describes and an attr_id referencing the attribute definition, creating a normalized entity-attribute-value structure that accommodates an unbounded set of attributes without schema modification.

Operational performance metrics are captured in a fact table that records duration_seconds, exit_code, and retry_count for communication kernel executions, with each fact row linked to a dimension record through a foreign key. A communication kernel identified as COMM-0001 may exhibit a duration of 5315.83 seconds, an exit code of 769, and 436 retries, while COMM-0004 shows a shorter duration of 3561.41 seconds with only 14 retries. The dimension table provides human-readable labels such as "With Process Comm Label 01" and categorical groupings like "With Process Comm Category 01" that enable aggregation and filtering of fact data. This star-schema arrangement separates measurable performance data from descriptive categorization, allowing analytical queries to join facts to dimensions on the identifier while preserving the ability to update labels and categories independently of the underlying measurements.

**fact_kernel**

| id | with_process_comm_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| COMM-0001 | COMM-0007 | 5315.83 | 769 | 436 |
| COMM-0002 | COMM-0004 | 6644.30 | 229 | 251 |
| COMM-0003 | COMM-0008 | 4698.54 | 332 | 190 |
| COMM-0004 | COMM-0004 | 3561.41 | 253 | 14 |
| COMM-0005 | COMM-0001 | 6092.67 | 910 | 352 |
| COMM-0006 | COMM-0002 | 6729.90 | 888 | 269 |
| COMM-0007 | COMM-0006 | 814.76 | 674 | 214 |
| COMM-0008 | COMM-0008 | 2447.90 | 247 | 434 |

**dim_with_process_comm**

| id | with_process_comm_label | with_process_comm_category |
| --- | --- | --- |
| COMM-0001 | With Process Comm Label 01 | With Process Comm Category 01 |
| COMM-0002 | With Process Comm Label 02 | With Process Comm Category 02 |
| COMM-0003 | With Process Comm Label 03 | With Process Comm Category 03 |
| COMM-0004 | With Process Comm Label 04 | With Process Comm Category 04 |
| COMM-0005 | With Process Comm Label 05 | With Process Comm Category 05 |
| COMM-0006 | With Process Comm Label 06 | With Process Comm Category 06 |
| COMM-0007 | With Process Comm Label 07 | With Process Comm Category 07 |
| COMM-0008 | With Process Comm Label 08 | With Process Comm Category 08 |

Domain-specific hierarchical relationships are modeled through a junction table that connects tissue origin records to their parent connective tissue structures with an explicit role qualifier. A ganglion cyst tissue origin such as "sacroiliac joint" (ORIG-0001) is linked to its containing "periosteal layer" through a relationship record that specifies the role as "reviewer" or "owner," while another origin like "metacarpophalangeal joint" (ORIG-0002) connects to "joint capsule" with the role "owner." The junction table carries its own identifier and dual foreign keys—one pointing to the ganglion cyst tissue origin as the subject and another to the connective tissue structure as the target—enabling many-to-many relationships where a single tissue origin may participate in multiple structural relationships with different roles, and a single connective tissue structure may contain multiple tissue origins. This role-based relationship model supports nuanced provenance tracking and access control by distinguishing between contributors, reviewers, and owners within the same hierarchical context.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |