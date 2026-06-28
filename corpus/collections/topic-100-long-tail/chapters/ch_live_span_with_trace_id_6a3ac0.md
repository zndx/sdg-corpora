---
chapter_id: ch_live_span_with_trace_id_6a3ac0
topic_id: 100
family: 07_long_tail
cited_terms: ['span_with_trace_id', 'policy_constrains_only_artifact', 'program_subclass']
model: engine-refine
---

DISTRIBUTED TRACEABILITY AND SPAN METADATA

The observability backbone of modern service architectures rests upon a disciplined span-and-trace model that records every discrete operation within a request lifecycle. Each span carries a unique identifier—TRAC-0001 through TRAC-0004 in the reference corpus—and a semantic label describing the operation, such as config_fetch, email_send, payment_process, or queue_consume. Spans are grouped into traces by a shared trace identifier, a 32-character hexadecimal token like 7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d or c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9, which serves as the correlation key across all spans belonging to a single end-to-end transaction. The trace identifier c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 appears for both TRAC-0002 and TRAC-0004, indicating that these two spans are siblings within the same distributed request, a structural relationship that enables root-cause analysis across service boundaries.

**t_span_with_trace_id**

| id | span | trace_id |
| --- | --- | --- |
| TRAC-0001 | config_fetch | 7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d |
| TRAC-0002 | email_send | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0003 | payment_process | e9f8a7b6c5d4e3f2a1b0c9d8e7f6a5b4 |
| TRAC-0004 | queue_consume | c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9 |
| TRAC-0005 | payment_process | f0e1d2c3b4a5968778695a4b3c2d1e0f |
| TRAC-0006 | queue_consume | 550e8400e29b41d4a716446655440000 |

Span attributes are declared in a separate metadata registry that pairs each attribute with a machine-readable type annotation drawn from the XML Schema definition namespace. The attribute duration_seconds carries the type xsd:decimal, end_time is typed as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This decoupling of attribute schema from attribute values permits type-safe storage and query optimization, since each typed value is persisted in a dedicated table that enforces the declared schema at write time. The attribute registry assigns its own sequential identifiers—TRAC-0001 through TRAC-0010 in the corpus—to each attribute definition, and these identifiers serve as foreign keys in the value tables, establishing a three-layer indirection: span → attribute definition → typed value.

**t_span_with_trace_id_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

The typed value tables implement an entity-attribute-value pattern partitioned by data type, with separate stores for datetime, decimal, integer, and variable-length string values. Each row in a value table references an entity via entity_id, which points back to a span identifier such as TRAC-0001 or TRAC-0002, and an attribute via attr_id, which resolves to the attribute definition. The decimal value table records quantitative measurements like 5004.94, 6293.97, 683.54, and 6162.04, all associated with attr_id TRAC-0001, which corresponds to the duration_seconds attribute. The integer value table stores exit codes such as 485, 203, 446, and 417, linked through attr_id values TRAC-0003 and TRAC-0007. The varchar table captures free-form strings including gw-12, Log Level 02, initiation, and running, mapped to attr_id entries TRAC-0004, TRAC-0005, TRAC-0006, and TRAC-0010. The datetime table holds timestamps like 2024-07-23T07:53:43, 2024-01-04T12:30:01, 2024-06-08T06:16:51, and 2024-09-04T10:45:36, associated with attr_id values TRAC-0002 and TRAC-0008, which resolve to the end_time attribute and its xsd:dateTime type. This type-partitioned design ensures that each value is stored in a column whose native type matches the declared attribute type, eliminating runtime coercion and enabling indexed range queries on temporal and numeric attributes.

**t_span_with_trace_id_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2024-07-23T07:53:43 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-01-04T12:30:01 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2024-06-08T06:16:51 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2024-09-04T10:45:36 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2024-03-10T17:10:26 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2024-08-27T18:50:31 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2024-05-28T07:14:21 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-12-31T18:14:37 |

**t_span_with_trace_id_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 5004.94 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 6293.97 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 683.54 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 6162.04 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 7049.18 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 6047.18 |

**t_span_with_trace_id_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 485 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 203 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 446 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 417 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 481 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 210 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 137 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 453 |

**t_span_with_trace_id_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | gw-12 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | running |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | gw-12 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

Governance constraints are expressed as policy records that bind a regulatory or organizational policy to an enforcement mechanism and a scope of applicability. The policy column carries designations such as CCPA and SOX, the enforcement column specifies the operational posture as mandatory or blocking, and the scope column delineates the boundary of application as team, global, or local. A record with policy SOX and enforcement blocking scoped to local indicates a jurisdiction-specific, hard-stop control, whereas a record with policy CCPA and enforcement mandatory scoped to global signals a broadly applicable requirement that permits downstream systems to implement their own remediation pathways. The enforcement distinction between mandatory and blocking is operationally significant: mandatory policies require compliance but allow the system to proceed with a warning or audit trail, while blocking policies prevent the operation from completing until the constraint is satisfied.

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |

Program classification and provenance are captured in a subclass registry that associates each program with its input modality, licensing terms, and deployment location. Programs such as MetadataHarvest, DataQualityScan, and AnomalyDetectionPipeline are catalogued alongside their input types—PostgreSQLSnapshot, RESTApiPayload, OracleStagingView, and CSVExportDump—which describe the data source format consumed at runtime. Licensing information is recorded as GPL-3.0, proprietary, Apache-2.0, or MIT, providing an auditable chain of third-party dependencies and their respective copyleft or permissive obligations. Deployment location is expressed as rack-7, us-east-1, or ap-south-2, anchoring each program to a physical or cloud region for capacity planning, data residency compliance, and incident response routing. The combination of program, input, license, and location forms a minimal provenance tuple that can be queried to answer questions about dependency risk, geographic data flow, and operational ownership.

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