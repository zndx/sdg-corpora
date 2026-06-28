---
chapter_id: ch_live_descriptive_not_retracted_041fad
topic_id: 69
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'evidence_for_audit', 'verification_concludes_with']
model: engine-refine
---

Attributes, attribute types, entities, and identifiers form the structural backbone of any system designed to track, audit, and verify data provenance across operational lifecycles. An entity represents a discrete, auditable object—whether a sensor drift note, a chain-of-custody record, or a compliance gateway scan—each assigned a stable identifier such as RETR-0001, AUDI-0001, or WITH-0001. These identifiers are not arbitrary; they encode the entity's domain and sequence, enabling deterministic joins across the attribute-value graph without ambiguity. The descriptive layer anchors each entity with human-readable labels: a record identified as RETR-0001 carries the description "Sensor Drift Note" alongside the secondary descriptor "Metadata Extension Record," while RETR-0002 is labeled "Anomaly Flag Sheet" with "Batch Processing Note" as its companion metadata. This dual-labeling convention—primary description paired with a contextual extension—provides immediate semantic grounding for downstream consumers who must reason about what each entity represents without consulting external documentation.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

Attribute definitions sit between entities and their values, specifying both the semantic meaning and the data type of each measurable or recordable property. The attribute registry for the descriptive domain declares four properties: confidence typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. The same four attribute names recur in the audit domain, demonstrating that attribute schemas are reusable across entity families rather than being scoped to individual records. This reuse is critical for cross-domain queries—auditors can filter on confidence thresholds regardless of whether the underlying entity is a sensor drift note or an audit trail entry. The type annotations (xsd:decimal, xsd:string, xsd:dateTime, xsd:integer) enforce value constraints at the schema level, ensuring that a confidence score of 0.736 is never conflated with a timestamp like 2024-02-12T07:34:36 or a categorical label such as "Dimension Kind 01."

Value storage is partitioned by type, a design choice that optimizes both storage efficiency and query performance. Decimal values—0.736, 273.61, 449.86, 0.217 in the descriptive domain; 0.978, 590.71, 212.01, 0.546 in the audit domain; and 5022.45, 4498.56, 4177.56, 216.79 in the verification domain—are stored in dedicated decimal value tables, each row linking an entity identifier to an attribute identifier and a numeric value. Datetime values follow the same pattern: timestamps such as 2024-02-12T07:34:36, 2024-08-04T13:26:29, 2024-08-02T08:30:25, and 2025-01-21T18:04:20 populate the descriptive datetime store, while the audit domain records 2024-10-15T21:07:57, 2024-11-22T11:38:19, 2023-06-03T22:32:06, and 2024-07-15T05:43:09. String values—intake form, es, Dimension Kind 01, Encoding 02 in the descriptive domain; intake form, fr in the audit domain; ingest-21, Log Level 02, review, complete in the verification domain—are similarly segregated. Integer values, such as 299, 242, 130, and 120, occupy their own store. This type-partitioned architecture means that a query for all decimal attributes on a given entity touches only one table, avoiding the overhead of type coercion and null-padding that plagues monolithic value stores.

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

The foreign-key relationships between these tables create a navigable graph that supports both point lookups and broad traversals. Each value row carries an entity_id that references the primary key of its domain's descriptive or evidence table, and an attr_id that points to the corresponding attribute definition. In the verification domain, the t_verification_concludes_with table serves as a bridge: it links verification activities—Compliance Gateway Scan, Telemetry Sync Verify, Data Lineage Trace, Artifact Hash Check—to their concluding entities via the concludes_with column, which references identifiers like RETR-0002, RETR-0005, RETR-0004, and RETR-0003. This cross-domain linkage is where the system's auditability becomes operational; a Compliance Gateway Scan (WITH-0001) concludes with RETR-0002, and an auditor can follow the foreign keys from WITH-0001 through its attribute definitions (duration_seconds, end_time, exit_code, host_name) to its typed values (5022.45, 2023-03-17T15:14:20, 299, ingest-21) and then into the descriptive domain to inspect the Anomaly Flag Sheet that the scan validated. The same pattern holds for Telemetry Sync Verify concluding with RETR-0005, Data Lineage Trace with RETR-0004, and Artifact Hash Check with RETR-0003, each carrying its own duration (4498.56, 4177.56, 216.79), host (Log Level 02, review, complete), and exit code (130, 120).

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |

**t_verification_concludes_with**

| id | verification | concludes_with |
| --- | --- | --- |
| WITH-0001 | Compliance Gateway Scan | RETR-0002 |
| WITH-0002 | Telemetry Sync Verify | RETR-0005 |
| WITH-0003 | Data Lineage Trace | RETR-0004 |
| WITH-0004 | Artifact Hash Check | RETR-0003 |
| WITH-0005 | Model Drift Assessment | RETR-0006 |
| WITH-0006 | Artifact Hash Check | RETR-0006 |

