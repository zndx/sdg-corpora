---
chapter_id: ch_live_flood_defence_condition_characterisation_9c43d5
topic_id: 92
family: 08_derived
cited_terms: ['flood_defence_condition_characterisation', 'foreign_key_relation', 'forward_compatible_with']
model: engine-refine
---

Flood defence condition characterisation forms the evidentiary backbone of infrastructure risk assessment, anchoring physical assessments to verifiable data sources and rigorous validation protocols. Each characterisation record—identified by a stable identifier such as CHAR-0001 through CHAR-0004—encodes a specific methodological approach, ranging from ExpertReviewPanel assessments to GroundTruthSampling campaigns, CrossSensorCalibration exercises, and UncertaintyPropagated analyses. These methodologies are not applied in isolation; each characterisation is explicitly linked to the earth observation data that underpins it. CopernicusDEM digital elevation models, Sentinel1GRD synthetic aperture radar imagery, and LiDARBathymetry surveys serve as the primary observational inputs, with LiDARBathymetry appearing across multiple records to reflect its repeated utility in bathymetric flood modelling. The validation process further grounds each characterisation in empirical reality: HistoricalBaselineMatch procedures compare current conditions against established reference states, GroundTruthSampling provides field-verified measurements, and the SeineBreach2016 event serves as a documented stress-test scenario, appearing in multiple records as a shared validation anchor.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |

The integrity of these characterisations depends on a structured governance model that tracks data lineage through foreign key relationships. The system maintains a two-tier relationship registry: the first tier maps relationship identifiers (RELA-0001 through RELA-0004) to the source tables involved—batch_workflows, config_snapshots, metric_snapshots, and schema_versions—while the second tier resolves the corresponding target tables, including system_clocks, schema_definitions, data_lake_catalog, and core_products. This dual-layer design separates the declaration of a relationship from its semantic resolution, enabling the system to track how operational metadata (such as batch processing workflows or configuration snapshots) connects to foundational data assets without hardcoding table names into the relationship logic itself.

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

Beyond structural lineage, the governance model assigns explicit ownership and contribution roles to each relationship instance. The junction table governing these assignments uses composite foreign keys to link a subject entity to a target entity, with the role column distinguishing between owner and contributor relationships. For example, relationship RELA-0003 appears twice with different targets—RELA-0005 and RELA-0006—both under an owner role, while RELA-0007 and RELA-0006 carry contributor roles, indicating that a single subject may hold primary ownership over some targets while contributing to others. This role-based distinction is critical for audit trails and change management, as it clarifies which entities bear responsibility for data quality and which provide supporting evidence.

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

Forward compatibility tracking introduces a probabilistic dimension to infrastructure data management, quantifying the confidence and uncertainty associated with version transitions. The fact table for forward compatibility records each transition with a confidence score—ranging from 0.209 for WITH-0003 to 0.534 for WITH-0001—paired with an uncertainty metric that spans from 241.93 to 942.64, reflecting the degree of residual risk in asserting compatibility. Each transition is also associated with a numeric value (275.17 to 861.85), which may represent a derived quality indicator or a weighted aggregation of underlying evidence. These transitions are catalogued against a dimension table that assigns each forward compatibility key a human-readable label (Forward Compatible With Label 01 through 04) and a categorical classification (Forward Compatible With Category 01 through 04), enabling both machine-readable version resolution and human-interpretable categorisation.

**fact_forward**

| id | forward_compatible_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0002 | 0.534 | 942.64 | 663.98 |
| WITH-0002 | WITH-0004 | 0.470 | 681.39 | 861.85 |
| WITH-0003 | WITH-0003 | 0.209 | 241.93 | 422.87 |
| WITH-0004 | WITH-0006 | 0.343 | 848.95 | 275.17 |
| WITH-0005 | WITH-0005 | 0.969 | 199.05 | 187.12 |
| WITH-0006 | WITH-0002 | 0.820 | 485.36 | 981.27 |
| WITH-0007 | WITH-0005 | 0.070 | 161.43 | 907.99 |
| WITH-0008 | WITH-0002 | 0.192 | 951.35 | 697.00 |

**dim_forward_compatible_with**

| id | forward_compatible_with_label | forward_compatible_with_category |
| --- | --- | --- |
| WITH-0001 | Forward Compatible With Label 01 | Forward Compatible With Category 01 |
| WITH-0002 | Forward Compatible With Label 02 | Forward Compatible With Category 02 |
| WITH-0003 | Forward Compatible With Label 03 | Forward Compatible With Category 03 |
| WITH-0004 | Forward Compatible With Label 04 | Forward Compatible With Category 04 |
| WITH-0005 | Forward Compatible With Label 05 | Forward Compatible With Category 05 |
| WITH-0006 | Forward Compatible With Label 06 | Forward Compatible With Category 06 |

The interplay between these components—characterisation records, relationship governance, and forward compatibility tracking—creates a comprehensive framework for managing the lifecycle of flood defence data. Earth observation inputs are validated against documented processes, lineage is tracked through role-annotated foreign key relationships, and version transitions are scored with explicit confidence and uncertainty metrics. This architecture ensures that every assertion about flood defence condition can be traced back to its observational basis, its governance context, and its compatibility posture, providing the auditability and reproducibility required for infrastructure risk management at scale.