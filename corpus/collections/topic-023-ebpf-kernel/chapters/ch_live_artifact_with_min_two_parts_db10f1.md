---
chapter_id: ch_live_artifact_with_min_two_parts_db10f1
topic_id: 23
family: 01_foundation
cited_terms: ['artifact_with_min_two_parts', 'frozen_artifact_governed_by', 'crop_parasitism_impact']
model: engine-refine
---

Within the artifact governance framework, each managed component is anchored by a unique identifier—such as `PART-0001` or `PART-0002`—and carries a content fingerprint expressed as a checksum like `c0ffee42` or `a3f9c21e`, alongside a version number that tracks evolution across releases ranging from `5` to `11`. The artifact names themselves, including `raw_telemetry_dump`, `compliance_manifest`, `inference_model_final`, and `ingestion_script_main`, denote the nature of the payload under control, while the checksums serve as integrity guarantees that enable rapid detection of unauthorized modification. Governance of these artifacts is enforced through a frozen-state mechanism: records such as `GOVE-0001` through `GOVE-0004` establish binding constraints on specific artifacts, with frozen designations like `Log-Archive-23Q4`, `Model-Prod-v4`, `Q3-2023-Snapshot`, and `Compliance-09` representing the immutable snapshots to which compliance is measured.

**t_artifact_with_min_two_parts**

| id | artifact | checksum | version |
| --- | --- | --- | --- |
| PART-0001 | raw_telemetry_dump | c0ffee42 | 7 |
| PART-0002 | compliance_manifest | a3f9c21e | 5 |
| PART-0003 | inference_model_final | 5e8f3c91 | 11 |
| PART-0004 | ingestion_script_main | 7b14de08 | 10 |
| PART-0005 | etl_pipeline_run | 1a4b6c2d | 9 |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

The attribute layer introduces a typed, extensible schema for governance metadata, where each attribute—`effective_date`, `enforcement`, `mandatory`, `priority`—is declared with a precise type from the XSD namespace: `xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`. This type discipline is enforced through a family of value tables that partition storage by data type, ensuring that boolean attributes such as `mandatory` receive only `true` or `false` values, date attributes like `effective_date` carry ISO-formatted dates such as `2025-04-28` or `2024-02-08`, integer attributes such as `priority` hold values ranging from `1` to `718`, and string attributes capture free-form content including `Encoding 01`, `Enforcement 02`, `calibration record`, and `es`. The join between an entity identifier and an attribute identifier—both drawn from the same `GOVE-*` namespace—establishes which governance record carries which typed value, creating a sparse, attribute-value-pair model that scales without schema migration.

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

Parallel to the governance domain, the agricultural impact model captures the ecological and socioeconomic consequences of crop parasitism through a network of interrelated entities. The `t_crop_parasitism_impact` table records discrete parasitism events identified by codes such as `IMPA-0001` through `IMPA-0004`, each associated with a descriptive impact label like `Crop Parasitism Impact 01`. These impacts propagate through the agricultural ecosystem along three distinct relational axes: they affect cultivation systems, they parasitize host weeds, and they impact target households. Each axis is mediated by a junction table that encodes not only the subject-to-target linkage but also a `role` attribute—`owner`, `contributor`, `observer`, or `reviewer`—that specifies the nature of the relationship from the perspective of the impact entity.

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

The junction table `t_crop_parasitism_impact__affects_cultivation_system` connects impact records to rice cultivation systems, with entries such as `IMPA-0002` linking to `IMPA-0006` under the role `owner`, and `IMPA-0001` similarly assuming ownership of `IMPA-0006`. The parasitism-host relationship, captured in `t_crop_parasitism_impact__parasitises_host`, assigns roles of `contributor` or `observer` to describe how an impact entity relates to a parasitic weed host; for instance, `IMPA-0004` acts as a `contributor` to host `IMPA-0003`, while `IMPA-0006` serves as an `observer` of host `IMPA-0001`. Each of these relationships carries a `cardinality_note`—`Cardinality Note 01` through `Cardinality Note 04`—that documents the multiplicity constraints governing the association, ensuring that downstream consumers can reason about one-to-many versus many-to-many semantics.

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

The final relational axis, `t_crop_parasitism_impact__impacts_target`, models the downstream effects on agricultural households, with roles including `observer`, `reviewer`, and `owner` applied to linkages between impact entities and household targets. The entry `IMPA-0002` assumes the role of `observer` against target `IMPA-0004`, while `IMPA-0003` appears twice: as an `observer` of target `IMPA-0002` since `2023-09-02`, and as a `reviewer` of the same target since `2023-10-26`. The `since` column on this junction table introduces a temporal dimension, anchoring each relationship to a point in time—`2024-06-04`, `2023-03-28`, `2023-09-02`, `2023-10-26`—that enables historical reconstruction of how parasitism impacts evolved across the agricultural landscape. Together, the governance and impact subsystems form a coherent data architecture in which artifact integrity, attribute-typed policy, and ecological-socioeconomic relationships are all expressed through a consistent pattern of typed identifiers, role-bearing junctions, and value-partitioned storage.

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

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