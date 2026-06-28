---
chapter_id: ch_live_attribute_set_max_attrs_cec1fa
topic_id: 91
family: 02_observation_measurement
cited_terms: ['attribute_set_max_attrs', 'equiv_intersect_anchored_artifact', 'classification_basic']
model: engine-refine
---

Attribute management in governed data systems rests on a disciplined separation between attribute definitions, their typed values, and the entities to which those values attach. Each attribute set is assigned a stable identifier—ATTR-0001 through ATTR-0004 serve as canonical handles—and the attributes themselves carry domain-meaningful names such as voltage_dc, flow_rate_lpm, humidity_percent, and particulate_um. The attribute catalog further specifies each attribute's semantic type: confidence is recorded as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline is not cosmetic; it governs storage, validation, and query semantics across the system. Decimal-valued attributes like confidence (0.687, 125.69, 391.05, 0.041) are persisted in a dedicated value table, string-valued attributes such as Dimension Kind 01 and Encoding 02 in another, and timestamped attributes like 2024-07-05T18:39:47 or 2023-05-25T09:01:45 in a third. The entity_id column anchors every value to the entity it describes, creating a normalized many-to-many relationship between entities and attributes that avoids the denormalization pitfalls of wide, sparse tables.

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Checksums and licensing form the integrity and provenance layer that sits alongside attribute data. The artifact equivalence table records pairs of equivalent representations—LabSampleMetadata paired with IntegrityFile, IngestionPipeline with ComplianceDocument, ValidationRuleSet with SecurityAuditLog, AuditTrailLog with IntegrityFile—each entry carrying a checksum such as 7b14de08, 5e8f3c91, or a3f9c21e that enables cryptographic verification of artifact identity and change detection. The license field (proprietary, GPL-3.0, MIT) documents the usage rights governing each artifact, a requirement that is both legal and operational: systems that ingest or transform these artifacts must respect licensing constraints during pipeline execution and downstream distribution. Notably, the same checksum value (7b14de08) appears for both ARTI-0001 and ARTI-0003, indicating that different artifact identifiers can resolve to the same underlying content, a pattern that supports deduplication and canonical reference.

**t_equiv_intersect_anchored_artifact**

| id | equiv | equiv_2 | checksum | license |
| --- | --- | --- | --- | --- |
| ARTI-0001 | LabSampleMetadata | IntegrityFile | 7b14de08 | proprietary |
| ARTI-0002 | IngestionPipeline | ComplianceDocument | 5e8f3c91 | GPL-3.0 |
| ARTI-0003 | ValidationRuleSet | SecurityAuditLog | 7b14de08 | MIT |
| ARTI-0004 | AuditTrailLog | IntegrityFile | a3f9c21e | proprietary |
| ARTI-0005 | FeatureVectorStore | ConfigurationArtifact | a3f9c21e | GPL-3.0 |
| ARTI-0006 | AuditTrailLog | ConstraintDefinition | a3f9c21e | BSD-3-Clause |

Classification records impose operational structure on the attribute and artifact ecosystem by assigning each item to a phase and recording what triggered its creation or update. The classification column carries labels such as sensor calibration, data validation, and pipeline orchestration, while the phase column distinguishes between execution and review stages. The triggered_by column captures the origin of the classification event—schedule, manual, or retry—providing an audit trail that distinguishes automated pipeline activity from human intervention. This triad (classification, phase, triggered_by) enables governance queries that answer questions like which sensor calibrations were applied during execution versus review, or which data validation rules were triggered by manual overrides rather than scheduled runs. The classification identifiers CLAS-0001 through CLAS-0004 serve as stable handles for these records, ensuring that classification decisions persist and can be referenced across system boundaries.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

The interplay between these layers—attribute definitions, typed values, artifact integrity, and classification—creates a coherent governance model. An entity identified by ATTR-0001, for instance, may carry a decimal confidence value of 0.687, a string dimension_kind of Dimension Kind 01, and a recorded_at timestamp of 2024-07-05T18:39:47, all of which can be traced back through the classification system to a sensor calibration event that was triggered by schedule and is currently in the execution phase. The artifact table ensures that the metadata describing this entity (perhaps a LabSampleMetadata record) has not been tampered with, as verified by its checksum, and that its use complies with the stated license. This architecture supports both real-time operational queries and retrospective compliance audits, because every value, every classification, and every artifact integrity marker is independently addressable and traceable.