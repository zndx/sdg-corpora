---
chapter_id: ch_live_column_value_distribution_28cd65
topic_id: 62
family: 07_long_tail
cited_terms: ['column_value_distribution', 'column_version_subclass', 'conceptual_construction_process']
model: engine-refine
---

The governance of column-level metadata rests on a layered architecture that separates statistical characterization from versioned attribute management and process-level provenance. The distribution layer begins with **t_column_value_distribution**, which anchors each column to a stable identifier—DIST-0001 through DIST-0004—and associates it with a concrete field such as `request_count`, `patient_bmi`, or `device_serial`. This table feeds into **t_column_value_distribution_value_distribution**, which classifies the statistical profile of each column using distribution types like `pareto_shape`, `binomial_profile`, `uniform_range`, and `poisson_profile`. The linkage between columns and their distributions is mediated by **t_column_value_distribution__value_distribution**, a junction table that carries a `role` attribute—`contributor` or `reviewer`—to distinguish whether a given distribution was produced as an input to analysis or validated as an output of review. For instance, DIST-0007 (a column referenced across multiple distribution assignments) appears with the role `contributor` in three of four junction records and `reviewer` in one, illustrating how the same column can participate in multiple distributional analyses with different governance responsibilities.

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

The versioning subsystem operates independently of distributional metadata but shares the same design philosophy of separating schema from instance data. **t_column_version_subclass** records named versions of columns—`release_2023q4`, `canonical_v3`, `staging_v0.9`—and binds each version to a column name such as `timestamp_utc`, `operator_code`, or `humidity_pct`. A single column may carry multiple versions; `timestamp_utc` appears under both `release_2023q4` and `staging_v0.9`, while `canonical_v3` is shared between `operator_code` and `humidity_pct`, reflecting a lifecycle in which columns evolve through release, staging, and canonical states. The attribute definitions for these versions are captured in **t_column_version_subclass_attr**, which assigns an `attr_name`—`confidence`, `dimension_kind`, `method`, `recorded_at`—and an `attr_type` drawn from the XSD namespace (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). This separation of attribute schema from attribute values enables type-safe storage of heterogeneous data.

Attribute values are materialized across three type-specific tables, each keyed by a surrogate identifier and linked to a version subclass through `entity_id` and `attr_id`. The decimal values table stores numeric measurements such as `0.648`, `428.43`, and `933.19` against attributes like `confidence` (VERS-0001) and others (VERS-0005, VERS-0007), while the varchar table captures string-valued attributes including `Dimension Kind 01`, `Encoding 02`, `intake form`, and `de`. The datetime table records temporal attributes with values like `2024-04-09T04:38:55`, `2024-01-02T00:15:06`, `2023-01-13T23:21:50`, and `2023-03-07T00:33:45`, all referencing the same attribute VERS-0004 (`recorded_at`), which demonstrates how a single attribute definition can accumulate multiple temporal observations across different entities. The `entity_id` column in each value table serves as the foreign key back to the version subclass, ensuring that every attribute value is traceable to a specific column version.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | release_2023q4 |
| VERS-0002 | operator_code | canonical_v3 |
| VERS-0003 | timestamp_utc | staging_v0.9 |
| VERS-0004 | humidity_pct | canonical_v3 |
| VERS-0005 | sample_volume_ml | draft_03 |
| VERS-0006 | ph_level | staging_v0.9 |

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

At the process layer, **t_conceptual_construction_process** documents the transformation pipelines that convert raw inputs into structured predicates. Each process carries an identifier (PROC-0001 through PROC-0004), a `conceptual_construction_process` name such as `HierarchicalEdge`, `Semantic Enrichment`, or `CausalDependency`, a `transforms_subject` field identifying the input artifact—`Raw Data Dictionary`, `Unstructured Log Streams`, `Raw Metadata Catalog`, `Raw Sensor Readings`—and a `generates_predicate` field specifying the output artifact, including `CrossReferenceLink`, `Provenance Tracing`, `Data Model Refinement`, and `Schema Derivation`. The process `HierarchicalEdge` (PROC-0001 and PROC-0002) appears twice, transforming both a `Raw Data Dictionary` into a `CrossReferenceLink` and `Unstructured Log Streams` into `Provenance Tracing`, indicating that the same construction mechanism can be applied to different subject types to produce different predicate outcomes. This process registry provides the governance layer with an auditable map from raw data sources through transformation mechanisms to their structured outputs, closing the loop between the distributional metadata, the versioned attributes, and the processes that produce them.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |