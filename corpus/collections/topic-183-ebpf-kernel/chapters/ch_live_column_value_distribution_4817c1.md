---
chapter_id: ch_live_column_value_distribution_4817c1
topic_id: 183
family: 07_long_tail
cited_terms: ['column_value_distribution', 'artifact_with_existential', 'annotation_at_tier']
model: engine-refine
---

Attributes serve as the fundamental descriptors of any managed entity, capturing properties that range from technical metadata to operational state. An attribute is always paired with a type that constrains its permissible values, establishing a contract between the property name and its semantic domain. In practice, attributes such as checksum, created_date, identifier, and license describe the characteristics of artifacts like provenance-certificates and edge-gateways, while their types—xsd:string, xsd:date, cco:DesignativeICE—enforce structural discipline across the system. Similarly, annotations attached to data tiers carry attributes like confidence, dimension_kind, method, and recorded_at, typed as xsd:decimal, xsd:string, and xsd:dateTime respectively, ensuring that calibration metadata and quality flags remain machine-interpretable. The attribute type is not merely a formality; it determines how values are validated, indexed, and queried, and it enables cross-system interoperability by anchoring properties to well-known schemas such as XML Schema Datatypes or custom ontologies like cco:DesignativeICE.

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | DIST-0006 |
| TIER-0002 | TelemetryLabel HighLatency | DIST-0002 |
| TIER-0003 | QualityFlag Pass | DIST-0001 |
| TIER-0004 | DatasetVersion v3.2.1 | DIST-0005 |
| TIER-0005 | ProvenanceSource EPA7 | DIST-0005 |
| TIER-0006 | ProvenanceSource EPA7 | DIST-0004 |
| TIER-0007 | ObservationNote Drift | DIST-0006 |
| TIER-0008 | ComplianceLevel SOC2 | DIST-0002 |

**t_annotation_at_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Every attribute instance is anchored to an entity through a foreign-key relationship that binds the property to a specific subject of description. The entity identifier—whether it appears as EXIS-0001 for an edge-gateway or TIER-0001 for a data distribution tier—acts as the stable handle that allows attributes to be resolved unambiguously. When a value is assigned to an attribute, the system records not only the value itself but also the entity_id and attr_id that form the composite key of the assignment. This design permits a single entity to carry multiple values for different attributes, and it allows attributes to be shared across entities when the same property is relevant in multiple contexts. For instance, the created_date attribute is applied uniformly across artifacts such as provenance-cert, edge-gateway, and audit-log-2023, with values ranging from 2023-02-05 to 2024-10-14, while the confidence attribute on data tier annotations captures decimal measurements like 0.089 and 0.223 that quantify the reliability of sensor calibration or telemetry labeling.

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

The value distribution framework extends this attribute model to the statistical characterization of column data, where a subject column is linked to a target distribution profile through a role that specifies the nature of the association. A column such as request_count or patient_bmi becomes the subject of analysis, and it is associated with a target distribution—pareto_shape, binomial_profile, uniform_range, or poisson_profile—through a relationship labeled contributor or reviewer. This triad of subject, target, and role enables the system to track not only what statistical model describes a given column but also who or what is responsible for that characterization. The same column, identified by DIST-0007, may appear in multiple associations with different roles, reflecting the fact that a single data field can be evaluated from multiple perspectives or by multiple stakeholders.

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

Identifiers provide the connective tissue that holds this entire structure together, serving as the stable keys that reference entities, attributes, distributions, and annotations across the system. They follow a consistent naming convention—DIST-0001, EXIS-0001, TIER-0001—that encodes both the category of the referenced object and its position within that category. These identifiers are not merely internal bookkeeping; they appear as foreign keys in value assignment tables, in join tables that relate subjects to targets, and in annotation mappings that tie descriptive labels to specific tiers. The identifier DIST-0006, for example, simultaneously references a value distribution profile and appears as the target of an annotation association, demonstrating how a single key can participate in multiple relationship contexts without ambiguity.

The misc column in value assignment tables captures the actual data values assigned to attributes, spanning a heterogeneous range of types that reflect the diversity of properties being described. String values such as 5e8f3c91 for a checksum or urn:uuid:9f2a for an identifier coexist with date values like 2024-03-17 and decimal measurements like 784.31, all stored in type-specific value tables that enforce schema integrity at the point of insertion. Timestamps such as 2023-08-28T08:07:44 and 2025-03-16T10:06:06 record the precise moment when annotations were created, while categorical values like proprietary and on-prem-dc1 describe deployment characteristics. This separation of value types into dedicated tables ensures that each attribute receives values of the correct type, preventing the kind of data corruption that plagues less disciplined metadata systems.