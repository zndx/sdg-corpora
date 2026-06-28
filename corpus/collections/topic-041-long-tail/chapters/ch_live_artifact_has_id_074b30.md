---
chapter_id: ch_live_artifact_has_id_074b30
topic_id: 41
family: 01_foundation
cited_terms: ['artifact_has_id', 'lineage_governed_by_directive', 'breaking_change_subclass']
model: engine-refine
---

Identifiers serve as the immutable anchors of any governance framework, binding abstract entities to stable, globally resolvable references. An artifact such as MetricsDump88A is not merely a name but a persistent object distinguished by the identifier oid:1.3.6.1 and tracked across revisions—version 3, version 4, version 9—each representing a distinct state in the artifact's lifecycle. Similarly, the identifier doi:10.1109/x anchors ConfigManifest99, while ARN:res/41 resolves DataPipelineV3 to a specific resource within a cloud-native namespace. These identifiers are not interchangeable; they encode the provenance and resolution domain of the entity they designate, whether that domain is an object identifier registry, a digital object system, or a cloud resource naming convention. The version field, an integer ranging from 3 to 9 across the observed records, provides a linear ordering of states, enabling auditors and automated systems to reconstruct the exact configuration that was in effect at any point in time.

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

Attributes and their associated types form the descriptive layer that gives entities their operational meaning. A breaking change such as Telemetry schema evolution is characterized by a set of typed attributes—confidence, dimension_kind, method, recorded_at—each constrained to a specific schema type. The attribute confidence carries an xsd:decimal type, permitting values such as 0.203 or 700.59, while dimension_kind and method are xsd:string, holding values like Dimension Kind 01 or calibration record. The attribute recorded_at, typed as xsd:dateTime, anchors temporal metadata to precise instants: 2023-07-26T14:07:49, 2025-01-03T20:08:42, 2024-04-10T03:15:13. This separation of attribute name from attribute type is not merely structural; it enforces type discipline across the registry, ensuring that a decimal confidence score cannot be conflated with a string-valued dimension kind, and that temporal attributes are always parsed and compared as ISO 8601 instants rather than opaque text.

Units and languages provide the contextual scaffolding that makes cross-system interoperability possible. A lineage item such as Patient Cohort Dataset is governed by a directive that specifies its measurement unit as m/s and its operational language as en, while Sensor Telemetry Stream carries the unit count and language de. The unit field captures the physical or logical dimension of a measurement—milliseconds (ms), meters per second (m/s), or raw count—ensuring that a value of 64.61 recorded against one lineage item is not misinterpreted when applied to another. Language codes, drawn from the ISO 639 set, establish the linguistic context for metadata, user-facing strings, and localization directives. These contextual fields are not decorative; they are the contract between systems that exchange data across organizational boundaries, where a telemetry stream in German (de) and a patient cohort dataset in English (en) must be processed by different pipelines with different validation rules.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

The entity-attribute-value model, as instantiated in the breaking change registry, demonstrates how a normalized schema supports both flexibility and rigor. Each breaking change—Telemetry schema evolution, Provenance graph migration, OAuth2 token rotation—is an entity that can carry multiple attributes of different types, stored across separate value tables keyed by the attribute's schema type. The entity CHAN-0001, for instance, carries a decimal confidence of 0.203, a string dimension_kind of Dimension Kind 01, and a string method of calibration record, each stored in its appropriate value table and linked through the entity and attribute identifiers. This design permits a single breaking change to accumulate heterogeneous metadata without schema drift, while the foreign-key constraints on entity_id and attr_id ensure referential integrity across the value tables. The result is a registry that can describe complex operational events with the same precision that identifiers bring to artifact tracking and units bring to measurement semantics.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | device telemetry collector |
| CHAN-0002 | Telemetry schema evolution | inventory management API |
| CHAN-0003 | Provenance graph migration | legacy mobile app |
| CHAN-0004 | OAuth2 token rotation | real-time event stream |
| CHAN-0005 | Schema field removal | internal microservice mesh |
| CHAN-0006 | Sensor sampling rate drop | customer dashboard frontend |
| CHAN-0007 | Provenance graph migration | compliance audit logger |
| CHAN-0008 | TLS 1.3 enforcement | third-party analytics SDK |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |