---
chapter_id: ch_live_crop_parasitism_impact_f37a01
topic_id: 24
family: 08_derived
cited_terms: ['crop_parasitism_impact', 'dataset_at_version', 'dataset_revision_of']
model: engine-refine
---

Crop parasitism impact serves as the central analytical construct, capturing the measurable consequences of parasitic organisms on agricultural production. Each impact record carries a stable identifier—IMPA-0001 through IMPA-0004—and a descriptive classification such as Crop Parasitism Impact 01, which functions as the human-readable label for downstream reporting and governance workflows. These identifiers anchor a network of relational tables that encode not merely what is affected, but how, by whom, and since when. The impact entity does not exist in isolation; it participates in binary relationships that distinguish between the subject of the relationship, the target entity, and the role that the subject plays vis-à-vis that target. In one configuration, an impact record with identifier IMPA-0001 assumes the role of owner over a rice cultivation system designated IMPA-0006, while in another, the same identifier IMPA-0001 appears as an observer of an agricultural household target IMPA-0002, with the relationship having been established since 2023-10-26. The since attribute provides temporal provenance, enabling auditors to reconstruct the lineage of stakeholder assignments and to detect shifts in responsibility over time—IMPA-0006, for instance, was linked to an agricultural household target as a reviewer since 2023-03-28, whereas IMPA-0003 assumed the owner role for the same target since 2023-10-26.

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

The parasitic host relationship introduces a second axis of relational complexity. Here, crop parasitism impacts are linked to parasitic weed entities, and the junction table carries both a role classification and a cardinality note that qualifies the nature of the association. An impact record IMPA-0004 may act as a contributor to a parasitic host IMPA-0003, accompanied by Cardinality Note 01, while IMPA-0006 functions as an observer of parasitic host IMPA-0001 under Cardinality Note 02. The cardinality note serves as a metadata carrier for constraints and qualifiers that cannot be expressed through role alone—whether a parasitism relationship is one-to-one, one-to-many, or conditional on environmental factors. This separation of concerns between role and cardinality allows the data model to remain extensible: new cardinality qualifiers can be introduced without altering the role taxonomy, and vice versa.

Rice cultivation systems and agricultural households constitute the two principal target domains affected by crop parasitism. The cultivation system relationship is captured through a dedicated junction table where the role is uniformly owner, suggesting that each impact record is assigned ownership over a specific cultivation system—IMPA-0002 owns IMPA-0002, IMPA-0001 owns IMPA-0006, and so forth. Agricultural households, by contrast, are linked through a richer relationship table that incorporates role diversity (observer, reviewer, owner) and temporal tracking via the since attribute. This asymmetry reflects the underlying domain: cultivation systems are managed assets with clear ownership, while households are stakeholders whose relationship to parasitism impacts may be observational, supervisory, or proprietary, and may evolve over time.

Beyond the agricultural domain, the data model extends to dataset versioning and revision tracking, employing the same relational patterns of subject, target, and role. Dataset version records—VERS-0001 through VERS-0004—associate concrete datasets such as SatelliteTelemetryRaw, customer-churn-features, and grid-load-forecast with version strings like v3.0.0-stable and release-2023-Q4. The junction table between datasets and versions carries role assignments: VERS-0004 is a contributor to VERS-0002, VERS-0002 is an owner of VERS-0001, and VERS-0005 is a reviewer of VERS-0001. A parallel revision table captures the lineage of dataset changes, recording not only which dataset was revised and what it was revised from—UrbanAirQuality was a revision of grid-load-forecast-base, genomics-raw-reads-q3 was a revision of market-index-initial—but also the MIME type of the revision payload (application/xml, application/octet-stream, application/parquet) and the owning team (ml-infra, governance). This multi-dimensional provenance model ensures that every revision can be traced to its source, its format, and its responsible party.

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | SatelliteTelemetryRaw |
| VERS-0002 | customer-churn-features |
| VERS-0003 | grid-load-forecast |
| VERS-0004 | proteomics-mass-spec |
| VERS-0005 | ClinicalTrialPhase2 |
| VERS-0006 | SST-30DayRolling |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | UrbanAirQuality | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | genomics-raw-reads-q3 | market-index-initial | application/octet-stream | governance |
| REVI-0003 | NeuralNetWeightsV3 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | GeospatialRoadNetwork | baseline-genomics-q2 | application/parquet | ml-infra |