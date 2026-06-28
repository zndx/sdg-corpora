---
chapter_id: ch_live_evidence_for_audit_63d66b
topic_id: 46
family: 07_long_tail
cited_terms: ['evidence_for_audit', 'primary_key_designation', 'lineage_edge_with_provenance']
model: engine-refine
---

Attributes, their types, and the entities they describe form the backbone of structured metadata management, enabling systems to capture, validate, and query heterogeneous information about auditable records, primary key designations, and data lineage edges. In this model, an entity represents a concrete object of interest—an audit evidence item such as `AuditTrail_20231015` or `ChainOfCustody_Batch44`, a primary key designation like `hardware_sn` governing the `clinical_trial_cohort` table, or a lineage edge such as `log-rotation-archival` with provenance from the `Audit-Trail-Service`. Each entity is assigned a stable identifier (`AUDI-0001`, `DESI-0001`, `PROV-0001`) that serves as the anchor for all subsequent attribute-value associations. The attribute catalogue defines what properties can be measured or recorded about these entities, with names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to a precise type from the XML Schema Definition namespace—`xsd:decimal` for numeric precision, `xsd:string` for free-form text, and `xsd:dateTime` for temporal stamps. This type discipline ensures that values are validated at ingestion and that downstream queries can rely on consistent semantics.

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

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | clinical_trial_cohort |
| DESI-0002 | lab_specimens | lab_specimens |
| DESI-0003 | manufacturing_batches | telemetry_id |
| DESI-0004 | asset_inventory | sensor_calibrations |
| DESI-0005 | network_traffic_db | hardware_sn |
| DESI-0006 | manufacturing_batches | manufacturing_batches |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

Value storage is partitioned by type to preserve data integrity while supporting a wide range of attribute kinds. Decimal attributes, such as a confidence score of `0.978` or a measured dimension of `590.71`, are stored in dedicated decimal value tables, each row linking an entity identifier to an attribute definition and its numeric value. String-valued attributes capture descriptive metadata: an encoding designation like `Encoding 02`, a method label such as `intake form`, or a language code like `fr` for audit evidence, and `de` for primary key designations. Temporal attributes record the moment an attribute was established or last updated, with timestamps such as `2024-10-15T21:07:57` or `2023-06-03T22:32:06` anchoring the provenance of each measurement. This separation of value types into distinct tables avoids the null-waste problem of a single wide attribute column and allows each value store to enforce its own constraints—decimal precision, string length, or ISO 8601 datetime format—without cross-type contamination.

The entity-attribute-value triad is instantiated through foreign-key relationships that bind values back to their source entities and attribute definitions. A decimal value row might reference entity `AUDI-0001` and attribute `AUDI-0001` (the confidence attribute), producing a verifiable chain from the raw numeric value `0.978` through the attribute definition to the audit evidence record itself. Similarly, a datetime value row links entity `AUDI-0001` to attribute `AUDI-0004` (the `recorded_at` attribute) with the value `2024-10-15T21:07:57`, establishing when the audit trail was captured. This three-way join—entity, attribute, value—is the fundamental query pattern across all entity types, whether the entity is an audit evidence item, a primary key designation, or a lineage edge. The same structural pattern repeats for primary key designations: entity `DESI-0001` carries a confidence of `0.354`, a dimension of `612.82`, a recorded-at timestamp of `2024-07-25T13:27:19`, and string attributes including `Dimension Kind 01`, `Encoding 02`, the label `audit excerpt`, and the language code `de`.

Encoding and label text introduce an additional layer of semantic clarity, particularly for data lineage and provenance tracking. The lineage edge table captures not only the relationship between a data transformation—such as `sensor-calibration-pipeline` or `financial-reconciliation-run`—and its provenance source like `Edge-Gateway-Router` or `Regulatory-Reporting-API`, but also the character encoding (`utf8`, `unicode`, `ascii`) used for the associated metadata and a human-readable label such as `nightly summary` or `calibration record`. These fields ensure that lineage metadata is both machine-parseable and human-interpretable across system boundaries, which is critical when audit trails must be reviewed by compliance officers or when data lineage must be traced across heterogeneous platforms. The encoding specification, for instance, guarantees that a label stored as `utf8` can be safely transmitted and rendered in any modern system, while an `ascii`-encoded label restricts the character set but maximizes interoperability with legacy tools.

Together, these constructs—entities as stable anchors, attributes as typed property definitions, values as partitioned by type, and encoding/label fields as cross-system bridges—form a coherent metadata architecture. The identifier scheme (`AUDI-*`, `DESI-*`, `PROV-*`) provides immediate classification of the entity domain, while the attribute type system (`xsd:decimal`, `xsd:string`, `xsd:dateTime`) enforces schema-level correctness. Representative values like `ChainOfCustody_Batch44` for evidence, `manufacturing_batches` as a primary key of `telemetry_id`, or `climate-model-updates` as a lineage edge with `unicode` encoding demonstrate how the same structural pattern scales across audit, governance, and data lineage use cases. The result is a queryable, type-safe, and extensible metadata store that supports compliance verification, data lineage tracing, and primary key governance without requiring schema changes for new attribute types.