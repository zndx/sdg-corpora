---
chapter_id: ch_live_cardinality_exactly_one_generic_59d48a
topic_id: 161
family: 01_foundation
cited_terms: ['cardinality_exactly_one_generic', 'subclass_basic', 'measurement_produced_by_run']
model: engine-refine
---

In measurement architectures, identifiers serve as the immutable anchor for every observation, classification, and derived metric. A run identifier such as RUN-0001 or RUN-0002 does not merely label a record; it establishes a referent across fact and dimension tables, enabling the reconciliation of confidence scores, uncertainty bounds, and raw values within a single analytical context. Cardinality constraints further enforce referential integrity: identifiers like GENE-0001 through GENE-0004 are governed by cardinality rules—ExclusiveOwner or StrictParent—that dictate whether a given entity may relate to a single CoreService or must maintain a StrictParent relationship with a SourceSystem. Similarly, subclass taxonomies assign identifiers such as TSUB-0001 through TSUB-0004 to pairs of technical subjects, pairing an ISO 8601 timestamp with a Query execution engine, or a Parquet row group with a Kestrel telemetry probe, thereby encoding the structural lineage of each measurement artifact.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

Categories provide the semantic scaffolding that transforms raw identifiers into analytically meaningful groupings. A measurement dimension table maps each identifier to a measurement label—Measurement Label 01 through Measurement Label 04—and to a broader measurement category, such as Measurement Category 01 or Measurement Category 04, which in turn references a category key like RUN-0005. The category dimension itself carries its own identifiers and category names, creating a two-level classification hierarchy that supports both granular and aggregated analysis. This categorical structure is not decorative; it determines how measurements are aggregated, how confidence intervals are compared across groups, and which uncertainty thresholds apply to a given analytical query.

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

Confidence and uncertainty are the twin metrics that quantify the reliability of any measurement. Confidence values range from 0.307 to 0.945 across the observed runs, with RUN-0002 achieving a confidence of 0.945 while RUN-0004 falls to 0.307, a spread that signals fundamentally different levels of trust in the underlying data. Uncertainty, expressed as absolute bounds such as 120.70, 279.24, 306.26, and 364.07, complements confidence by providing a range within which the true value is expected to lie. The relationship between these two metrics is inverse in practice: the measurement with the highest confidence (RUN-0002, at 0.945) carries an uncertainty of 279.24, while the lowest-confidence measurement (RUN-0004, at 0.307) exhibits the widest uncertainty bound of 364.07, a pattern that governance frameworks must explicitly model when establishing acceptance criteria.

The measured values themselves—353.34, 660.64, 878.99, and 64.10—represent the raw observations that confidence and uncertainty qualify, and that categories organize. These values are not self-interpreting; their analytical utility depends entirely on the metadata surrounding them. A value of 878.99 from RUN-0003, paired with a confidence of 0.506 and an uncertainty of 120.70, tells a different story than a value of 64.10 from RUN-0004 with confidence 0.307 and uncertainty 364.07, even though the latter's value is numerically smaller. The measurement key column further links observations across runs, with RUN-0006 appearing as a measurement key for both RUN-0003 and RUN-0004, suggesting that multiple measurement instances may reference the same underlying phenomenon.

Effective measurement governance requires that all six elements—category, confidence, identifier, measurement, misc, and uncertainty—be treated as interdependent rather than isolated attributes. The cardinality constraints on generic entities, the subclass relationships between technical subjects, the categorical hierarchies in dimension tables, and the confidence-uncertainty-value triad in fact tables collectively form a closed system of accountability. When a measurement fails to meet its uncertainty threshold, the identifier provides the traceability needed to audit the classification chain, the category determines the applicable remediation policy, and the confidence score quantifies the degree of degradation. This is not a schema; it is an operational discipline.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |