---
chapter_id: ch_live_taper_tolerance_constraint_faafe9
topic_id: 42
family: 08_derived
cited_terms: ['taper_tolerance_constraint', 'profile_has_null_rate', 'transformation_min_one_output']
model: engine-refine
---

Taper tolerance constraints constitute the foundational entities of a manufacturing specification registry, each identified by a unique constraint code such as CONS-0001 through CONS-0004 and classified by a standardized nomenclature—ISO 7/24, R8 Taper, HSK 63A, Brown Sharpe. These identifiers anchor a broader attribute-value architecture in which each constraint carries a set of typed metadata properties. Attribute definitions are catalogued separately under names like confidence, dimension_kind, method, and recorded_at, each bound to a precise data type: xsd:decimal for numeric measurements, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This separation of attribute schema from attribute instances permits constraints to be enriched with heterogeneous properties without requiring schema migrations, and it ensures that every value—whether the decimal 0.573, the string Dimension Kind 01, or the timestamp 2023-04-13T01:14:03—is validated against its declared type at ingestion.

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

The value-store is partitioned by data type into three dedicated tables, each linking an entity identifier to an attribute identifier and a concrete value. Decimal values such as 111.04 and 682.01 reside in the numeric store, string values like Encoding 02 and nightly summary in the varchar store, and temporal values such as 2024-02-24T21:07:21 in the datetime store. This type-disaggregated design eliminates the ambiguity of a single monolithic value column and enables indexed queries tailored to each type's semantics. A single constraint, for instance CONS-0001, may simultaneously carry a confidence score of 0.573, a dimension kind of Dimension Kind 01, and a recorded_at timestamp of 2023-04-13T01:14:03, each drawn from its respective value table through the shared entity_id and attr_id keys.

Beyond specification metadata, the framework enforces data quality through a profile-to-null-rate association model. Profiles such as QualityGateConfig, ObservationProtocolAlpha, and SensorTelemetryV2 are linked to null-rate categories—dropRate, absentMetric, missingBaseline—via a junction table that records the nature of each association through a role field. A profile may assume the role of owner over a null rate, contributor to another, or reviewer of a third, thereby encoding governance responsibilities directly into the relationship. The identifier RATE-0001, for example, ties profile RATE-0003 to null rate RATE-0005 under the role of owner, while RATE-0004 connects profile RATE-0004 to null rate RATE-0001 under the role of contributor. This tripartite structure—profile, null rate, role—allows a single quality profile to express differentiated accountability across multiple dimensions of data completeness.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

A parallel junction model governs the relationship between data transformations and their output datasets. Transformations such as data normalization and format conversion are associated with output datasets including parsed access logs, curated events table, and standardized inventory index through a role-bearing association table. The role field here distinguishes between reviewer, contributor, and observer, enabling a single transformation to produce multiple outputs while attributing distinct responsibilities to each output lineage. Transformation OUTP-0006, for instance, maps to output datasets OUTP-0003, OUTP-0005, and OUTP-0001 under the roles of reviewer, contributor, and contributor respectively, while OUTP-0003 links to OUTP-0003 under the role of observer. This pattern mirrors the null-rate association in structure and intent, establishing a reusable governance vocabulary across different operational domains.

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

Together, these tables form a coherent metadata management layer: constraints define what is being measured, attributes define how it is described, values store the actual measurements, profiles define quality expectations, and transformation-output associations document data lineage. The consistent use of surrogate identifiers (CONS-*, RATE-*, OUTP-*) and role-bearing junction tables ensures that every relationship is explicit, auditable, and extensible. This architecture supports both the static classification of manufacturing specifications and the dynamic tracking of data quality and transformation pipelines within a single, unified reference model.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |