---
chapter_id: ch_live_labrun_basic_26e519
topic_id: 12
family: 02_observation_measurement
cited_terms: ['labrun_basic', 'transformation_with_output_dataset', 'audit_produces_evidence']
model: engine-refine
---

An identifier serves as the immutable handle by which every operational entity is distinguished across the provenance graph. Laboratory runs carry identifiers such as LABR-0001 through LABR-0004, each bound to a human-readable execution name—Microplate_Scan_9A, MassSpec_Triplicate, ELISA_Screen_4B, PCR_Amplification—while transformation outcomes and audit evidence records are similarly anchored by identifiers like DATA-0001 and EVID-0001. The entity column in the value tables re-references these identifiers, establishing the foreign-key linkage that binds a measured property back to the run or dataset that produced it. Without this disciplined referencing, attribute values would float unmoored from their source, and any attempt to reconstruct the provenance of a result would collapse into ambiguity.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Attributes and their types form the schema layer that gives meaning to otherwise opaque value columns. The attribute definition table records an attr_name—duration_seconds, end_time, exit_code, host_name—alongside an attr_type drawn from the XSD vocabulary: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. This separation of name, type, and value is not academic; it ensures that a decimal value such as 1438.98 or 6523.97 is never misinterpreted as a timestamp or string, and that a datetime value like 2025-01-01T00:58:28 is stored in the dedicated datetime value table rather than mixed with integers or variable-length text. The same pattern recurs in the audit evidence domain, where attributes such as confidence, dimension_kind, method, and recorded_at are typed as xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively, and their values are routed to the corresponding type-specific value table.

The value tables themselves—val_datetime, val_decimal, val_int, val_varchar—constitute the misc layer, a type-dispatched store that holds the actual measurements, codes, and labels. Each row carries an entity_id pointing back to the originating lab run or audit record, an attr_id pointing to the attribute definition, and a value column whose content is constrained by the table's type. Decimal values such as 0.658, 291.89, and 838.98 appear alongside integer values like 918, 57, 674, and 220, while varchar values capture host names (edge-03), log levels (Log Level 02), execution states (execution, complete), and categorical descriptors (Dimension Kind 01, Encoding 02, calibration record). The entity_id and attr_id columns in these tables are the foreign keys that stitch the misc values back into the attribute and entity hierarchies.

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

Duration seconds, exit codes, and retry counts are the operational metrics that quantify transformation outcomes. In the transformation fact table, each record is keyed by an identifier such as DATA-0001 and linked to an output_dataset_key—DATA-0004, DATA-0005—that identifies the dataset produced. The duration_seconds column records wall-clock execution time, with values ranging from 150.01 seconds for a fast transformation to 5474.59 seconds for a prolonged run. The exit column captures the termination status; values such as 354, 220, 471, and 302 encode the exit condition, whether successful or anomalous. The retry_count column documents how many times the transformation was retried before reaching its final state, with values of 25, 357, 150, and 85 reflecting varying degrees of transient failure. These three columns together form a compact performance and reliability profile for every transformation.

**fact_transformation**

| id | output_dataset_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0004 | 2399.22 | 354 | 25 |
| DATA-0002 | DATA-0004 | 5474.59 | 220 | 357 |
| DATA-0003 | DATA-0005 | 150.01 | 471 | 150 |
| DATA-0004 | DATA-0004 | 5248.45 | 302 | 85 |
| DATA-0005 | DATA-0006 | 6668.88 | 184 | 484 |
| DATA-0006 | DATA-0004 | 777.01 | 996 | 445 |
| DATA-0007 | DATA-0005 | 6572.74 | 634 | 341 |

The output dataset dimension table provides the categorical and descriptive context for the datasets referenced by the transformation facts. Each dataset is identified by an identifier such as DATA-0001 and carries an output_dataset_label—Output Dataset Label 01 through 04—and an output_dataset_category—Output Dataset Category 01 through 04—that classifies the dataset by its nature or purpose. The category column is the foreign-key target for the output_dataset_key in the transformation fact, enabling queries that aggregate transformations by dataset type or filter by category. This classification layer is essential for governance: it allows auditors and operators to distinguish between datasets produced for compliance evidence, those generated for routine analysis, and those reserved for archival, each of which may carry different retention and access policies.

**dim_output_dataset**

| id | output_dataset_label | output_dataset_category |
| --- | --- | --- |
| DATA-0001 | Output Dataset Label 01 | Output Dataset Category 01 |
| DATA-0002 | Output Dataset Label 02 | Output Dataset Category 02 |
| DATA-0003 | Output Dataset Label 03 | Output Dataset Category 03 |
| DATA-0004 | Output Dataset Label 04 | Output Dataset Category 04 |
| DATA-0005 | Output Dataset Label 05 | Output Dataset Category 05 |
| DATA-0006 | Output Dataset Label 06 | Output Dataset Category 06 |