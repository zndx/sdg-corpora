---
chapter_id: ch_live_profiling_produces_profile_ebb31b
topic_id: 26
family: 02_observation_measurement
cited_terms: ['profiling_produces_profile', 'schemaorg_place_longitude', 'annotation_at_tier']
model: engine-refine
---

Operational tracking and data governance rely on a consistent identifier scheme to anchor every record to a unique, auditable reference. Profiling runs are assigned identifiers such as PROF-0001 through PROF-0004, each capturing a discrete execution event. For each run, the system records how long the process took—duration_seconds ranges from roughly 1,113 seconds for PROF-0002 to nearly 6,717 seconds for PROF-0001—and how many times the job was retried before completion, with retry counts spanning from 186 to 303 across the sample. The exit_code field, labeled exit in the schema, stores the final status code returned by the process; values such as 725, 809, 348, and 827 serve as machine-readable signals for downstream alerting and compliance reporting.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

Every profiling event is associated with a produces key that links back to a dimension table describing what artifact or output was generated. That dimension table carries a produces_label—miscellaneous human-readable text like "Produces Label 01"—and a produces_category, which classifies the output into structured groups such as "Produces Category 01" through "Produces Category 04." This separation of label and category enables both human consumption and programmatic filtering, ensuring that governance policies can be applied at the category level while operators inspect individual labels for troubleshooting.

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Geographic and schema.org entities are tracked through a parallel set of tables that model place-based data with explicit coordinate values and relationship semantics. A place such as HooverDam, MaunaLoaObservatory, GoldenGateBridge, or ISSOrbitModule is identified by a LONG- prefixed identifier and paired with a longitude coordinate—for instance, -27.9692 for LONG-0001 or 2.2945 for LONG-0002. Relationships between schema.org entities and longitude records are captured in a junction table where the subject column names the originating entity, the target column names the referenced longitude, and the role column describes the nature of the association, taking values such as reviewer, contributor, or owner. This role-based modeling makes it possible to audit who or what is responsible for each geographic linkage.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | HooverDam |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | GoldenGateBridge |
| LONG-0004 | ISSOrbitModule |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | PaloAltoResearchCenter |
| LONG-0007 | BlackRockForest |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

Annotations at the tier level extend this framework by attaching typed attributes to entities. Each annotation—such as "SensorCalibration Q4," "TelemetryLabel HighLatency," "QualityFlag Pass," or "DatasetVersion v3.2.1"—is linked to a tier via the at_tier column and enriched with attribute definitions that specify both the attribute name and its data type. Attribute names include confidence, dimension_kind, method, and recorded_at, while their corresponding types span xsd:decimal, xsd:string, and xsd:dateTime. The actual values are stored in type-specific tables keyed by entity and attribute identifiers, ensuring type safety and enabling efficient queries. Decimal values such as 0.089 and 784.31 are stored separately from string values like "Dimension Kind 01" and "Encoding 02," and datetime values such as 2023-08-28T08:07:44 and 2025-03-16T10:06:06 are persisted in their own table. This typed value architecture guarantees that compliance checks can validate data integrity at the type level, while the entity column consistently ties every attribute value back to the annotation record it augments.

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | LONG-0006 |
| TIER-0002 | TelemetryLabel HighLatency | LONG-0002 |
| TIER-0003 | QualityFlag Pass | LONG-0001 |
| TIER-0004 | DatasetVersion v3.2.1 | LONG-0005 |
| TIER-0005 | ProvenanceSource EPA7 | LONG-0005 |
| TIER-0006 | ProvenanceSource EPA7 | LONG-0004 |
| TIER-0007 | ObservationNote Drift | LONG-0006 |
| TIER-0008 | ComplianceLevel SOC2 | LONG-0002 |

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