---
chapter_id: ch_live_subclass_to_information_content_entity_f67902
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_information_content_entity', 'program_subclass', 'crop_parasitism_impact']
model: engine-refine
---

The `t_crop_parasitism_impact` table serves as the central entity for cataloguing agricultural disturbances, with each record identified by a stable surrogate key such as `IMPA-0001` through `IMPA-0004` and annotated with a descriptive impact designation—`Crop Parasitism Impact 01`, `Crop Parasitism Impact 02`, and so forth. This entity does not exist in isolation; it participates in three distinct relational facets, each capturing a different dimension of agricultural consequence. The first facet links parasitism impacts to the rice cultivation systems they disrupt, recorded in `t_crop_parasitism_impact_affects_cultivation_system`, where entries such as `Affects Cultivation System 01` and `Affects Cultivation System 02` denote the specific farming regimes under stress. The second facet enumerates the parasitic weeds that serve as biological hosts, stored in `t_crop_parasitism_impact_parasitises_host` with values like `Parasitises Host 01` and `Parasitises Host 03`. The third and most structurally complex facet records the downstream effects on agricultural households, captured through `t_crop_parasitism_impact_impacts_target` and its associated target registry `t_crop_parasitism_impact_impacts_target`, which contains entries such as `Impacts Target 01` and `Impacts Target 04`.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The junction tables that mediate these relationships introduce two critical governance columns: `role` and `cardinality_note`. In the parasitism-to-host relationship, the `t_crop_parasitism_impact__parasitises_host` table assigns roles of `contributor` and `observer` to describe the nature of the biological association—for instance, the impact identified as `IMPA-0004` assumes the role of `contributor` when linked to host `IMPA-0003`, while `IMPA-0006` assumes the role of `observer` against host `IMPA-0001`. Each of these pairings carries a cardinality constraint, recorded as `Cardinality Note 01` through `Cardinality Note 04`, which specifies whether the relationship is one-to-one, one-to-many, or many-to-many in operational terms. The same pattern recurs in the parasitism-to-agricultural-household linkage, where `t_crop_parasitism_impact__impacts_target` assigns roles of `observer`, `reviewer`, and `owner` to describe the household's relationship to the impact event. Here, `IMPA-0002` is linked to target `IMPA-0004` under the role of `observer`, while `IMPA-0003` appears twice—once as `reviewer` against target `IMPA-0004` and once as `owner` against target `IMPA-0002`—demonstrating that a single impact entity may assume multiple relational stances toward the same or different households.

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

Temporal provenance is preserved through the `since` column in the household-impact junction table, anchoring each relationship to a point of operational awareness. The impact identified as `IMPA-0002` has been recorded as affecting target `IMPA-0004` since `2024-06-04`, whereas the impact `IMPA-0006` has been linked to the same target since `2023-03-28`, and impact `IMPA-0003` has been associated with target `IMPA-0002` since both `2023-09-02` and `2023-10-26`, suggesting either a re-evaluation or a bifurcation of the relationship over time. These timestamps are essential for audit trails and for distinguishing current from historical exposure when aggregating household-level risk profiles.

Supporting metadata tables provide the contextual scaffolding for these core entities. The `t_subclass_to_information_content_entity` table maps identifiers such as `ENTI-0001` through `ENTI-0004` to information content descriptions—`schema_registry`, `telemetry_stream`, `compliance_audit`, and `data_catalog_entry`—each accompanied by a `label_text` field containing human-readable annotations like `nightly summary`, `pre-release note`, `intake form`, and `change rationale`, and a `language` field specifying the locale (`en`, `ja`, `es`). This table enables multilingual documentation of the data assets that feed into or derive from the parasitism impact system. Meanwhile, the `t_program_subclass` table records the operational pipelines that process or produce this data, with program identifiers such as `PROG-0001` through `PROG-0004` linked to program names like `MetadataHarvest`, `DataQualityScan`, and `AnomalyDetectionPipeline`, input source types including `PostgreSQLSnapshot`, `RESTApiPayload`, `OracleStagingView`, and `CSVExportDump`, deployment licenses ranging from `GPL-3.0` and `Apache-2.0` to `proprietary` and `MIT`, and physical or cloud locations such as `rack-7`, `us-east-1`, and `ap-south-2`. These program-level attributes establish the operational provenance and compliance posture of the systems that sustain the agricultural household and parasitism impact registries.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

**t_program_subclass**

| id | program | input | license | location |
| --- | --- | --- | --- | --- |
| PROG-0001 | MetadataHarvest | PostgreSQLSnapshot | GPL-3.0 | rack-7 |
| PROG-0002 | DataQualityScan | RESTApiPayload | proprietary | us-east-1 |
| PROG-0003 | MetadataHarvest | OracleStagingView | Apache-2.0 | ap-south-2 |
| PROG-0004 | AnomalyDetectionPipeline | CSVExportDump | MIT | us-east-1 |
| PROG-0005 | LogAggregationJob | ParquetPartition | BSD-3-Clause | us-east-1 |
| PROG-0006 | DataQualityScan | JSONTelemetryBatch | GPL-3.0 | us-east-1 |
| PROG-0007 | PatientCohortExtract | CSVExportDump | CC-BY-4.0 | us-east-1 |
| PROG-0008 | NightlyDataSync | ParquetPartition | GPL-3.0 | rack-7 |