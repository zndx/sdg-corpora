## Ontology-Grounded Relational Modelling of Ganglion Cyst Phenotypes

The clinical documentation of ganglion cysts requires capturing a multidimensional phenotype: morphological measurements, anatomical localisation, histological composition, associated nerve involvement, imaging evidence, and pathological specimen data. The relational schema models this domain by anchoring every fact to a central `ganglion_cysts` entity, with six satellite tables providing orthogonal detail. Foreign keys radiate outward from the core, and a suite of materialised views reassembles these normalised fragments into clinically readable projections. The following sections trace the ontology from class definitions through column-level design to the join logic that each view encodes.

**Table `ganglion_cysts`**

| id | cyst_id | diameter_cm | is_multilocular | cyst_location | cyst_type | contains_mucinous_fluid | has_synovial_lining | anatomical_region_id | connective_tissue_id | nerve_fascicle_id | imaging_study_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | baseline-cyst-79 | intraosseous | false | true | 1 | 1 | 1 | 1 |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | pilot-cyst-80 | periosteal | true | false | 2 | 2 | 2 | 2 |
| 1002 | 69428 | 29.10 | false | extended-cyst-81 | soft_tissue | false | true | 3 | 3 | 3 | 3 |
| 1003 | 4716410 | 32.80 | true | integrated-cyst-82 | intra_articular | true | false | 4 | 4 | 4 | 4 |

The `ganglion_cysts` table is the schema's nucleus. Its surrogate primary key `id` (auto-incrementing integers such as `1000` through `1003`) is never exposed to clinicians; instead, the business identifier `cyst_id` carries the domain meaning. Cyst `8387527` measures `21.70` cm in diameter, is not multilocular, and is classified as `intraosseous` at location `baseline-cyst-79`. By contrast, cyst `46cf6b73-02b4-4298-a314-f28840b25c46` spans `25.40` cm, is multilocular, and carries the `periosteal` type. The boolean flags `contains_mucinous_fluid` and `has_synovial_lining` capture histological hallmarks: the first cyst lacks mucinous fluid but possesses a synovial lining, while the second has mucinous fluid but no synovial lining. The remaining columns — `anatomical_region_id`, `connective_tissue_id`, `nerve_fascicle_id`, and `imaging_study_id` — are foreign keys that tether each cyst to its anatomical, histological, neurological, and radiological context.

**Table `anatomical_regions`**

| id | region_id | region_name | is_subchondral | is_near_joint | is_near_tendon_sheath | ganglion_cyst_id | nerve_fascicle_id |
|---|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | false | false | false | 1000 | 1 |
| 2 | 4180948 | Adaptive Survey D | true | true | true | 1001 | 2 |
| 3 | 3012829 | Primary Corridor | false | false | false | 1002 | 3 |
| 4 | 778576 | Composite Series | true | true | true | 1003 | 4 |

The `anatomical_regions` table describes where a cyst resides in the musculoskeletal landscape. Each row carries a UUID `region_id` (for example, `46d49f56-8fcc-11eb-924d-9cd76263cbd0` for the region named `Distributed Assessment`) alongside three spatial predicates: `is_subchondral`, `is_near_joint`, and `is_near_tendon_sheath`. Region `4180948` (`Adaptive Survey D`) is subchondral, near a joint, and near a tendon sheath simultaneously, whereas region `3012829` (`Primary Corridor`) is none of these. The column `ganglion_cyst_id` is a foreign key back to `ganglion_cysts.id`, establishing the inverse of the FK on the core table. The column `nerve_fascicle_id` creates a direct anatomical-to-neurological link, allowing a region to be associated with a specific nerve fascicle independent of the cyst's own nerve reference.

**Table `connective_tissues`**

| id | tissue_id | tissue_type | is_degenerated | has_collagen_sheets | ganglion_cyst_id |
|---|---|---|---|---|---|
| 1 | 8843767 | joint_capsule | false | false | 1000 |
| 2 | gd_acc_121000 | tendon_sheath | true | true | 1001 |
| 3 | 17565595 | periosteum | false | false | 1002 |
| 4 | 135 | meniscus | true | true | 1003 |

Histological composition of the cyst wall is captured in `connective_tissues`. The `tissue_type` column enumerates categories such as `joint_capsule`, `tendon_sheath`, `periosteum`, and `meniscus`. Boolean attributes `is_degenerated` and `has_collagen_sheets` record degenerative status and microstructural organisation. Tissue `gd_acc_121000` (`tendon_sheath`) is degenerated and contains collagen sheets, while tissue `8843767` (`joint_capsule`) is neither. The foreign key `ganglion_cyst_id` anchors each tissue row to its parent cyst, ensuring that histological detail is scoped to a single lesion.

**Table `nerve_fascicles`**

| nerve_fascicle_id | nerve_id | nerve_name | is_compressed | has_paresthesia | has_weakness | has_atrophy | ganglion_cyst_id |
|---|---|---|---|---|---|---|---|
| 1 | 3717619 | Baseline Model D | false | true | true | false | 1000 |
| 2 | 32814 | Distributed Cluster | true | false | false | true | 1001 |
| 3 | state_et_4 | Adaptive Review | false | true | true | false | 1002 |
| 4 | 6926374 | Primary Initiative A | true | false | false | true | 1003 |

Nerve involvement is modelled in `nerve_fascicles`, which records both the nerve's identity (`nerve_id`, `nerve_name`) and the clinical signs of compression. The boolean flags `is_compressed`, `has_paresthesia`, `has_weakness`, and `has_atrophy` form a compact neurological profile. Fascicle `3717619` (`Baseline Model D`) is not compressed but exhibits both paresthesia and weakness; fascicle `32814` (`Distributed Cluster`) is compressed and shows atrophy but no paresthesia. The column `ganglion_cyst_id` ties each fascicle to the cyst that impinges upon it, while `nerve_fascicle_id` serves as the table's own business key, referenced by FKs on both `ganglion_cysts` and `anatomical_regions`.

**Table `imaging_studies`**

| id | study_id | study_date | modality | is_diagnostic | findings_description | ganglion_cyst_id |
|---|---|---|---|---|---|---|
| 1 | Karyawan | 2024-11-08T10:06:00 | ultrasound | true | Pilot Assessment | 1000 |
| 2 | 392491 | 2025-04-19T17:23:00 | mri | false | Baseline Survey | 1001 |
| 3 | 9568466 | 2022-09-03T00:40:00 | ultrasound | true | Distributed Corridor A | 1002 |
| 4 | 4985166 | 2023-02-14T07:57:00 | mri | false | Adaptive Series | 1003 |

Radiological evidence lives in `imaging_studies`. Each row records a `study_id`, a `study_date`, the `modality` (`ultrasound` or `mri`), whether the study is `is_diagnostic`, and a free-text `findings_description`. Study `Karyawan` performed on `2024-11-08` via ultrasound is diagnostic with findings described as `Pilot Assessment`. Study `392491` on `2025-04-19` via MRI is non-diagnostic with findings `Baseline Survey`. The FK `ganglion_cyst_id` ensures every imaging record is attributable to a single cyst.

**Table `pathological_specimens`**

| id | specimen_id | collection_date | is_multilobulated | has_mucinous_fluid | has_synovial_epithelium | has_fibro_connective_tissue | ganglion_cyst_id | pathological_analysis_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4277032 | 2025-12-17T11:57:00 | true | true | false | false | 1000 | 1 |
| 1001 | 5f935766-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-01T18:14:00 | false | false | true | true | 1001 | 2 |
| 1002 | 727069 | 2023-10-12T01:31:00 | true | true | false | false | 1002 | 3 |
| 1003 | 103172 | 2024-03-23T08:48:00 | false | false | true | true | 1003 | 4 |

The `pathological_specimens` table documents ex vivo tissue samples. Columns `is_multilobulated`, `has_mucinous_fluid`, `has_synovial_epithelium`, and `has_fibro_connective_tissue` capture histopathological features. Specimen `4277032` is multilobulated and contains mucinous fluid but lacks both synovial epithelium and fibro-connective tissue. Specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0` is not multilobulated and lacks mucinous fluid but possesses both synovial epithelium and fibro-connective tissue. The FK `ganglion_cyst_id` links the specimen to its source cyst, while `pathological_analysis_id` links it to the corresponding analysis record in the `pathological_analysises` table.

**Table `pathological_analysises`**

| id | analysis_id | analysis_date | staining_method | has_collagen_sheets | has_fibroblasts | has_mesenchymal_cells | has_necrosis | has_inflammatory_changes | pathological_specimen_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | L355 | 2024-03-01T02:18:00 | adaptive-staining-29 | false | false | false | false | false | 1000 | 2025-01-01 00:14:00 |
| 2 | 4843 | 2025-08-12T09:35:00 | distributed-staining-30 | true | true | true | true | true | 1001 | 2025-02-06 03:14:00 |
| 3 | 4985157 | 2022-01-23T16:52:00 | baseline-staining-31 | false | false | false | false | false | 1002 | 2025-03-11 06:14:00 |
| 4 | 0471948470 | 2023-06-07T23:09:00 | pilot-staining-32 | true | true | true | true | true | 1003 | 2025-04-16 09:14:00 |

The `pathological_analysises` table stores the interpretive results of specimen examination. Although its column set is not enumerated in the sample data, its role in the schema is clear: it receives a foreign key from `pathological_specimens.pathological_analysis_id`, forming a one-to-many or one-to-one relationship between specimens and their analyses. This separation allows multiple analyses to be attached to a single specimen over time, or a single analysis to reference multiple specimens.

The materialised views reassemble these normalised tables into clinically oriented projections. Each view is a `SELECT` with explicit `JOIN` clauses that reconstruct a domain fact from its constituent tables.

**View `vw_ganglion_cyst_anatomical_region`**

```sql
CREATE VIEW vw_ganglion_cyst_anatomical_region AS
SELECT a.id, a.cyst_id, a.diameter_cm, a.is_multilocular, b.id AS region_id, b.region_id AS region_region_id, b.region_name AS region_region_name
FROM ganglion_cysts a JOIN anatomical_regions b ON a.anatomical_region_id = b.id;
```

| id | cyst_id | diameter_cm | is_multilocular | region_id | region_region_id | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | 2 | 4180948 | Adaptive Survey D |
| 1002 | 69428 | 29.10 | false | 3 | 3012829 | Primary Corridor |
| 1003 | 4716410 | 32.80 | true | 4 | 778576 | Composite Series |

The view `vw_ganglion_cyst_anatomical_region` joins `ganglion_cysts` to `anatomical_regions` on `ganglion_cysts.anatomical_region_id = anatomical_regions.id`. It answers the question: "Given a cyst, what is its anatomical context?" Row `1000` (cyst `8387527`) joins to region `46d49f56-8fcc-11eb-924d-9cd76263cbd0` (`Distributed Assessment`), revealing that this intraosseous cyst sits in a region that is neither subchondral nor near a joint or tendon sheath. Row `1001` (cyst `46cf6b73-02b4-4298-a314-f28840b25c46`) joins to region `4180948` (`Adaptive Survey D`), a region that is subchondral, near a joint, and near a tendon sheath — a markedly different anatomical setting for a periosteal cyst.

**View `vw_ganglion_cyst_connective_tissue`**

```sql
CREATE VIEW vw_ganglion_cyst_connective_tissue AS
SELECT a.id, a.cyst_id, a.diameter_cm, a.is_multilocular, b.id AS tissue_id, b.tissue_id AS tissue_tissue_id, b.tissue_type AS tissue_tissue_type
FROM ganglion_cysts a JOIN connective_tissues b ON a.connective_tissue_id = b.id;
```

| id | cyst_id | diameter_cm | is_multilocular | tissue_id | tissue_tissue_id | tissue_tissue_type |
|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | 1 | 8843767 | joint_capsule |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | 2 | gd_acc_121000 | tendon_sheath |
| 1002 | 69428 | 29.10 | false | 3 | 17565595 | periosteum |
| 1003 | 4716410 | 32.80 | true | 4 | 135 | meniscus |

`vw_ganglion_cyst_connective_tissue` joins `ganglion_cysts` to `connective_tissues` on `ganglion_cysts.connective_tissue_id = connective_tissues.id`. It answers: "What connective tissue type surrounds this cyst, and is it degenerated?" Cyst `8387527` is associated with tissue `8843767` (`joint_capsule`), which is not degenerated and lacks collagen sheets. Cyst `46cf6b73-02b4-4298-a314-f28840b25c46` is associated with tissue `gd_acc_121000` (`tendon_sheath`), which is degenerated and contains collagen sheets — a finding that may correlate with the cyst's multilocular morphology.

**View `vw_ganglion_cyst_nerve_fascicle`**

```sql
CREATE VIEW vw_ganglion_cyst_nerve_fascicle AS
SELECT a.id, a.cyst_id, a.diameter_cm, a.is_multilocular, b.nerve_fascicle_id AS fascicle_nerve_fascicle_id, b.nerve_id AS fascicle_nerve_id, b.nerve_name AS fascicle_nerve_name
FROM ganglion_cysts a JOIN nerve_fascicles b ON a.nerve_fascicle_id = b.nerve_fascicle_id;
```

| id | cyst_id | diameter_cm | is_multilocular | fascicle_nerve_fascicle_id | fascicle_nerve_id | fascicle_nerve_name |
|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | 1 | 3717619 | Baseline Model D |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | 2 | 32814 | Distributed Cluster |
| 1002 | 69428 | 29.10 | false | 3 | state_et_4 | Adaptive Review |
| 1003 | 4716410 | 32.80 | true | 4 | 6926374 | Primary Initiative A |

`vw_ganglion_cyst_nerve_fascicle` joins `ganglion_cysts` to `nerve_fascicles` on `ganglion_cysts.nerve_fascicle_id = nerve_fascicles.nerve_fascicle_id`. It answers: "Which nerve is affected by this cyst, and what are the clinical signs?" Cyst `8387527` impinges on fascicle `3717619` (`Baseline Model D`), which is not compressed but shows paresthesia and weakness. Cyst `46cf6b73-02b4-4298-a314-f28840b25c46` impinges on fascicle `32814` (`Distributed Cluster`), which is compressed and shows atrophy but no paresthesia — a different neurological profile despite both cysts being multilocular.

**View `vw_ganglion_cyst_imaging_study`**

```sql
CREATE VIEW vw_ganglion_cyst_imaging_study AS
SELECT a.id, a.cyst_id, a.diameter_cm, a.is_multilocular, b.id AS study_id, b.study_id AS study_study_id, b.study_date AS study_study_date
FROM ganglion_cysts a JOIN imaging_studies b ON a.imaging_study_id = b.id;
```

| id | cyst_id | diameter_cm | is_multilocular | study_id | study_study_id | study_study_date |
|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | 1 | Karyawan | 2024-11-08T10:06:00 |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | 2 | 392491 | 2025-04-19T17:23:00 |
| 1002 | 69428 | 29.10 | false | 3 | 9568466 | 2022-09-03T00:40:00 |
| 1003 | 4716410 | 32.80 | true | 4 | 4985166 | 2023-02-14T07:57:00 |

`vw_ganglion_cyst_imaging_study` joins `ganglion_cysts` to `imaging_studies` on `ganglion_cysts.imaging_study_id = imaging_studies.id`. It answers: "What imaging evidence exists for this cyst?" Cyst `8387527` has study `Karyawan` (`ultrasound`, diagnostic, findings: `Pilot Assessment`). Cyst `46cf6b73-02b4-4298-a314-f28840b25c46` has study `392491` (`mri`, non-diagnostic, findings: `Baseline Survey`). The view allows clinicians to correlate cyst morphology with imaging modality and diagnostic confidence.

**View `vw_anatomical_region_ganglion_cyst`**

```sql
CREATE VIEW vw_anatomical_region_ganglion_cyst AS
SELECT a.id, a.region_id, a.region_name, a.is_subchondral, b.id AS cyst_id, b.cyst_id AS cyst_cyst_id, b.diameter_cm AS cyst_diameter_cm
FROM anatomical_regions a JOIN ganglion_cysts b ON a.ganglion_cyst_id = b.id;
```

| id | region_id | region_name | is_subchondral | cyst_id | cyst_cyst_id | cyst_diameter_cm |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | false | 1000 | 8387527 | 21.70 |
| 2 | 4180948 | Adaptive Survey D | true | 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 |
| 3 | 3012829 | Primary Corridor | false | 1002 | 69428 | 29.10 |
| 4 | 778576 | Composite Series | true | 1003 | 4716410 | 32.80 |

`vw_anatomical_region_ganglion_cyst` performs the inverse join: `anatomical_regions` to `ganglion_cysts` on `anatomical_regions.ganglion_cyst_id = ganglion_cysts.id`. It answers the reverse question: "Given an anatomical region, which cyst occupies it?" Region `46d49f56-8fcc-11eb-924d-9cd76263cbd0` (`Distributed Assessment`) is occupied by cyst `8387527` (intraosseous, `21.70` cm). Region `4180948` (`Adaptive Survey D`) is occupied by cyst `46cf6b73-02b4-4298-a314-f28840b25c46` (periosteal, `25.40` cm, multilocular). This view supports queries that start from anatomy and drill down to the lesion.

**View `vw_anatomical_region_nerve_fascicle`**

```sql
CREATE VIEW vw_anatomical_region_nerve_fascicle AS
SELECT a.id, a.region_id, a.region_name, a.is_subchondral, b.nerve_fascicle_id AS fascicle_nerve_fascicle_id, b.nerve_id AS fascicle_nerve_id, b.nerve_name AS fascicle_nerve_name
FROM anatomical_regions a JOIN nerve_fascicles b ON a.nerve_fascicle_id = b.nerve_fascicle_id;
```

| id | region_id | region_name | is_subchondral | fascicle_nerve_fascicle_id | fascicle_nerve_id | fascicle_nerve_name |
|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | false | 1 | 3717619 | Baseline Model D |
| 2 | 4180948 | Adaptive Survey D | true | 2 | 32814 | Distributed Cluster |
| 3 | 3012829 | Primary Corridor | false | 3 | state_et_4 | Adaptive Review |
| 4 | 778576 | Composite Series | true | 4 | 6926374 | Primary Initiative A |

`vw_anatomical_region_nerve_fascicle` joins `anatomical_regions` to `nerve_fascicles` on `anatomical_regions.nerve_fascicle_id = nerve_fascicles.nerve_fascicle_id`. It answers: "Which nerve fascicle is anatomically proximate to this region?" Region `46d49f56-8fcc-11eb-924d-9cd76263cbd0` is proximate to fascicle `3717619` (`Baseline Model D`), while region `4180948` is proximate to fascicle `32814` (`Distributed Cluster`). This view captures the anatomical-neurological adjacency that exists independently of the cyst's own nerve reference.

**View `vw_connective_tissue_ganglion_cyst`**

```sql
CREATE VIEW vw_connective_tissue_ganglion_cyst AS
SELECT a.id, a.tissue_id, a.tissue_type, a.is_degenerated, b.id AS cyst_id, b.cyst_id AS cyst_cyst_id, b.diameter_cm AS cyst_diameter_cm
FROM connective_tissues a JOIN ganglion_cysts b ON a.ganglion_cyst_id = b.id;
```

| id | tissue_id | tissue_type | is_degenerated | cyst_id | cyst_cyst_id | cyst_diameter_cm |
|---|---|---|---|---|---|---|
| 1 | 8843767 | joint_capsule | false | 1000 | 8387527 | 21.70 |
| 2 | gd_acc_121000 | tendon_sheath | true | 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 |
| 3 | 17565595 | periosteum | false | 1002 | 69428 | 29.10 |
| 4 | 135 | meniscus | true | 1003 | 4716410 | 32.80 |

`vw_connective_tissue_ganglion_cyst` joins `connective_tissues` to `ganglion_cysts` on `connective_tissues.ganglion_cyst_id = ganglion_cysts.id`. It answers: "Given a connective tissue type, which cyst is associated with it?" Tissue `8843767` (`joint_capsule`) is associated with cyst `8387527`. Tissue `gd_acc_121000` (`tendon_sheath`) is associated with cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports histological queries that begin with tissue type.

**View `vw_nerve_fascicle_ganglion_cyst`**

```sql
CREATE VIEW vw_nerve_fascicle_ganglion_cyst AS
SELECT a.nerve_fascicle_id, a.nerve_id, a.nerve_name, a.is_compressed, b.id AS cyst_id, b.cyst_id AS cyst_cyst_id, b.diameter_cm AS cyst_diameter_cm
FROM nerve_fascicles a JOIN ganglion_cysts b ON a.ganglion_cyst_id = b.id;
```

| nerve_fascicle_id | nerve_id | nerve_name | is_compressed | cyst_id | cyst_cyst_id | cyst_diameter_cm |
|---|---|---|---|---|---|---|
| 1 | 3717619 | Baseline Model D | false | 1000 | 8387527 | 21.70 |
| 2 | 32814 | Distributed Cluster | true | 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 |
| 3 | state_et_4 | Adaptive Review | false | 1002 | 69428 | 29.10 |
| 4 | 6926374 | Primary Initiative A | true | 1003 | 4716410 | 32.80 |

`vw_nerve_fascicle_ganglion_cyst` joins `nerve_fascicles` to `ganglion_cysts` on `nerve_fascicles.ganglion_cyst_id = ganglion_cysts.id`. It answers: "Given a nerve fascicle, which cyst impinges upon it?" Fascicle `3717619` (`Baseline Model D`) is impinged by cyst `8387527`. Fascicle `32814` (`Distributed Cluster`) is impinged by cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports neurological queries that begin with the nerve.

**View `vw_imaging_study_ganglion_cyst`**

```sql
CREATE VIEW vw_imaging_study_ganglion_cyst AS
SELECT a.id, a.study_id, a.study_date, a.modality, b.id AS cyst_id, b.cyst_id AS cyst_cyst_id, b.diameter_cm AS cyst_diameter_cm
FROM imaging_studies a JOIN ganglion_cysts b ON a.ganglion_cyst_id = b.id;
```

| id | study_id | study_date | modality | cyst_id | cyst_cyst_id | cyst_diameter_cm |
|---|---|---|---|---|---|---|
| 1 | Karyawan | 2024-11-08T10:06:00 | ultrasound | 1000 | 8387527 | 21.70 |
| 2 | 392491 | 2025-04-19T17:23:00 | mri | 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 |
| 3 | 9568466 | 2022-09-03T00:40:00 | ultrasound | 1002 | 69428 | 29.10 |
| 4 | 4985166 | 2023-02-14T07:57:00 | mri | 1003 | 4716410 | 32.80 |

`vw_imaging_study_ganglion_cyst` joins `imaging_studies` to `ganglion_cysts` on `imaging_studies.ganglion_cyst_id = ganglion_cysts.id`. It answers: "Given an imaging study, which cyst does it evaluate?" Study `Karyawan` (`ultrasound`, diagnostic) evaluates cyst `8387527`. Study `392491` (`mri`, non-diagnostic) evaluates cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports radiological queries that begin with the study.

**View `vw_pathological_specimen_ganglion_cyst`**

```sql
CREATE VIEW vw_pathological_specimen_ganglion_cyst AS
SELECT a.id, a.specimen_id, a.collection_date, a.is_multilobulated, b.id AS cyst_id, b.cyst_id AS cyst_cyst_id, b.diameter_cm AS cyst_diameter_cm
FROM pathological_specimens a JOIN ganglion_cysts b ON a.ganglion_cyst_id = b.id;
```

| id | specimen_id | collection_date | is_multilobulated | cyst_id | cyst_cyst_id | cyst_diameter_cm |
|---|---|---|---|---|---|---|
| 1000 | 4277032 | 2025-12-17T11:57:00 | true | 1000 | 8387527 | 21.70 |
| 1001 | 5f935766-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-01T18:14:00 | false | 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 |
| 1002 | 727069 | 2023-10-12T01:31:00 | true | 1002 | 69428 | 29.10 |
| 1003 | 103172 | 2024-03-23T08:48:00 | false | 1003 | 4716410 | 32.80 |

`vw_pathological_specimen_ganglion_cyst` joins `pathological_specimens` to `ganglion_cysts` on `pathological_specimens.ganglion_cyst_id = ganglion_cysts.id`. It answers: "Given a pathological specimen, which cyst is its source?" Specimen `4277032` (multilobulated, mucinous, no synovial epithelium) originates from cyst `8387527`. Specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0` (not multilobulated, no mucinous fluid, with synovial epithelium) originates from cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports pathology queries that begin with the specimen.

**View `vw_pathological_specimen_pathological_analysis`**

```sql
CREATE VIEW vw_pathological_specimen_pathological_analysis AS
SELECT a.id, a.specimen_id, a.collection_date, a.is_multilobulated, b.id AS analysis_id, b.analysis_id AS analysis_analysis_id, b.analysis_date AS analysis_analysis_date
FROM pathological_specimens a JOIN pathological_analysises b ON a.pathological_analysis_id = b.id;
```

| id | specimen_id | collection_date | is_multilobulated | analysis_id | analysis_analysis_id | analysis_analysis_date |
|---|---|---|---|---|---|---|
| 1000 | 4277032 | 2025-12-17T11:57:00 | true | 1 | L355 | 2024-03-01T02:18:00 |
| 1001 | 5f935766-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-01T18:14:00 | false | 2 | 4843 | 2025-08-12T09:35:00 |
| 1002 | 727069 | 2023-10-12T01:31:00 | true | 3 | 4985157 | 2022-01-23T16:52:00 |
| 1003 | 103172 | 2024-03-23T08:48:00 | false | 4 | 0471948470 | 2023-06-07T23:09:00 |

`vw_pathological_specimen_pathological_analysis` joins `pathological_specimens` to `pathological_analysises` on `pathological_specimens.pathological_analysis_id = pathological_analysises.id`. It answers: "Given a specimen, what is its pathological analysis?" Specimen `4277032` is linked to analysis `1`, and specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0` is linked to analysis `2`. This view isolates the specimen-to-analysis relationship, independent of the cyst context.

**View `vw_pathological_analysis_pathological_specimen`**

```sql
CREATE VIEW vw_pathological_analysis_pathological_specimen AS
SELECT a.id, a.analysis_id, a.analysis_date, a.staining_method, b.id AS specimen_id, b.specimen_id AS specimen_specimen_id, b.collection_date AS specimen_collection_date
FROM pathological_analysises a JOIN pathological_specimens b ON a.pathological_specimen_id = b.id;
```

| id | analysis_id | analysis_date | staining_method | specimen_id | specimen_specimen_id | specimen_collection_date |
|---|---|---|---|---|---|---|
| 1 | L355 | 2024-03-01T02:18:00 | adaptive-staining-29 | 1000 | 4277032 | 2025-12-17T11:57:00 |
| 2 | 4843 | 2025-08-12T09:35:00 | distributed-staining-30 | 1001 | 5f935766-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-01T18:14:00 |
| 3 | 4985157 | 2022-01-23T16:52:00 | baseline-staining-31 | 1002 | 727069 | 2023-10-12T01:31:00 |
| 4 | 0471948470 | 2023-06-07T23:09:00 | pilot-staining-32 | 1003 | 103172 | 2024-03-23T08:48:00 |

`vw_pathological_analysis_pathological_specimen` performs the inverse join: `pathological_analysises` to `pathological_specimens` on `pathological_analysises.id = pathological_specimens.pathological_analysis_id`. It answers: "Given a pathological analysis, which specimen does it interpret?" Analysis `1` interprets specimen `4277032`, and analysis `2` interprets specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0`. This view supports queries that begin with the analysis and drill down to the specimen.

The schema embodies a star-like normalisation centred on `ganglion_cysts`, with each satellite table capturing a distinct ontological dimension — anatomy, histology, neurology, imaging, and pathology. Foreign keys enforce referential integrity at the column level, while the materialised views provide denormalised projections that answer clinically natural questions from either direction (cyst-to-detail or detail-to-cyst). The design ensures that no fact is duplicated: a cyst's diameter lives only in `ganglion_cysts`, its tissue type only in `connective_tissues`, and its imaging modality only in `imaging_studies`. The views reconstruct the full phenotype on demand, trading storage for query simplicity without compromising the underlying normalised integrity.