Ganglion cysts are benign, fluid-filled lesions that arise in the periarticular and periosteal environments, most commonly around joints of the wrist, hand, and foot. Their clinical significance derives not only from their size and potential for nerve compression but also from their histological architecture, which ranges from simple unilocular sacs to complex multilocular structures with varying degrees of synovial differentiation. A comprehensive clinical record must capture the cyst's morphological dimensions, its anatomical setting, the nature of the surrounding connective tissue, any associated nerve involvement, the imaging modality used for detection, and the histopathological findings from excised specimens. The following chapter describes the data model that supports this multi-dimensional documentation, drawing on representative records to illustrate how each layer of information interlocks.

## The Ganglion Cyst Record

At the center of the documentation model is the ganglion cyst itself, a record that anchors every other observation to a single identifiable lesion. Each cyst carries a unique identifier, a measured maximum diameter in centimeters, and a set of binary flags describing its internal architecture—whether it is multilocular, whether it contains mucinous fluid, and whether a synovial lining is present. The cyst type classifies its anatomical relationship to bone and joint: intraosseous cysts arise within the bone, periosteal cysts sit on the bone surface, soft_tissue cysts occupy the surrounding soft tissues, and intra_articular cysts communicate with the joint space.

**Table `ganglion_cysts`**

| id | cyst_id | diameter_cm | is_multilocular | cyst_location | cyst_type | contains_mucinous_fluid | has_synovial_lining | anatomical_region_id | connective_tissue_id | nerve_fascicle_id | imaging_study_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 8387527 | 21.70 | false | baseline-cyst-79 | intraosseous | false | true | 1 | 1 | 1 | 1 |
| 1001 | 46cf6b73-02b4-4298-a314-f28840b25c46 | 25.40 | true | pilot-cyst-80 | periosteal | true | false | 2 | 2 | 2 | 2 |
| 1002 | 69428 | 29.10 | false | extended-cyst-81 | soft_tissue | false | true | 3 | 3 | 3 | 3 |
| 1003 | 4716410 | 32.80 | true | integrated-cyst-82 | intra_articular | true | false | 4 | 4 | 4 | 4 |

Consider the first record, identified by the cyst identifier `8387527`. This cyst measures 21.70 cm in diameter, is classified as intraosseous, and lacks both multilocularity and mucinous fluid, though it does possess a synovial lining. Its anatomical region, connective tissue, nerve fascicle, and imaging study are each linked by foreign key to their respective tables. The second record, bearing the UUID `46cf6b73-02b4-4298-a314-f28840b25c46`, presents a contrasting phenotype: it is 25.40 cm, multilocular, contains mucinous fluid, lacks a synovial lining, and is classified as periosteal. The diameter range across the four records spans from 21.70 cm to 32.80 cm, illustrating the substantial size variation that can occur in clinical practice.

## Anatomical Context

The anatomical region table records the spatial setting of each cyst, providing a structured description of where the lesion sits relative to joints, tendons, and subchondral bone. Each region carries a human-readable name, a boolean flag indicating whether it is subchondral, whether it lies near a joint, and whether it is near a tendon sheath. The region also links back to the ganglion cyst and to a nerve fascicle, establishing a direct anatomical corridor between the lesion and the neural structures at risk.

**Table `anatomical_regions`**

| id | region_id | region_name | is_subchondral | is_near_joint | is_near_tendon_sheath | ganglion_cyst_id | nerve_fascicle_id |
|---|---|---|---|---|---|---|---|
| 1 | 46d49f56-8fcc-11eb-924d-9cd76263cbd0 | Distributed Assessment | false | false | false | 1000 | 1 |
| 2 | 4180948 | Adaptive Survey D | true | true | true | 1001 | 2 |
| 3 | 3012829 | Primary Corridor | false | false | false | 1002 | 3 |
| 4 | 778576 | Composite Series | true | true | true | 1003 | 4 |

The region named `Distributed Assessment` (identifier `46d49f56-8fcc-11eb-924d-9cd76263cbd0`) is associated with the first cyst and is neither subchondral nor near a joint or tendon sheath. By contrast, `Adaptive Survey D` and `Composite Series` are both subchondral and situated near joints and tendon sheaths, suggesting a higher risk of nerve compression in those locations. The nerve fascicle column in this table provides a direct link to the nerve fascicle table, enabling queries that trace the path from a cyst through its anatomical region to the specific nerve at risk.

## Connective Tissue Composition

The connective tissue table describes the structural matrix surrounding each cyst. The tissue type field records whether the adjacent tissue is a joint capsule, tendon sheath, periosteum, or meniscus. Two binary flags capture the state of the tissue: whether it is degenerated and whether it contains organized collagen sheets. This information is clinically relevant because degenerated tissue with disrupted collagen architecture may influence both the cyst's growth pattern and the surgical approach required for excision.

**Table `connective_tissues`**

| id | tissue_id | tissue_type | is_degenerated | has_collagen_sheets | ganglion_cyst_id |
|---|---|---|---|---|---|
| 1 | 8843767 | joint_capsule | false | false | 1000 |
| 2 | gd_acc_121000 | tendon_sheath | true | true | 1001 |
| 3 | 17565595 | periosteum | false | false | 1002 |
| 4 | 135 | meniscus | true | true | 1003 |

The first record identifies a `joint_capsule` that is not degenerated and lacks collagen sheets, corresponding to the intraosseous cyst `8387527`. The second record, associated with the periosteal cyst `46cf6b73-02b4-4298-a314-f28840b25c46`, describes a `tendon_sheath` that is both degenerated and contains collagen sheets—a combination that may reflect chronic mechanical stress. The fourth record links a `meniscus` to the intra_articular cyst `4716410`, again with degeneration and collagen sheet presence, underscoring the meniscus's role as a potential site of cyst origin in intra-articular locations.

## Nerve Fascicle Involvement

Nerve compression is a primary driver of symptoms in ganglion cyst cases. The nerve fascicle table records the identity and name of the affected nerve, along with a set of clinical signs: whether the nerve is compressed, whether the patient reports paresthesia, whether weakness is present, and whether muscle atrophy has developed. These four binary fields together form a clinical severity profile that can guide treatment decisions.

**Table `nerve_fascicles`**

| nerve_fascicle_id | nerve_id | nerve_name | is_compressed | has_paresthesia | has_weakness | has_atrophy | ganglion_cyst_id |
|---|---|---|---|---|---|---|---|
| 1 | 3717619 | Baseline Model D | false | true | true | false | 1000 |
| 2 | 32814 | Distributed Cluster | true | false | false | true | 1001 |
| 3 | state_et_4 | Adaptive Review | false | true | true | false | 1002 |
| 4 | 6926374 | Primary Initiative A | true | false | false | true | 1003 |

The nerve named `Baseline Model D` (identifier `3717619`) is not compressed but the patient does report paresthesia and weakness, with no atrophy. This pattern suggests early or intermittent compression. In contrast, the nerve `Distributed Cluster` (identifier `32814`) is compressed, and the patient exhibits weakness and atrophy but no paresthesia—a profile that may indicate chronic, sustained compression with motor fiber involvement. The nerve `Primary Initiative A` (identifier `6926374`) mirrors this compressed, atrophic pattern. The presence or absence of paresthesia across the records highlights the variability in sensory symptomatology even when motor signs are present.

## Imaging Studies

Imaging provides the first line of cyst detection and characterization. The imaging studies table records the study identifier, the date of the examination, the modality used (ultrasound or MRI), whether the study was deemed diagnostic, and a free-text description of the findings. The modality choice often depends on the cyst's location and the clinical question: ultrasound is frequently used for superficial cysts, while MRI offers superior soft-tissue contrast for deeper or more complex lesions.

**Table `imaging_studies`**

| id | study_id | study_date | modality | is_diagnostic | findings_description | ganglion_cyst_id |
|---|---|---|---|---|---|---|
| 1 | Karyawan | 2024-11-08T10:06:00 | ultrasound | true | Pilot Assessment | 1000 |
| 2 | 392491 | 2025-04-19T17:23:00 | mri | false | Baseline Survey | 1001 |
| 3 | 9568466 | 2022-09-03T00:40:00 | ultrasound | true | Distributed Corridor A | 1002 |
| 4 | 4985166 | 2023-02-14T07:57:00 | mri | false | Adaptive Series | 1003 |

The first imaging study, identified as `Karyawan`, was performed on 2024-11-08 using ultrasound and was rated as diagnostic, with findings described as `Pilot Assessment`. The second study, `392491`, used MRI on 2025-04-19 but was not rated as diagnostic, with findings labeled `Baseline Survey`. The third study, `9568466`, again used ultrasound on 2022-09-03 and was diagnostic, with findings described as `Distributed Corridor A`. The fourth study, `4985166`, used MRI on 2023-02-14 and was not diagnostic, with findings labeled `Adaptive Series`. The alternation between diagnostic and non-diagnostic ratings across modalities suggests that study quality depends on factors beyond modality alone, such as cyst depth or patient body habitus.

## Pathological Specimens and Analysis

Following surgical excision, the cyst specimen is documented in the pathological specimens table, which records the specimen identifier, the date of collection, and a set of histological features: whether the specimen is multilobulated, whether it contains mucinous fluid, whether synovial epithelium is present, and whether fibrous connective tissue is identified. Each specimen links to a corresponding pathological analysis, which provides the interpretive diagnosis.

**Table `pathological_specimens`**

| id | specimen_id | collection_date | is_multilobulated | has_mucinous_fluid | has_synovial_epithelium | has_fibro_connective_tissue | ganglion_cyst_id | pathological_analysis_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 4277032 | 2025-12-17T11:57:00 | true | true | false | false | 1000 | 1 |
| 1001 | 5f935766-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-01T18:14:00 | false | false | true | true | 1001 | 2 |
| 1002 | 727069 | 2023-10-12T01:31:00 | true | true | false | false | 1002 | 3 |
| 1003 | 103172 | 2024-03-23T08:48:00 | false | false | true | true | 1003 | 4 |

The first specimen, `4277032`, collected on 2025-12-17, is multilobulated and contains mucinous fluid but lacks both synovial epithelium and fibrous connective tissue. The second specimen, `5f935766-8fcd-11eb-924d-9cd76263cbd0`, collected on 2022-05-01, is not multilobulated and lacks mucinous fluid but does contain both synovial epithelium and fibrous connective tissue. These contrasting profiles illustrate the histological diversity of ganglion cysts: some are purely mucinous and multilocular, while others are fibrous and epithelial-lined.

**Table `pathological_analysises`**

| id | analysis_id | analysis_date | staining_method | has_collagen_sheets | has_fibroblasts | has_mesenchymal_cells | has_necrosis | has_inflammatory_changes | pathological_specimen_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | L355 | 2024-03-01T02:18:00 | adaptive-staining-29 | false | false | false | false | false | 1000 | 2025-01-01 00:14:00 |
| 2 | 4843 | 2025-08-12T09:35:00 | distributed-staining-30 | true | true | true | true | true | 1001 | 2025-02-06 03:14:00 |
| 3 | 4985157 | 2022-01-23T16:52:00 | baseline-staining-31 | false | false | false | false | false | 1002 | 2025-03-11 06:14:00 |
| 4 | 0471948470 | 2023-06-07T23:09:00 | pilot-staining-32 | true | true | true | true | true | 1003 | 2025-04-16 09:14:00 |

The pathological analysis table provides the interpretive layer, linking each specimen to a diagnostic conclusion. The analysis records the specimen identifier, the date of analysis, the diagnostic category, and a descriptive summary. Together, the specimen and analysis tables form a complete pathological record that can be correlated with pre-operative imaging and clinical findings.

## Joined Views: Integrating the Layers

The power of the data model lies in its ability to join these tables into cohesive views that answer specific clinical questions. Each view represents a particular relational perspective on the ganglion cyst data.

The view `vw_ganglion_cyst_anatomical_region` joins the ganglion cyst table with the anatomical regions table, answering the question: what is the anatomical setting of each cyst? The first joined row pairs the cyst `8387527` (21.70 cm, intraosseous, synovial lining present) with the region `Distributed Assessment` (not subchondral, not near joint, not near tendon sheath). The second row pairs the cyst `46cf6b73-02b4-4298-a314-f28840b25c46` (25.40 cm, periosteal, multilocular, mucinous fluid present) with the region `Adaptive Survey D` (subchondral, near joint, near tendon sheath). This view enables clinicians to quickly assess whether a cyst's anatomical location places it in a high-risk zone for nerve compression.

The view `vw_ganglion_cyst_connective_tissue` joins the cyst table with the connective tissues table, answering: what type of connective tissue surrounds each cyst, and what is its histological state? The first row links the cyst `8387527` to a non-degenerated `joint_capsule` without collagen sheets. The second row links the cyst `46cf6b73-02b4-4298-a314-f28840b25c46` to a degenerated `tendon_sheath` with collagen sheets. This view is particularly useful for surgical planning, as degenerated tissue may require different handling techniques.

The view `vw_ganglion_cyst_nerve_fascicle` joins the cyst table with the nerve fascicle table, answering: which nerve is associated with each cyst, and what is the clinical severity profile? The first row pairs the cyst `8387527` with the nerve `Baseline Model D`, which is not compressed but shows paresthesia and weakness. The second row pairs the cyst `46cf6b73-02b4-4298-a314-f28840b25c46` with the nerve `Distributed Cluster`, which is compressed and shows weakness and atrophy. This view directly supports triage decisions: patients with compressed nerves and atrophy may warrant earlier surgical intervention.

