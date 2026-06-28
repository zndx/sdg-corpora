---
chapter_id: ch_live_radicalization_process_68ad6f
topic_id: 65
family: 08_derived
cited_terms: ['radicalization_process', 'trace_has_resource', 'measurement_of_artifact']
model: engine-refine
---

The architecture for tracking radicalization processes and their associated activities rests on a foundation of unique identifiers that anchor every entity in the system. Each radicalization process—whether a Militia Formation Phase, a Network Recruit Wave, or a Radicalization Vector Delta—is assigned a distinct identifier such as PROC-0001 or PROC-0003, ensuring unambiguous reference across all downstream records. These identifiers serve as the primary keys that bind together the various tables capturing process details, participant affiliations, and resource utilization. The same principle extends to resource traces, where records like RESO-0001 and RESO-0002 link operational activities such as batch-etl-nightly or lab-assay-protocol-2b to the underlying infrastructure resources they consume, including s3-data-lake-warehouse and postgresql-primary-db. Similarly, measurement artifacts like ARTI-0001 and ARTI-0002 are identified by codes such as ARTI-0001 and tied to specific measurement types including latency_p99_ms and yield_stress_test.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | s3-data-lake-warehouse |
| RESO-0002 | lab-assay-protocol-2b | postgresql-primary-db |
| RESO-0003 | governance-audit-cycle-9 | network-bandwidth-10g |
| RESO-0004 | lab-assay-protocol-2b | s3-data-lake-warehouse |
| RESO-0005 | ml-training-run-aurora | iot-sensor-bus-7 |
| RESO-0006 | governance-audit-cycle-9 | gpu-cluster-node-04 |
| RESO-0007 | lab-assay-protocol-2b | gpu-cluster-node-04 |
| RESO-0008 | api-gateway-chain-alpha | compute-node-vm-128 |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

Affiliated organizations represent the human and structural actors embedded within each radicalization process. The system captures which organizations participate in which processes through a direct relationship: Sympathizer Network Alpha appears as a participant in both PROC-0001 and PROC-0004, while Al-Shabaab Recruitment Cell is associated with PROC-0002, and Regional Coordination Cell with PROC-0003. This many-to-many relationship between processes and organizations enables analysts to trace organizational involvement across multiple radicalization phases and identify recurring actors. The presence of the same organization across different processes—such as Sympathizer Network Alpha appearing in two separate radicalization vectors—signals persistent engagement and potentially coordinated activity patterns that warrant closer scrutiny.

Attributes and their types form the descriptive layer that characterizes both resource traces and measurement artifacts. Each attribute—whether duration_seconds, end_time, exit_code, or host_name for resource traces, or confidence, dimension_kind, method, and recorded_at for measurement artifacts—is declared with a specific data type drawn from the XSD schema namespace. The type system enforces data integrity: duration_seconds is stored as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This typed attribute model ensures that values are validated at ingestion and that downstream queries can rely on consistent data semantics. The attr_name and attr_type columns in the attribute definition tables establish the schema, while the value tables store the actual observations.

The separation of attribute definitions from their values across type-specific tables—datetime, decimal, integer, and varchar—reflects a practical design choice that accommodates heterogeneous data while maintaining referential integrity through the entity_id and attr_id foreign keys. For resource traces, the decimal values table captures quantitative measurements such as 6459.38, 3107.88, 4594.49, and 2602.26, while the datetime values table records timestamps like 2024-06-04T06:37:56 and 2024-12-02T12:01:14. The integer values table stores exit codes and numeric indicators including 866, 141, 185, and 294, and the varchar values table holds string observations such as node-b14, Log Level 02, closeout, and running. This same pattern applies to measurement artifacts, where decimal values like 0.670, 226.14, 361.86, and 0.088 represent confidence scores and physical measurements, and varchar values include Dimension Kind 01, Encoding 02, intake form, and fr.

The entity concept ties together all these relationships by serving as the bridge between attribute definitions and their concrete values. Every value record carries an entity_id that points back to the trace or measurement artifact it describes, and an attr_id that references the attribute definition. This design allows a single resource trace like RESO-0001 to accumulate multiple attributes across different value tables—its duration_seconds of 6459.38 in the decimal table, its end_time of 2024-06-04T06:37:56 in the datetime table, its exit_code of 866 in the integer table, and its host_name of node-b14 in the varchar table—all linked through the same entity identifier. The same mechanism applies to measurement artifacts, where ARTI-0001 carries a confidence of 0.670, a dimension_kind of Dimension Kind 01, a method of intake form, and a recorded_at timestamp of 2023-05-19T07:46:35. This unified entity-based linking ensures that all attributes of a given trace or measurement can be reconstructed as a coherent record regardless of the data types involved.

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |