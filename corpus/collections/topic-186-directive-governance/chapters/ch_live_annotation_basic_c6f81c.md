---
chapter_id: ch_live_annotation_basic_c6f81c
topic_id: 186
family: 02_observation_measurement
cited_terms: ['annotation_basic', 'schemaorg_event_location', 'span_within_trace']
model: engine-refine
---

In structured data governance, the distinction between an entity and its attributes forms the backbone of auditable provenance tracking. An entity represents a discrete, identifiable object within the system—whether it is a lab sample preservation log, a data-lake ingestion job, or a trace span such as `lambda-process-image`. Each entity receives a stable identifier, like `ANNO-0001` or `LOCA-0001`, that serves as its canonical reference across all downstream queries and cross-references. The entity itself carries a human-readable label or description, but the identifier is what guarantees unambiguous resolution when multiple systems need to refer to the same object. This separation of identity from description is essential in compliance contexts, where the same audit event must be referenced consistently across logging, retention, and reporting pipelines.

**t_annotation_basic**

| id | annotation |
| --- | --- |
| ANNO-0001 | Lab sample preservation log |
| ANNO-0002 | Dataset quality flag |
| ANNO-0003 | Observation confidence score |
| ANNO-0004 | Model versioning record |
| ANNO-0005 | Lab sample preservation log |
| ANNO-0006 | Temperature sensor calibration |
| ANNO-0007 | Observation confidence score |
| ANNO-0008 | Telemetry schema update |

**t_annotation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_annotation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2023-10-01T01:18:56 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-08-04T06:45:48 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2023-05-30T04:23:33 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-12-22T16:10:44 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2024-08-02T10:45:55 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2023-08-09T11:38:40 |
| ANNO-0007 | ANNO-0007 | ANNO-0004 | 2023-04-18T06:49:25 |
| ANNO-0008 | ANNO-0008 | ANNO-0004 | 2024-10-12T21:41:16 |

**t_annotation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.902 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 146.86 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 292.49 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.818 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 591.53 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 955.64 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.553 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 336.91 |

**t_annotation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | intake form |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | fr |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | automated |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | ms |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | ANNO-0001 |
| LOCA-0002 | data-lake-ingestion-job | ANNO-0003 |
| LOCA-0003 | provenance-trace-record | ANNO-0004 |
| LOCA-0004 | provenance-trace-record | ANNO-0003 |
| LOCA-0005 | field-observation-dataset | ANNO-0002 |
| LOCA-0006 | governance-policy-update | ANNO-0004 |
| LOCA-0007 | lab-sample-tracker | ANNO-0005 |
| LOCA-0008 | field-observation-dataset | ANNO-0008 |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

Attributes extend an entity's descriptive capacity by defining named properties with well-specified types. An attribute definition—such as `confidence`, `recorded_at`, or `checksum`—establishes both the semantic meaning and the data type of a property, using schema namespaces like `xsd:decimal`, `xsd:string`, `xsd:dateTime`, and `xsd:date`. The type constraint ensures that values stored for a given attribute are homogeneous and machine-processable. For instance, the `recorded_at` attribute is typed as `xsd:dateTime`, and its associated values—`2023-10-01T01:18:56`, `2024-08-04T06:45:48`—are all valid ISO 8601 timestamps. Similarly, the `confidence` attribute, typed as `xsd:decimal`, holds values like `0.902` and `0.818`. By separating attribute definitions from their concrete values, the model supports schema evolution: new attributes can be introduced without altering existing entity records, and type validation can be enforced at write time.

The actual values of attributes are stored in dedicated value tables partitioned by type, each linking a value back to its owning entity and its defining attribute through foreign keys. An entity such as `ANNO-0001` may carry multiple attribute values simultaneously—a decimal value of `0.902` for `confidence`, a string value of `intake form` for a descriptive field, and a datetime value of `2023-10-01T01:18:56` for `recorded_at`. This value-entity-attribute triad is the fundamental unit of structured metadata: every fact about an entity is captured as a triple that can be queried, filtered, and audited independently. The partitioning by value type (datetime, decimal, varchar, integer, date) enables efficient storage and indexing, since queries for timestamp ranges or numeric thresholds do not need to scan heterogeneous value columns.

Relationships between entities are expressed through subject-target-role triples, which encode not just connectivity but the semantic nature of the connection. In a trace analysis context, a span such as `http-get-users` (the subject) may be related to a parent span `checkout-session` (the target) with the role `observer`, indicating that the HTTP request was monitored as part of a broader checkout workflow. The same subject-target pair can carry different roles—`contributor` versus `observer`—depending on whether the span actively participated in or merely witnessed the parent operation. This role-bearing relationship model is critical for compliance auditing, where the distinction between an entity that caused an event and one that merely recorded it can determine liability, retention requirements, and regulatory reporting obligations.

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |

The practical effect of this design is a fully queryable provenance graph. Any entity can be traced through its attributes to understand its properties, through its relationships to understand its context, and through its identifier to locate it across all related tables. A `provenance-trace-record` event located in the `ap-south-2` region, licensed under `Apache-2.0`, with checksum `c0ffee42` and created on `2023-06-13`, can be correlated with the trace spans that generated it and the attributes that describe its quality. This unified model supports both ad-hoc investigation—reconstructing the full state of an audit event—and systematic compliance checks, such as verifying that all ingestion jobs have a recorded checksum or that all confidence scores fall within acceptable thresholds.