The view `vw_ganglion_cyst_imaging_study` joins the cyst table with the imaging studies table, answering: what imaging was performed for each cyst, and was it diagnostic? The first row links the cyst `8387527` to an ultrasound study (`Karyawan`) that was diagnostic, with findings described as `Pilot Assessment`. The second row links the cyst `46cf6b73-02b4-4298-a314-f28840b25c46` to an MRI study (`392491`) that was not diagnostic, with findings described as `Baseline Survey`. This view helps identify cases where imaging may need to be repeated or supplemented with a different modality.

The view `vw_anatomical_region_ganglion_cyst` reverses the perspective, answering: which cysts are located in each anatomical region? The first row associates the region `Distributed Assessment` with the cyst `8387527` (21.70 cm, intraosseous). The second row associates the region `Adaptive Survey D` with the cyst `46cf6b73-02b4-4298-a314-f28840b25c46` (25.40 cm, periosteal, multilocular). This reverse-lookup view is useful for epidemiological analysis, such as determining which anatomical regions are most frequently affected.

The view `vw_anatomical_region_nerve_fascicle` joins the anatomical regions table with the nerve fascicle table, answering: which nerve fascicle is associated with each anatomical region? The first row links the region `Distributed Assessment` to the nerve `Baseline Model D` (not compressed, paresthesia present, weakness present, no atrophy). The second row links the region `Adaptive Survey D` to the nerve `Distributed Cluster` (compressed, no paresthesia, weakness present, atrophy present). This view reveals the anatomical-neural corridors that are most at risk in ganglion cyst disease.

The view `vw_connective_tissue_ganglion_cyst` reverses the connective tissue perspective, answering: which cysts are associated with each connective tissue type? The first row links the `joint_capsule` tissue to the cyst `8387527`. The second row links the `tendon_sheath` tissue to the cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports tissue-level epidemiology, identifying which connective tissue types are most commonly involved.

The view `vw_nerve_fascicle_ganglion_cyst` reverses the nerve perspective, answering: which cysts are associated with each nerve fascicle? The first row links the nerve `Baseline Model D` to the cyst `8387527`. The second row links the nerve `Distributed Cluster` to the cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view is useful for nerve-specific outcome tracking, such as comparing recovery rates across different nerves.

The view `vw_imaging_study_ganglion_cyst` reverses the imaging perspective, answering: which cysts were evaluated by each imaging study? The first row links the study `Karyawan` (ultrasound, diagnostic) to the cyst `8387527`. The second row links the study `392491` (MRI, not diagnostic) to the cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view supports quality assurance by identifying imaging studies that were not diagnostic and may need to be repeated.

The view `vw_pathological_specimen_ganglion_cyst` joins the pathological specimens table with the ganglion cyst table, answering: what histological features were found in the specimen excised from each cyst? The first row links the specimen `4277032` (multilobulated, mucinous fluid present, no synovial epithelium, no fibrous connective tissue) to the cyst `8387527`. The second row links the specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0` (not multilobulated, no mucinous fluid, synovial epithelium present, fibrous connective tissue present) to the cyst `46cf6b73-02b4-4298-a314-f28840b25c46`. This view enables correlation between pre-operative imaging characteristics and post-operative histology.

The view `vw_pathological_specimen_pathological_analysis` joins the pathological specimens table with the pathological analysis table, answering: what diagnostic conclusion was reached for each specimen? The first row links the specimen `4277032` to its analysis, and the second row links the specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0` to its analysis. This view forms the core of the pathological reporting workflow, ensuring that every specimen has a corresponding diagnostic interpretation.

The view `vw_pathological_analysis_pathological_specimen` reverses the pathological perspective, answering: which specimen was analyzed for each diagnostic report? The first row links the analysis to the specimen `4277032`, and the second row links the analysis to the specimen `5f935766-8fcd-11eb-924d-9cd76263cbd0`. This reverse-lookup view supports audit trails and quality review, allowing pathologists to trace each diagnostic conclusion back to its source specimen.

## Synthesis

The ganglion cyst documentation model captures a lesion from six complementary angles: its intrinsic morphology, its anatomical setting, the state of the surrounding connective tissue, the clinical status of associated nerves, the imaging findings, and the histopathological diagnosis. Each table stores a distinct layer of information, and the foreign-key relationships between them enable flexible querying across any combination of these layers. The twelve views provide both forward and reverse perspectives on these relationships, supporting clinical documentation, epidemiological analysis, surgical planning, and quality assurance. Together, the tables and views form a coherent record of ganglion cyst disease that is as multidimensional as the condition itself.

## Data appendix

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
