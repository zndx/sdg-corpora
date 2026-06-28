---
chapter_id: ch_live_allocation_subclass_2d6af5
topic_id: 10
family: 05_provo_lineage
cited_terms: ['allocation_subclass', 'artifact_has_id', 'profile_of_dataset']
model: engine-refine
---

The architecture of data provenance and measurement quality rests upon a disciplined separation of identity, classification, and certainty. Every artifact carries an identifier that anchors it to an external namespace—`oid:1.3.6.1` for object identifiers, `doi:10.1109/x` for digital object identifiers, `ARN:res/41` for Amazon Resource Names—each serving as a stable, globally resolvable handle that survives internal refactoring. These identifiers are paired with a version number, an integer such as `3`, `4`, `9`, or `6`, that tracks the evolution of the underlying artifact across releases. The version field is not merely a label; it is the mechanism by which downstream consumers determine whether a `MetricsDump88A` at version `3` is compatible with a pipeline that expects version `6`, and by which auditors reconstruct the lineage of a `ConfigManifest99` through its revision history. Without versioned identifiers, reproducibility collapses into ambiguity, and the distinction between a corrected artifact and a divergent fork becomes impossible to enforce.

**t_artifact_has_id**

| id | artifact | identifier | version |
| --- | --- | --- | --- |
| HAS-0001 | MetricsDump88A | oid:1.3.6.1 | 3 |
| HAS-0002 | DroneFleet7C | oid:1.3.6.1 | 4 |
| HAS-0003 | ConfigManifest99 | doi:10.1109/x | 9 |
| HAS-0004 | DataPipelineV3 | ARN:res/41 | 6 |
| HAS-0005 | DataPipelineV3 | ref-8842 | 11 |
| HAS-0006 | DroneFleet7C | oid:1.3.6.1 | 5 |

Classification of these artifacts and their associated measurements proceeds through a category hierarchy that is itself normalized into a dedicated dimension. A `dim_profile_category` table holds canonical category names—`Category Name 01` through `Category Name 04`—while the `dim_profile` dimension assigns each profile a `profile_category` label and a foreign key, `category_id`, that resolves to the canonical entry. This two-level structure permits profiles such as `Profile Label 01` or `Profile Label 03` to be grouped under shared categories without duplicating category metadata across every row. The category dimension is not decorative; it is the primary axis along which aggregation, filtering, and access control are evaluated. A profile bearing `category_id` `DATA-0004` inherits the governance rules, retention policies, and reporting templates associated with that category, and any change to the category assignment propagates to all dependent queries and dashboards.

At the core of the measurement model lies the `fact_profile` table, which records quantitative observations alongside their associated confidence and uncertainty. Each fact row carries a `profile_key` that links it to a named profile, a `confidence` value ranging from `0.299` to `0.994`, an `uncertainty` expressed as an absolute magnitude such as `284.36` or `622.09`, and a `value`—for example, `728.94` or `380.57`—that represents the measured quantity. Confidence and uncertainty are complementary: a confidence of `0.994` paired with an uncertainty of `557.92` signals a measurement that is statistically reliable but carries a wide error band, whereas a confidence of `0.226` with an uncertainty of `488.10` indicates both low reliability and substantial imprecision. These paired fields enable downstream systems to weight observations appropriately, to flag anomalous readings, and to apply confidence-thresholded filtering before any aggregation or alerting logic executes.

The relationships between allocation subclasses and their execution engines are mediated by a junction table that introduces the concept of role as a first-class attribute. An allocation such as `nightly-ingest` (identified as `ALLO-0001`) may execute a `Celery Worker` transformation, while `batch-prod-main` (`ALLO-0003`) runs a `Flink TaskManager`. The junction table `t_allocation_subclass__executes_transformation` links an `allocation_id` to an `executes_transformation_id` and assigns a `role`—`contributor`, `owner`, or `observer`—that describes the nature of the relationship. This role attribute is critical: it distinguishes an allocation that actively produces data from one that merely consumes or monitors it, and it determines which teams hold ownership, which receive notifications, and which are excluded from change management workflows. The same transformation, `TensorFlow Serving`, may appear with the role `owner` in one allocation context and `observer` in another, reflecting the same engine serving fundamentally different operational responsibilities.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

Together, these constructs—identifier, version, category, profile, confidence, uncertainty, role, subject, and target—form a coherent framework for tracking what data exists, how it is classified, how certain its measurements are, and who is responsible for its behavior. The framework is relational by design: foreign keys connect artifacts to their identifiers, profiles to their categories, facts to their profiles, and allocations to their transformations, while role and version provide the semantic and temporal context that pure referential integrity cannot express. In practice, this means that a data engineer querying a pipeline can determine not only that `DataPipelineV3` at version `6` exists and is classified under a specific category, but also that its associated measurements carry a confidence of `0.773` with an uncertainty of `622.09`, that the pipeline is owned by a `Flink TaskManager` execution role, and that any downstream consumers should apply confidence-weighted aggregation to the reported values.

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |