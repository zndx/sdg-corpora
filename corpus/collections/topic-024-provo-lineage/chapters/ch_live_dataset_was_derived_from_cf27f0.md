---
chapter_id: ch_live_dataset_was_derived_from_cf27f0
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_derived_from', 'national_dataset_augmentation_process', 'profile_of_dataset']
model: engine-refine
---

Dataset provenance in governed data estates rests on stable identifiers that anchor every assertion about origin, transformation, and use. An identifier such as FROM-0001 or PROC-0003 is not merely a surrogate key; it is the durable handle through which audit trails, retention schedules, and cross-system reconciliation attach to a single logical entity across registries, catalogues, and operational logs. Without that constancy, lineage graphs fragment and augmentation programmes cannot be shown to have acted on the correct national asset at the correct revision. The evidence therefore treats identifier as the spine on which subject–target assertions, role assignments, and profile bindings are hung, rather than as an administrative convenience.

Lineage is expressed as derivation: a dataset is understood to have been produced from antecedent material, and the relationship is typed by role. Where patient_demographics_clean (FROM-0002) is linked to raw_sensor_stream only indirectly, the graph records that iot_edge_logs (FROM-0001) was derived from archival_tape_restore while simultaneously owning a contributor edge toward FROM-0002; market_index_history traces to warehouse_staging_area, and the repeated appearance of patient_demographics_clean under FROM-0004 signals either deliberate republication or a reconciled duplicate that governance must treat as one logical product with two registry entries. Subject and target orient the edge: the subject is the derived dataset identifier, the target the upstream source identifier, and role distinguishes mere incorporation (contributor) from authoritative custody (owner). That distinction matters in practice when liability, refresh obligations, and consent scope are allocated along the chain from regulatory_filing_pdf and warehouse_staging_area through to curated products consumed downstream.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

National dataset augmentation processes sit at the boundary between sovereign reference data and external Earth-observation programmes. A process such as DGIWGBase or EuroStatSync names a governed procedure—method, validation gates, and publication rules—not a single file drop. Each procedure declares which Copernicus observation source it incorporates (CopernicusLand, CMEMSDataCube, GLO30Coverage, CopernicusCrisis) and which existing national dataset it augments (SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, LandCoverSync). The copernicusobservationsource field therefore records programmatic ingress from the Copernicus family and its operational services; the existingnationaldataset field records the domestic baseline that must remain identifiable after merge, so that differential licensing, versioning, and error attribution remain traceable. TerrainDataMerge augmenting CensusMapAlign with GLO30Coverage exemplifies the usual pattern: national geometry and semantics are preserved as the augmented record, while satellite-derived coverage supplies complementary observational evidence under a process-specific quality contract.

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

Profile metadata characterises datasets or derived artefacts along categorical axes and attaches quantitative statements of belief. Category organises profiles for retrieval and policy: dim_profile_category supplies canonical names (Category Name 01 through Category Name 04), while dim_profile binds human-readable labels (Profile Label 01–04) to those categories through category_id, so that the same taxonomy can govern both discovery facets and compliance rules without collapsing label and class. The profile key on fact_profile (for example pointing at DATA-0005 or DATA-0003) ties factual measurements to the profile dimension row they describe. Confidence and uncertainty are paired epistemic fields: confidence 0.994 on one profile row signals near-certainty for governance thresholds that gate automated publication, whereas confidence 0.226 or 0.299 demands human review or exclusion from high-assurance use cases; uncertainty magnitudes in the hundreds (284.36 through 622.09) express spread or error budget in the units of the measured quantity, not a probability. The misc value field holds the asserted measurement itself (728.94, 380.57, and comparable figures)—the datum the profile is about—while category and profile together answer what kind of assertion is being made and under which control framework it must be interpreted.

In operation, these elements interlock. Augmentation processes consume observation sources and touch national datasets whose lineage may already span contributors and owners across FROM-0001–FROM-0006; profile facts then document how trustworthy the resulting characteristics are for each category-bound label. An auditor does not read tables; they reconstruct obligations—who owned the upstream tape restore, which Copernicus service fed the merge, whether CensusMapAlign’s post-augmentation profile meets a 0.773 confidence floor, and whether uncertainty below 500 is required for the misc value to support statutory reporting. Identifier stability, typed derivation roles, explicit augmentation bindings, and profile-level confidence and uncertainty jointly constitute the evidentiary grammar through which a national data programme demonstrates fitness for purpose without reducing governance to column lists or schema narration.

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