---
chapter_id: ch_live_dataset_snapshot_subclass_0a2008
topic_id: 46
family: 07_long_tail
cited_terms: ['dataset_snapshot_subclass', 'column_value_distribution', 'national_dataset_augmentation_process']
model: engine-refine
---

In geospatial and environmental data management, the integrity of a dataset hinges on precise versioning, size tracking, and snapshot lineage. Each dataset is assigned a unique identifier—such as `SNAP-0001` or `SNAP-0004`—that anchors its record across the system. The `size_bytes` column captures the storage footprint of each dataset, ranging from approximately 31.5 MB for `SNAP-0003` to 676.1 MB for `SNAP-0004`, providing operational visibility into storage consumption and transfer requirements. The `version` field tracks the iteration of each dataset, with observed values including version 2, version 5, and version 10, enabling auditors and data engineers to trace the evolution of a dataset through successive releases. Crucially, the `snapshot_of` relationship links each dataset record to a parent snapshot dimension, establishing a lineage graph that clarifies which snapshot a given record derives from—for instance, `SNAP-0004` is a snapshot of `SNAP-0003`, while `SNAP-0002` is a snapshot of `SNAP-0002`, indicating self-referential or root-level snapshots.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

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

The snapshot dimension itself is structured to support classification and labeling. Each snapshot carries a human-readable label, such as `Snapshot Of Label 01` through `Snapshot Of Label 04`, and is assigned to a category, exemplified by values like `Snapshot Of Category 01` through `Snapshot Of Category 04`. This categorical taxonomy allows downstream consumers to filter, aggregate, or govern datasets by their classification without parsing raw identifiers. The `misc` column, which stores the snapshot label, serves as a free-form or semi-structured descriptor that can accommodate contextual metadata not captured by the rigid category hierarchy. Together, the identifier, category, and misc fields form a minimal but sufficient dimensional model for navigating the snapshot universe.

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

Beyond structural metadata, the system tracks the statistical properties of individual columns through a value distribution framework. Each column—identified by names such as `request_count`, `patient_bmi`, `device_serial`, and `request_count`—is associated with a distribution profile that characterizes its value spread. Observed distribution types include `pareto_shape`, `binomial_profile`, `uniform_range`, and `poisson_profile`, each reflecting a distinct statistical model appropriate to the column's domain. The junction table `t_column_value_distribution__value_distribution` maps columns to their distributions via a `subject` column (referencing the column distribution record) and a `target` column (referencing the value distribution record), while a `role` field specifies the nature of the relationship. Roles observed in the data include `contributor` and `reviewer`, indicating whether a given distribution record actively contributes to the column's statistical profile or serves a validation and oversight function. This role-based distinction supports governance workflows where certain distributions must be reviewed before being promoted to production.

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

The national dataset augmentation process represents a higher-order operational construct that describes how external observation sources are integrated into existing national datasets. Each augmentation process—such as `DGIWGBase`, `NRCANMap`, `TerrainDataMerge`, and `EuroStatSync`—specifies an observation source drawn from the Copernicus ecosystem, including `CopernicusLand`, `CMEMSDataCube`, `GLO30Coverage`, and `CopernicusCrisis`. These sources feed into the augmentation pipeline, which targets an existing national dataset for enrichment; examples of target datasets include `SentinelCoreLoad`, `GADMAdminLevels`, `CensusMapAlign`, and `LandCoverSync`. The `copernicusobservationsource` and `existingnationaldataset` columns thus form a directed edge from an external data provider to an internal dataset, documenting the provenance chain that underpins regulatory compliance and data quality assurance. By maintaining this augmentation lineage, organizations can demonstrate that their national datasets incorporate authoritative observations from recognized sources, satisfying audit requirements and supporting reproducible data pipelines.

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |