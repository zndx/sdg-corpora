---
chapter_id: ch_live_constraint_with_predicate_5a704f
topic_id: 183
family: 03_directive_governance
cited_terms: ['constraint_with_predicate', 'lineage_edge_subclass', 'column_property_subclass']
model: engine-refine
---

Within a structured governance framework, every artifact is anchored by a unique identifier and described through a typed attribute model that separates property definitions from their concrete values. Identifiers such as PRED-0001 and EDGE-0001 serve as immutable keys that persist across relationship tables and value stores, ensuring referential integrity regardless of how data is partitioned. Attributes themselves are declared with explicit names and data types—confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime—so that downstream consumers can validate, transform, or query values without guessing at semantics. This separation of schema from instance data means that a property like recorded_at can be attached to any entity in the system, and its value will always be interpreted as a timestamp, not a freeform string.

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | PRED-0001 |
| PROP-0002 | device_serial | PRED-0008 |
| PROP-0003 | request_payload | PRED-0005 |
| PROP-0004 | event_code | PRED-0004 |
| PROP-0005 | batch_id | PRED-0004 |
| PROP-0006 | batch_id | PRED-0008 |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

The confidence metric exemplifies this precision in practice. Lineage edges carry decimal-valued confidence scores that quantify the reliability of a data relationship: a ManufacturingBatchTrace flowing from GCSRawZone scores 0.101, suggesting weak evidentiary support, while a FinancialLedgerSync pipeline from S3ArchivalBucket achieves a perfect 1.000. These scores are not ad hoc annotations; they are first-class attributes with a declared type, stored in the same value table alongside other decimal properties such as 504.02 and 422.21, and subject to the same type enforcement. The framework thus treats confidence as a measurable dimension of trust rather than an informal label, enabling governance policies to trigger different workflows based on whether a lineage edge crosses a defined confidence threshold.

Relationships between governed entities are expressed through subject-target pairs enriched with a role that clarifies the nature of the connection. In the constraint-predicate association layer, a constraint such as PRED-0003 (the Authentication requirement) is linked to a predicate like PRED-0001 (authRequirement) with the role owner, indicating that the constraint directly governs that predicate. The same predicate may appear in other relationships with the role contributor or observer, reflecting that a single technical requirement can participate in multiple governance contexts simultaneously. This role-based modeling allows auditors to trace not just which constraints apply to which predicates, but how each constraint participates in the broader compliance architecture.

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

Descriptive labels and categorical metadata provide the human-readable context that complements machine-enforced structure. Lineage edges carry label_text values such as intake form and calibration record, which communicate the document type or procedural artifact associated with a data flow without encoding that information in the identifier or the confidence score. Similarly, column properties annotate specific columns—user_agent, device_serial, request_payload, event_code—and attach typed attributes to them, enabling column-level governance that can distinguish between a column's dimensional classification (Dimension Kind 01) and its encoding scheme (Encoding 02).

**t_lineage_edge_subclass**

| id | lineage | from_source | confidence | label_text |
| --- | --- | --- | --- | --- |
| EDGE-0001 | NetworkTrafficDump | PostgreSQLRawDB | 0.584 | intake form |
| EDGE-0002 | ManufacturingBatchTrace | GCSRawZone | 0.101 | calibration record |
| EDGE-0003 | ManufacturingBatchTrace | RESTAPIGateway | 0.280 | intake form |
| EDGE-0004 | FinancialLedgerSync | S3ArchivalBucket | 1.000 | calibration record |
| EDGE-0005 | ManufacturingBatchTrace | RedisCacheStore | 0.544 | audit excerpt |
| EDGE-0006 | NetworkTrafficDump | OracleERPSystem | 0.796 | calibration record |
| EDGE-0007 | PatientAdmissionRecord | RedisCacheStore | 0.907 | change rationale |
| EDGE-0008 | InventoryReconciliation | KafkaEventsStream | 0.508 | audit excerpt |

Temporal provenance is captured through the same attribute-value mechanism, ensuring that every annotation carries a timestamp. The recorded_at attribute, typed as xsd:dateTime, stores values like 2023-02-03T11:52:35 and 2024-11-24T00:57:54 for different property entities, establishing when each governance decision was made. Because these timestamps are stored as typed values in a dedicated value table rather than as freeform text, they can be queried, sorted, and compared alongside numeric confidence scores and string classifications, creating a unified audit trail where every property—whether it expresses a confidence level, a categorical label, or a point in time—is governed by the same type-aware attribute model.