**t_verification_concludes_with_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WITH-0001 | duration_seconds | xsd:decimal |
| WITH-0002 | end_time | xsd:dateTime |
| WITH-0003 | exit_code | xsd:integer |
| WITH-0004 | host_name | xsd:string |
| WITH-0005 | log_level | xsd:string |
| WITH-0006 | phase | xsd:string |
| WITH-0007 | retry_count | xsd:integer |
| WITH-0008 | scheduled_at | xsd:dateTime |

**t_verification_concludes_with_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0003 | 299 |
| WITH-0002 | WITH-0001 | WITH-0007 | 242 |
| WITH-0003 | WITH-0002 | WITH-0003 | 130 |
| WITH-0004 | WITH-0002 | WITH-0007 | 120 |
| WITH-0005 | WITH-0003 | WITH-0003 | 587 |
| WITH-0006 | WITH-0003 | WITH-0007 | 195 |
| WITH-0007 | WITH-0004 | WITH-0003 | 700 |
| WITH-0008 | WITH-0004 | WITH-0007 | 420 |

**t_verification_concludes_with_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0004 | ingest-21 |
| WITH-0002 | WITH-0001 | WITH-0005 | Log Level 02 |
| WITH-0003 | WITH-0001 | WITH-0006 | review |
| WITH-0004 | WITH-0001 | WITH-0010 | complete |
| WITH-0005 | WITH-0001 | WITH-0011 | Triggered By 05 |
| WITH-0006 | WITH-0002 | WITH-0004 | gw-12 |
| WITH-0007 | WITH-0002 | WITH-0005 | Log Level 07 |
| WITH-0008 | WITH-0002 | WITH-0006 | execution |

Evidence records introduce a parallel namespace for audit artifacts, distinguished by the AUDI prefix and populated with identifiers such as AUDI-0001 through AUDI-0004. The evidence column carries values like AuditTrail_20231015, ChainOfCustody_Batch44, and SignatureBlock_99A1, which serve as the primary keys for a second attribute-value graph that mirrors the descriptive domain's structure. The audit domain's decimal values—0.978, 590.71, 212.01, 0.546—represent confidence scores and measurement readings attached to audit evidence, while its datetime values—2024-10-15T21:07:57, 2024-11-22T11:38:19, 2023-06-03T22:32:06, 2024-07-15T05:43:09—record when each piece of evidence was captured. The string values in the audit domain (Dimension Kind 01, Encoding 02, intake form, fr) parallel the descriptive domain's categorical labels but are scoped to audit-specific metadata. This duplication of attribute names across domains is intentional: it allows the same query logic to operate on both descriptive and audit entities, with the attr_id foreign key disambiguating which domain's attribute definition applies to each value row.

The practical consequence of this architecture is that data provenance becomes queryable at multiple levels of granularity. An operator can retrieve all attributes for a single entity by joining the entity's identifier through the value tables, selecting only the rows whose attr_id matches a desired attribute definition. A cross-domain audit trail can be reconstructed by following the concludes_with foreign keys from verification activities into descriptive entities and then into their attribute values, producing a chain from Compliance Gateway Scan through RETR-0002 to the Anomaly Flag Sheet and its associated confidence, dimension, method, and timestamp values. The type-partitioned value stores ensure that this traversal is efficient: decimal joins touch only decimal tables, datetime joins touch only datetime tables, and so on. The identifiers—RETR-0001, AUDI-0001, WITH-0001—serve as the stable anchors throughout, guaranteeing that the graph remains navigable even as new entities, attributes, and values are added over time.

**t_verification_concludes_with_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0002 | 2023-03-17T15:14:20 |
| WITH-0002 | WITH-0001 | WITH-0008 | 2023-03-29T16:58:23 |
| WITH-0003 | WITH-0001 | WITH-0009 | 2023-05-17T22:59:07 |
| WITH-0004 | WITH-0002 | WITH-0002 | 2023-10-18T10:06:06 |
| WITH-0005 | WITH-0002 | WITH-0008 | 2023-06-18T21:36:06 |
| WITH-0006 | WITH-0002 | WITH-0009 | 2025-01-08T20:27:31 |
| WITH-0007 | WITH-0003 | WITH-0002 | 2025-05-26T17:08:43 |
| WITH-0008 | WITH-0003 | WITH-0008 | 2023-08-15T17:46:49 |

**t_verification_concludes_with_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0001 | 5022.45 |
| WITH-0002 | WITH-0002 | WITH-0001 | 4498.56 |
| WITH-0003 | WITH-0003 | WITH-0001 | 4177.56 |
| WITH-0004 | WITH-0004 | WITH-0001 | 216.79 |
| WITH-0005 | WITH-0005 | WITH-0001 | 4466.82 |
| WITH-0006 | WITH-0006 | WITH-0001 | 6044.91 |