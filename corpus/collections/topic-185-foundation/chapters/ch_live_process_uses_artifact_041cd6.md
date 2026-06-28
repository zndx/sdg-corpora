---
chapter_id: ch_live_process_uses_artifact_041cd6
topic_id: 185
family: 01_foundation
cited_terms: ['process_uses_artifact', 'transformation_generates_entity', 'evidence_for_audit']
model: engine-refine
---

Identifiers and entities constitute the foundational addressing layer for any auditable data pipeline, anchoring every artifact, transformation, and evidence record to a stable, machine-readable key. Within the process artifact registry, identifiers such as ARTI-0001 through ARTI-0004 uniquely tag individual workflow invocations, while the entity column in the audit value tables—AUDI-0001, AUDI-0002, and so forth—serves as the foreign-key handle that binds typed attribute values back to their parent evidence records. This two-tier addressing scheme, where a primary identifier names the record and an entity reference resolves it from value tables, ensures that every measurement, timestamp, or categorical label can be traced to its source without ambiguity. The evidence registry itself, carrying identifiers like AUDI-0001 through AUDI-0004 and evidence names such as AuditTrail_20231015 and ChainOfCustody_Batch44, provides the top-level container that these entity references point into, forming a closed loop of referential integrity across the audit graph.

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

Process scheduling and resilience are captured through the scheduledat and retrycount attributes, which together quantify both the planned and actual execution posture of each artifact. The scheduledat field records the intended invocation time with microsecond precision—2025-02-18T02:41:43 for the log_shipment artifact, for instance—enabling downstream consumers to reconstruct the intended execution timeline and detect drift between plan and reality. Retrycount, ranging from 50 for ARTI-0001 to 487 for ARTI-0004 (the trace_sampling artifact), provides a direct measure of operational instability; a retry count of 487 on a single trace-sampling invocation signals a systemic degradation that warrants immediate investigation, whereas a count of 50 on a log shipment may fall within acceptable tolerance. These two attributes, when joined on the process identifier, allow compliance officers to correlate scheduled frequency with failure rates across process types such as index_rebuild, batch ingestion, and archival compression.

**t_process_uses_artifact**

| id | process | retry_count | scheduled_at |
| --- | --- | --- | --- |
| ARTI-0001 | log_shipment | 50 | 2025-02-18T02:41:43 |
| ARTI-0002 | index_rebuild | 207 | 2024-07-19T11:09:21 |
| ARTI-0003 | index_rebuild | 193 | 2025-02-01T09:38:01 |
| ARTI-0004 | trace_sampling | 487 | 2024-04-29T06:10:14 |

Transformation lifecycle tracking relies on durationseconds and phase to characterize the temporal footprint and execution state of each data operation. The durationseconds column records wall-clock execution time in fractional seconds—5649.07 for the schema migration routine, 6875.45 for the feature engineering step—providing a quantitative basis for capacity planning and SLA enforcement. The phase column, currently populated uniformly with the value execution across all four recorded transformations (schema migration routine, batch ingestion pipeline, archival compression job, feature engineering step), indicates the current stage of the transformation lifecycle; its design to support additional phase values suggests a state machine that can be extended to capture staging, validation, or rollback states as the pipeline matures. The generates_entity column bridges the transformation registry to the audit value tables, naming the concrete data product produced—calibrated sensor readings, feature matrix, cleaned telemetry dataset—so that downstream consumers can resolve the lineage from transformation to output artifact.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |

The audit evidence attribute system employs a typed value model where attr_name and attr_type define the schema and value tables store the actual measurements. Attribute names such as confidence, dimension_kind, method, and recorded_at are paired with XML Schema types—xsd:decimal, xsd:string, xsd:dateTime—to enforce type safety at query time. The value storage is partitioned by type: datetime values like 2024-10-15T21:07:57 and 2023-06-03T22:32:06 reside in the datetime table, decimal measurements such as 0.978 and 590.71 in the decimal table, and free-form strings including Dimension Kind 01, Encoding 02, and intake form in the varchar table. Each value row carries an entity_id that resolves to a specific evidence record and an attr_id that resolves to the attribute definition, creating a normalized entity-attribute-value structure that supports arbitrary attribute expansion without schema migration. The misc column, which holds the actual value content, is the sole data-bearing field in each value table; the identifier, entity, and attr columns serve exclusively as the composite key that guarantees each attribute measurement is stored exactly once and retrievable by its full three-part address.

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